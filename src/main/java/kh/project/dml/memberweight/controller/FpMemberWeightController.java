package kh.project.dml.memberweight.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	public Integer mainPageOpen10( String memberId, String weightDate, String weight) {
		Date now = new Date();	// 오늘 날짜
		SimpleDateFormat dFormat = new SimpleDateFormat("yyyyMMdd");
		String nowDate = dFormat.format(now);
		
		FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(memberId, weightDate, Double.parseDouble(weight));
		int result = fpMemberWeightServiceImpl.dateWeight(fpMemberWeightVo, nowDate);
		return result;
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

	//근육량 체지방량 update
	@PostMapping("/composition")
	public String mainPageOpen15(@RequestParam String memberId, @RequestParam Date date, @RequestParam int muscleMass, @RequestParam int bodyFatPet, Model model) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String weightDate = format.format(date);
		
		FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(memberId, weightDate, muscleMass, bodyFatPet);
		fpMemberWeightServiceImpl.insertUpdate(fpMemberWeightVo);
		return "redirect:/memberweight/composition";
	}
		//근육량 체지방량 delete/	
			@PostMapping("/delete")
	 		public String mainPageOpen17( @RequestParam String weightDate, @RequestParam String memberId, Model model){
			/* FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(weight); */
		 fpMemberWeightServiceImpl.delete( weightDate ,memberId );
	 	 return "memberweight/composition";
	  }
	
	
	@GetMapping("/healthmap")
	public String mainPageOpen12() {
		return "memberweight/healthmap";
	}
	
}