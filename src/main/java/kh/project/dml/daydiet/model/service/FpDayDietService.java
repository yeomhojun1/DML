package kh.project.dml.daydiet.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.daydiet.model.dao.FpDayDietDao;
import kh.project.dml.daydiet.model.vo.FpDayDietVo;



@Service
public class FpDayDietService {
	@Autowired
	private FpDayDietDao fpDayDietDao;
	
	public List<FpDayDietVo> selectList()  {
		return fpDayDietDao.selectList();
	}
	public FpDayDietVo selectOne(String foodDate)  {
		return fpDayDietDao.selectOne(foodDate);
	}
	public int insert(FpDayDietVo vo)  {
		return fpDayDietDao.insert(vo);
	}
	public int update(FpDayDietVo vo) {
		return fpDayDietDao.update(vo);
	}
	public int delete(String foodDate)  {
		return fpDayDietDao.delete(foodDate);
	}
}
