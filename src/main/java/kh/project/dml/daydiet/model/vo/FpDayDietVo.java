package kh.project.dml.daydiet.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Component
public class FpDayDietVo {
	
	private String dayDietCode;
	private String memberId;
	private String foodDate;
	private String feedback;
	


}
