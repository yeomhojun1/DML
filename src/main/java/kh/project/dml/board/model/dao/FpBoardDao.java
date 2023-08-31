package kh.project.dml.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.board.model.vo.FpBoardVo;

@Repository
public class FpBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpBoardVo> selectList() {
		return sqlSession.selectList("board.selectList");
	}
	public FpBoardVo selectOne(int commentNum) {
		return sqlSession.selectOne("board.selectOne", commentNum);
	}
	public int insert(FpBoardVo vo) {
		return sqlSession.insert("board.insert", vo);
	}
	public int update(FpBoardVo vo) {
		return sqlSession.update("board.update", vo);
	}
	public int delete(int commentNum) {
		return sqlSession.delete("board.delete" ,commentNum);
	}
}
