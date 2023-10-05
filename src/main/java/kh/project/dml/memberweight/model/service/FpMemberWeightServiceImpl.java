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
	public List<FpMemberWeightVo> selectList(String memberId) {
		return fpMemberWeightDao.selectList(memberId);
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

	//delete
	@Override
	public int deleteWeight(String memberId, String weightDate) {
		
		return	fpMemberWeightDao.deleteWeight(memberId, weightDate);
	}

	//근육량, 체지방량  update/insert
	@Transactional
	@Override
	public int insertUpdate(FpMemberWeightVo vo) {
		System.out.println("service:"+vo.getWeight());
		if(fpMemberWeightDao.checkDate(vo) == null) {
			return fpMemberWeightDao.insert(vo);
		} else {
			return fpMemberWeightDao.update(vo);
		}
	}

	////근육량, 체지방량 delete
	
	public int delete( String weightDate , String memberId) {
		
		return	fpMemberWeightDao.delete( weightDate , memberId);
	}
	
}
