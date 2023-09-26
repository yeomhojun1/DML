package kh.project.dml.diet.model.vo;

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
	
	private List<FpFoodVo> foodlist;
}
