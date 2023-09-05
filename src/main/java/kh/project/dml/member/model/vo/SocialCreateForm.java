package kh.project.dml.member.model.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SocialCreateForm {
	@Email
	private String username;

    @NotEmpty(message = "비밀번호는 필수항목입니다.")
    private String password1;
    
    private String gender;
    
    private String name;
    
    @NotEmpty(message = "키는 필수항목입니다.")
    private double height;
    
    @NotEmpty(message = "몸무게는 필수항목입니다.")
    private double weight;
    
    private String naverid;
    
    private String googleid;
    
    private String kakaoid;
    
    
    
    
}
