package kh.project.dml.admin.model.vo;

import lombok.Data;

@Data
public class FpAdminVo {
	
	private int rownum;
	private String memberId;
	private String mname;
	private String mbirthday;
	private String gender;
	private double height;
	private double weight;
	
	private int userEnabled;
	private String authorities;
}
