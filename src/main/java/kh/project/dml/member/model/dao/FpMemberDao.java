package kh.project.dml.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.member.model.vo.FpMemberVo;

@Repository("fpMemberDao")
public class FpMemberDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpMemberVo> selectList()  {
		return sqlSession.selectList("member.selectList");
	}
	public FpMemberVo selectOne(String mid) {
		return sqlSession.selectOne("member.selectOne", mid);
	}
	public int insert(FpMemberVo vo)  {
		return sqlSession.insert("member.insert", vo);
	}
	public int update(FpMemberVo vo)  {
		return sqlSession.update("member.update", vo);
	}
	public int delete(String mid) {
		return sqlSession.delete("member.delete",  mid);
	}
}
