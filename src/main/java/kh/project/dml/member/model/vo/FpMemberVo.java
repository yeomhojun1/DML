package kh.project.dml.member.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
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
	
	// 인증 정보
	private int memberAuth;
	
	// 계정 권한
	private int userEnabled;
	private String authorities;
	
	//평판 추가
	private int reputation;
	
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
