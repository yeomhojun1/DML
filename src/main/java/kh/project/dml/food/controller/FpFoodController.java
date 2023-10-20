package kh.project.dml.food.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.diet.model.vo.FpDietVo;
import kh.project.dml.diet.model.vo.FpFoodVo;
import kh.project.dml.food.model.service.FpFoodService;


@Controller
@RequestMapping("/food")
public class FpFoodController {
	@Autowired
	private FpFoodService fpFoodServiceImpl;
	
	@GetMapping("/list")
	public ModelAndView selectListfood(ModelAndView mv) {
		mv.addObject("foodlist", fpFoodServiceImpl.selectList());
		mv.setViewName("food/list");
		return mv;
	}
	
	@GetMapping("/index")
	public String selectList() {
		return "food/index"; 
			
	}	
	@GetMapping("/one")
	public ModelAndView selectOnefood(ModelAndView mv, String commentNum) {
		mv.addObject("foodone", fpFoodServiceImpl.selectOne(commentNum));
		mv.setViewName("food/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertfood(ModelAndView mv ) {
		mv.setViewName("food/insert");
		return mv;
	}
	@PostMapping("/insert")
	@ResponseBody
	public String insertDofood(
//			@RequestBody Map<String, Object> mapParam
//			, 
			@RequestBody FpDietVo voParam
			) {
		System.out.println("aaaa");
		System.out.println(voParam);
		fpFoodServiceImpl.insert(voParam);
/*
FpDailyFoodParam(
mealCode=, 
memberId=77@77.77, 
foodDate=2023-09-21, 
foodTime=null, 
feedback=null, 
foodlist=[
	FpFoodVo(foodCd=D00009, foodQuantity=20, foodTime=아침, mealCode=null), 
	FpFoodVo(foodCd=D00008, foodQuantity=20, foodTime=아침, mealCode=null), 
	FpFoodVo(foodCd=D00011, foodQuantity=20, foodTime=아침, mealCode=null)]
)
 */

//		System.out.println(mapParam);
//		System.out.println(mapParam.get("selectedDate"));
//		List<Object> list = Arrays.asList(mapParam.get("foodlist"));
//		System.out.println(list);
/*
{
mealCode=, 
foodlist=[{foodCd=D00008, foodQuantity=20, foodTime=아침}, 
		{foodCd=D00010, foodQuantity=20, foodTime=아침}, 
		{foodCd=D00009, foodQuantity=20, foodTime=아침}], 
foodDate=2023-09-21, 
memberId=77@77.77
}
 */
		
		
		
		return "성공";
	}
	@GetMapping("/update")
	public ModelAndView updatefood(ModelAndView mv, String commentNum ) {
		mv.addObject("foodone", fpFoodServiceImpl.selectOne(commentNum));
		mv.setViewName("food/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDofood(RedirectAttributes redirectAttr, FpFoodVo vo ) {
		String viewPage = "redirect:/";
		int result = fpFoodServiceImpl.update(vo);
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
	@ResponseBody
	public String deleteDofood(RedirectAttributes redirectAttr,String foodCd ) {
		System.out.println(foodCd);
		int result = fpFoodServiceImpl.delete(foodCd);
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
