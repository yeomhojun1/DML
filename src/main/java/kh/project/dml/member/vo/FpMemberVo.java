package kh.project.dml.member.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FpMemberVo {

//	"MID"	VARCHAR(20)		NOT NULL,
//	"MPWD"	VARCHAR(20)		NOT NULL,
//	"MNAME"	VARCHAR(20)		NOT NULL,
//	"MEMAIL"	VARCHAR((50)		NOT NULL,
//	"MBIRTHDAY"	NUMBER		NOT NULL,
//	"GENDER"	CHAR(1)		NOT NULL,
//	"ADDRESS"	VARCHAR(40)		NOT NULL,
//	"HEIGHT"	NUMBER		NOT NULL,
//	"WEIGHT"	NUMBER		NOT NULL
	
	private String mid;
	private String mpwd;
	private String mname;
	private String meamil;
	private int mbirthday;
	private String gender;
	private String address;
	private int height;
	private int weight;
	
	
	
	
	
	
}
