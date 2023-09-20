package kh.project.dml.nutrient.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.nutrient.model.dao.FpNutrientDao;
import kh.project.dml.nutrient.model.vo.FpNutrientVo;


@Service("fpNutrientService")
public class FpNutrientServiceImpl implements FpNutrientService {

	@Autowired
	private FpNutrientDao fpNutrientDao;
	
	@Override
	public List<FpNutrientVo> selectList()  {
		return fpNutrientDao.selectList();
	}
	@Override
	public FpNutrientVo selectOne(int nutrientId)  {
		return fpNutrientDao.selectOne(nutrientId);
	}
	@Override
	public int insert(FpNutrientVo vo)  {
		return fpNutrientDao.insert(vo);
	}
	@Override
	public int update(FpNutrientVo vo) {
		return fpNutrientDao.update(vo);
	}
	@Override
	public int delete(int nutrientId)  {
		return fpNutrientDao.delete(nutrientId);
	}
}
