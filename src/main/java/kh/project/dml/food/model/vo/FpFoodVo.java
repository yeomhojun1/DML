package kh.project.dml.food.model.vo;

import org.springframework.stereotype.Component;

import kh.project.dml.foodapi.model.vo.FpFoodApiVo;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Component
@Getter
@Setter
@ToString
public class FpFoodVo {

	private String mid;
	private String foodCode;
	private String foodDaily;
	private int foodQuality;
	
	
	public FpFoodVo(String mid, String foodCode, String foodDaily, int foodQuality) {
		super();
		this.mid = mid;
		this.foodCode = foodCode;
		this.foodDaily = foodDaily;
		this.foodQuality = foodQuality;
	}


	public FpFoodVo() {
		super();
	}
	
	
	
	
	
}
