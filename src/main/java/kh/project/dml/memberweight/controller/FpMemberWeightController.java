package kh.project.dml.memberweight.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.memberweight.model.service.FpMemberWeightServiceImpl;
import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;
import kh.project.dml.users.model.vo.FpUsersVo;

@Controller
@RequestMapping("/memberweight")
public class FpMemberWeightController {

	@Autowired
	private FpMemberWeightServiceImpl fpMemberWeightServiceImpl;

	@GetMapping("/weight")
	public ModelAndView mainPageOpen9(ModelAndView mv, HttpSession session) {
		// TODO
		String memberId = "ch@dml.com";
		mv.addObject("fpMemberWeightVoListJson", new Gson().toJson(fpMemberWeightServiceImpl.selectList(memberId)));
//		[{"memberId":"ch@dml.com","weightDate":"20230922","weight":90.0,"muscleMass":0,"bodyFatPet":0},
//		{"memberId":"ch@dml.com","weightDate":"230904","weight":77.0,"muscleMass":36,"bodyFatPet":25},
//		{"memberId":"ch@dml.com","weightDate":"230908","weight":77.0,"muscleMass":42,"bodyFatPet":29},{"memberId":"ch@dml.com","weightDate":"20230921","weight":90.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20230926","weight":70.0122,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20230904","weight":50.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20230925","weight":70.0,"muscleMass":25,"bodyFatPet":15},{"memberId":"ch@dml.com","weightDate":"20230927","weight":85.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20230912","weight":55.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20230920","weight":55.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20230905","weight":77.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20230907","weight":80.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20230929","weight":33.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20231001","weight":55.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20231002","weight":50.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20231004","weight":0.0,"muscleMass":0,"bodyFatPet":0},{"memberId":"ch@dml.com","weightDate":"20231012","weight":0.0,"muscleMass":20,"bodyFatPet":15},{"memberId":"ch@dml.com","weightDate":"20231005","weight":55.0,"muscleMass":77,"bodyFatPet":15},{"memberId":"ch@dml.com","weightDate":"20231019","weight":0.0,"muscleMass":20,"bodyFatPet":15},{"memberId":"ch@dml.com","weightDate":"20231021","weight":0.0,"muscleMass":25,"bodyFatPet":15},{"memberId":"ch@dml.com","weightDate":"20231017","weight":0.0,"muscleMass":10,"bodyFatPet":15},{"memberId":"ch@dml.com","weightDate":"20231003","weight":0.0,"muscleMass":10,"bodyFatPet":15},{"memberId":"ch@dml.com","weightDate":"20231007","weight":0.0,"muscleMass":20,"bodyFatPet":15},{"memberId":"ch@dml.com","weightDate":"20231011","weight":0.0,"muscleMass":27,"bodyFatPet":10}]}]

		mv.setViewName("memberweight/weight2");
		return mv;
	}

//	update 체중관리
	@PostMapping("/weight")
	@ResponseBody
	public Integer mainPageOpen10(String memberId, String weightDate, String weight) {
		Date now = new Date(); // 오늘 날짜
		SimpleDateFormat dFormat = new SimpleDateFormat("yyyyMMdd");
		String nowDate = dFormat.format(now);

		FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(memberId, weightDate, Double.parseDouble(weight));
		int result = fpMemberWeightServiceImpl.dateWeight(fpMemberWeightVo, nowDate);
		return result;
	}

	// delete 선택한 날짜의 데이터 삭제
	@PostMapping("/deleteWeight")
	public String mainPageOpen13(@RequestParam String memberId, @RequestParam String weightDate) {
		/* FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(weight); */
		fpMemberWeightServiceImpl.deleteWeight(memberId, weightDate);
		return "memberweight/weight2";
	}

	
	  @GetMapping("/composition") public String mainPageOpen11() { 
		  
		  return"memberweight/composition";
		  }
	 
	
	/*
	 * @GetMapping("/composition") public String mainPageOpen11(ModelAndView mv,
	 * HttpSession session) { String memberId = "ch@dml.com";
	 * mv.addObject("fpMemberWeightVoListJson", new
	 * Gson().toJson(fpMemberWeightServiceImpl.selectList(memberId))); return
	 * "memberweight/composition"; }
	 */
	// 근육량 체지방량 update
	@PostMapping("/composition")
	public String mainPageOpen15(
//			@RequestParam String memberId, @RequestParam String weightDate, @RequestParam int muscleMass, @RequestParam int bodyFatPet
			FpMemberWeightVo fpMemberWeightVo, Model model) {
		System.out.println(fpMemberWeightVo);
//		FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(memberId, weightDate2, muscleMass, bodyFatPet);
		fpMemberWeightServiceImpl.insertUpdate(fpMemberWeightVo);
		return "redirect:/memberweight/composition";

	}

	// 근육량 체지방량 delete/
	@PostMapping("/delete")
	public String mainPageOpen17(@RequestParam String weightDate, @RequestParam String memberId, Model model) {
		/* FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(weight); */
		fpMemberWeightServiceImpl.delete(weightDate, memberId);
		return "memberweight/composition";
	}

	@GetMapping("/healthmap")
	public String mainPageOpen12() {
		return "memberweight/healthmap";
	}

}