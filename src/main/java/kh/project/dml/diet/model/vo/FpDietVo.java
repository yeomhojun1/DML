package kh.project.dml.diet.model.vo;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
public class FpDietVo {
	private String mealCode;   // Service에서 조합할 예정 TODO
	private String memberId;
	private String foodDate;
	private String foodTime;   // Service에서 조합할 예정 TODO
	private String feedback;
	private String foodCd;
	private int foodGp;
	private int foodQuality;
	private String foodName;
	private int calorie;
	private int crabs;
	private int protein;
	private int fat;
	
	//검색
	private String type;
	private String keyword;
	

	
	private List<FpFoodVo> foodlist;
}
