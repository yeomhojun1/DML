package kh.project.dml.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.admin.model.dao.FpAdminDao;
import kh.project.dml.admin.model.vo.FpAdminVo;
import kh.project.dml.common.vo.Criteria;


public interface FpAdminService {
	
	List<FpAdminVo> memberList(Criteria cri);
	List<FpAdminVo> suspendedList(Criteria cri);
	void suspendedActive(String memberId);
	void suspendedClear(String memberId);
	int getTotal(Criteria cri);
	int getTotalActive(Criteria cri);
	int getTotalSuspended(Criteria cri);
	FpAdminVo selectOne(String adminId);
	int insert(FpAdminVo vo);
	int update(FpAdminVo vo);
	int delete(String adminId);
}
