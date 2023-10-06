package kh.project.dml.foodapi.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;


@Data
@Component
public class FpFoodApiVo {

	
	private String foodCd;
	private String foodName;
	private int calorie;
	private int crabs;
	private int protein;
	private int fat;
	
	//검색
	/*
	 * private String type; private String keyword;
	 */
	
	
}
