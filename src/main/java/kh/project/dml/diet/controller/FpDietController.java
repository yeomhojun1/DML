package kh.project.dml.diet.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
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
import kh.project.dml.food.model.service.FpFoodService;
import kh.project.dml.food.model.service.FpFoodServiceImpl;
import kh.project.dml.users.model.vo.FpUsersVo;

@Controller
@RequestMapping("/diet")
public class FpDietController {

	@Autowired
	public FpDietService fpDietServiceImpl;
	
	@Autowired
	private FpFoodServiceImpl fpFoodServiceImpl;
	
	@ResponseBody
	@PostMapping("/list")
	public Map<String, Object> selectListDiet(@RequestBody FpDietVo vo, HttpSession session) 
	{
		
		
       Object memberObj = session.getAttribute(SessionNames.LOGIN);
		
		FpDietVo dietVo = new FpDietVo();
				
		if (memberObj instanceof FpUsersVo) { // 일반 계정인 경우
    		FpUsersVo userMember = (FpUsersVo) memberObj;
    		
    		System.out.println("===========================================================");
    		System.out.println("userMember : " + userMember);
    		System.out.println("===========================================================");
    	
    		dietVo.setMemberId(userMember.getUsername());

		}
		
		else if(memberObj == null) {
			dietVo.setMemberId("");
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
		
		map.put("dietList", fpDietServiceImpl.selectList(dietVo));
		 
		
		return map;
	};
	
	@GetMapping("/list")
	public ModelAndView selectListdiet(ModelAndView mv,HttpSession session) {
		
		Object memberObj = session.getAttribute(SessionNames.LOGIN);
		
		FpDietVo dietVo = new FpDietVo();
				
		if (memberObj instanceof FpUsersVo) { // 일반 계정인 경우
    		FpUsersVo userMember = (FpUsersVo) memberObj;
    		
    		System.out.println("===========================================================");
    		System.out.println(userMember);
    		System.out.println("===========================================================");
    
    		dietVo.setMemberId(userMember.getUsername());
    	
		}
		
		else if(memberObj == null) {
			dietVo.setMemberId("");
		}
		
		

		
		mv.addObject("dietList", fpDietServiceImpl.selectList(dietVo));
		 
		mv.setViewName("diet/list");
		
		return mv;
	}
	
	@GetMapping("/search")
	@ResponseBody
	public String selectDayList(ModelAndView mv,String mealCode) {
		return new Gson().toJson(fpDietServiceImpl.selectDayList(mealCode));
	}
	
	/*
	 * @GetMapping("/dietlist") public String selectList2() { return
	 * "diet/dietlist";
	 * 
	 * }
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
		
		Object memberObj = session.getAttribute(SessionNames.LOGIN);
				
		if (memberObj instanceof FpUsersVo) { // 일반 계정인 경우
    		FpUsersVo userMember = (FpUsersVo) memberObj;
    		
    		System.out.println("INSERT 컨틀로러 호출 ===========================================================");
    		System.out.println(userMember);
    		System.out.println("INSERT 컨틀로러 호출 ===========================================================");
    
    		voParam.setMemberId(userMember.getUsername());
    	
		}
		
		
		
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
	public String deleteDoMemeber(RedirectAttributes redirectAttr, String foodCd) {
		int result = fpDietServiceImpl.delete(foodCd);
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