package kh.project.dml.member.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import kh.project.dml.common.auth.SnsLogin;
import kh.project.dml.common.auth.SnsValue;
import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.member.model.service.FpMemberService;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.users.model.vo.LoginVo;

@Controller
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
			model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");
			
			//미존재시 가입페이지로!!
			return "/social/signup";
			
		} else {
			model.addAttribute("result", member.getMname() + "님 반갑습니다.");
			
			// 4. 존재시 강제로그인
			session.setAttribute(SessionNames.LOGIN, member);
		}
		return "/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		session.removeAttribute(SessionNames.LOGIN);
		session.invalidate();
		
		Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN);
		if (loginCookie != null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			
			response.addCookie(loginCookie);
			
			FpMemberVo member = (FpMemberVo)session.getAttribute(SessionNames.LOGIN);
			service.keepLogin(member.getMid(), session.getId(), new Date());
		}
		
		return "/social/login";
	}
	
	@GetMapping("/social/login")
	public void login(Model model) throws Exception {
		logger.info("login GET .....");
		
		SnsLogin snsLogin = new SnsLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getAuthURL());
		
		/* 구글code 발행을 위한 URL 생성 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("google_url", url);
		
		SnsLogin kakaoLogin = new SnsLogin(kakaoSns);
		model.addAttribute("kakao_url", kakaoLogin.getAuthURL());
	}
	
	@PostMapping("/loginPost")
	public void loginPost(LoginVo vo, Model model, HttpSession session) throws Exception {
		logger.info("loginPost...LoginVo={}", vo); 
		
		try {
			FpMemberVo member = service.login(vo);
			if (member != null) {
				Date expire = new Date(System.currentTimeMillis() + SessionNames.EXPIRE * 1000);
				service.keepLogin(member.getMid(), session.getId(), expire);
				model.addAttribute("member", member);
				
			} else {
				model.addAttribute("loginResult", "Login Fail!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@GetMapping("/logoutAjax")
	public ResponseEntity<String> logoutAjax(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session) {
		logger.info("Logout Ajax>> " + session.getAttribute("loginUser"));
		session.removeAttribute("loginUser");
		
		FpMemberVo member = (FpMemberVo)session.getAttribute(SessionNames.LOGIN);
		if (member != null) {
			session.removeAttribute(SessionNames.LOGIN);
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}
		}
		
		return new ResponseEntity<>("logouted", HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping("/loginAjax")
	public ResponseEntity<FpMemberVo> loginAjax(@RequestBody LoginVo vo, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("loginPost...LoginVo={}", vo); 
		
		try {
			FpMemberVo member = service.login(vo);
			if (member != null) { // login success
				// member.setUpw(null);
				
				session.setAttribute("loginMember", member);
				
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(7 * 24 * 60 * 60);
				
				response.addCookie(loginCookie);
				
				return new ResponseEntity<>(member, HttpStatus.OK);
				
			} else {
				return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
		}
	}
	
}

