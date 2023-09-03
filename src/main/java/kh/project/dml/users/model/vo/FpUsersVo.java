package kh.project.dml.users.model.vo;

import java.util.Date;

import lombok.Data;


//TODO users 테이블 형태로 수정 필요
@Data
//@Builder
public class FpUsersVo {
	private String uid;
	private String upw;
	private String uname;
	
	private String email;
	private String googleid;
	private String naverid;
	private String kakaoid;
	private String nickname;
	
	private String loginip;
	private Date lastlogin;
	
}
