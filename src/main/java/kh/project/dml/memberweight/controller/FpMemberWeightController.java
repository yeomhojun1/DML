package kh.project.dml.memberweight.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.memberweight.model.service.FpMemberWeightService;
import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;


@Controller
@RequestMapping("/memberweight")
public class FpMemberWeightController {
	@Autowired
	private FpMemberWeightService fpmemberweightService;
	
	@GetMapping("/list")
	public ModelAndView selectListmemberweight(ModelAndView mv) {
		mv.addObject("memberweightlist", fpmemberweightService.selectList());
		mv.setViewName("memberweight/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOnememberweight(ModelAndView mv, String userId) {
		mv.addObject("memberweightone", fpmemberweightService.selectOne(userId));
		mv.setViewName("memberweight/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertmemberweight(ModelAndView mv ) {
		mv.setViewName("memberweight/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDomemberweight(RedirectAttributes redirectAttr, FpMemberWeightVo vo ) {
		String viewPage = "redirect:/";
		int result = fpmemberweightService.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/memberweight/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/memberweight/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updatememberweight(ModelAndView mv, String userId ) {
		mv.addObject("memberweightone", fpmemberweightService.selectOne(userId));
		mv.setViewName("memberweight/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDomemberweight(RedirectAttributes redirectAttr, FpMemberWeightVo vo ) {
		String viewPage = "redirect:/";
		int result = fpmemberweightService.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/memberweight/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/memberweight/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDomemberweight(RedirectAttributes redirectAttr,String userId ) {
		String viewPage = "redirect:/";
		int result = fpmemberweightService.delete(userId);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/memberweight/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/memberweight/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}