package kh.project.dml.member.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kh.project.dml.common.auth.SnsLogin;
import kh.project.dml.common.auth.SnsValue;
import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.member.model.service.FpMemberServiceImpl;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.member.model.vo.PwdChangeForm;
import kh.project.dml.member.model.vo.SocialCreateForm;
import kh.project.dml.member.model.vo.UserCreateForm;
import kh.project.dml.users.model.vo.LoginVo;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/")
public class FpMemberController {
	
	// 로그 수집 기능
	private static final Logger logger = LoggerFactory.getLogger(FpMemberController.class);
	
	private final FpMemberServiceImpl service;
	private final SnsValue naverSns;
	private final SnsValue googleSns;
	private final SnsValue kakaoSns;
	private final GoogleConnectionFactory googleConnectionFactory;
	private final OAuth2Parameters googleOAuth2Parameters;
	
	// 소셜 로그인 시 각 소셜 API에서 콜백 받을때
	@RequestMapping(value = "/auth/{snsService}/callback", 
			method = { RequestMethod.GET, RequestMethod.POST})
	public String SnsLoginCallback(@PathVariable String snsService,
			Model model, @RequestParam String code, HttpSession session, HttpServletResponse response) throws Exception {
		
		logger.info("SnsLoginCallback: service={}", snsService);
		SnsValue sns = null;
		if (StringUtils.equals("naver", snsService))
			sns = naverSns;
		else if (StringUtils.equals("google", snsService))
			sns = googleSns;
		else
			sns = kakaoSns;
		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		SnsLogin SnsLogin = new SnsLogin(sns);
		FpMemberVo snsMember = SnsLogin.getMemberProfile(code); // 1,2번 동시
		System.out.println("Profile>>" + snsMember);
		
		
		// 3. DB 해당 유저가 존재하는 체크 (googleid, naverid, kakaoid 컬럼 필수)
		FpMemberVo member = service.getBySns(snsMember);
		if (member == null) {
			String checkId = service.checkId(snsMember.getMemberId());
			if(checkId == null) {				
				model.addAttribute("member", snsMember);
				session.setAttribute("snsMember", snsMember);  // 임시로 세션에 저장
				//미존재시 가입페이지로!!
				return "/member/agreement";
			} else {
				// 아이디 중복 시
				return "/member/duplicationId";
			}
		} else {
			// 4. 존재시 강제로그인
			if(member.getUserEnabled() == 0) {
    			model.addAttribute("loginResult", "정지된 ID입니다. 관리자에게 문의하세요.");
    			return "/member/login";
    		}
			
			Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
			service.keepLogin(member.getMemberId(), session.getId(), expire);
			session.setAttribute(SessionNames.LOGIN, member);
			
			// 쿠키에 세션 ID 저장
            Cookie loginCookie = new Cookie(SessionNames.LOGIN_COOKIE, session.getId());
            loginCookie.setPath("/");
            loginCookie.setMaxAge(SessionNames.EXPIRE); // 쿠키 유효기간 설정 (초 단위)
            response.addCookie(loginCookie);
            
            String redirectUrl = (String) session.getAttribute("prevPage");
            if (redirectUrl != null) {
            	System.out.println(redirectUrl);
                // 이전 페이지로 리다이렉트
                session.removeAttribute("prevPage");
                return "redirect:"+redirectUrl;
            }
		}
		return "redirect:/index";
	}
	
	// 로그인 요청 팝업
	@GetMapping("/member/loginPopup")
	public String loginPopup(HttpSession session, HttpServletRequest request) {
		System.out.println("loginPopup");
		return "/member/loginPopup";
	}
	
	// 로그인 페이지
	@GetMapping("/member/login")
	public String login(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		logger.info("login GET .....");
		
		model.addAttribute("loginVo", new LoginVo());
		SnsLogin snsLogin = new SnsLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getAuthURL());
		
