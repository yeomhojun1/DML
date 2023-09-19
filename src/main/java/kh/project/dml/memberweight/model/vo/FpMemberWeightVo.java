package kh.project.dml.memberweight.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class FpMemberWeightVo {

	private String memberId;
	private Date date;
	private double weight;
	private int muscleMass;
	private int bodyFatPet;
	
	public FpMemberWeightVo() {}
	
	public FpMemberWeightVo(String memberId, Date date, double weight) {
		this.memberId = memberId;
		this.date = date;
		this.weight = weight;
	}


	public FpMemberWeightVo(String memberId, int muscleMass, int bodyFatPet) {
		this.memberId = memberId;
		this.muscleMass = muscleMass;
		this.bodyFatPet = bodyFatPet;
	}
	
	
}
