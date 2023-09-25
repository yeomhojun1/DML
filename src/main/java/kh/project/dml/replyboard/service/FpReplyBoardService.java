package kh.project.dml.replyboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.project.dml.replyboard.model.vo.FpReplyBoardVo;

public interface FpReplyBoardService {
public List<FpReplyBoardVo> selectList();
	public FpReplyBoardVo selectOne(int chickenNo);
	public int insert(FpReplyBoardVo vo);
	public int update(FpReplyBoardVo vo);
	public int delete(int chickenNo);
}
