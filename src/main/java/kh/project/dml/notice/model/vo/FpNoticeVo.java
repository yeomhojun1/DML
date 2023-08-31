package kh.project.dml.notice.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
@Data
@Component
public class FpNoticeVo {
	
	private int noticeNumber;
	private String adminId;
	private String noticeTitle;
	private String noticeContent;
	private int noticeView;
	private Date noticeDate;
}
