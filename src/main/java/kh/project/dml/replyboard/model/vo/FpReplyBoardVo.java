package kh.project.dml.replyboard.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class FpReplyBoardVo {

	private int replyNo;
	private String memberId;
	private String replyContent ;
	private String replyDate;
	private int boardNo;
	private int rref;
	private int rstep;
	private int rlevel;
	
}
