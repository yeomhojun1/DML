package kh.project.dml.chickenproduct.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FpChickenproductVo {

	private int chickenNo;
	private String link;
	private String productName;
	private int price;
	private String type;
}
