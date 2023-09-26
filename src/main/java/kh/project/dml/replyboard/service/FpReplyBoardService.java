package kh.project.dml.replyboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.project.dml.replyboard.model.vo.FpReplyBoardVo;

public interface FpReplyBoardService {
	public FpReplyBoardVo selectOne(int chickenNo);
	public List<FpReplyBoardVo> insert(FpReplyBoardVo vo);
	public FpReplyBoardVo update(FpReplyBoardVo vo);
	public List<FpReplyBoardVo> delete(int chickenNo);
	public List<FpReplyBoardVo> selectList(int boardNo);
}
