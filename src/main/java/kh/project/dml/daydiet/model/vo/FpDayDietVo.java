package kh.project.dml.daydiet.model.vo;

import org.springframework.stereotype.Component;

import kh.project.dml.onedayex.model.Vo.FpOneDayExVo;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Component
@Getter
@Setter
@ToString
public class FpDayDietVo {

	private String foodDate;
	private String feedBack;
	
	public FpDayDietVo(String foodDate, String feedBack) {
		super();
		this.foodDate = foodDate;
		this.feedBack = feedBack;
	}

	public FpDayDietVo() {
		super();
	}
	
	
}
