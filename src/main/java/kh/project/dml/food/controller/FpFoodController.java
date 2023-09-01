package kh.project.dml.food.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.food.model.service.FpFoodService;
import kh.project.dml.food.model.vo.FpFoodVo;


@Controller
@RequestMapping("/food")
public class FpFoodController {
	@Autowired
	private FpFoodService fpfoodService;
	
	@GetMapping("/list")
	public ModelAndView selectListfood(ModelAndView mv) {
		mv.addObject("foodlist", fpfoodService.selectList());
		mv.setViewName("food/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOnefood(ModelAndView mv, String commentNum) {
		mv.addObject("foodone", fpfoodService.selectOne(commentNum));
		mv.setViewName("food/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertfood(ModelAndView mv ) {
		mv.setViewName("food/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDofood(RedirectAttributes redirectAttr, FpFoodVo vo ) {
		String viewPage = "redirect:/";
		int result = fpfoodService.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/food/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/food/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updatefood(ModelAndView mv, String commentNum ) {
		mv.addObject("foodone", fpfoodService.selectOne(commentNum));
		mv.setViewName("food/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDofood(RedirectAttributes redirectAttr, FpFoodVo vo ) {
		String viewPage = "redirect:/";
		int result = fpfoodService.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/food/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/food/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDofood(RedirectAttributes redirectAttr,String commentNum ) {
		String viewPage = "redirect:/";
		int result = fpfoodService.delete(commentNum);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/food/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/food/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}
