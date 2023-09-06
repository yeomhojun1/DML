package kh.project.dml.calender.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FpCalenderVo {

	
//	CREATE TABLE "CALENDAR" (
//			"CALENDARNO"	NUMBER		NULL,
//			"MEMBER_ID"	VARCHAR2(20)		NOT NULL,
//			"TITLE"	VARCHAR2(100)		NULL,
//			"STARTDATE"	VARCHAR2(20)		NULL,
//			"ENDDATE"	VARCHAR2(20)		NULL,
//			"CONTENT"	VARCHAR2(200)		NULL
//		);
	
	private int calendarno;
	private String memberId;
	private String title;
	private String startdate;
	private String enddate;
	private String content;
}
