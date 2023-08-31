package kh.project.dml.memberweight.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;

@Repository
public class FpMemberWeightDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpMemberWeightVo> selectList() {
		return sqlSession.selectList("memberweight.selectList");
	}
	public FpMemberWeightVo selectOne(String userId) {
		return sqlSession.selectOne("memberweight.selectList", userId);
	}
	public int insert(FpMemberWeightVo vo) {
		return sqlSession.insert("memberweight.selectList", vo);
	}
	public int update(FpMemberWeightVo vo) {
		return sqlSession.update("memberweight.selectList", vo);
	}
	public int delete(String userId) {
		return sqlSession.delete("memberweight.selectList", userId);
	}
 }
