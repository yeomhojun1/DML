package kh.project.dml.member.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import kh.project.dml.common.auth.SnsLogin;
import kh.project.dml.common.auth.SnsValue;
import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.member.model.service.FpMemberService;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.member.model.vo.SocialCreateForm;
import kh.project.dml.member.model.vo.UserCreateForm;
import kh.project.dml.users.model.vo.FpUsersVo;
import kh.project.dml.users.model.vo.LoginVo;

@Controller
@RequestMapping("/")
public class FpMemberController {

	private static final Logger logger = LoggerFactory.getLogger(FpMemberController.class);
	
	@Inject
	private FpMemberService service;
	
	@Inject
	private SnsValue naverSns;
	
	@Inject
	private SnsValue googleSns;

	@Inject
	private SnsValue kakaoSns;
	
	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;
	
	@Autowired
	private FpMemberService fpMemberService;
	
	@GetMapping("/member/list")
	public String memberList(Model model) {
		model.addAttribute("memberList", service.selectList());
		return "/member/list";
	}
	
	@RequestMapping(value = "/auth/{snsService}/callback", 
			method = { RequestMethod.GET, RequestMethod.POST})
	public String SnsLoginCallback(@PathVariable String snsService,
			Model model, @RequestParam String code, HttpSession session) throws Exception {
		
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
//			model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");
			String checkId = service.checkId(snsMember.getMemberId());
			if(checkId == null) {				
				model.addAttribute("member", snsMember);
				session.setAttribute("snsMember", snsMember);  // 임시로 세션에 저장
				//미존재시 가입페이지로!!
				return "/member/agreement";
			} else {
				model.addAttribute("result", "동일한 Email로 가입되어 있습니다. 기존에 회원가입한 방식으로 로그인해주세요.");
				return "redirect:/member/login";
			}
		} else {
//			model.addAttribute("result", member.getMname() + "님 반갑습니다.");
			// 4. 존재시 강제로그인
			Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
			service.keepLogin(member.getMemberId(), session.getId(), expire);
			session.setAttribute(SessionNames.LOGIN, member);
		}
		return "redirect:/index";
	}
	
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
	    
	    Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN_COOKIE);
	    if (loginCookie != null) {
	        loginCookie.setPath("/");	
	        loginCookie.setMaxAge(0);
	        response.addCookie(loginCookie);
	    }
	    
	    session.invalidate();
	    
	    return "redirect:/index";
	}
	
	@GetMapping("/member/login")
	public String login(Model model, HttpSession session) throws Exception {
		logger.info("login GET .....");
		if(service.checkSession(session.getId()) == null) {
			System.out.println("null");
		} else {
			return "redirect:/index";
		}
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
	
	@PostMapping("/member/login")
	public String loginPost(LoginVo vo, Model model, HttpSession session) throws Exception {
	    logger.info("loginPost...LoginVo={}", vo); 
	    try {
	        FpUsersVo member = service.login(vo);
	        if (member.getAuthorities().equals("ROLE_MEMBER")) {
	            Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
	            service.keepLogin(member.getUsername(), session.getId(), expire);
	            session.setAttribute(SessionNames.LOGIN, member); // 세션 설정
	            return "redirect:/index";
	        } else {
	            model.addAttribute("loginResult", "Login Fail!!");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        logger.error("사용자ID 또는 비밀번호를 확인해 주세요.", e);
	        model.addAttribute("loginResult", "사용자ID 또는 비밀번호를 확인해 주세요.");
	    }
	    return "/member/login";
	}
	
	@GetMapping("/member/signup")
	public String signupPage(Model model) {
		model.addAttribute("userCreateForm", new UserCreateForm());
		return "/member/signup";
	}
	
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
        	fpMemberService.create(userCreateForm);
            // 회원가입 후 자동 로그인 처리(오류 발생으로 조치 필요)
        	vo.setUsername(userCreateForm.getUsername());
        	vo.setPassword(userCreateForm.getPassword1()); 
            FpUsersVo member = service.login(vo);
            if (member != null) {
                Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
                fpMemberService.keepLogin(member.getUsername(), session.getId(), expire);
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
	
	@PostMapping("/member/agreement")
    public String agreement(@Valid SocialCreateForm socialCreateForm, BindingResult bindingResult, HttpSession session, LoginVo vo) {
        if(bindingResult.hasErrors()) {
            return "/member/agreement";
        }
        
        try {
        	fpMemberService.socialCreate(socialCreateForm);
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
	
	@GetMapping("/member/mypage")
	public String mypage(Model model, HttpSession session) {
		Object memberObj = session.getAttribute(SessionNames.LOGIN);
	    
	    if (memberObj instanceof FpUsersVo) {
	        FpUsersVo userMember = (FpUsersVo) memberObj;
	        model.addAttribute("member", service.mypage(userMember.getUsername()));
	    } else if (memberObj instanceof FpMemberVo) {
	    	FpMemberVo member = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
	    	model.addAttribute("member", service.mypage(member.getMemberId()));
	    }
		return "/member/mypage";
	}
	
	@PostMapping("/member/update")
	public String updateMember(@RequestBody FpMemberVo member, Model model, HttpSession session) {
		service.update(member);
	    member = service.mypage(member.getMemberId());
	    model.addAttribute("member", member);
		return "redirect:/member/mypage";
	}
	
	@PostMapping("/member/withdrawal")
	public String deleteCheck(@RequestParam String password, Model model, HttpSession session, LoginVo vo) {
		Object memberObj = session.getAttribute(SessionNames.LOGIN);
	    try {	    	
	    	if (memberObj instanceof FpUsersVo) {
	    		FpUsersVo userMember = (FpUsersVo) memberObj;
	    		vo.setUsername(userMember.getUsername());
	    		vo.setPassword(password);
	    		FpUsersVo user = service.login(vo);
	    		if(user == null) {
	    			return "/member/errorPopup";
	    		} else {
	    			service.delete(user.getUsername());
	    			return "/member/deletePopup";
	    		}
	    	} else if (memberObj instanceof FpMemberVo) {
	    		FpMemberVo member = (FpMemberVo) memberObj;
	    		service.delete(member.getMemberId());
	    		return "/member/deletePopup";
	    	}
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    return "/member/mypage";
	}
	
	@GetMapping("/member/deleteCheck")
	public String deleteCheck(HttpSession session) {
		session.getAttribute(SessionNames.LOGIN);
		return "/member/deleteCheck";
	}
	
	@GetMapping("/member/errorPopup")
	public String errorPopup() {
		return "redirect:/member/errorPopup";
	}
	
	@GetMapping("/member/deletePopup")
	public String deletePopup(HttpSession session) {
		session.setAttribute(SessionNames.LOGIN, "");
		return "/member/deletePopup";
	}
}

