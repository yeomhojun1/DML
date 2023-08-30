package kh.project.dml.onedayex.model.Vo;

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
public class FpOneDayExVo {
	
	private int exerciesId;
	private String exerciesName;
	private int exerciesDay;
	private int exerciesOrder;

	public FpOneDayExVo() {}

	public FpOneDayExVo(int exerciesId, String exerciesName, int exerciesDay, int exerciesOrder) {
		super();
		this.exerciesId = exerciesId;
		this.exerciesName = exerciesName;
		this.exerciesDay = exerciesDay;
		this.exerciesOrder = exerciesOrder;
	}

}
