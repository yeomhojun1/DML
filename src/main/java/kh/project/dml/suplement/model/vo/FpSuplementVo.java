package kh.project.dml.suplement.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FpSuplementVo {

	private int suplementno;
	private String link;
	private String suplementname;
	private int nutrientId;
}
