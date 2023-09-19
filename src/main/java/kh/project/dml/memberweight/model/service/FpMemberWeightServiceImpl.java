package kh.project.dml.memberweight.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.memberweight.model.dao.FpMemberWeightDao;
import kh.project.dml.memberweight.model.vo.FpMemberWeightVo;

@Service("fpMemberWeightServiceImpl")
public class FpMemberWeightServiceImpl implements FpMemberWeightService {
	
	@Autowired
	private FpMemberWeightDao fpMemberWeightDao;
	
	@Override
	public List<FpMemberWeightVo> selectList() {
		return fpMemberWeightDao.selectList();
	}
	@Override
	public FpMemberWeightVo selectOne(String userId) {
		return fpMemberWeightDao.selectOne(userId);
	}
	@Override
	public int insert(FpMemberWeightVo vo) {
		System.out.println(vo);
		return fpMemberWeightDao.insert(vo);
	}
	@Override
	public int update(FpMemberWeightVo vo) {
		return fpMemberWeightDao.update(vo);
	}
	@Override
	public int delete(String userId) {
		return fpMemberWeightDao.delete(userId);
	}
}
