package kh.project.dml.diet.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.diet.model.service.FpDietService;
import kh.project.dml.diet.model.vo.FpDietVo;
import kh.project.dml.diet.model.vo.TotalFoodListDTO;
import kh.project.dml.food.model.service.FpFoodService;
import kh.project.dml.food.model.service.FpFoodServiceImpl;
import kh.project.dml.foodapi.model.vo.FpFoodApiVo;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.users.model.vo.FpUsersVo;

@Controller
@RequestMapping("/diet")
public class FpDietController {

	@Autowired
	public FpDietService fpDietServiceImpl; 
	
	@Autowired
	private FpFoodService fpFoodServiceImpl;
	
	@ResponseBody
	@PostMapping("/list")
	public Map<String, Object> selectListDiet(@RequestBody FpDietVo vo, HttpSession session) 
	{
		FpMemberVo member = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		FpDietVo dietVo = new FpDietVo();
		if (member == null) { // 일반 계정인 경우
			dietVo.setMemberId("");

		} else {
			System.out.println("===========================================================");

//			System.out.println("userMember : " + userMember);

			System.out.println("userMember : " + member );

			System.out.println("===========================================================");
			
			dietVo.setMemberId(member.getMemberId());
		}
		
		if(!"ALL".equals(vo.getFoodTime()))
		{
			dietVo.setFoodTime(vo.getFoodTime());
		}
		
		
		dietVo.setFoodDate(vo.getFoodDate());
		
		System.out.println("==============================================================================");
		System.out.println("vo : " + dietVo);
		System.out.println("==============================================================================");
		
		Map<String, Object> map = new HashMap<>();
		
		TotalFoodListDTO totalDto = null;
		
		totalDto =fpDietServiceImpl.totalSelectList(dietVo);
		
		if(totalDto != null) 
		{
			if(totalDto.getFoodTime() ==null)
				totalDto.setFoodTime("");
			
			if(totalDto.getTotalCal() ==null)
				totalDto.setTotalCal("");
			
			if(totalDto.getTotalCrabs() ==null)
				totalDto.setTotalCrabs("");
			
			if(totalDto.getTotalFat() ==null)
				totalDto.setTotalFat("");
			
			if(totalDto.getTotalProtein() ==null)
				totalDto.setTotalProtein("");
		
		}
		else 
		{
			totalDto = new TotalFoodListDTO();
			totalDto.setFoodTime("");
			totalDto.setTotalCal("");
			totalDto.setTotalCrabs("");
			totalDto.setTotalFat("");
			totalDto.setTotalProtein("");
		}
		
		map.put("dietList", fpDietServiceImpl.selectList(dietVo));
		map.put("totalDietList", totalDto); 
		
		return map;
	}
	
	@GetMapping("/list")
	public ModelAndView selectListdiet(ModelAndView mv,HttpSession session) {
		
		FpMemberVo member = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		
		FpDietVo dietVo = new FpDietVo();
				
		if (member == null) {
			dietVo.setMemberId("");
		} else {
			System.out.println("===========================================================");
			System.out.println(member);
			System.out.println("===========================================================");
			dietVo.setMemberId(member.getMemberId());
		}
		
		LocalDate now = LocalDate.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");

		String formaterNow = now.format(formatter);
		
		dietVo.setFoodDate(formaterNow);
		
		

		List<FpDietVo> dietList = fpDietServiceImpl.selectList(dietVo);
		
	    dietList.stream().forEach((row)->{
	    	
	    		
	    	switch (row.getFoodTime()) {
			  case "A":
				  row.setFoodTime("아침");
			    break;
			  case "B":
				  row.setFoodTime("점심");
				break;
			  case "C":
				  row.setFoodTime("저녁");
			    break;
			  case "Z":
				  row.setFoodTime("간식");
			    break;	  
			  default:
				  row.setFoodTime("전체");
			}
	    	
	    });
		
		
		mv.addObject("dietList", dietList);
		
		TotalFoodListDTO totalDto = null;
		
		totalDto =fpDietServiceImpl.totalSelectList(dietVo);
		
		if(totalDto != null) 
		{
			if(totalDto.getFoodTime() ==null)
				totalDto.setFoodTime("");
			
			if(totalDto.getTotalCal() ==null)
				totalDto.setTotalCal("");
			
			if(totalDto.getTotalCrabs() ==null)
				totalDto.setTotalCrabs("");
			
			if(totalDto.getTotalFat() ==null)
				totalDto.setTotalFat("");
			
			if(totalDto.getTotalProtein() ==null)
				totalDto.setTotalProtein("");
		
		}
		else 
		{
			totalDto = new TotalFoodListDTO();
			totalDto.setFoodTime("");
			totalDto.setTotalCal("");
			totalDto.setTotalCrabs("");
			totalDto.setTotalFat("");
			totalDto.setTotalProtein("");
		}
		
		mv.addObject("totalDietList", totalDto);
		 
		mv.setViewName("diet/list");
		
		return mv;
	}
	
	@GetMapping("/search")
	@ResponseBody
	public String selectDayList(ModelAndView mv,String mealCode) {
		return new Gson().toJson(fpDietServiceImpl.selectDayList(mealCode));
	}
	
	/*
	 * @GetMapping("/getSearchList")
	 * 
	 * @ResponseBody public List<FpFoodApiVo> getSearchList( //@RequestParam("type")
	 * String type, //@RequestParam("keyword") String keyword FpDietVo fpDietVo ,
	 * Model model) { System.out.println("aaaa"); List<FpFoodApiVo> result =
	 * fpFOODAPServiceImpl.getSearchList(fpFoodApiVo); return result; }
	 */
	
	
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
	public String insertDofood(@RequestBody FpDietVo voParam, HttpSession session) {
		System.out.println(" INSERT 컨틀로러 호출 ===========================================================");
		System.out.println(voParam);
		System.out.println("INSERT 컨틀로러 호출 ===========================================================");
		
		FpMemberVo member = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		System.out.println("INSERT 컨틀로러 호출 ===========================================================");
		System.out.println(member);
		System.out.println("INSERT 컨틀로러 호출 ===========================================================");
		voParam.setMemberId(member.getMemberId());
		fpFoodServiceImpl.insert(voParam);
		return "success";
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
	public String deleteDoMemeber(RedirectAttributes redirectAttr, @RequestBody FpDietVo FpDietVo) {
		int result = fpDietServiceImpl.delete(FpDietVo);
		
		System.out.println("======================================");
		System.out.println("delete 컨트롤러 호출 : " + result + "foodGp : " + FpDietVo);
		System.out.println("======================================");
		
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