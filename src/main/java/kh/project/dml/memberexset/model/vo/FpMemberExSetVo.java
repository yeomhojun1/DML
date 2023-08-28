package kh.project.dml.memberexset.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Data
public class FpMemberExSetVo {

	
	private String mid;
	private int ecode;
	private int exercieseId;
	private int exercieseSet;
	private int exercieseNumber;
	
	
	public FpMemberExSetVo(String mid, int ecode, int exercieseId, int exercieseSet, int exercieseNumber) {
		super();
		this.mid = mid;
		this.ecode = ecode;
		this.exercieseId = exercieseId;
		this.exercieseSet = exercieseSet;
		this.exercieseNumber = exercieseNumber;
	}


	public FpMemberExSetVo() {
		super();
	}
	
	
}
