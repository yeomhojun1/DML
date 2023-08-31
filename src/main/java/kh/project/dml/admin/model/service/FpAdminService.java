package kh.project.dml.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.admin.model.dao.FpAdminDao;
import kh.project.dml.admin.model.vo.FpAdminVo;

@Service
public class FpAdminService {
	
	@Autowired
	private FpAdminDao fpAdminDao;
	
	public List<FpAdminVo> selectList() {
		return fpAdminDao.selectList(); 
	}
	public FpAdminVo selectOne(String adminId) {
		return fpAdminDao.selectOne(adminId);
	}
	public int insert(FpAdminVo vo) {
		return fpAdminDao.insert(vo);
	}
	public int update(FpAdminVo vo) {
		return fpAdminDao.update(vo);
	}
	public int delete(String adminId) {
		return fpAdminDao.delete(adminId);
	}
}
