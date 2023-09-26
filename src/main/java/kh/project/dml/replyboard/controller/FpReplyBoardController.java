package kh.project.dml.replyboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.project.dml.replyboard.model.vo.FpReplyBoardVo;
import kh.project.dml.replyboard.service.FpReplyBoardService;



@Controller
@RequestMapping("/replyboard")
public class FpReplyBoardController {
	
	@Autowired
	private FpReplyBoardService fpReplyBoardServiceImpl;
	
	@GetMapping("/list")
	@ResponseBody
	public String selectListreplyboard(RedirectAttributes redirectAttr,int boardNo) {
		List<FpReplyBoardVo> result = fpReplyBoardServiceImpl.selectList(boardNo);
		return new Gson().toJson(result);
	}
	
	@GetMapping("/one")
	public ModelAndView selectOnereplyboard(ModelAndView mv, int replyNo) {
		mv.addObject("replyboard", fpReplyBoardServiceImpl.selectOne(replyNo));
		mv.setViewName("replyboard/one");
		return mv;
	}
	@PostMapping("/insert")
	@ResponseBody
	public String insertDoReply(FpReplyBoardVo vo) {
		List<FpReplyBoardVo> result = fpReplyBoardServiceImpl.insert(vo);
//		
		return new Gson().toJson(result);
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
	@ResponseBody
	public String deleteDoMemeber(RedirectAttributes redirectAttr,int replyNo ) {
		List<FpReplyBoardVo> result = fpReplyBoardServiceImpl.delete(replyNo);
		return new Gson().toJson(result);
	}

}
