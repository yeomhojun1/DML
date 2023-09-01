package kh.project.dml.daydiet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.daydiet.model.service.FpDayDietService;
import kh.project.dml.daydiet.model.vo.FpDayDietVo;


@Controller
@RequestMapping("/daydiet")
public class FpDayDietController {
	@Autowired
	private FpDayDietService fpdaydietService;
	
	@GetMapping("/list")
	public ModelAndView selectListdaydiet(ModelAndView mv) {
		mv.addObject("daydietlist", fpdaydietService.selectList());
		mv.setViewName("daydiet/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOnedaydiet(ModelAndView mv, String commentNum) {
		mv.addObject("daydietone", fpdaydietService.selectOne(commentNum));
		mv.setViewName("daydiet/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertdaydiet(ModelAndView mv ) {
		mv.setViewName("daydiet/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDoMemeber(RedirectAttributes redirectAttr, FpDayDietVo vo) {
		String viewPage = "redirect:/";
		int result = fpdaydietService.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/daydiet/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/daydiet/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updatedaydiet(ModelAndView mv, String commentNum ) {
		mv.addObject("daydietone", fpdaydietService.selectOne(commentNum));
		mv.setViewName("daydiet/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpDayDietVo vo ) {
		String viewPage = "redirect:/";
		int result = fpdaydietService.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/daydiet/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/daydiet/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr,String commentNum ) {
		String viewPage = "redirect:/";
		int result = fpdaydietService.delete(commentNum);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/daydiet/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/daydiet/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}