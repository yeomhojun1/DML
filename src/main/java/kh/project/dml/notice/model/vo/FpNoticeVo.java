package kh.project.dml.notice.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FpNoticeVo {

	private int noticeNo;
	private String adminId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int noticeView;
}
