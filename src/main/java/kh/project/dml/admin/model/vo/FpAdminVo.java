package kh.project.dml.admin.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FpAdminVo {
		
	private String adminId;
	private int adminPwd;
	private String adminName;
	private String adminEmail;
}
