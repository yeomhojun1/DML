package kh.project.dml.users.model.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class FpUsersVo {
	private String username;
	private String password;
	private int userEnabled;
	private String authorities;
}
