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
	
	public List<FpMemberVo> selectList() throws Exception {
		List<FpMemberVo> result = fpMemberDao.selectList();
		return result;
	}
	public FpMemberVo selectOne(String mid) throws Exception {
		return fpMemberDao.selectOne(mid);
	}
	public int insert(FpMemberVo vo)  throws Exception {
		fpMemberDao.insert(vo);
		return fpMemberDao.insert(vo);
	}
	@Transactional
	public int insertReply(FpMemberVo vo)  throws Exception {
		fpMemberDao.insert(vo);
		return fpMemberDao.insert(vo);
	}
	public int update(FpMemberVo vo)  throws Exception {
		return fpMemberDao.update(vo);
		
	}
	public int delete(String mid)  throws Exception {
		return fpMemberDao.delete(mid);
	}
}