		/* 구글code 발행을 위한 URL 생성 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("google_url", url);
		
		SnsLogin kakaoLogin = new SnsLogin(kakaoSns);
		model.addAttribute("kakao_url", kakaoLogin.getAuthURL());
		model.addAttribute("loginResult", "");
		return "/member/login";
	}
	
	// 로그인 페이지에서 로그인 버튼 클릭
	@PostMapping("/member/login")
	public String loginPost(LoginVo vo, @RequestParam(value = "useCookie", required = false) String useCookie, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
	    logger.info("loginPost...LoginVo={}", vo);
        FpMemberVo memberLogin = service.login(vo);
        if(memberLogin != null) {
        	if (!memberLogin.getAuthorities().equals("ROLE_SOCIAL")) {
        		if(memberLogin.getMemberAuth() == 0) {
        			model.addAttribute("Auth", memberLogin.getMemberAuth());
        			return "/member/signupReady";
        		}
        		
        		if(memberLogin.getUserEnabled() == 0) {
        			model.addAttribute("loginResult", "정지된 ID입니다. 관리자에게 문의하세요.");
        			return "/member/login";
        		}
        		
           		model.addAttribute("member", service.memberInfo(memberLogin.getMemberId()));
           		if(useCookie != null && useCookie.equals("on")) {
           			logger.info("remember me...");
           			Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
          			service.keepLogin(memberLogin.getMemberId(), session.getId(), expire);
           			session.setAttribute(SessionNames.LOGIN, memberLogin); // 세션 설정
            			
           			// 쿠키에 세션 ID 저장
           			Cookie loginCookie = new Cookie(SessionNames.LOGIN_COOKIE, session.getId());
           			loginCookie.setPath("/");
           			loginCookie.setMaxAge(SessionNames.EXPIRE); // 쿠키 유효기간 설정 (초 단위)
           			response.addCookie(loginCookie);
            	} else {
            		session.setAttribute(SessionNames.LOGIN, memberLogin); // 세션 설정
            	}
        		
                String redirectUrl = (String) session.getAttribute("prevPage");
                System.out.println(redirectUrl);
                if (redirectUrl != null) {
                    // 이전 페이지로 리다이렉트
                    session.removeAttribute("prevPage");
                    return "redirect:"+redirectUrl;
                }
                return "redirect:/index";
        	} else {
        		model.addAttribute("loginResult", "Login Fail!!");
        	}
        } else {	        	
        	logger.error("사용자ID 또는 비밀번호를 확인해 주세요.");
        	model.addAttribute("loginResult", "사용자ID 또는 비밀번호를 확인해 주세요.");
        }
        return "/member/login";
	}
	
	// 로그아웃 버튼 클릭
	@GetMapping("/member/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {

		FpMemberVo member = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		service.keepLogin(member.getMemberId(), "", new Date()); // 로그아웃 상태를 DB에 기록
	    session.removeAttribute(SessionNames.LOGIN);
	    
	    // 쿠키를 찾아서 삭제
	    Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN_COOKIE);
	    if (loginCookie != null) {
	        loginCookie.setPath("/");    
	        loginCookie.setMaxAge(0);
	        response.addCookie(loginCookie);
	    }
	    
	    session.invalidate();
	    
	    return "redirect:/index";
	}
	
	// 회원가입 페이지
	@GetMapping("/member/signup")
	public String signupPage(Model model) {
		model.addAttribute("userCreateForm", new UserCreateForm());
		return "/member/signup";
	}
	
	// 회원가입 ID 체크
	@PostMapping("/member/signup/checkId")
	@ResponseBody
	public int signupCheckId(String username) {
		int result = 0;
		if(username.equals("")) {
			return result;
		}
		String checkId = service.checkId(username);
		System.out.println(checkId);
		if(checkId == null) {
			result = 1;
			return result;
		} else {
			result = 2;
			return result;
		}
	}
	
	// 회원가입 페이지에서 회원가입 버튼 클릭
	@PostMapping("/member/signup")
    public String signup(@Valid UserCreateForm userCreateForm, BindingResult bindingResult, HttpSession session, LoginVo vo, Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("signupResult", "모든 항목에 내용이 입력되어야 합니다.");
            return "/member/signup";
        }
		
        if(!userCreateForm.getPassword().equals(userCreateForm.getPassword2())) {
            bindingResult.rejectValue("password2", "passwordInCorrect", "2개의 비밀번호가 일치하지 않습니다.");
            model.addAttribute("signupResult", "2개의 비밀번호가 일치하지 않습니다.");
            return "/member/signup";
        }
        try {
        	service.create(userCreateForm);
        	System.out.println("LoginVo:"+vo);
        	// 회원가입 후 자동 로그인 처리
            FpMemberVo member = service.login(vo);
            if (member != null) {
                session.setAttribute(SessionNames.LOGIN, member); // 세션 설정
            }
            String redirectUrl = (String) session.getAttribute("prevPage");
            if (redirectUrl != null) {
                // 이전 페이지로 리다이렉트
                session.removeAttribute("prevPage");
                return "redirect:"+redirectUrl;
            }
        } catch(DataIntegrityViolationException e) {
            e.printStackTrace();
            bindingResult.reject("signupFailed", "이미 등록된 사용자입니다.");
            return "/member/signup";
        } catch(Exception e) {
            e.printStackTrace();
            bindingResult.reject("signupFailed", e.getMessage());
            return "/member/signup";
        }
        
        return "/member/signupReady";
    }
	
	// 메일 인증
	@Transactional
	@GetMapping("/member/signupEmail")
	public String emailConfirm(String memberId, String key, Model model)throws Exception {
		service.memberAuth(memberId, key);
		model.addAttribute("memberId", memberId);
		service.memberAuthDelete(memberId);
		return "/member/signupEmail";
	}
	
	// 소셜 회원가입 페이지
	@PostMapping("/member/agreement")
    public String agreement(@Valid SocialCreateForm socialCreateForm, BindingResult bindingResult, HttpSession session, HttpServletResponse response) {
        if(bindingResult.hasErrors()) {
            return "/member/agreement";
        }
        
        try {
        	service.socialCreate(socialCreateForm);
        	FpMemberVo member = (FpMemberVo) session.getAttribute("snsMember");
        	System.out.println(member);
			Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
			service.keepLogin(member.getMemberId(), session.getId(), expire);
			session.setAttribute(SessionNames.LOGIN, member);
			
			// 쿠키에 세션 ID 저장
    		Cookie loginCookie = new Cookie(SessionNames.LOGIN_COOKIE, session.getId());
    		loginCookie.setPath("/");
    		loginCookie.setMaxAge(SessionNames.EXPIRE); // 쿠키 유효기간 설정 (초 단위)
    		response.addCookie(loginCookie);
    		
    		String redirectUrl = (String) session.getAttribute("prevPage");
            if (redirectUrl != null) {
                // 이전 페이지로 리다이렉트
                session.removeAttribute("prevPage");
                return "redirect:"+redirectUrl;
            }
        } catch(Exception e) {
            e.printStackTrace();
            bindingResult.reject("signupFailed", e.getMessage());
            return "/member/agreement";
        }
        
        return "redirect:/index";
    }
	
	// 아이디 찾기
	@GetMapping("/member/idSearch")
	public String idSearch() {
		return "/member/idSearch";
	}
	@PostMapping("/member/idSearch")
	public String idSearchResult(@RequestParam String name, @RequestParam String birthday, Model model) {
		List<FpMemberVo> vo = service.idSearch(name, birthday);
		System.out.println(vo);
		if(vo.isEmpty()) {
			model.addAttribute("msg", "일치하는 정보를 확인할 수 없습니다. 다시 입력해주세요.");
			model.addAttribute("prevUrlLink", "/member/idSearch");
			return "/member/searchError";
		} else {
			model.addAttribute("memberlist", vo);
			return "/member/idSearchResult";
		}
	}
	
	// 비밀번호 찾기
	@GetMapping("/member/pwdSearch")
	public String pwdSearch() {
		return "/member/pwdSearch";
	}
	@PostMapping("/member/pwdSearch")
	public String pwdSearchResult(@RequestParam String username, @RequestParam String name, @RequestParam String birthday, Model model, HttpSession session) throws Exception {
		FpMemberVo vo = service.pwdSearch(username, name, birthday);
		System.out.println(vo);
		if(vo == null) {
			model.addAttribute("msg", "일치하는 정보를 확인할 수 없습니다. 다시 입력해주세요.");
			model.addAttribute("prevUrlLink", "/member/pwdSearch");
			return "/member/searchError";
		} else {
			session.setAttribute("pwdMember", vo);
			return "/member/pwdMail";
		}
	}
	
	// 패스워드 재설정 메일
	@GetMapping("/member/pwdSearchResult")
	public String pwdChangeMail(String memberId, String key, Model model) throws Exception {
		String pwdAuth = service.pwdAuth(memberId, key);
		if(pwdAuth.equals(memberId)) {			
			model.addAttribute("pwdAuth", pwdAuth);
			return "/member/pwdSearchResult";
		} else {
			model.addAttribute("msg", "잘못된 경로로 접근하였습니다.");
			model.addAttribute("prevUrlLink", "/index");
			return "/member/searchError";
		}
	}
	
	// 비밀번호 찾기를 통한 재설정
	@PostMapping("/member/pwdSearchResult")
	public String pwdChangeResult(@RequestParam String username, @RequestParam String password, @RequestParam String password2, Model model, HttpSession session) throws Exception {
		if(!password.equals(password2)) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			model.addAttribute("prevUrlLink", "/member/pwdChangeResult");
            return "/member/searchError";
        } else {
        	service.pwdChangeResult(username, password);
        	model.addAttribute("msg", "비밀번호 재설정이 완료되었습니다.");
        	return "/member/pwdChangeSuccess";        	
        }
		
	}
	
	// 마이페이지
	@GetMapping("/member/mypage")
	public String mypage(HttpSession session) {
		FpMemberVo member = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		if(member.getAuthorities().equals("ROLE_ADMIN")) {
			return "redirect:/admin/mypage";
		}
		return "/member/mypage";
	}
	
	// 마이페이지에서 정보 변경 후 저장버튼을 누르면 정보 업데이트
	@PostMapping("/member/update")
	public String updateMember(@RequestBody FpMemberVo member, HttpSession session) {
		service.update(member);
	    member = service.memberInfo(member.getMemberId());
	    System.out.println(member);
	    session.setAttribute(SessionNames.LOGIN, member);
		return "redirect:/member/mypage";
	}
	
	// 비밀번호 변경 페이지
	@GetMapping("/member/mypage/pwdChange")
	public String pwdChange() {
		return "/member/pwdChange";
	}
	
	// 비밀번호 변경 관련 팝업 
	@GetMapping("/member/mypage/pwdChangePopup")
	public String pwdChangePopup() {
		return "/member/pwdChangePopup";
	}
	
	// 비밀번호 변경 페이지에서 버튼 클릭 시
	@PostMapping("/member/mypage/pwdChange")
	public String pwdChangeDo(@Valid PwdChangeForm pwdChangeForm, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("msg", "모든 항목에 내용이 입력되어야 합니다.");
            return "/member/pwdChangePopup";
        }
		
		if(!pwdChangeForm.getPassword2().equals(pwdChangeForm.getPassword3())) {
            bindingResult.rejectValue("password2", "passwordInCorrect", "변경할 2개의 비밀번호가 일치하지 않습니다.");
            model.addAttribute("msg", "변경할 2개의 비밀번호가 일치하지 않습니다.");
			return "/member/pwdChangePopup";
        }
		
		if(service.pwdChange(pwdChangeForm) == 1) {			
			model.addAttribute("msg", "비밀번호 변경이 완료되었습니다.");
			return "/member/pwdChangePopup";
		} else {
			model.addAttribute("msg", "현재 비밀번호가 일치하지 않습니다.");
			return "/member/pwdChangePopup";
		}
	}
		
	// 회원탈퇴 전 비밀번호 항목 입력
	@GetMapping("/member/deleteCheck")
	public String deleteCheck(HttpSession session) {
		return "/member/deleteCheck";
	}
	// /member/deleteCheck 페이지에서 회원탈퇴 버튼 클릭
	@PostMapping("/member/withdrawal")
	public String deleteCheck(@RequestParam String password, Model model, HttpSession session, LoginVo vo, HttpServletRequest request, HttpServletResponse response) {
		FpMemberVo member = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
	    try {
	    	if(member.getAuthorities().equals("ROLE_MEMBER")) {	    		
	    		vo.setUsername(member.getMemberId());
	    		vo.setPassword(password);
	    		FpMemberVo withMember = service.login(vo);
	    		if(withMember == null) {
	    			return "/member/errorPopup";
	    		} else {
	    			service.keepLogin(withMember.getMemberId(), "", new Date());
	    			session.removeAttribute(SessionNames.LOGIN);
	    			
	    			// 쿠키를 찾아서 삭제
	    			Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN_COOKIE);
	    			if (loginCookie != null) {
	    				loginCookie.setPath("/");    
	    				loginCookie.setMaxAge(0);
	    				response.addCookie(loginCookie);
	    			}
	    			
	    			session.invalidate();
	    			service.delete(withMember.getMemberId());
	    			return "/member/deletePopup";
	    		}
	    	} else if(member.getAuthorities().equals("ROLE_SOCIAL")) {
	    		service.keepLogin(member.getMemberId(), "", new Date());
    			session.removeAttribute(SessionNames.LOGIN);
    			
    			// 쿠키를 찾아서 삭제
    			Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN_COOKIE);
    			if (loginCookie != null) {
    				loginCookie.setPath("/");    
    				loginCookie.setMaxAge(0);
    				response.addCookie(loginCookie);
    			}
    			
    			session.invalidate();
    			service.delete(member.getMemberId());
    			return "/member/deletePopup";
	    	}
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    return "/member/mypage";
	}
	
	// 회원탈퇴 시 아이디/비밀번호가 맞지 않는 경우 에러 발생
	@GetMapping("/member/errorPopup")
	public String errorPopup() {
		return "redirect:/member/errorPopup";
	}
	
	// 회원탈퇴 완료 후 팝업창 화면
	@GetMapping("/member/deletePopup")
	public String deletePopup() {
		return "/member/deletePopup";
	}

	@GetMapping("/member/plusReputation")
	@ResponseBody
	public int plusReputation(int replyNo) {
		return service.plusReputation(replyNo);
	}
	
	@GetMapping("/member/memberReputation")
	@ResponseBody
	public List<FpMemberVo> memberReputation() {
		return  service.memberReputation();
	}
}

