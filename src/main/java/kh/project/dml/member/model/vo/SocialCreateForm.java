package kh.project.dml.member.model.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SocialCreateForm {
	
	@Email
	private String username;

    private String password1;
    
    @Size(min = 8, max = 8)
    @NotEmpty(message = "생년월일은 YYYYMMDD 형식으로 입력해주세요.")
    private String birthday;
    
    private String gender;
    
    private String name;
    
    @NotEmpty(message = "키는 필수항목입니다.")
    private String height;
    
    @NotEmpty(message = "몸무게는 필수항목입니다.")
    private String weight;
    
    private String naverid;
    
    private String googleid;
    
    private String kakaoid;
    
}
