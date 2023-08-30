package kh.project.dml.diet.model.vo;

import org.springframework.stereotype.Component;

import kh.project.dml.food.model.vo.FpFoodVo;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Component
@Getter
@Setter
@ToString
public class FpDietVo {
	private String mid;
	private String foodDaliy;
	private String foodTime;
	
	public FpDietVo() {}
	
	public FpDietVo(String mid, String foodDaliy, String foodTime) {
		super();
		this.mid = mid;
		this.foodDaliy = foodDaliy;
		this.foodTime = foodTime;
	}

}
