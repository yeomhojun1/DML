package kh.project.dml.diet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.diet.model.service.FpDietService;
import kh.project.dml.diet.model.vo.FpDietVo;
import kh.project.dml.food.model.service.FpFoodService;
import kh.project.dml.food.model.service.FpFoodServiceImpl;

@Controller
@RequestMapping("/diet")
public class FpDietController {

	@Autowired
	public FpDietService fpDietServiceImpl;
	
	@Autowired
	private FpFoodServiceImpl fpFoodServiceImpl;
	
	@GetMapping("/list")
	public ModelAndView selectListdiet(ModelAndView mv) {
		mv.addObject("dietList", fpDietServiceImpl.selectList());
		mv.setViewName("diet/list");
		return mv;
	}
	
	
	@GetMapping("/dietlist")
	public String selectList2() {
		return "diet/dietlist"; 
			
	}	
	
	@GetMapping("/one")
	public ModelAndView selectOnediet(ModelAndView mv, String mealCode) {
		mv.addObject("dietone", fpDietServiceImpl.selectOne(mealCode));
		mv.setViewName("diet/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertdiet(ModelAndView mv ) {
		mv.setViewName("diet/insert");
		return mv;
	}
	@PostMapping("/insert")
	@ResponseBody
	public String insertDofood(@RequestBody FpDietVo voParam) {
		fpFoodServiceImpl.insert(voParam);
		return "성공";
	}
	@GetMapping("/update")
	public ModelAndView updatediet(ModelAndView mv, String mealCode) {
		mv.addObject("dietone", fpDietServiceImpl.selectOne(mealCode));
		mv.setViewName("diet/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpDietVo vo ) {
		String viewPage = "redirect:/";
		int result = fpDietServiceImpl.update(vo);
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
	@ResponseBody
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr, String mealCode ) {
		int result = fpDietServiceImpl.delete(mealCode);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}
}