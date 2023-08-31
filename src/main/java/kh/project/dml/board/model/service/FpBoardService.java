package kh.project.dml.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.board.model.dao.FpBoardDao;
import kh.project.dml.board.model.vo.FpBoardVo;

@Service
public class FpBoardService {

	@Autowired
	private FpBoardDao fpBoardDao;
	
	public List<FpBoardVo> selectList() {
		return fpBoardDao.selectList();
	}
	public FpBoardVo selectOne(int commentNum) {
		return fpBoardDao.selectOne(commentNum);
	}
	public int insert(FpBoardVo vo) {
		return fpBoardDao.insert(vo);
	}
	public int update(FpBoardVo vo) {
		return fpBoardDao.update(vo);
	}
	public int delete(int commentNum) {
		return fpBoardDao.delete(commentNum);
	}
}
