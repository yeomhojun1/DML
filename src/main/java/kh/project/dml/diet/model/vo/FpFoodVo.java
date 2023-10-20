package kh.project.dml.diet.model.vo;

import lombok.Data;

@Data
public class FpFoodVo {

	private String foodCd;
	private int foodQuantity;
	private String foodTime; 
	private String mealCode;  // Service에서 조합할 예정 mealCode
	
}
