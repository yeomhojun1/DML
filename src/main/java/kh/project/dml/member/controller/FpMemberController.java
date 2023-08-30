package kh.project.dml.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kh.project.dml.member.model.service.FpMemberService;
import kh.project.dml.member.model.vo.FpMemberVo;

@Controller
@RequestMapping("/member")
public class FpMemberController {
	@Autowired
	private FpMemberService fpMemberService;
	
	@GetMapping("/list")
	public ModelAndView selectListMember(ModelAndView mv) {
		mv.addObject("memberlist", fpMemberService.selectList());
		mv.setViewName("member/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOneMember(ModelAndView mv, String mid) {
		mv.addObject("memberone", fpMemberService.selectOne(mid));
		mv.setViewName("member/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertMember(ModelAndView mv ) {
		mv.setViewName("member/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDoMemeber(RedirectAttributes redirectAttr, FpMemberVo vo ) {
		String viewPage = "redirect:/";
		int result = fpMemberService.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/member/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/member/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updateMember(ModelAndView mv, String mid ) {
		mv.addObject("memberone", fpMemberService.selectOne(mid));
		mv.setViewName("member/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpMemberVo vo ) {
		String viewPage = "redirect:/";
		int result = fpMemberService.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/member/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/member/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr, String mid ) {
		String viewPage = "redirect:/";
		int result = fpMemberService.delete(mid);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/member/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/member/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}

/**@controller
 *
 *
 * public class SelectListController{
 * 	private FpMemberService fpMemberService;
 * private FpMemberService fpDietService;
 * 
 * @GetMapping("/member")
 * 	public ModelAndView list1(ModelAndView mv) {
		mv.addObject("memberlist", fpMemberService.selectList());
		mv.setViewName("member/list");
		return mv;
	}
	@GetMapping("/diet")
	public ModelAndView list2(ModelAndView mv) {
		mv.addObject("dietlist", fpDietService.selectList());
		mv.setViewName("diet/list");
		return mv;
	}
 * 
 * 
 */
