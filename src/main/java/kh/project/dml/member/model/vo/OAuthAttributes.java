package kh.project.dml.member.model.vo;

import java.util.Map;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class OAuthAttributes {
    private Map<String, Object> attributes;
    private String nameAttributeKey;
    private String id;
    private String username;
    private String name;
 
    public static OAuthAttributes of(String registrationId, String userNameAttributeName, Map<String, Object> attributes) {
        if("naver".equals(registrationId)) {
            return ofNaver("id", attributes);
        } else if ("kakao".equals(registrationId)) {
            return ofKakao("id", attributes);
        }
 
        return ofGoogle(userNameAttributeName, attributes);
    }
 
    private static OAuthAttributes ofGoogle(String userNameAttributeName, Map<String, Object> attributes) {
        return OAuthAttributes.builder()
        		.username((String) attributes.get("email"))
                .name((String) attributes.get("name"))
                .attributes(attributes)
                .nameAttributeKey(userNameAttributeName)
                .build();
    }
 
    private static OAuthAttributes ofNaver(String userNameAttributeName, Map<String, Object> attributes) {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");
 
        return OAuthAttributes.builder()
        		.id((String) response.get("naverid"))
        		.username((String) response.get("email"))
                .name((String) response.get("name"))
                .attributes(response)
                .nameAttributeKey(userNameAttributeName)
                .build();
    }
 
    private static OAuthAttributes ofKakao(String userNameAttributeName, Map<String, Object> attributes) {
        Map<String, Object> response = (Map<String, Object>) attributes.get("kakao_account");
        Map<String, Object> account = (Map<String, Object>) attributes.get("profile");
 
        return OAuthAttributes.builder()
        		.id((String) attributes.get("id"))
        		.username((String) response.get("email"))
                .name((String) account.get("nickname"))
                .attributes(response)
                .nameAttributeKey(userNameAttributeName)
                .build();
    }
 
    public FpMemberVo toEntity() {
        return FpMemberVo.builder()
        		.memberId(username)
                .mname(name)
                .build();
    }
}
