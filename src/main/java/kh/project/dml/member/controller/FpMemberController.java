package kh.project.dml.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.member.model.service.FpMemberService;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.users.model.vo.FpUsersVo;

@Controller
public class FpMemberController {

	@Autowired
	private FpMemberService fpMemberService;
	
	private static final Logger logger = LoggerFactory.getLogger(FpMemberController.class);
	
	/* 회원가입 */
	// http://localhost:8088/member/join
	
	@GetMapping("/join")
	public String insertGET() throws Exception {
		return "/member/join";
	}
	
	@PostMapping("/join")
	public String insertPOST(FpUsersVo uvo, FpMemberVo mvo) throws Exception {
		logger.info("C: 회원가입포스트메서드"+ uvo + " / "+mvo);
		fpMemberService.insertMember(uvo, mvo);
		return "redirect:/member/login";
	}
	
	//회원가입시 아이디중복확인
	@PostMapping("/idCheck")
	public @ResponseBody int idCheck(@RequestParam("id") String id) throws Exception {
		String ck = fpMemberService.idCheck(id);
		if(ck != null) return 1;
		else return 0;
	}
	
	/* 로그인 기능 */
	// http://localhost:8088/member/login
	
	@GetMapping("/login")
	public String loginGET() throws Exception{
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String loginPOST(FpUsersVo uvo, HttpSession session, RedirectAttributes rttr) throws Exception{
		FpUsersVo returnVo = fpMemberService.loginMember(uvo);
		System.out.println("C: 리턴VO결과(서비스에서 예외처리를 진행했으므로 null이 출력되면 코드에 문제있다는 의미) "+returnVo);
		
		if(returnVo != null) {
			session.setAttribute("id", returnVo.getUserId());
			rttr.addFlashAttribute("mvo", returnVo);
			return "redirect:/member/main"; 
		} else {
			return "redirect:/member/login";
		}
	}
	
	/* 로그아웃 */
	@GetMapping("/logout")
	public void logoutGET(HttpSession session) throws Exception{
		logger.info("C: 로그아웃 GET");
		session.invalidate();
		// return "redirect:/member/main"; 얼럿창출력안하고싶을때 사용
	}
	
	/* 구글아이디로 로그인 */	
    @ResponseBody
	@PostMapping("/loginGoogle")
	public String loginGooglePOST(FpUsersVo uvo, FpMemberVo mvo, HttpSession session, RedirectAttributes rttr) throws Exception{

    	FpUsersVo returnVo = fpMemberService.loginMemberByGoogle(uvo);
		String mvo_ajaxid = mvo.getMid(); 
		System.out.println("C: 구글아이디 포스트 db에서 가져온 vo "+ uvo);
		System.out.println("C: 구글아이디 포스트 ajax에서 가져온 id "+ mvo_ajaxid);
		
		if(returnVo == null) { //아이디가 DB에 존재하지 않는 경우
			//구글 회원가입
			fpMemberService.insertMemberByGoogle(uvo, mvo);
			
			//구글 로그인
			returnVo = fpMemberService.loginMemberByGoogle(uvo);
			session.setAttribute("id", returnVo.getUserId());			
			rttr.addFlashAttribute("uvo", returnVo);
		}
		
		if(mvo_ajaxid.equals(returnVo.getUserId())){ // 아아이디가 DB에 존재하는 경우
			//구글 로그인
			fpMemberService.loginMemberByGoogle(uvo);
			session.setAttribute("id", returnVo.getUserId());			
			rttr.addFlashAttribute("uvo", returnVo);
		}else { // 아이디가 DB에 존재하지 않는 경우
			//구글 회원가입
			fpMemberService.insertMemberByGoogle(uvo, mvo);	
			
			//구글 로그인
			returnVo = fpMemberService.loginMemberByGoogle(uvo);
			session.setAttribute("id", returnVo.getUserId());			
			rttr.addFlashAttribute("uvo", returnVo);
		}
		
		return "redirect:/member/main";
	}
}
