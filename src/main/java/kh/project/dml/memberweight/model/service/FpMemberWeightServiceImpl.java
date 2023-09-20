package kh.project.dml.memberweight.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public FpMemberWeightVo selectOne(String memberId) {
		return fpMemberWeightDao.selectOne(memberId);
	}
	
	@Transactional
	@Override
	public int dateWeight(FpMemberWeightVo vo, String now) {
		if(vo.getWeightDate().equals(now)) {
			fpMemberWeightDao.updateWeightMember(vo);
		}
		if(fpMemberWeightDao.checkDate(vo) == null) {			
			return fpMemberWeightDao.insertWeight(vo);
		} else {
			return fpMemberWeightDao.updateWeight(vo);
		}
	}

	@Override
	public int delete(String memberId) {
		return fpMemberWeightDao.delete(memberId);
	}
}
