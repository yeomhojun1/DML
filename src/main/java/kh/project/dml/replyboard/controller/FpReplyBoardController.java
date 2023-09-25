package kh.project.dml.replyboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.replyboard.model.vo.FpReplyBoardVo;
import kh.project.dml.replyboard.service.FpReplyBoardService;



@Controller
@RequestMapping("/replyboard")
public class FpReplyBoardController {
	
	@Autowired
	private FpReplyBoardService fpReplyBoardServiceImpl;
	
	@GetMapping("/list")
	public ModelAndView selectListreplyboard(ModelAndView mv) {
		mv.addObject("replyboardlist" ,fpReplyBoardServiceImpl.selectList());
		mv.setViewName("replyboard/list");
		return mv;
	}
	
	@GetMapping("/one")
	public ModelAndView selectOnereplyboard(ModelAndView mv, int replyNo) {
		mv.addObject("replyboard", fpReplyBoardServiceImpl.selectOne(replyNo));
		mv.setViewName("replyboard/one");
		return mv;
	}
	@PostMapping("/insert")
	@ResponseBody
	public String insertDoReply(RedirectAttributes redirectAttr, FpReplyBoardVo vo) {
		//String viewPage = "redirect:/";
		int result = fpReplyBoardServiceImpl.insert(vo);
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
	public ModelAndView updatedaydiet(ModelAndView mv, int replyNo  ) {
		mv.addObject("daydietone", fpReplyBoardServiceImpl.selectOne(replyNo));
		mv.setViewName("daydiet/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpReplyBoardVo vo ) {
		String viewPage = "redirect:/";
		int result = fpReplyBoardServiceImpl.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/replyboard/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/replyboard/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr,int replyNo ) {
		String viewPage = "redirect:/";
		int result = fpReplyBoardServiceImpl.delete(replyNo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/replyboard/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/replyboard/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}

}
