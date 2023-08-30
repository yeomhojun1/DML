package kh.project.dml.diet.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.diet.model.dao.FdDietDao;
import kh.project.dml.diet.model.vo.FpDietVo;

@Service
public class FpDietService {

	@Autowired
	private FdDietDao fdDietDao;
	
	public List<FpDietVo> selectList()  {
		return fdDietDao.selectList();
	}
	public FpDietVo selectOne(String mid)  {
		return fdDietDao.selectOne(mid);
	}
	public int insert(FpDietVo vo)  {
		return fdDietDao.insert(vo);
	}
	public int update(FpDietVo vo) {
		return fdDietDao.update(vo);
	}
	public int delete(String mid)  {
		return fdDietDao.delete(mid);
	}
	
}
