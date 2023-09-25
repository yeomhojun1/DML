package kh.project.dml.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kh.project.dml.member.model.service.FpMemberServiceImpl;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.users.model.vo.FpUsersVo;

@Component
public class AdminCheckInterceptor implements HandlerInterceptor {
	
	@Autowired
	private FpMemberServiceImpl service;
	
	// 로그 수집 기능
	private static final Logger logger = LoggerFactory.getLogger(SessionCheckInterceptor.class);
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object memberObj = session.getAttribute("member");
    	if (memberObj instanceof FpUsersVo) {
    		FpUsersVo userMember = (FpUsersVo) memberObj;
    		System.out.println(userMember.getAuthorities());
    		if(userMember.getAuthorities().equals("ROLE_ADMIN")) {
            	return true; // 컨트롤러 메소드 실행 계속
            } 
    	} else if (memberObj instanceof FpMemberVo) {
    		FpMemberVo member = (FpMemberVo) memberObj;
    		System.out.println(member.getAuthorities());
    		if(member.getAuthorities().equals("ROLE_ADMIN")) {
            	return true; // 컨트롤러 메소드 실행 계속
            }
    	}
    	response.sendRedirect(request.getContextPath() + "/index");
    	return false; // 컨트롤러 메소드 실행 중지
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mv) throws Exception {
    }
}
