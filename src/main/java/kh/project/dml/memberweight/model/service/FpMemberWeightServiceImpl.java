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
			fpMemberWeightDao.updateWeight(vo);
		}
		if(fpMemberWeightDao.checkDate(vo) == null) {			
			return fpMemberWeightDao.insertWeight(vo);
		} else {
			return fpMemberWeightDao.updateWeight(vo);
		}
	}

	//delete
	@Override
	public int deleteWeight(String memberId, String weightDate) {
		
		return	fpMemberWeightDao.deleteWeight(memberId, weightDate);
	}
	// insert 몸무게 
	@Override
	public int insertUpdateWeight(FpMemberWeightVo vo) {
		int result = 0;
		try { 
			result = fpMemberWeightDao.insertWeight(vo);
		} catch (Exception e) {
			result = fpMemberWeightDao.updateWeight(vo);	
		}
		return result;
	}
	//근육량, 체지방량 insert
	@Override
	public int insertUpdate(FpMemberWeightVo vo) {
		int result = 0;
		try { 
			result = fpMemberWeightDao.insert(vo);
		} catch (Exception e) {
			result = fpMemberWeightDao.update(vo);	
		}
		return result;
	}


	
}
