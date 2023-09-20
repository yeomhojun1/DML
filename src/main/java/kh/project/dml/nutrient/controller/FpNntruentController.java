package kh.project.dml.nutrient.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.daydiet.model.vo.FpDayDietVo;
import kh.project.dml.nutrient.model.service.FpNntruentService;
import kh.project.dml.nutrient.model.vo.FpNntruentVo;

@Controller
@RequestMapping("/nutruent")
public class FpNntruentController {

	@Autowired
	private FpNntruentService fpNntruentServiceImpl;
	
	@GetMapping("/list")
	public ModelAndView selectList(ModelAndView mv) {
		mv.addObject("nutruentlist", fpNntruentServiceImpl.selectList());
		mv.setViewName("nutruent/list");
		return mv;
	}
	
	@GetMapping("/one")
	public ModelAndView selectOnenutruent(ModelAndView mv, int nutrientId) {
		mv.addObject("nutruentone", fpNntruentServiceImpl.selectOne(nutrientId));
		mv.setViewName("nutruent/one");
		return mv;
	}
	
	@GetMapping("/insert")
	public ModelAndView insertnutruent(ModelAndView mv ) {
		mv.setViewName("nutruent/insert");
		return mv;
	}
	
	@PostMapping("/insert")
	public String insertDoMemeber(RedirectAttributes redirectAttr, FpNntruentVo vo) {
		String viewPage = "redirect:/";
		int result = fpNntruentServiceImpl.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/nutruent/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
			viewPage = "redirect:/nutruent/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
	@GetMapping("/update")
	public ModelAndView updatedaydiet(ModelAndView mv, int nutrientId ) {
		mv.addObject("nutruentone", fpNntruentServiceImpl.selectOne(nutrientId));
		mv.setViewName("nutruent/update");
		return mv;
	}
	
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpNntruentVo vo ) {
		String viewPage = "redirect:/";
		int result = fpNntruentServiceImpl.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/nutruent/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/nutruent/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr,int nutrientId ) {
		String viewPage = "redirect:/";
		int result = fpNntruentServiceImpl.delete(nutrientId);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/nutruent/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/nutruent/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
}
