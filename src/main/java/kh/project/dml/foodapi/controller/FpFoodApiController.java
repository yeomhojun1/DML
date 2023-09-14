package kh.project.dml.foodapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.foodapi.model.service.FpFoodApiService;
import kh.project.dml.foodapi.model.vo.FpFoodApiVo;


@Controller
@RequestMapping("/foodapi")
public class FpFoodApiController {
	@Autowired
	private FpFoodApiService fpFoodApiServiceImpl;
	
	@GetMapping("/list")
	public ModelAndView selectListfoodapi(ModelAndView mv) {
		mv.addObject("foodapilist", fpFoodApiServiceImpl.selectList());
		mv.setViewName("foodapi/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOnefoodapi(ModelAndView mv, String commentNum) {
		mv.addObject("foodapione", fpFoodApiServiceImpl.selectOne(commentNum));
		mv.setViewName("foodapi/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertfoodapi(ModelAndView mv ) {
		mv.setViewName("foodapi/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDofoodapi(RedirectAttributes redirectAttr, FpFoodApiVo vo ) {
		String viewPage = "redirect:/";
		int result = fpFoodApiServiceImpl.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/foodapi/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/foodapi/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updatefoodapi(ModelAndView mv, String commentNum ) {
		mv.addObject("foodapione", fpFoodApiServiceImpl.selectOne(commentNum));
		mv.setViewName("foodapi/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDofoodapi(RedirectAttributes redirectAttr, FpFoodApiVo vo ) {
		String viewPage = "redirect:/";
		int result = fpFoodApiServiceImpl.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/foodapi/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/foodapi/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDofoodapi(RedirectAttributes redirectAttr,String commentNum ) {
		String viewPage = "redirect:/";
		int result = fpFoodApiServiceImpl.delete(commentNum);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/foodapi/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/foodapi/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}