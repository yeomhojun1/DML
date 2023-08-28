package kh.project.dml.diet.model.service;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.project.dml.diet.model.dao.FpDietDao;
import kh.project.dml.diet.model.vo.FpDietVo;

@Service
public class FpDietService {

	
	
	@Autowired
	private FpDietDao FpDietDao;
	
	public List<FpDietVo> selectList()  {
		return FpDietDao.selectList();
	}
	public FpDietVo selectOne(String mid)  {
		return FpDietDao.selectOne(mid);
	}
	public int insert(FpDietVo vo)  {
		return FpDietDao.insert(vo);
	}
	@Transactional
	public int update(FpDietVo vo) {
		return FpDietDao.update(vo);
		
	}
	public int delete(String mid)  {
		return FpDietDao.delete(mid);
	}
	
}
