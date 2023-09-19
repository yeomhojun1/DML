package kh.project.dml.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import javax.sql.DataSource;

import kh.project.dml.common.CustomLoginSuccessHandler;
import kh.project.dml.security.service.CustomOAuth2UserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    
    private final CustomOAuth2UserService customOAuth2UserService;
    
    @Autowired
    private DataSource dataSource; // 데이터소스 주입

    public SecurityConfig(CustomOAuth2UserService customOAuth2UserService) {
        this.customOAuth2UserService = customOAuth2UserService;
    }

    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
    	auth
	        .jdbcAuthentication()
	        .dataSource(dataSource)
	        .usersByUsernameQuery("SELECT username, password, userEnabled FROM users WHERE username = ?")
	        .authoritiesByUsernameQuery("SELECT username, authorities FROM users WHERE username = ?")
	        .passwordEncoder(encoder());
    }
    
    @Bean
    AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public BCryptPasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .sessionManagement()
            	.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
            	.invalidSessionUrl("/member/logout") // 세션 만료 후 리다이렉트 될 URL
                .maximumSessions(2) // 최대 동시 세션 수. 이 경우 한 번에 하나의 세션만 허용.
                	.expiredUrl("/member/logout") // 최대 세션 수를 초과할 경우 리다이렉트 될 URL
                .and()
            .sessionFixation().migrateSession()
            .sessionAuthenticationErrorUrl("/member/logout")
            .and()
//            .httpBasic().disable()
            // oauth2 경로 모든 사용자에게 허용
            .authorizeRequests()
            	.antMatchers("/oauth2/*").permitAll()
            .and()
            // resources, error 경로는 모든 사용자에게 허용
            .authorizeRequests()
                .antMatchers("/resources/**", "/error/**").permitAll()

            // board 경로는 모든 사용자에게 허용
            .and()
                .authorizeRequests()
                .antMatchers("/board/**").permitAll()

            .and()
                .authorizeRequests()
                .antMatchers("/member/**").authenticated()

            // admin 경로는 R_A 역할을 가진 사용자에게만 허용
//            .and()
//                .authorizeRequests()
//                .antMatchers("/admin/**").hasRole("ROLE_ADMIN")

            // 로그인 관련 설정
            .and()
                .formLogin()
                .loginPage("/member/login")
                .failureUrl("/member/login")
                .defaultSuccessUrl("/index")
                .permitAll()

            // 로그아웃 관련 설정
            .and()
                .logout()
                .logoutUrl("/member/logout")
                .logoutSuccessUrl("/index")
                .invalidateHttpSession(true)
                .deleteCookies("remember-me", "JSESSION_ID")
                .permitAll()
            .and()
            // OAuth2 기능 사용
            .oauth2Login().userInfoEndpoint().userService(customOAuth2UserService);
        return http.build();
    }
    
     @Bean
     public CustomLoginSuccessHandler customLoginSuccess() {
         return new CustomLoginSuccessHandler();
     }
     
}
