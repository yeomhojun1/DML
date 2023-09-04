package kh.project.dml.member.model.vo;

import org.springframework.stereotype.Component;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Component
@Getter
@Setter
@ToString
public class FpMemberVo {
	private String mid;
	private String mname;
	private String memail;
	private int mbirthday;
	private String gender;
	private String address;
	private int height;
	private int weight;
	// 소셜 추가
	private String googleid;
	private String naverid;
	private String kakaoid;
	private String nickname;
	
	public FpMemberVo() {}
	
	@Builder
    public FpMemberVo(String mid, String mname, String memail) {
        this.mid = mid;
        this.mname = mname;
        this.memail = memail;
    }
	
	public FpMemberVo update(String name) {
        this.mname = name;
        return this;
    }
	
}
