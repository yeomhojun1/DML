package kh.project.dml.diet.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.diet.model.dao.FpDietDao;
import kh.project.dml.diet.model.vo.FpDietVo;
import kh.project.dml.diet.model.vo.TotalFoodListDTO;

@Service("fpDietServiceImpl")
public class FpDietServiceImpl implements FpDietService {

	@Autowired
	private FpDietDao fpDietDao;

	@Override
	public List<FpDietVo> selectList(FpDietVo dietVo) {
		return fpDietDao.selectList(dietVo);
	}

	@Override
	public List<FpDietVo> selectDayList(String mealCode) {
		return fpDietDao.selectDayList(mealCode);
	}


	@Override
	public FpDietVo selectOne(String mealCode) {
		return fpDietDao.selectOne(mealCode);
	}

	@Override
	public int insert(FpDietVo vo)  {
		return fpDietDao.insert(vo);
	}

	@Override
	public int update(FpDietVo vo) {
		return fpDietDao.update(vo);
	}

	@Override
	public int delete(FpDietVo FpDietVo) {
		return fpDietDao.delete(FpDietVo);
	}

	@Override
	public TotalFoodListDTO TotalSelectList(FpDietVo dietVo) {
	
		return fpDietDao.totalSelectList(dietVo);
	}



	
}
