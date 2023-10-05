package kh.project.dml.member.model.vo;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;

// 패스워드 변경 유효성 체크
@Getter
@Setter
public class PwdChangeForm {
	
	private String username;
	
	@NotEmpty(message = "현재 비밀번호는 필수항목입니다.")
	private String password;

    @NotEmpty(message = "변경할 비밀번호는 필수항목입니다.")
    private String password2;

    @NotEmpty(message = "변경할 비밀번호 확인은 필수항목입니다.")
    private String password3;
}
