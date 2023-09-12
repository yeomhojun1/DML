package kh.project.dml.product;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.project.dml.common.interceptor.SessionNames;

@Controller
@SessionAttributes(SessionNames.LOGIN)
public class FpProductController {

	@GetMapping("/product")
	public String mainPageOpen1() {
		return "product/product";
	}
	
}
