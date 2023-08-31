package kh.project.dml.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FpBoardVo {
	
	private int commentNum;
	private String memberId;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private Date boardDate;
}
