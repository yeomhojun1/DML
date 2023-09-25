package kh.project.dml.replyboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.replyboard.model.vo.FpReplyBoardVo;


@Repository("FpReplyBoardVo")
public class FpReplyBoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpReplyBoardVo> selectList() {
		return sqlSession.selectList("replyboard.selectList");
	}
	public FpReplyBoardVo selectOne(Integer replyNo) {
		return sqlSession.selectOne("replyboard.selectOne", replyNo);
	}
	public int insert(FpReplyBoardVo vo) {
		return sqlSession.insert("replyboard.insert", vo);
	}
	public int update(FpReplyBoardVo vo) {
		return sqlSession.update("replyboard.update", vo);
	}
	public int delete(int replyNo) {
		return sqlSession.delete("replyboard.delete" ,replyNo);
	}
}
