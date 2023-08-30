package kh.project.dml.temp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TempController {
	@GetMapping("/main")
	public String mainPageOpen1() {
		return "temp/blog-default2";
	}
	@GetMapping("/temp2")
	public String mainPageOpen2() {
		return "temp/blog-single2";
	}

	
//	체중관리
	@GetMapping("/frame2")
	public String mainPageOpen3() {
		return "temp/frame2";
	}
	
//	식단짜기
	@GetMapping("/frame3")
	public String mainPageOpen4() {
		return "temp/frame3";
	}
	
//	운동 도우미
	@GetMapping("/frame4")
	public String mainPageOpen5() {
		return "temp/frame4";
	}
	
//	제품추천
	@GetMapping("/frame5")
	public String mainPageOpen6() {
		return "temp/frame5";
	}
	
}
