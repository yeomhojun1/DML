package kh.project.dml.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.board.model.service.FpBoardService;
import kh.project.dml.board.model.vo.FpBoardVo;

@Controller
@RequestMapping("/board")
public class FpBoardController {
	@Autowired
	private FpBoardService fpboardService;
	
	@GetMapping("/list")
	public ModelAndView selectListboard(ModelAndView mv) {
		mv.addObject("boardlist", fpboardService.selectList());
		mv.setViewName("board/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOneboard(ModelAndView mv, int commentNum) {
		mv.addObject("boardone", fpboardService.selectOne(commentNum));
		mv.setViewName("board/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertboard(ModelAndView mv ) {
		mv.setViewName("board/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDoBoard(RedirectAttributes redirectAttr, FpBoardVo vo ) {
		String viewPage = "redirect:/";
		int result = fpboardService.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/board/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/board/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updateboard(ModelAndView mv, int commentNum ) {
		mv.addObject("boardone", fpboardService.selectOne(commentNum));
		mv.setViewName("board/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoBoard(RedirectAttributes redirectAttr, FpBoardVo vo ) {
		String viewPage = "redirect:/";
		int result = fpboardService.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/board/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/board/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDoBoard(RedirectAttributes redirectAttr,int commentNum ) {
		String viewPage = "redirect:/";
		int result = fpboardService.delete(commentNum);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/board/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/board/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}