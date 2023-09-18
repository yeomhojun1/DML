package kh.project.dml.memberexset.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Component
@Getter
@Setter
@ToString
public class FpMemberExSetVo {
	private String dayExSet;
	private String memberId;
	private int ecode;
	private String dayNo;
	private String exName;
	private int exerciseSet;
	private int exerciseNumber;
	private int exerciseWeight;
	
	

}
