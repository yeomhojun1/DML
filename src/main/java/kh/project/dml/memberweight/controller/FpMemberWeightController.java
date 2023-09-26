package kh.project.dml.memberweight.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.project.dml.memberweight.model.service.FpMemberWeightServiceImpl;
import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;


@Controller
@RequestMapping("/memberweight")
public class FpMemberWeightController {
	
	@Autowired
	private FpMemberWeightServiceImpl fpMemberWeightServiceImpl;
	
	@GetMapping("/weight")
	public String mainPageOpen9(Model model) {
		model.addAttribute("fpMemberWeightVo" , new FpMemberWeightVo());
		return "memberweight/weight2";
	}
	
	
//	update 체중관리
	@PostMapping("/weight")
	public String mainPageOpen10(@RequestParam String memberId, @RequestParam Date date, @RequestParam double weight, Model model) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String weightDate = format.format(date);
		Date now = new Date(System.currentTimeMillis());
		String nowDate = format.format(now);
		
		FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(memberId, weightDate, weight);
		fpMemberWeightServiceImpl.dateWeight(fpMemberWeightVo, nowDate);
		return "memberweight/weight2";
	}
	
	//	delete 선택한 날짜의 데이터 삭제
	 @PostMapping("/deleteWeight")
	 public String mainPageOpen13(@RequestParam String memberId, @RequestParam String weightDate){
			/* FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(weight); */
		 fpMemberWeightServiceImpl.deleteWeight(memberId, weightDate);
	 	 return "memberweight/weight2";
	  }
	 
	@GetMapping("/composition")
	public String mainPageOpen11() {
		return "memberweight/composition";
	}
	
	//근육량 체지방 insert
	@PostMapping("/composition/insert")
	public String mainPageOpen14(FpMemberWeightVo param) {
		fpMemberWeightServiceImpl.insertUpdate(param);
		return "memberweight/composition";
	}
	
	@GetMapping("/healthmap")
	public String mainPageOpen12() {
		return "memberweight/healthmap";
	}
	
}