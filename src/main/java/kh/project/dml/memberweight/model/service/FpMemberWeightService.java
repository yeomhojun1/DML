package kh.project.dml.memberweight.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.memberweight.model.dao.FpMemberWeightDao;
import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;


public interface FpMemberWeightService {
	
	public List<FpMemberWeightVo> selectList();
	public FpMemberWeightVo selectOne(String userId);
	public int dateWeight(FpMemberWeightVo vo, String now);
	public int delete(String userId);
}
