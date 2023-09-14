package kh.project.dml.memberexset.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.project.dml.memberexset.model.dao.FpMemberExSetDao;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;


public interface FpMemberExSetService {

	
	
	public List<FpMemberExSetVo> selectList();
	public FpMemberExSetVo selectOne(String memberId);
	public int insert(FpMemberExSetVo vo);
	public int update(FpMemberExSetVo vo);
	public int delete(String memberId);
}
