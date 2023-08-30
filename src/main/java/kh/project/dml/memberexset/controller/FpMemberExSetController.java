package kh.project.dml.memberexset.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.memberexset.model.service.FpMemberExSetService;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;


@Controller
class FpMemberExSetController {
	@Autowired
	private FpMemberExSetService fpmemberexsetService;
	
	@GetMapping("/list")
	public ModelAndView selectListmemberexset(ModelAndView mv) {
		mv.addObject("memberexsetlist", fpmemberexsetService.selectList());
		mv.setViewName("memberexset/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOnememberexset(ModelAndView mv, String mid) {
		mv.addObject("memberexsetone", fpmemberexsetService.selectOne(mid));
		mv.setViewName("memberexset/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertmemberexset(ModelAndView mv ) {
		mv.setViewName("memberexset/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDoMemeber(RedirectAttributes redirectAttr, FpMemberExSetVo vo ) {
		String viewPage = "redirect:/";
		int result = fpmemberexsetService.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/memberexset/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/memberexset/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updatememberexset(ModelAndView mv, String mid ) {
		mv.addObject("memberexsetone", fpmemberexsetService.selectOne(mid));
		mv.setViewName("memberexset/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpMemberExSetVo vo ) {
		String viewPage = "redirect:/";
		int result = fpmemberexsetService.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/memberexset/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/memberexset/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr, String mid ) {
		String viewPage = "redirect:/";
		int result = fpmemberexsetService.delete(mid);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/memberexset/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/memberexset/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}

