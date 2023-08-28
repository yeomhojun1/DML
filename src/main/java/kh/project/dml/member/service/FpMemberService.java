package kh.project.dml.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.project.dml.member.dao.FpMemberDao;
import kh.project.dml.member.vo.FpMemberVo;

@Service
public class FpMemberService {
	
	@Autowired
	private FpMemberDao fpMemberDao;
	
	public List<FpMemberVo> selectList()  {
		return fpMemberDao.selectList();
	}
	public FpMemberVo selectOne(String mid)  {
		return fpMemberDao.selectOne(mid);
	}
	public int insert(FpMemberVo vo)  {
		return fpMemberDao.insert(vo);
	}
	@Transactional
	public int update(FpMemberVo vo) {
		return fpMemberDao.update(vo);
		
	}
	public int delete(String mid)  {
		return fpMemberDao.delete(mid);
	}
}
