package kh.project.dml.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FpIndexController {
	
	@GetMapping("/index")
	public String index() {
		return "/index";
	}
}
