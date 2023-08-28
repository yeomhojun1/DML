package kh.project.dml.security.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	// 이전에 Spring Boot에서 쓴 보안 설정 코드인데 아직 쓸지 말지 미정
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests() // 로그인없이 접근 가능한 경로
                        .requestMatchers(new AntPathRequestMatcher("/**")).permitAll();
//                		.antMatchers("/", "/crytochart", "/news", "/crytomarket", "/user/login", "/user/signup", "/css/**", "/fontawesome/**", "/fonts/**", "/img/**", "/js/**", "bootstrap.min.js").permitAll()
//                		.anyRequest().authenticated()
//                .and()
//                .formLogin() // 로그인 페이지(위에 접근 불가한 경로 접근 시 자동 이동)
//                        .loginPage("/user/login")
//                        .defaultSuccessUrl("/")
//                .and()
//                .logout() // 로그아웃
//                        .logoutRequestMatcher(new AntPathRequestMatcher("/user/logout"))
//                        .logoutSuccessUrl("/")
//                        .invalidateHttpSession(true)
//                .and()
//                .csrf() // csrf 취약점으로 접근 제한된 페이지 허용
//		                .ignoringAntMatchers("/coin/prices/buy", "/coin/prices/sell")
//                .and()
//                .sessionManagement() // 세션 유효 유무
//                	.invalidSessionUrl("/"); // 세션이 유효하지 않을 때 메인 페이지로 리다이렉트
        return http.build();
    }

    @Bean // 패스워드 암호화
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }
}
