package kh.project.dml.diet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import kh.project.dml.diet.model.service.FpDietService;

@Controller
public class FpDietController {
	
	@Autowired
	public FpDietService fpDietService;
	
	// 기존 model 사용
	public String selectList(Model model) {
		model.addAttribute("dietList", fpDietService.selectList());
		return "diet/list";
	}
	
	// ModelAndView 사용
	public ModelAndView selectList(ModelAndView mv) {
		mv.addObject("dietList", fpDietService.selectList());
		mv.setViewName("diet/list");
		return mv;
	}
}
