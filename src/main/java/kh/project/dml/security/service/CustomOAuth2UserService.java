package kh.project.dml.security.service;

import java.util.Collections;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import kh.project.dml.member.model.dao.FpMemberRepository;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.member.model.vo.OAuthAttributes;


@EnableAspectJAutoProxy(proxyTargetClass = true)
@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
 
	@Autowired
    private FpMemberRepository memberRepository;
	
	@Autowired
    private HttpSession httpSession;
 
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2UserService<OAuth2UserRequest, OAuth2User> delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);
 
        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName();
 
        OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributeName, oAuth2User.getAttributes());
 
        FpMemberVo member = saveOrUpdate(attributes);
        httpSession.setAttribute("member", member);
 
        return new DefaultOAuth2User(
                Collections.singleton(new SimpleGrantedAuthority("")),
                attributes.getAttributes(),
                attributes.getNameAttributeKey()
        );
    }
 
    private FpMemberVo saveOrUpdate(OAuthAttributes attributes) {
    	FpMemberVo member = memberRepository.findByMemail(attributes.getEmail());
        try {
        	if (member == null) {
        		member = attributes.toEntity();
        		memberRepository.save(member);
        	} else {
        		member.update(attributes.getName());
        		memberRepository.update(member);
        	}
        } catch(Exception e) {
        	e.printStackTrace();
        }
        
        return member;
    }
}