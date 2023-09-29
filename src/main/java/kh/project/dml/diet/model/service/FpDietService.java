package kh.project.dml.diet.model.service;

import java.util.List;

import kh.project.dml.diet.model.vo.FpDietVo;

public interface FpDietService {

	public List<FpDietVo> selectList(FpDietVo dietVo);

	public List<FpDietVo> selectDayList(String mealCode);

	public FpDietVo selectOne(String mealCode);

	public int insert(FpDietVo vo);

	public int update(FpDietVo vo);

	public int delete(String foodCd);

}
