package kh.project.dml.memberweight.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.project.dml.memberweight.model.service.FpMemberWeightServiceImpl;
import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;


@Controller
@RequestMapping("/memberweight")
public class FpMemberWeightController {
	
	@Autowired
	private FpMemberWeightServiceImpl service;
	
	@GetMapping("/weight2")
	public String mainPageOpen9(Model model) {
		model.addAttribute("fpMemberWeightVo" , new FpMemberWeightVo());
		return "temp/weight2";
	}
	
	@PostMapping("/weight2")
	public String mainPageOpen10(@RequestParam String memberId, @RequestParam Date date, @RequestParam double weight, Model model) {
		FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(memberId, date, weight);
		service.insert(fpMemberWeightVo);
		return "temp/weight2";
	}

	@GetMapping("/composition")
	public String mainPageOpen11() {
		return "temp/composition";
	}
	
	@GetMapping("/healthmap")
	public String mainPageOpen12() {
		return "temp/healthmap";
	}
	
}