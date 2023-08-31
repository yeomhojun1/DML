package kh.project.dml.exercise.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.exercise.model.service.FpExerciseService;
import kh.project.dml.exercise.model.vo.FpExerciseVo;


@Controller
@RequestMapping("/exercise")
public class FpExerciseController {
	@Autowired
	private FpExerciseService fpexerciseService;
	
	@GetMapping("/list")
	public ModelAndView selectListexercise(ModelAndView mv) {
		mv.addObject("exerciselist", fpexerciseService.selectList());
		mv.setViewName("exercise/list");
		return mv;
	}
	@GetMapping("/one")
	public ModelAndView selectOneexercise(ModelAndView mv, int ecode) {
		mv.addObject("exerciseone", fpexerciseService.selectOne(ecode));
		mv.setViewName("exercise/one");
		return mv;
	}
	@GetMapping("/insert")
	public ModelAndView insertexercise(ModelAndView mv ) {
		mv.setViewName("exercise/insert");
		return mv;
	}
	@PostMapping("/insert")
	public String insertDoMemeber(RedirectAttributes redirectAttr, FpExerciseVo vo ) {
		String viewPage = "redirect:/";
		int result = fpexerciseService.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/exercise/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/exercise/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@GetMapping("/update")
	public ModelAndView updateexercise(ModelAndView mv, int ecode ) {
		mv.addObject("exerciseone", fpexerciseService.selectOne(ecode));
		mv.setViewName("exercise/update");
		return mv;
	}
	@PostMapping("/update")
	public String updateDoMemeber(RedirectAttributes redirectAttr, FpExerciseVo vo ) {
		String viewPage = "redirect:/";
		int result = fpexerciseService.update(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/exercise/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/exercise/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	@PostMapping("/delete")
	public String deleteDoMemeber(RedirectAttributes redirectAttr,int ecode ) {
		String viewPage = "redirect:/";
		int result = fpexerciseService.delete(ecode);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/exercise/list";//delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/exercise/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
}