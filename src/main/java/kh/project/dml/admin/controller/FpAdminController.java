package kh.project.dml.admin.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.admin.model.service.FpAdminServiceImpl;
import kh.project.dml.admin.model.vo.FpAdminVo;
import kh.project.dml.common.vo.Criteria;
import kh.project.dml.common.vo.FpPageMakerVo;
import kh.project.dml.member.model.service.FpMemberServiceImpl;
import kh.project.dml.member.model.vo.PwdChangeForm;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/admin")
public class FpAdminController {
	
	// 로그 수집 기능
	private static final Logger logger = LoggerFactory.getLogger(FpAdminController.class);
	
	private final FpAdminServiceImpl service;
	private final FpMemberServiceImpl memberService;
	
	@GetMapping("/index")
	public ModelAndView adminIndex(ModelAndView mv) {
		mv.setViewName("/admin/index");
		return mv;
	}
	
	@GetMapping("/memberlist")
	public ModelAndView memberList(ModelAndView mv, Criteria cri) {
		logger.info("boardListGET");
		logger.info("cri : " + cri);
		
		mv.addObject("memberlist", service.memberList(cri));
		int total = service.getTotalActive(cri);
		FpPageMakerVo pageMake = new FpPageMakerVo(cri, total);
		
		mv.addObject("pageMaker", pageMake);
		mv.setViewName("admin/memberlist");
		return mv;
	}
	
	@GetMapping("/suspended")
	public ModelAndView suspendedList(ModelAndView mv, Criteria cri) {
		logger.info("boardListGET");
		logger.info("cri : " + cri);
		
		mv.addObject("memberlist", service.suspendedList(cri));
		int total = service.getTotalSuspended(cri);
		FpPageMakerVo pageMake = new FpPageMakerVo(cri, total);
		
		mv.addObject("pageMaker", pageMake);
		mv.setViewName("admin/suspended");
		return mv;
	}
	
	@PostMapping("/suspended/active")
	public ModelAndView suspendedActive(ModelAndView mv, @RequestParam("memberId") String memberId) {
		service.suspendedActive(memberId);
		mv.setViewName("admin/memberlist");
		return mv;
	}
	
	@PostMapping("/suspended/clear")
	public ModelAndView suspendedClear(ModelAndView mv, @RequestParam String memberId) {
		service.suspendedClear(memberId);
		mv.setViewName("admin/suspended");
		return mv;
	}
	
	@GetMapping("/adminlist")
	public ModelAndView adminList(ModelAndView mv, Criteria cri) {
		logger.info("boardListGET");
		logger.info("cri : " + cri);
		
		mv.addObject("memberlist", service.adminList(cri));
		int total = service.getTotalAdmin(cri);
		FpPageMakerVo pageMake = new FpPageMakerVo(cri, total);
		
		mv.addObject("pageMaker", pageMake);
		mv.setViewName("admin/adminlist");
		return mv;
	}
	
	// Admin 용 마이페이지
	@GetMapping("/mypage")
	public ModelAndView adminMypage(ModelAndView mv) {
		mv.setViewName("admin/mypage");
		return mv;
	}
	
	@GetMapping("/mypage/pwdChange")
	public ModelAndView pwdChange(ModelAndView mv) {
		mv.setViewName("admin/pwdChange");
		return mv;
	}
	
	@PostMapping("/mypage/pwdChange")
	public ModelAndView pwdChangeDo(@Valid PwdChangeForm pwdChangeForm, BindingResult bindingResult, ModelAndView mv) {
		if(bindingResult.hasErrors()) {
			mv.setViewName("admin/pwdChange");
			return mv;
        }
		
		if(!pwdChangeForm.getPassword2().equals(pwdChangeForm.getPassword3())) {
            bindingResult.rejectValue("password3", "passwordInCorrect", "변경할 2개의 비밀번호가 일치하지 않습니다.");
            mv.setViewName("admin/pwdChange");
    		return mv;
        }
		
		memberService.pwdChange(pwdChangeForm);
		mv.setViewName("admin/mypage");
		return mv;
	}
}