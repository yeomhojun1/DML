package kh.project.dml.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kh.project.dml.member.model.service.FpMemberService;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.users.model.vo.FpUsersVo;

@Component
public class SessionCheckInterceptor implements HandlerInterceptor {
	
	@Autowired
	private FpMemberService service;
	
	// 로그 수집 기능
	private static final Logger logger = LoggerFactory.getLogger(SessionCheckInterceptor.class);
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        FpMemberVo vo = service.checkSession(session.getId());
        if (vo == null) {
            // 세션 정보가 유효하지 않은 경우 처리
            response.sendRedirect(request.getContextPath() + "/member/login"); // 예시: 로그인 페이지로 리다이렉트
            return false; // 컨트롤러 메소드 실행 중지
        } else {
            // 세션 정보가 유효한 경우
            session.setAttribute(SessionNames.LOGIN, vo);
            return true; // 컨트롤러 메소드 실행 계속
        }
    }
    
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mv) throws Exception {
    	HttpSession session = request.getSession();
		Object memberObj = session.getAttribute(SessionNames.LOGIN);
	    System.out.println(memberObj);
		
	    if (memberObj instanceof FpUsersVo) {
	        FpUsersVo userMember = (FpUsersVo) memberObj;
	        System.out.println(userMember);
	        mv.addObject("member", service.memberInfo(userMember.getUsername()));
	        
	    } else if (memberObj instanceof FpMemberVo) {
	    	FpMemberVo member = (FpMemberVo) memberObj;
	    	System.out.println(member);
	    	mv.addObject("member", service.memberInfo(member.getMemberId()));
	    }
	}
}
