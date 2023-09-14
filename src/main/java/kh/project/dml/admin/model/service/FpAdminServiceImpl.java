package kh.project.dml.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.admin.model.dao.FpAdminDao;
import kh.project.dml.admin.model.vo.FpAdminVo;

@Service("fpAdminServiceImpl")
public class FpAdminServiceImpl implements FpAdminService {
	
	@Autowired
	private FpAdminDao fpAdminDao;
	
	@Override
	public List<FpAdminVo> selectList() {
		return fpAdminDao.selectList(); 
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
