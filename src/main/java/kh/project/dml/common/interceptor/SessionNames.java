package kh.project.dml.common.interceptor;

// 세션, 쿠키 저장 시 사용
public interface SessionNames {
	static final String LOGIN = "loginUser";
	static final String LOGIN_COOKIE = "loginCookie";
	static final String ATTEMPTED = "attemptedLocation";
	
	static final int EXPIRE = 7 * 24 * 60 * 60;
}

