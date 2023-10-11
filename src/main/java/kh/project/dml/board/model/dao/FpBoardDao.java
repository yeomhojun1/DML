package kh.project.dml.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.board.model.vo.FpBoardParam;
import kh.project.dml.board.model.vo.FpBoardSelectReplyParam;
import kh.project.dml.board.model.vo.FpBoardVo;
import kh.project.dml.common.vo.Criteria;

@Repository
public class FpBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpBoardVo> selectList(Criteria cri) {
		return sqlSession.selectList("board.selectList",cri);
	}
	public FpBoardVo selectOne(Integer boardNo) {
		return sqlSession.selectOne("board.selectOne", boardNo);
	}
	public FpBoardVo selectOneForReply(Integer boardNo) {
		return sqlSession.selectOne("board.selectOneJoinReply", boardNo);
	}
	public int insert(FpBoardVo vo) {
		return sqlSession.insert("board.insert", vo);
	}
	public int update(FpBoardVo vo) {
		return sqlSession.update("board.update", vo);
	}
	public int updateCount(FpBoardParam param) {
		return sqlSession.update("board.plusCount", param);
	}
	public int delete(int boardNo) {
		return sqlSession.delete("board.delete" ,boardNo);
	}
	public int selectReply(FpBoardSelectReplyParam param) {
		return sqlSession.update("board.selectReply", param);
	}
	public int getTotalBoard(Criteria cri) {
		return sqlSession.selectOne("board.getTotalBoard", cri);
	}
}
