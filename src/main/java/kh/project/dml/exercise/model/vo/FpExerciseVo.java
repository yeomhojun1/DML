package kh.project.dml.exercise.model.vo;

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
public class FpExerciseVo {
	private int ecode;
	private String exName;
	private String part;
	private String epose;
	private String eposeLink;
}
