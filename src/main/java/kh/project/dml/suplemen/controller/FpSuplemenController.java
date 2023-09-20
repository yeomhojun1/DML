package kh.project.dml.suplemen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.dml.suplemen.model.service.FpSuplemenService;

@Controller
@RequestMapping("/suplemen")
public class FpSuplemenController {
	@Autowired
	private FpSuplemenService fpSuplemenServiceImpl;
	
	@GetMapping("list")
	public ModelAndView selectListsuplemen(ModelAndView mv) {
		mv.addObject("", mv)
	}
}
