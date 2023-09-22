package kh.project.dml.chickenproduct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.chickenproduct.model.service.FpChickenproductServiceImpl;
import kh.project.dml.chickenproduct.model.vo.FpChickenproductVo;


@Controller
@RequestMapping("/chickenproduct")
public class FpChickenproductController {
	
	@Autowired
	private FpChickenproductServiceImpl fpChickenproductServiceImpl;
	
	@GetMapping("/list")
	public ModelAndView selectListchickenproduct(ModelAndView mv) {
		mv.addObject("chickenproductlist" ,fpChickenproductServiceImpl.selectList());
		mv.setViewName("chickenproduct/list");
		return mv;
	}
	
	@GetMapping("/one")
	public ModelAndView selectOnechickenproduct(ModelAndView mv, int chickenNo) {
		mv.addObject("chickenproduct", fpChickenproductServiceImpl.selectOne(chickenNo));
		mv.setViewName("chickenproduct/one");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDoMemeber(RedirectAttributes redirectAttr, FpChickenproductVo vo) {
		String viewPage = "redirect:/";
		int result = fpChickenproductServiceImpl.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/chickenproduct/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/chickenproduct/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
	@GetMapping("/update")
	public ModelAndView updatedaydiet(ModelAndView mv, int chickenNo  ) {
		mv.addObject("daydietone", fpChickenproductServiceImpl.selectOne(chickenNo));
		mv.setViewName("daydiet/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpChickenproductVo vo ) {
		String viewPage = "redirect:/";
		int result = fpChickenproductServiceImpl.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/chickenproduct/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/chickenproduct/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr,int chickenNo ) {
		String viewPage = "redirect:/";
		int result = fpChickenproductServiceImpl.delete(chickenNo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/chickenproduct/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/chickenproduct/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}

}
