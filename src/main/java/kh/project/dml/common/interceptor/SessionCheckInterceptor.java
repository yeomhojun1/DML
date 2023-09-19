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
public class SessionCheckInterceptor implements HandlerInterceptor {
	
	@Autowired
	private FpMemberServiceImpl service;
	
	// 로그 수집 기능
	private static final Logger logger = LoggerFactory.getLogger(SessionCheckInterceptor.class);
	
	// TODO 1개의 세션만 사용 가능 - 다른 사이트에서 접근 시 기존 세션 삭제되면서 새로 로그인 해야함
	// TODO 작업 중에는 임시로 설정 후 나중에 작업이 종료 되면 삭제 예정
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
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mv) throws Exception {
    	boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    	// ajax 에서 페이지를 불러올 경우에는 미동작
    	if (!isAjaxRequest) {
        	HttpSession session = request.getSession();
        	Object memberObj = session.getAttribute(SessionNames.LOGIN);
        	
        	if (memberObj instanceof FpUsersVo) {
        		FpUsersVo userMember = (FpUsersVo) memberObj;
        		mv.addObject("member", service.memberInfo(userMember.getUsername()));
        		
        	} else if (memberObj instanceof FpMemberVo) {
        		FpMemberVo member = (FpMemberVo) memberObj;
        		System.out.println(member);
        		mv.addObject("member", service.memberInfo(member.getMemberId()));
        	}
        }
	}
}
