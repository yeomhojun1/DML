package kh.project.dml.memberexset.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.memberexset.model.dao.FpMemberExSetDao;
import kh.project.dml.memberexset.model.vo.FpMemberExSetParam;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;

@Service("fpMemberExSetServiceImpl")
public class FpMemberExSetServiceImpl implements FpMemberExSetService  {

	@Autowired
	private FpMemberExSetDao fpMemberExSetDao;
	
	@Override
	public List<FpMemberExSetVo> selectList(String dayExSet)  {
		return fpMemberExSetDao.selectList(dayExSet);
	}
	@Override
	public FpMemberExSetVo selectOne(String dayExSet)  {
		return fpMemberExSetDao.selectOne(dayExSet);
	}
	@Override
	public int insert(FpMemberExSetVo vo)  {
		return fpMemberExSetDao.insert(vo);
	}
	@Override
	public int update(FpMemberExSetVo vo) {
		return fpMemberExSetDao.update(vo);
	}
	@Override
	public int delete(String dayExSet)  {
		return fpMemberExSetDao.delete(dayExSet);
	}
	@Override
	public List<FpMemberExSetVo> selectPart(FpMemberExSetParam param) {
		return fpMemberExSetDao.selectPart(param);
	}
}
