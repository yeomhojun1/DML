package kh.project.dml.memberweight.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.memberweight.model.dao.FpMemberWeightDao;
import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;


public interface FpMemberWeightService {
	
	/* public List<FpMemberWeightVo> selectList(); */
	public FpMemberWeightVo selectOne(String userId);
	// 몸무게 입력
	public int dateWeight(FpMemberWeightVo vo, String now);
	//몸무게 삭제
	public int deleteWeight(String memberId, String weightDate);
	
	
	// 체지방량, 근육량 입력
	public int insertUpdate(FpMemberWeightVo vo) ;
	//체지방량, 근육량 삭제
	public int delete(String weightDate , String memberId) ;
	
	//체중관리 페이지 - 날짜 List 
	public List<FpMemberWeightVo> selectList(String memberId);
}
