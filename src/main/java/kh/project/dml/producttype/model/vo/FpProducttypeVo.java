package kh.project.dml.producttype.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import kh.project.dml.chickenproduct.model.vo.FpChickenproductVo;
import lombok.Data;

@Data
@Component
public class FpProducttypeVo {

	//상품분류vo --> 닭가슴살vo 불러오기
	//private List<FpChickenproductVo> FpChickenproductList;
	
	
	private String type;
	private String storageMethod;
}
