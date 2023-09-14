package kh.project.dml.food.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.food.model.dao.FpFoodDao;
import kh.project.dml.food.model.vo.FpFoodVo;

@Service("fpFoodServiceImpl")
public class FpFoodServiceImpl implements FpFoodService  {
	@Autowired
	private FpFoodDao fpFoodDao;
	
	@Override
	public List<FpFoodVo> selectList()  {
		return fpFoodDao.selectList();
	}
	@Override
	public FpFoodVo selectOne(String foodCd)  {
		return fpFoodDao.selectOne(foodCd);
	}
	@Override
	public int insert(FpFoodVo vo)  {
		return fpFoodDao.insert(vo);
	}
	@Override
	public int update(FpFoodVo vo) {
		return fpFoodDao.update(vo);
	}
	@Override
	public int delete(String foodCd)  {
		return fpFoodDao.delete(foodCd);
	}
}
