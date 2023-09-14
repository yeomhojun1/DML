package kh.project.dml.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.admin.model.service.FpAdminService;
import kh.project.dml.admin.model.service.FpAdminServiceImpl;
import kh.project.dml.admin.model.vo.FpAdminVo;


@Controller
@RequestMapping("/admin")
public class FpAdminController {
	@Autowired
	private FpAdminServiceImpl fpAdminServiceImpl;
	
	@GetMapping("/list")
	public ModelAndView selectListadmin(ModelAndView mv) {
		mv.addObject("adminlist", fpAdminServiceImpl.selectList());
		mv.setViewName("admin/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOneadmin(ModelAndView mv, String adminId) {
		mv.addObject("adminone", fpAdminServiceImpl.selectOne(adminId));
		mv.setViewName("admin/one");
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
		int result = fpAdminServiceImpl.insert(vo);
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
		mv.addObject("adminone", fpAdminServiceImpl.selectOne(adminId));
		mv.setViewName("admin/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpAdminVo vo ) {
		String viewPage = "redirect:/";
		int result = fpAdminServiceImpl.update(vo);
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
		int result = fpAdminServiceImpl.delete(adminId);
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