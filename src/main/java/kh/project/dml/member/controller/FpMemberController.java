package kh.project.dml.member.controller;

import java.util.Date;

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
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import kh.project.dml.common.auth.SnsLogin;
import kh.project.dml.common.auth.SnsValue;
import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.member.model.service.FpMemberServiceImpl;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.member.model.vo.SocialCreateForm;
import kh.project.dml.member.model.vo.UserCreateForm;
import kh.project.dml.users.model.vo.FpUsersVo;
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
	
	// 멤버 페이지(임시)
	@GetMapping("/member/list")
	public String memberList(Model model) {
		model.addAttribute("memberList", service.selectList());
		return "/member/list";
	}
	
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
				return "redirect:/member/duplicationId";
			}
		} else {
			// 4. 존재시 강제로그인
			Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
			service.keepLogin(member.getMemberId(), session.getId(), expire);
			session.setAttribute(SessionNames.LOGIN, member);
			
			// 쿠키에 세션 ID 저장
            Cookie loginCookie = new Cookie(SessionNames.LOGIN_COOKIE, session.getId());
            loginCookie.setPath("/");
            loginCookie.setMaxAge(SessionNames.EXPIRE); // 쿠키 유효기간 설정 (초 단위)
            response.addCookie(loginCookie);
		}
		return "redirect:/index";
	}
	
	// 로그인 페이지
	@GetMapping("/member/login")
	public String login(Model model, HttpSession session) throws Exception {
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
	public String loginPost(LoginVo vo, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
	    logger.info("loginPost...LoginVo={}", vo); 
        FpUsersVo member = service.login(vo);
        if(member != null) {
        	if (member.getAuthorities().equals("ROLE_MEMBER")) {
        		Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
        		service.keepLogin(member.getUsername(), session.getId(), expire);
        		session.setAttribute(SessionNames.LOGIN, member); // 세션 설정
        		
        		// 쿠키에 세션 ID 저장
        		Cookie loginCookie = new Cookie(SessionNames.LOGIN_COOKIE, session.getId());
        		loginCookie.setPath("/");
        		loginCookie.setMaxAge(SessionNames.EXPIRE); // 쿠키 유효기간 설정 (초 단위)
        		response.addCookie(loginCookie);
        		
        		return "redirect:/index";
        	} else {
        		model.addAttribute("loginResult", "Login Fail!!");
        	}
        } else {	        	
        	logger.error("사용자ID 또는 비밀번호를 확인해 주세요.");
        	model.addAttribute("loginResult", "사용자ID 또는 비밀번호를 확인해 주세요.");
        }
        session = request.getSession();
        if (session != null) {
            String redirectUrl = (String) session.getAttribute("prevPage");
            if (redirectUrl != null) {
                // 이전 페이지로 리다이렉트
                session.removeAttribute("prevPage");
                return redirectUrl;
            }
        }
        return "/index";
	}
	
	// 로그아웃 버튼 클릭
	@GetMapping("/member/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		Object memberObj = session.getAttribute(SessionNames.LOGIN);
	    
	    if (memberObj instanceof FpUsersVo) {
	        FpUsersVo userMember = (FpUsersVo) memberObj;
	        service.keepLogin(userMember.getUsername(), "", new Date()); // 로그아웃 상태를 DB에 기록
	    } else if (memberObj instanceof FpMemberVo) {
	    	FpMemberVo member = (FpMemberVo) memberObj;
	    	service.keepLogin(member.getMemberId(), "", new Date()); // SNS 로그아웃 상태를 DB에 기록
	    }
	    
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
	
	// 회원가입 페이지에서 회원가입 버튼 클릭
	@PostMapping("/member/signup")
    public String signup(@Valid UserCreateForm userCreateForm, BindingResult bindingResult, HttpSession session, LoginVo vo) {
		if(bindingResult.hasErrors()) {
            return "/member/signup";
        }

        if(!userCreateForm.getPassword1().equals(userCreateForm.getPassword2())) {
            bindingResult.rejectValue("password2", "passwordInCorrect", "2개의 패스워드가 일치하지 않습니다.");
            return "/member/signup";
        }
        try {
        	service.create(userCreateForm);
        	vo.setUsername(userCreateForm.getUsername());
        	vo.setPassword(userCreateForm.getPassword1()); 
            FpUsersVo member = service.login(vo);
            if (member != null) {
                Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
                service.keepLogin(member.getUsername(), session.getId(), expire);
                session.setAttribute(SessionNames.LOGIN, member); // 세션 설정
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
        
        return "redirect:/index";
    }
	
	// 소셜 회원가입 페이지
	@PostMapping("/member/agreement")
    public String agreement(@Valid SocialCreateForm socialCreateForm, BindingResult bindingResult, HttpSession session) {
        if(bindingResult.hasErrors()) {
            return "/member/agreement";
        }
        
        try {
        	service.socialCreate(socialCreateForm);
        	FpMemberVo member = (FpMemberVo) session.getAttribute("snsMember");
			Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
			service.keepLogin(member.getMemberId(), session.getId(), expire);
			session.setAttribute(SessionNames.LOGIN, member);
        } catch(Exception e) {
            e.printStackTrace();
            bindingResult.reject("signupFailed", e.getMessage());
            return "/member/agreement";
        }
        
        return "redirect:/index";
    }
	
	// 마이페이지
	@GetMapping("/member/mypage")
	public String mypage() {
		return "/member/mypage";
	}
	
	// 마이페이지에서 정보 변경 후 저장버튼을 누르면 정보 업데이트
	@PostMapping("/member/update")
	public String updateMember(@RequestBody FpMemberVo member, Model model, HttpSession session) {
		service.update(member);
	    member = service.memberInfo(member.getMemberId());
	    model.addAttribute("member", member);
		return "redirect:/member/mypage";
	}
	
	// 회원탈퇴 전 패스워드 항목 입력
	@GetMapping("/member/deleteCheck")
	public String deleteCheck(HttpSession session) {
		return "/member/deleteCheck";
	}
	// /member/deleteCheck 페이지에서 회원탈퇴 버튼 클릭
	@PostMapping("/member/withdrawal")
	public String deleteCheck(@RequestParam String password, Model model, HttpSession session, LoginVo vo, HttpServletRequest request, HttpServletResponse response) {
		Object memberObj = session.getAttribute(SessionNames.LOGIN);
	    try {
	    	if (memberObj instanceof FpUsersVo) { // 일반 계정인 경우
	    		FpUsersVo userMember = (FpUsersVo) memberObj;
	    		vo.setUsername(userMember.getUsername());
	    		vo.setPassword(password);
	    		FpUsersVo user = service.login(vo);
	    		if(user == null) {
	    			return "/member/errorPopup";
	    		} else {
    		        service.keepLogin(user.getUsername(), "", new Date());
		        	session.removeAttribute(SessionNames.LOGIN);
	    		    
	    		    // 쿠키를 찾아서 삭제
	    		    Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN_COOKIE);
	    		    if (loginCookie != null) {
	    		        loginCookie.setPath("/");    
	    		        loginCookie.setMaxAge(0);
	    		        response.addCookie(loginCookie);
	    		    }
	    		    
	    		    session.invalidate();
	    			service.delete(user.getUsername());
	    			return "/member/deletePopup";
	    		}
	    	} else if (memberObj instanceof FpMemberVo) { // 소셜 계정인 경우
	    		FpMemberVo member = (FpMemberVo) memberObj;
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
	
	// 회원탈퇴 시 아이디/패스워드가 맞지 않는 경우 에러 발생
	@GetMapping("/member/errorPopup")
	public String errorPopup() {
		return "redirect:/member/errorPopup";
	}
	
	// 회원탈퇴 완료 후 팝업창 화면
	@GetMapping("/member/deletePopup")
	public String deletePopup() {
		return "/member/deletePopup";
	}
}

