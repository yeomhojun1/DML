package kh.project.dml.memberexset.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.project.dml.memberexset.model.service.FpMemberExSetService;

import kh.project.dml.memberexset.model.service.FpMemberExSetServiceImpl;
import kh.project.dml.memberexset.model.vo.FpMemberExSetParam;

import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;


@Controller
@RequestMapping("/memberexset")
public class FpMemberExSetController {
	@Autowired
	private FpMemberExSetService fpMemberExSetServiceImpl;
	
	@GetMapping("/list")
	public ModelAndView viewmemberexset(ModelAndView mv) {
		mv.setViewName("memberexset/list");
		return mv;
	}
	@GetMapping("/list.ajax")
	@ResponseBody
	public String selectListmemberexset(ModelAndView mv,String dayExSet) {
		return new Gson().toJson(fpMemberExSetServiceImpl.selectList(dayExSet));
	}
	@GetMapping("/one")
	public ModelAndView selectOnememberexset(ModelAndView mv, String memberId) {
		mv.addObject("memberexsetone", fpMemberExSetServiceImpl.selectOne(memberId));
		mv.setViewName("memberexset/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertmemberexset(ModelAndView mv ) {
		mv.setViewName("memberexset/insert");
		return mv;
	}
	@PostMapping("/insert")
	@ResponseBody
	public String insertDomemberexset(RedirectAttributes redirectAttr, FpMemberExSetVo vo ) {
		//String viewPage = "redirect:/";
		int result = fpMemberExSetServiceImpl.insert(vo);
		try {
			if (result < 1) {
//				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
//				viewPage = "redirect:/memberexset/insert";
			} else {
//				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
//				viewPage = "redirect:/memberexset/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}
	@GetMapping("/update")
	public ModelAndView updatememberexset(ModelAndView mv, String memberId ) {
		mv.addObject("memberexsetone", fpMemberExSetServiceImpl.selectOne(memberId));
		mv.setViewName("memberexset/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDomemberexset(RedirectAttributes redirectAttr, FpMemberExSetVo vo ) {
		String viewPage = "redirect:/";
		int result = fpMemberExSetServiceImpl.update(vo);
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
	@ResponseBody
	public String deleteDomemberexset(RedirectAttributes redirectAttr,@RequestParam String dayExSet) {
		System.out.println(dayExSet);
		int result = fpMemberExSetServiceImpl.delete(dayExSet);
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
