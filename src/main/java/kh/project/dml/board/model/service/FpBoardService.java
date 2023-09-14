package kh.project.dml.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.board.model.dao.FpBoardDao;
import kh.project.dml.board.model.vo.FpBoardVo;


public interface FpBoardService {

	
	public List<FpBoardVo> selectList();
	public FpBoardVo selectOne(int commentNum);
	public int insert(FpBoardVo vo);
	public int update(FpBoardVo vo);
	public int delete(int commentNum);
}
