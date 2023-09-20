package kh.project.dml.nutrient.model.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import kh.project.dml.suplemenid.model.vo.FpSuplemenIdVo;
import lombok.Data;

@Data
@Component
public class FpNntruentVo {
	
	//영양소vo에 보충제 vo값 불러오기
	private List<FpSuplemenIdVo> FpSuplemenList;

	private int nutrientId;
	private String nutrient;
	private String comment;
	private String intake;
	private int workmanship;
}
