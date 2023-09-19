package kh.project.dml.weight.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class FpWeightController {

	@GetMapping("/temp2")
	public String mainPageOpen2() {
		return "temp/blog-single2";
	}
	
	@GetMapping("/index")
	public String index() {
		return "index";
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

