package kh.project.dml.suplement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.daydiet.model.vo.FpDayDietVo;
import kh.project.dml.suplement.model.service.FpSuplementService;
import kh.project.dml.suplement.model.vo.FpSuplementVo;

@Controller
@RequestMapping("/suplement")
public class FpSuplementController {
	@Autowired
	private FpSuplementService fpSuplementServiceImpl;
	
	@GetMapping("list")
	public ModelAndView selectListsuplemen(ModelAndView mv) {
		mv.addObject("suplementlist", fpSuplementServiceImpl.selectList());
		mv.setViewName("suplement/list");
		return mv;
	}
	
	@GetMapping("/one")
	public ModelAndView selectOnesuplemen(ModelAndView mv, int suplemenno) {
		mv.addObject("suplementone", fpSuplementServiceImpl.selectOne(suplemenno));
		mv.setViewName("suplement/one");
		return mv;
	}
	
	@GetMapping("/insert")
	public ModelAndView insertsuplemen(ModelAndView mv) {
		mv.setViewName("suplement/insert");
		return mv;
		
	}
	@PostMapping("/insert")
	public String insertsuplemen(RedirectAttributes redirectAttr, FpSuplementVo vo) {
		String viewPage = "redirect:/";
		int result = fpSuplementServiceImpl.insert(vo);
		try {
			if(result < 1) {
				redirectAttr.addFlashAttribute("msg","회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/suplement/insert";
			}else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/suplement/list";
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updatesuplemen(ModelAndView mv, int suplemenno ) {
		mv.addObject("suplementone", fpSuplementServiceImpl.selectOne(suplemenno));
		mv.setViewName("suplement/update");
		return mv;
	}
	
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpSuplementVo vo ) {
		String viewPage = "redirect:/";
		int result = fpSuplementServiceImpl.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/suplement/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/suplement/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr,int suplemenno ) {
		String viewPage = "redirect:/";
		int result = fpSuplementServiceImpl.delete(suplemenno);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/suplement/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/suplement/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
}
