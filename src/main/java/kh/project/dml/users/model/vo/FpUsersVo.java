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
	private String userId;
	private String userPwd;
	private String userEnabled;
	private String authorities;
}
