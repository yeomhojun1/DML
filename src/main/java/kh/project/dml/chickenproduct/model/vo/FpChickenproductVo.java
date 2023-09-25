package kh.project.dml.chickenproduct.model.vo;

import org.springframework.stereotype.Component;

import kh.project.dml.producttype.model.vo.FpProducttypeVo;
import lombok.Data;

@Data
@Component
public class FpChickenproductVo {
	
	private int chickenNo;
	private String link;
	private String productName;
	private String price;
	private String type;
	// 닭가슴살vo --> 상품분류vo 불러오기
	private FpProducttypeVo fpProducttypeVo;
}
