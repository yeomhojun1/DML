package kh.project.dml.food.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.food.model.dao.FpFoodDao;
import kh.project.dml.food.model.vo.FpFoodVo;


public interface FpFoodService {
	
	
	public List<FpFoodVo> selectList();
	public FpFoodVo selectOne(String foodCd);
	public int insert(FpFoodVo vo);
	public int update(FpFoodVo vo);
	public int delete(String foodCd);
}
