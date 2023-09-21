package kh.project.dml.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FpBoardVo {
	private int boardNo;
	private String memberId;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private int boardCount;
	private String bref;
	private int bstep;
	private int blevel;
}
