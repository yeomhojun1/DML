package kh.project.dml.weight.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.project.dml.common.interceptor.SessionNames;


@Controller
@SessionAttributes(SessionNames.LOGIN)
public class FpWeightController {

	@GetMapping("/temp2")
	public String mainPageOpen2() {
		return "temp/blog-single2";
	}
	
	
	@GetMapping("/main")
	public String mainPageOpen8() {
		return "main";
	}
	
	@GetMapping("/weight2")
	public String mainPageOpen9() {
		return "temp/weight2";
	}
	@GetMapping("/weight")
	public String mainPageOpen10() {
		return "temp/weight";
	}
	

	@GetMapping("/composition")
	public String mainPageOpen11() {
		return "temp/composition";
	}
	
}

