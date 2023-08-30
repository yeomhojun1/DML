package kh.project.dml.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginTestController {
	@GetMapping("/logintest")
	public String gogleLoginTest() {
		return "/logintest";
	}
}
