package kh.project.dml.exercise.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Component
@Getter
@Setter
public class FpExerciseVo {

	private int ecode;
	private String exName;
	private String part;
	private String epose;
	private String eposeLink;
	@Override
	public String toString() {
		return "FpExerciseVo [ecode=" + ecode + ", exName=" + exName + ", part=" + part + ", epose= 공백, eposeLink= 공백]";
	}

//	private String mid2;
//	private String studentName;
//	private int examScore;
//	private Date birthday;
//	private Date enterDate;
//	private String important;
//	private String mid;
//	private String tele;


}
