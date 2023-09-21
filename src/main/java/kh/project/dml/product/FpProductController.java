package kh.project.dml.product;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.nutrient.model.service.FpNutrientService;

@Controller
@SessionAttributes(SessionNames.LOGIN)
public class FpProductController {
	@Autowired
	private FpNutrientService fpNutrientServiceImpl;

	@GetMapping("/product")
	public ModelAndView mainPageOpen1(ModelAndView mv) {
		mv.addObject("tab", "1"); //컨트롤러에 값 써야함 product.jsp 맨밑에가보면있음.
		mv.addObject("nutruentlist", fpNutrientServiceImpl.selectList());
		mv.setViewName("product/product");
		return mv;
	}
	
	@GetMapping("/fullcalendar/calendar")
	public String calendar() {
		return "/fullcalendar/calendar";
	}
	
}
