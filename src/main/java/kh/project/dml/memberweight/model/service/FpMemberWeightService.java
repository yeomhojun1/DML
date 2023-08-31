package kh.project.dml.memberweight.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.memberweight.model.dao.FpMemberWeightDao;
import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;

@Service
public class FpMemberWeightService {
	
	@Autowired
	private FpMemberWeightDao fpMemberWeightDao;
	
	public List<FpMemberWeightVo> selectList() {
		return fpMemberWeightDao.selectList();
	}
	public FpMemberWeightVo selectOne(String userId) {
		return fpMemberWeightDao.selectOne(userId);
	}
	public int insert(FpMemberWeightVo vo) {
		return fpMemberWeightDao.insert(vo);
	}
	public int update(FpMemberWeightVo vo) {
		return fpMemberWeightDao.update(vo);
	}
	public int delete(String userId) {
		return fpMemberWeightDao.delete(userId);
	}
}
