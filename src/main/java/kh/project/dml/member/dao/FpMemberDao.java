package kh.project.dml.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.member.vo.FpMemberVo;

@Repository("fpMemberDao")
public class FpMemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpMemberVo> selectList() throws Exception {
		return sqlSession.selectList("member.selectList");
	}
	public FpMemberVo selectOne(String mid) throws Exception {
		return sqlSession.selectOne("member.selectOne", mid);
	}
	
	public int insert(FpMemberVo vo) throws Exception {
		int result = sqlSession.insert("member.insert", vo);
		return sqlSession.insert("member.insert", vo);
	}
	public int update(FpMemberVo vo) throws Exception {
		return sqlSession.update("member.update", vo);
	}
	public int delete(String mid) throws Exception {
		return sqlSession.delete("member.delete",  mid);
	}
}
