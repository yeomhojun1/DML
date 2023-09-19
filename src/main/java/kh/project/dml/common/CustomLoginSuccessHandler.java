package kh.project.dml.common;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, 
                                        HttpServletResponse response, 
                                        Authentication authentication) throws IOException {
        // 원하는 로직 수행
        HttpSession session = request.getSession();
        if (session != null) {
            String redirectUrl = (String) session.getAttribute("prevPage");
            if (redirectUrl != null) {
                // 이전 페이지로 리다이렉트
                session.removeAttribute("prevPage");
                response.sendRedirect(redirectUrl);
                return;
            }
        }
        response.sendRedirect("/index"); // 기본 리다이렉트 URL
    }
}