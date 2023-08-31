package kh.project.dml.onedayex.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.onedayex.model.Service.FpOneDayExService;
import kh.project.dml.onedayex.model.Vo.FpOneDayExVo;


@Controller
@RequestMapping("/onedayex")
public class FpOneDayExController {
	@Autowired
	private FpOneDayExService fponedayexService;
	
	@GetMapping("/list")
	public ModelAndView selectListonedayex(ModelAndView mv) {
		mv.addObject("onedayexlist", fponedayexService.selectList());
		mv.setViewName("onedayex/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOneonedayex(ModelAndView mv, int exerciesId) {
		mv.addObject("onedayexone", fponedayexService.selectOne(exerciesId));
		mv.setViewName("onedayex/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertonedayex(ModelAndView mv ) {
		mv.setViewName("onedayex/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDoMemeber(RedirectAttributes redirectAttr, FpOneDayExVo vo ) {
		String viewPage = "redirect:/";
		int result = fponedayexService.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/onedayex/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/onedayex/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updateonedayex(ModelAndView mv, int exerciesId ) {
		mv.addObject("onedayexone", fponedayexService.selectOne(exerciesId));
		mv.setViewName("onedayex/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpOneDayExVo vo ) {
		String viewPage = "redirect:/";
		int result = fponedayexService.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/onedayex/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/onedayex/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr, int exerciesId ) {
		String viewPage = "redirect:/";
		int result = fponedayexService.delete(exerciesId);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/onedayex/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/onedayex/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}

