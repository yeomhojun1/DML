package kh.project.dml.security.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;

@Configuration
public class OAuth2LoginConfig {
    
    @Value("${google.client-id}")
    private String googleClientId;

    @Value("${google.client-secret}")
    private String googleClientSecret;
    
    @Bean
    public ClientRegistrationRepository clientRegistrationRepository() {
        List<ClientRegistration> registrations = new ArrayList<ClientRegistration>();
        registrations.add(getGoogleRegistration());
        // 여기에 다른 OAuth2 제공자 정보도 추가할 수 있습니다. (Naver, Kakao 등)
        return new InMemoryClientRegistrationRepository(registrations);
    }

    private ClientRegistration getGoogleRegistration() {
        return ClientRegistration.withRegistrationId("google")
            .clientId(googleClientId)
            .clientSecret(googleClientSecret)
            .tokenUri("https://www.googleapis.com/oauth2/v4/token")
            .authorizationUri("https://accounts.google.com/o/oauth2/v2/auth")
            .redirectUri("https://dailymusclelife.site/login/oauth2/code/google")
            .scope("openid", "profile", "email")
            .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
            .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_BASIC)
            .build();
    }
}
