package kh.project.dml.memberweight.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.memberweight.model.dao.FpMemberWeightDao;
import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;


public interface FpMemberWeightService {
	
	
	
	public List<FpMemberWeightVo> selectList();
	public FpMemberWeightVo selectOne(String userId);
	public int insert(FpMemberWeightVo vo);
	public int update(FpMemberWeightVo vo);
	public int delete(String userId);
}
