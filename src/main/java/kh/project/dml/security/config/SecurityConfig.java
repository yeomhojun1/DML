package kh.project.dml.security.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

import kh.project.dml.common.CustomLoginSuccessHandler;
import kh.project.dml.security.service.CustomOAuth2UserService;
import kh.project.dml.security.service.UserSecurityService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {
    
	// 로그 수집 기능
	private static final Logger logger = LoggerFactory.getLogger(SecurityConfig.class);
	
    private final CustomOAuth2UserService customOAuth2UserService;
    private final UserSecurityService userSecurityService;
    
    @Autowired
    private DataSource dataSource; // 데이터소스 주입

    public SecurityConfig(CustomOAuth2UserService customOAuth2UserService, UserSecurityService userSecurityService) {
        this.customOAuth2UserService = customOAuth2UserService;
        this.userSecurityService = userSecurityService;
    }

    @Bean
    public AuthenticationManager authManager(HttpSecurity http) throws Exception {
        return http.getSharedObject(AuthenticationManagerBuilder.class)
                .jdbcAuthentication()
                .dataSource(dataSource)
                .usersByUsernameQuery("SELECT username, password, user_enabled FROM users WHERE username = ?")
                .authoritiesByUsernameQuery("SELECT username, authorities FROM users WHERE username = ?")
                .passwordEncoder(encoder()).and().build();
    }

    @Bean
    public BCryptPasswordEncoder encoder() {
        return new BCryptPasswordEncoder();	
    }
    
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
        		.csrf((csrf) -> csrf
        				.disable())
        		.sessionManagement((session) -> session
        			.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
    				.invalidSessionUrl("/index") // 세션 만료 후 리다이렉트 될 URL
    					.maximumSessions(10) // 최대 동시 세션 수. 이 경우 한 번에 하나의 세션만 허용.
    					.expiredUrl("/index") // 최대 세션 수를 초과할 경우 리다이렉트 될 URL
//					.sessionFixation((sessionFixation) -> sessionFixation
//    							.migrateSession()
//    							.sessionAuthenticationErrorUrl("/member/logout"))
					)
                .authorizeHttpRequests((authorizeHttpRequests) -> authorizeHttpRequests
//                        .requestMatchers(new AntPathRequestMatcher("/**")).permitAll())
//            			.antMatchers("/", "/index").permitAll()
//            			// oauth2 경로 모든 사용자에게 허용
//            			.antMatchers("/oauth2/**").permitAll()
//                    	// resources 관련 경로는 모든 사용자에게 허용
//                        .antMatchers("/resources/**", "/resources1/**", "/css/**",
//                        		"/js/**", "/fonts/**", "/images/**", "/frame/**").permitAll()
//                        .antMatchers("/member/login", "/member/signup",
//                        		"/member/agreement", "/member/*Popup").permitAll()
//                        // admin 경로는 ROLE_ADMIN 역할을 가진 사용자에게만 허용
//                        .antMatchers("/admin/**").hasRole("ROLE_ADMIN")
                        .anyRequest().authenticated())
                // 로그인 관련 설정
                .formLogin((formLogin) -> formLogin
                		.loginPage("/member/login")
                		.failureUrl("/member/login")
                		.defaultSuccessUrl("/index")
                		.successHandler(customLoginSuccess())
                		.permitAll())
                // 로그아웃 관련 설정
                .logout((logout) -> logout
                		.logoutUrl("/member/logout")
                		.logoutSuccessUrl("/index")
                		.invalidateHttpSession(true)
                		.deleteCookies("remember-me", "JSESSION_ID"))
        		.oauth2Login((oauth2Login) -> oauth2Login
        				.userInfoEndpoint()
        				.userService(customOAuth2UserService));
        return http.build();
    }
    
	@Bean
	public CustomLoginSuccessHandler customLoginSuccess() {
		return new CustomLoginSuccessHandler();
	}
}
