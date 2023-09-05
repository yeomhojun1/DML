package kh.project.dml.member.model.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserCreateForm {
	@NotEmpty(message = "이메일은 필수항목입니다.")
	@Email
	private String username;

    @NotEmpty(message = "비밀번호는 필수항목입니다.")
    private String password1;

    @NotEmpty(message = "비밀번호 확인은 필수항목입니다.")
    private String password2;
    
    private String gender;
    
    @NotEmpty(message = "이름은 필수항목입니다.")
    private String name;
    
    @NotEmpty(message = "키는 필수항목입니다.")
    private double height;
    
    @NotEmpty(message = "몸무게는 필수항목입니다.")
    private double weight;
    
}
