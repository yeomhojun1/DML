package kh.project.dml.memberexset.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.memberexset.model.vo.FpMemberExSetParam;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;

@Repository("FpMemberExSetVo")
public class FpMemberExSetDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpMemberExSetVo> selectList(String dayExSet)  {
		return sqlSession.selectList("memberExSet.selectList",dayExSet);
	}
	public List<FpMemberExSetVo> selectPart(FpMemberExSetParam param)  {
		return sqlSession.selectList("memberExSet.selectPart",param);
	}
	public FpMemberExSetVo selectOne(String dayExSet) {
		return sqlSession.selectOne("memberExSet.selectOne", dayExSet);
	}
	public int insert(FpMemberExSetVo vo)  {
		return sqlSession.insert("memberExSet.insert", vo);
	}
	public int update(FpMemberExSetVo vo)  {
		return sqlSession.update("memberExSet.update", vo);
	}
	public int delete(String dayExSet) {
		return sqlSession.delete("memberExSet.delete",  dayExSet);
	}
}
