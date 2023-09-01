package kh.project.dml.food.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.food.model.dao.FpFoodDao;
import kh.project.dml.food.model.vo.FpFoodVo;

@Service
public class FpFoodService {
	@Autowired
	private FpFoodDao fpFoodDao;
	
	public List<FpFoodVo> selectList()  {
		return fpFoodDao.selectList();
	}
	public FpFoodVo selectOne(String foodCd)  {
		return fpFoodDao.selectOne(foodCd);
	}
	public int insert(FpFoodVo vo)  {
		return fpFoodDao.insert(vo);
	}
	public int update(FpFoodVo vo) {
		return fpFoodDao.update(vo);
	}
	public int delete(String foodCd)  {
		return fpFoodDao.delete(foodCd);
	}
}
