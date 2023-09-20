package kh.project.dml.nutrient.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.nutrient.model.dao.FpNutrientDao;
import kh.project.dml.nutrient.model.vo.FpNutrientVo;



public interface FpNutrientService {

	
	
	
	public List<FpNutrientVo> selectList();
	
	public FpNutrientVo selectOne(int nutrientId);
	
	public int insert(FpNutrientVo vo);
	
	public int update(FpNutrientVo vo);
	
	public int delete(int nutrientId);
}
