package kh.project.dml.common.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kh.project.dml.member.model.service.FpMemberServiceImpl;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.users.model.vo.FpUsersVo;

@Component
public class SessionCheckInterceptor implements HandlerInterceptor {
	
	@Autowired
	private FpMemberServiceImpl service;
	
	// 로그 수집 기능
	private static final Logger logger = LoggerFactory.getLogger(SessionCheckInterceptor.class);
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	logger.info("interceptor preHandle");
        HttpSession session = request.getSession();
        String url = (String)request.getRequestURI();
        url = url.replaceAll("/dml", "");
        url = url.replaceAll("/member/logout", "/index");
        Object memberObj = session.getAttribute(SessionNames.LOGIN);
    	if (memberObj instanceof FpUsersVo) {
    		FpUsersVo userMember = (FpUsersVo) memberObj;
    		session.setAttribute("member", service.memberInfo(userMember.getUsername()));
    		
    	} else if (memberObj instanceof FpMemberVo) {
    		FpMemberVo member = (FpMemberVo) memberObj;
    		session.setAttribute("member", service.memberInfo(member.getMemberId()));
    	}
    	
        if (session.getAttribute("member") == null) {
            // 세션 정보가 유효하지 않은 경우 처리
            Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN_COOKIE);
            if (loginCookie != null) {
                FpMemberVo vo = service.checkLoginBefore(loginCookie.getValue());
                if (vo != null)
                    session.setAttribute(SessionNames.LOGIN, vo);
                	return true;
            }
            session.setAttribute("prevPage", url);
            
            response.sendRedirect(request.getContextPath() + "/member/loginPopup"); // 예시: 로그인 페이지로 리다이렉트
            return false; // 컨트롤러 메소드 실행 중지
        } else {
            // 세션 정보가 유효한 경우
            session.setAttribute(SessionNames.LOGIN, memberObj);
            return true; // 컨트롤러 메소드 실행 계속
        }
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mv) throws Exception {
    }
}
