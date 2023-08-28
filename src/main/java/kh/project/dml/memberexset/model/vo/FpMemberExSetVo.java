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
	private String mid;
	private int ecode;
	private int exercieseId;
	private int exercieseSet;
	private int exercieseNumber;

	public FpMemberExSetVo() {}
	
	public FpMemberExSetVo(String mid, int ecode, int exercieseId, int exercieseSet, int exercieseNumber) {
		this.mid = mid;
		this.ecode = ecode;
		this.exercieseId = exercieseId;
		this.exercieseSet = exercieseSet;
		this.exercieseNumber = exercieseNumber;
	}

}
