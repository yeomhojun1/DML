package kh.project.dml.foodapi.model.vo;

import org.springframework.stereotype.Component;

import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Component
@Getter
@Setter
@ToString
public class FpFoodApiVo {
	
	private int foodCd;
	private String foodName;
	private int calorie;
	private int crabs;
	private int protein;
	private int fat;
	
	public FpFoodApiVo() {}
	
	public FpFoodApiVo(int foodCd, String foodName, int calorie, int crabs, int protein, int fat) {
		super();
		this.foodCd = foodCd;
		this.foodName = foodName;
		this.calorie = calorie;
		this.crabs = crabs;
		this.protein = protein;
		this.fat = fat;
	}

}
