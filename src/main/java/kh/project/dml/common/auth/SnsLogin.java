package kh.project.dml.common.auth;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import kh.project.dml.member.model.vo.FpMemberVo;


public class SnsLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	public SnsLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.build(sns.getApi20Instance());
		this.sns = sns;
	}
	
	public String getAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public FpMemberVo getMemberProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		System.out.println("accessToken : "+accessToken);
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}

	private FpMemberVo parseJson(String body) throws Exception {
		FpMemberVo member = new FpMemberVo();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		if (this.sns.isGoogle()) {
			String id = rootNode.get("id").asText();
			if (sns.isGoogle())
				member.setGoogleid(id);
			member.setMemberId(rootNode.get("email").asText());
			member.setMname(rootNode.get("name").asText());
			
		} else if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			member.setMemberId(resNode.get("email").asText());
			member.setMname(resNode.get("nickname").asText());
			member.setNaverid(resNode.get("id").asText());
			
		} else if (this.sns.isKakao()) {
			member.setKakaoid(rootNode.get("id").asText());
			JsonNode kakaoAccountNode = rootNode.get("kakao_account");
			member.setMemberId(kakaoAccountNode.get("email").asText());
			member.setMname(kakaoAccountNode.get("profile").get("nickname").asText());
		}
		return member;
	}
	
}

