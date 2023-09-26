package kh.project.dml.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
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

@Controller
@RequestMapping("/admin")
public class FpAdminController {
	
	// 로그 수집 기능
	private static final Logger logger = LoggerFactory.getLogger(FpAdminController.class);
	
	@Autowired
	private FpAdminServiceImpl service;
	
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
	
	@GetMapping("/insert")
	public ModelAndView insertadmin(ModelAndView mv ) {
		mv.setViewName("admin/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDoMemeber(RedirectAttributes redirectAttr, FpAdminVo vo ) {
		String viewPage = "redirect:/";
		int result = service.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/admin/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/admin/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updateadmin(ModelAndView mv, String adminId ) {
		mv.addObject("adminone", service.selectOne(adminId));
		mv.setViewName("admin/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpAdminVo vo ) {
		String viewPage = "redirect:/";
		int result = service.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/admin/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/admin/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr,String adminId ) {
		String viewPage = "redirect:/";
		int result = service.delete(adminId);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/admin/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/admin/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}