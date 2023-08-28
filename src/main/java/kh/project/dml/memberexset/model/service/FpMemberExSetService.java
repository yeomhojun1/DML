package kh.project.dml.memberexset.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.project.dml.memberexset.model.dao.FpMemberExSetDao;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;

@Service
public class FpMemberExSetService {

	@Autowired
	private FpMemberExSetDao fpMemberExSetDao;
	
	public List<FpMemberExSetVo> selectList()  {
		return fpMemberExSetDao.selectList();
	}
	public FpMemberExSetVo selectOne(String mid)  {
		return fpMemberExSetDao.selectOne(mid);
	}
	public int insert(FpMemberExSetVo vo)  {
		return fpMemberExSetDao.insert(vo);
	}
	public int update(FpMemberExSetVo vo) {
		return fpMemberExSetDao.update(vo);
	}
	public int delete(String mid)  {
		return fpMemberExSetDao.delete(mid);
	}
}
