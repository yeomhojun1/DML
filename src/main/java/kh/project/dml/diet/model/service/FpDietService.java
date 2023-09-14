package kh.project.dml.diet.model.service;

import java.util.List;

import kh.project.dml.diet.model.vo.FpDietVo;

public interface FpDietService {

	public List<FpDietVo> selectList();

	public FpDietVo selectOne(String mealCode);

	public int insert(FpDietVo vo);

	public int update(FpDietVo vo);

	public int delete(String mealCode);

}
