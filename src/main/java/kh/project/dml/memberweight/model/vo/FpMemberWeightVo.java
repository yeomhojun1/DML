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
	private String weightDate;
	private double weight;
	private int muscleMass;
	private int bodyFatPet;
	
	public FpMemberWeightVo() {}
	
	public FpMemberWeightVo(String memberId, String weightDate, double weight) {
		this.memberId = memberId;
		this.weightDate = weightDate;
		this.weight = weight;
	}


	public FpMemberWeightVo(String memberId, String weightDate, int muscleMass, int bodyFatPet) {
		this.memberId = memberId;
		this.weightDate = weightDate;
		this.muscleMass = muscleMass;
		this.bodyFatPet = bodyFatPet;
	}
	
	
}
