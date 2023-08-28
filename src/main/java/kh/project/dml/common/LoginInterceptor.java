package kh.project.dml.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

@Configuration
public class LoginInterceptor implements HandlerInterceptor {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object obj = request.getSession().getAttribute("loginId");
		if(obj == null) { // 로그인 되어있지않은 상태
			response.sendRedirect(request.getContextPath()+"/login");
			// return false : 타겟URL 요청으로 가지 않음.
			return false;
		}
		
		// return true : 타겟URL의 mapping된 타겟 메소드 호출하러감. 
		// return HandlerInterceptor.super.preHandle(request, response, handler);
		return true;
	}
}
