package kh.project.dml.producttype.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kh.project.dml.producttype.model.service.FpProducttypeService;
import kh.project.dml.producttype.model.vo.FpProducttypeVo;

@Controller
@RequestMapping("/producttype")
public class FpProducttypeController {

	@Autowired
	private FpProducttypeService fpProducttypeServiceImpl;
	
	@GetMapping("/list")
	public ModelAndView selectList(ModelAndView mv) {
		mv.addObject("producttypelist", fpProducttypeServiceImpl.selectList());
		mv.setViewName("producttype/list");
		return mv;
	}
	
	@GetMapping("/one")
	public ModelAndView selectOnedaydiet(ModelAndView mv, String type) {
		mv.addObject("producttypeone", fpProducttypeServiceImpl.selectOne(type));
		mv.setViewName("producttype/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertdaydiet(ModelAndView mv ) {
		mv.setViewName("producttype/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDoMemeber(RedirectAttributes redirectAttr, FpProducttypeVo vo) {
		String viewPage = "redirect:/";
		int result = fpProducttypeServiceImpl.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/producttype/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/producttype/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
	@GetMapping("/update")
	public ModelAndView updatedaydiet(ModelAndView mv, String type ) {
		mv.addObject("producttypeone", fpProducttypeServiceImpl.selectOne(type));
		mv.setViewName("producttype/update");
		return mv;
	}
	
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpProducttypeVo vo ) {
		String viewPage = "redirect:/";
		int result = fpProducttypeServiceImpl.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/producttype/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/producttype/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr,String type ) {
		String viewPage = "redirect:/";
		int result = fpProducttypeServiceImpl.delete(type);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/producttype/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/producttype/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
}
