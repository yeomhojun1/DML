package kh.project.dml.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.admin.model.dao.FpAdminDao;
import kh.project.dml.admin.model.vo.FpAdminVo;
import kh.project.dml.common.vo.Criteria;


public interface FpAdminService {
	
	public List<FpAdminVo> memberList(Criteria cri);
	public List<FpAdminVo> suspendedList(Criteria cri);
	public int getTotal(Criteria cri);
	public FpAdminVo selectOne(String adminId);
	public int insert(FpAdminVo vo);
	public int update(FpAdminVo vo);
	public int delete(String adminId);
}
