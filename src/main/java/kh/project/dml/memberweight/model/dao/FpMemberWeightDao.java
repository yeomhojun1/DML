package kh.project.dml.memberweight.model.dao;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;

@Repository
public class FpMemberWeightDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpMemberWeightVo> selectList(String memberId) {
		return sqlSession.selectList("memberweight.selectList", memberId);
	}
	public FpMemberWeightVo selectOne(String userId) {
		return sqlSession.selectOne("memberweight.selectOne", userId);
	}
	
	//근육량 체지방량 입력시 화면구현
	public FpMemberWeightVo nowComposition(String selectDate, String memberId) {
		Map<String, Object> map = new HashMap<>();
		map.put("selectDate", selectDate);
		map.put("memberId", memberId);
		return sqlSession.selectOne("memberweight.nowComposition", map);
	}
	
	
	
	//날짜 몸무게 입력시 화면구현
	public FpMemberWeightVo nowWeight(String selectDate, String memberId) {
		Map<String, Object> map = new HashMap<>();
		map.put("selectDate", selectDate);
		map.put("memberId", memberId);
		return sqlSession.selectOne("memberweight.nowWeight", map);
	}
	
	
	public FpMemberWeightVo checkDate(FpMemberWeightVo vo) {
		return sqlSession.selectOne("memberweight.checkDate", vo);
	}
	
	// 
	public int insertWeight(FpMemberWeightVo vo) {
		return sqlSession.insert("memberweight.insertWeight", vo);
	}
	public int updateWeight(FpMemberWeightVo vo) {
		return sqlSession.update("memberweight.updateWeight", vo);
	}
	
	public int updateWeightMember(FpMemberWeightVo vo) {
		return sqlSession.update("memberweight.updateWeightMember", vo);
	}
	//근육량, 체지방 
	public int insert(FpMemberWeightVo vo) {
		return sqlSession.insert("memberweight.insert", vo);
	}
	
	public int update(FpMemberWeightVo vo) {
		return sqlSession.update("memberweight.update", vo);
	}

	//delete
	public int deleteWeight(String memberId,String weightDate) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("weightDate", weightDate);
		return sqlSession.delete("memberweight.deleteWeight", map);
	}
	
	//delete 근육량 체지방량 삭제
	
	public int delete(String weightDate , String memberId) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("weightDate", weightDate);
		map.put("memberId", memberId);
		
		return sqlSession.delete("memberweight.delete" , map);
	}
	
 }
