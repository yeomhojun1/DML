package kh.project.dml.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.admin.model.dao.FpAdminDao;
import kh.project.dml.admin.model.vo.FpAdminVo;


public interface FpAdminService {
	
	
	
	public List<FpAdminVo> selectList();
	public FpAdminVo selectOne(String adminId);
	public int insert(FpAdminVo vo);
	public int update(FpAdminVo vo);
	public int delete(String adminId);
}
