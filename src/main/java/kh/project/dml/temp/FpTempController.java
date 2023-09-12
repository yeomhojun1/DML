package kh.project.dml.temp;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.project.dml.common.interceptor.SessionNames;


@Controller
@SessionAttributes(SessionNames.LOGIN)
public class FpTempController {
	@GetMapping("/temp1")
	public String mainPageOpen1() {
		return "temp/blog-default2";
	}
	@GetMapping("/temp2")
	public String mainPageOpen2() {
		return "temp/blog-single2";
	}
	
	@GetMapping("/index")
	public String mainPageOpen7() {
		return "diet/index";
	}
	
	@GetMapping("/main")
	public String mainPageOpen8() {
		return "temp/main";
	}

	
	@GetMapping("/weight")
	public String mainPageOpen9() {
		return "temp/weight";
	}
	
}