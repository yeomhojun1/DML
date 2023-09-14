package kh.project.dml.users.model.vo;

import lombok.Data;

@Data
public class LoginVo {
	private String username;
	private String password;
	
	@Override
	public String toString() {
	    // 패스워드를 가리는 방식으로 문자열을 반환
	    return "LoginVo(username=" + username + ", password=******)";
	}
}


