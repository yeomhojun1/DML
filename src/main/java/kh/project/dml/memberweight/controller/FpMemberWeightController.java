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

@Controller
@RequestMapping("/memberweight")
public class FpMemberWeightController {

	@Autowired
	private FpMemberWeightServiceImpl fpMemberWeightServiceImpl;
	//체중관리차트 controller
	
	@GetMapping("/weight")
	public ModelAndView chartDate(ModelAndView mv, HttpSession session) {
		Date now = new Date(); // 오늘 날짜
		SimpleDateFormat dFormat = new SimpleDateFormat("yyyyMMdd");
		String nowDate = dFormat.format(now);
		
		FpMemberVo vo = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		mv.addObject("fpMemberWeightVoListJson", new Gson().toJson(fpMemberWeightServiceImpl.selectList(vo.getMemberId())));
		mv.addObject("memberWeight", fpMemberWeightServiceImpl.nowWeight(nowDate, vo.getMemberId()));
		mv.setViewName("memberweight/weight2");
		return mv;
	}
	
	//체중관리 입력시 화면구현 controller
	@PostMapping("/weight/nowDate")
	@ResponseBody
	public FpMemberWeightVo weightInsert(@RequestParam String selectDate, ModelAndView mv, HttpSession session) {
		FpMemberVo vo = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		FpMemberWeightVo result = fpMemberWeightServiceImpl.nowWeight(selectDate, vo.getMemberId());
		return result;
	}

//	update 체중관리
	@PostMapping("/weight")
	@ResponseBody
	public Integer weightUpdate(String memberId, String weightDate, String weight) {
		Date now = new Date(); // 오늘 날짜
		SimpleDateFormat dFormat = new SimpleDateFormat("yyyyMMdd");
		String nowDate = dFormat.format(now);

		FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(memberId, weightDate, Double.parseDouble(weight));
		int result = fpMemberWeightServiceImpl.dateWeight(fpMemberWeightVo, nowDate);
		return result;
	}

	// delete 선택한 날짜의 데이터 삭제
	@PostMapping("/deleteWeight")
	public String weightDelete(@RequestParam String memberId, @RequestParam String weightDate) {
		/* FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(weight); */
		fpMemberWeightServiceImpl.deleteWeight(memberId, weightDate);
		return "memberweight/weight2";
	}
	
	
	//근육량 체지방량 차트 controller
	@GetMapping("/composition")
	public ModelAndView chartComposition(ModelAndView mv, HttpSession session) { 
		Date now = new Date(); // 오늘 날짜
		SimpleDateFormat dFormat = new SimpleDateFormat("yyyyMMdd");
		String nowDate = dFormat.format(now);
		
		FpMemberVo vo = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		mv.addObject("fpMemberWeightVoListJson", new Gson().toJson(fpMemberWeightServiceImpl.selectList(vo.getMemberId())));
		mv.addObject("memberComposition", fpMemberWeightServiceImpl.nowComposition(nowDate, vo.getMemberId()));
		mv.setViewName("memberweight/composition2");
		return mv;
	}
	
	//근육량 체지방량 차트 controller
	@PostMapping("/composition/nowdate")
	@ResponseBody
	public FpMemberWeightVo nowDate(@RequestParam String selectDate, ModelAndView mv, HttpSession session) { 
		FpMemberVo vo = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		FpMemberWeightVo result = fpMemberWeightServiceImpl.nowComposition(selectDate, vo.getMemberId());
		return result;
	}
	
	  
	// 근육량 체지방량 update
	@PostMapping("/composition")
	public String compositionUpdate(
//			@RequestParam String memberId, @RequestParam String weightDate, @RequestParam int muscleMass, @RequestParam int bodyFatPet
			FpMemberWeightVo fpMemberWeightVo, Model model) {
		System.out.println(fpMemberWeightVo);
//		FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(memberId, weightDate2, muscleMass, bodyFatPet);
		fpMemberWeightServiceImpl.insertUpdate(fpMemberWeightVo);
		return "redirect:/memberweight/composition";

	}

	// 근육량 체지방량 delete/
	@PostMapping("/delete")
	public String compositionDelete(@RequestParam String weightDate, @RequestParam String memberId, Model model) {
		/* FpMemberWeightVo fpMemberWeightVo = new FpMemberWeightVo(weight); */
		fpMemberWeightServiceImpl.delete(weightDate, memberId);
		return "memberweight/composition2";
	}

	@GetMapping("/healthmap")
	public String mapApi() {
		return "memberweight/healthmap";
	}

}