package kh.project.dml.diet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.diet.model.service.FpDietService;
import kh.project.dml.diet.model.vo.FpDietVo;

@Controller
@RequestMapping("/diet")
public class FpDietController {
	@Autowired
	private FpDietService fpdietService;
	
	@GetMapping("/list")
	public ModelAndView selectListdiet(ModelAndView mv) {
		mv.addObject("dietlist", fpdietService.selectList());
		mv.setViewName("diet/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOnediet(ModelAndView mv, String mid) {
		mv.addObject("dietone", fpdietService.selectOne(mid));
		mv.setViewName("diet/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertdiet(ModelAndView mv ) {
		mv.setViewName("diet/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDoMemeber(RedirectAttributes redirectAttr, FpDietVo vo ) {
		String viewPage = "redirect:/";
		int result = fpdietService.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/diet/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/diet/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updatediet(ModelAndView mv, String mid ) {
		mv.addObject("dietone", fpdietService.selectOne(mid));
		mv.setViewName("diet/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpDietVo vo ) {
		String viewPage = "redirect:/";
		int result = fpdietService.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/diet/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/diet/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr, String mid ) {
		String viewPage = "redirect:/";
		int result = fpdietService.delete(mid);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/diet/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/diet/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}
