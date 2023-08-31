package kh.project.dml.memberweight.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FpMemberWeightVo {

	private String userId;
	private Date date;
	private int weight;
	private int muscleMass;
	private int bodyFatPet;
}
