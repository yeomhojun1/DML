package kh.project.dml.diet.model.vo;

import org.springframework.stereotype.Component;

import kh.project.dml.food.model.vo.FpFoodVo;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Component
public class FpDietVo {
	private int mealCode;
	private int dayDietCode;
	private String foodTime;
	

}
