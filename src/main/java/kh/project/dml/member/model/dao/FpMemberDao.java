package kh.project.dml.member.model.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kh.project.dml.member.model.vo.FpMemberVo;

@Repository("fpMemberDao")
public class FpMemberDao {
	
	@Inject
	private SqlSession sqlSession;

	//회원가입구현
	public void insertMember(FpMemberVo vo) {
		System.out.println("#####");
		sqlSession.insert("member.insertMember", vo);
	}
	
	// 회원 정보 조회 - ID 정보에 해당하는 사용자 정보
	public FpMemberVo readMember(String userid) throws Exception {
		return sqlSession.selectOne("member.readMember", userid); 
	}
	
	public int updateMember(FpMemberVo mvo) throws Exception {
		return sqlSession.update("member.updateMember", mvo); 
	}
	
	public int deleteMember(FpMemberVo mvo) throws Exception {
		return sqlSession.delete("member.deleteMember", mvo); 
	}
	
}
