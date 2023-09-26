package kh.project.dml.index;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.util.WebUtils;

import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.member.model.service.FpMemberServiceImpl;
import kh.project.dml.member.model.vo.FpMemberVo;

@Controller
public class FpIndexController {
	
	@Autowired
	private FpMemberServiceImpl service;
	
	@GetMapping("/index")
	public String index(HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("member") == null) {
            // 세션 정보가 유효하지 않은 경우 처리
            Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN_COOKIE);
            if (loginCookie != null) {
                FpMemberVo vo = service.checkLoginBefore(loginCookie.getValue());
                if (vo != null)
                    session.setAttribute(SessionNames.LOGIN, vo);
            }
		}
		return "/index";
	}
	
	@GetMapping("/error/{statusCode}")
	public String getErrorPage(@PathVariable String statusCode) {
	    return "error/"+statusCode;
	}
}
