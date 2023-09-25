package kh.project.dml.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.admin.model.dao.FpAdminDao;
import kh.project.dml.admin.model.vo.FpAdminVo;
import kh.project.dml.common.vo.Criteria;

@Service
public class FpAdminServiceImpl implements FpAdminService {
	
	@Autowired
	private FpAdminDao fpAdminDao;
	
	@Override
	public List<FpAdminVo> memberList(Criteria cri) {
		return fpAdminDao.memberList(cri);
	}
	
	@Override
	public List<FpAdminVo> suspendedList(Criteria cri) {
		return fpAdminDao.suspendedList(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return fpAdminDao.getTotal(cri);
	}
	
	@Override
	public FpAdminVo selectOne(String adminId) {
		return fpAdminDao.selectOne(adminId);
	}
	@Override
	public int insert(FpAdminVo vo) {
		return fpAdminDao.insert(vo);
	}
	@Override
	public int update(FpAdminVo vo) {
		return fpAdminDao.update(vo);
	}
	@Override
	public int delete(String adminId) {
		return fpAdminDao.delete(adminId);
	}
}
