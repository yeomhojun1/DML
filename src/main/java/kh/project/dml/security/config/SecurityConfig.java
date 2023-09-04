package kh.project.dml.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
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

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
            .dataSource(dataSource)
            .passwordEncoder(encoder())
            .usersByUsernameQuery("SELECT mid username, mpwd password, enabled FROM MEMBER WHERE mid=?")
            .authoritiesByUsernameQuery("SELECT mid username, authority as authority FROM MEMBER WHERE mid=?");
    }

    @Bean
    public BCryptPasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            .and()
            .httpBasic().disable()
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

            // member 경로는 R_M 역할을 가진 사용자에게만 허용
//            .and()
//                .authorizeRequests()
//                .antMatchers("/member/**").hasRole("ROLE_MEMBER")

            // admin 경로는 R_A 역할을 가진 사용자에게만 허용
//            .and()
//                .authorizeRequests()
//                .antMatchers("/admin/**").hasRole("ROLE_ADMIN")

            // 로그인 관련 설정
            .and()
                .formLogin()
                .loginPage("/member/login")
                .successHandler(customLoginSuccess())
                .failureUrl("/member/login")

            // 로그아웃 관련 설정
            .and()
                .logout()
                .logoutUrl("/user/logout")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .deleteCookies("remember-me", "JSESSION_ID")
            .and()
            // OAuth2 기능 사용
            .oauth2Login().userInfoEndpoint().userService(customOAuth2UserService);
        return http.build();
    }
    
     // CustomLoginSuccess 핸들러의 빈 설정. 필요한 경우 이 부분을 추가하십시오.
     @Bean
     public CustomLoginSuccessHandler customLoginSuccess() {
         return new CustomLoginSuccessHandler();
     }
}
