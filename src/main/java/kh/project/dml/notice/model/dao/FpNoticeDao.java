package kh.project.dml.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.notice.model.vo.FpNoticeVo;

@Repository
public class FpNoticeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpNoticeVo> selectList() {
		return sqlSession.selectList("notice.selectList");
	}
	public FpNoticeVo selectOne(int noticeNumber) {
		return sqlSession.selectOne("notice.selecOne", noticeNumber);
	}
	public int insert(FpNoticeVo vo) {
		return sqlSession.insert("notice.insert", vo);
	}
	public int update(FpNoticeVo vo) {
		return sqlSession.update("notice.update", vo);
	}
	public int delete(int noticeNumber) {
		return sqlSession.delete("notice.delete", noticeNumber);
	}
}
