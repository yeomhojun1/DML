package kh.project.dml.member.model.vo;


import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class FpMemberVo {
	private String memberId;
	private String mname;
	private String mbirthday;
	private String gender;
	private double height;
	private double weight;
	// 소셜 추가
	private String googleid;
	private String naverid;
	private String kakaoid;
	
	// 세션 추가
	private String sessionkey;
	private String sessionlimit;
	
	public FpMemberVo() {}
	
	@Builder
    public FpMemberVo(String memberId, String mname) {
        this.memberId = memberId;
        this.mname = mname;
    }
	
	public FpMemberVo update(String name) {
        this.mname = name;
        return this;
    }
	
}
