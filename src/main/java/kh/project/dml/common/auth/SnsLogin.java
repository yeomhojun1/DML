package kh.project.dml.common.auth;

import java.util.Iterator;

import org.apache.commons.lang3.StringUtils;

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
		if(sns.getService().equals("kakao")) {			
			this.oauthService = new ServiceBuilder(sns.getClientId())
					.apiSecret(sns.getClientSecret())
					.callback(sns.getRedirectUrl())
					.build(sns.getApi20Instance());
		} else {
			this.oauthService = new ServiceBuilder(sns.getClientId())
					.apiSecret(sns.getClientSecret())
					.callback(sns.getRedirectUrl())
					.build(sns.getApi20Instance());
		}
		this.sns = sns;
		System.out.println("sns : "+this.sns);
	}
	
	public String getAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public FpMemberVo getMemberProfile(String code) throws Exception {
		System.out.println(code);
		System.out.println(oauthService);
		
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		System.out.println("accessToken : "+accessToken);
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}

	private FpMemberVo parseJson(String body) throws Exception {
		System.out.println("============================\n" + body + "\n==================");
		FpMemberVo member = new FpMemberVo();
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		
		if (this.sns.isGoogle()) {
			String id = rootNode.get("id").asText();
			if (sns.isGoogle())
				member.setGoogleid(id);
			member.setMname(rootNode.get("name").asText());

			Iterator<JsonNode> iterEmails = rootNode.path("emails").elements();
			while(iterEmails.hasNext()) {
				JsonNode emailNode = iterEmails.next();
				String type = emailNode.get("type").asText();
				if (StringUtils.equals(type, "account")) {
					member.setMemail(emailNode.get("value").asText());
					break;
				}
			}
			
		} else if (this.sns.isNaver()) {
			JsonNode resNode = rootNode.get("response");
			member.setNaverid(resNode.get("id").asText());
			member.setNickname(resNode.get("nickname").asText());
			member.setMemail(resNode.get("email").asText());
			
		} else if (this.sns.isKakao()) {
			member.setKakaoid(rootNode.get("id").asText());
			JsonNode kakaoAccountNode = rootNode.get("kakao_account");
			member.setNickname(kakaoAccountNode.get("profile").get("nickname").asText());
			member.setMemail(kakaoAccountNode.get("email").asText());
		}
		System.out.println(member);
		return member;
	}
	
}

