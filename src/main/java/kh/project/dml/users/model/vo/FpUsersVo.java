package kh.project.dml.users.model.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class FpUsersVo {
	private String username;
	private String password;
	private int userEnabled;
	private String authorities;
	
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
}
