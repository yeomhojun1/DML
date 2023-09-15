package kh.project.dml.member.model.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserCreateForm {
	
	@NotEmpty(message = "아이디는 필수항목입니다.")
	@Email
	private String username;

    @NotEmpty(message = "비밀번호는 필수항목입니다.")
    private String password1;

    @NotEmpty(message = "비밀번호 확인은 필수항목입니다.")
    private String password2;
    
    @Size(min = 8, max = 8)
    @NotEmpty(message = "생년월일은 YYYYMMDD 형식으로 입력해주세요.")
    private int birthday;

    private String gender;
    
    @NotEmpty(message = "이름은 필수항목입니다.")
    private String name;
    
    @NotEmpty(message = "키는 필수항목입니다.")
    private double height;
    
    @NotEmpty(message = "몸무게는 필수항목입니다.")
    private double weight;
    
}
