package kh.project.dml.food.model.vo;

import lombok.Data;

@Data
public class FpFoodVo {

	private String foodCd;
	private int foodQuality;
	private String foodTime; 
	private String mealCode;  // Service에서 조합할 예정 mealCode
	
}
