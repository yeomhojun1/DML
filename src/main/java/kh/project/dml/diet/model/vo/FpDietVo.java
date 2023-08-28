package kh.project.dml.diet.model.vo;

import org.springframework.stereotype.Component;

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
	private String foodCode;
	private String foodDaily;
	private String foodQuality;

	public FpDietVo() {}
	
	public FpDietVo(String mid, String foodCode, String foodDaily, String foodQuality) {
		this.mid = mid;
		this.foodCode = foodCode;
		this.foodDaily = foodDaily;
		this.foodQuality = foodQuality;
	}

}
