package kh.project.dml.users.model.vo;

import kh.project.dml.member.model.vo.FpMemberVo;
import lombok.Data;

@Data
public class FpUsersVo {
	private String username;
	private String password;
	private int userEnabled;
	private String authorities;
	
	private FpMemberVo member;
	
	public FpUsersVo() {}
	
	public FpUsersVo(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public FpUsersVo(String username, String password, int userEnabled, String authorities) {
		this.username = username;
		this.password = password;
		this.userEnabled = userEnabled;
		this.authorities = authorities;
	}

	@Override
	public String toString() {
		return "FpUsersVo [username=" + username + ", password=****** , userEnabled=" + userEnabled
				+ ", authorities=" + authorities + "]";
	}
	
}
