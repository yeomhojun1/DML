package kh.project.dml.common.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverApi20 extends DefaultApi20 implements SnsUrls {
	private NaverApi20() {
	}
	
	private static class InstanceHolder {
		private static final NaverApi20 INSTANCE = new NaverApi20();
	}
	
	public static NaverApi20 instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}
}

