package kh.project.dml.daydiet.model.service;

import java.util.List;

import kh.project.dml.daydiet.model.vo.FpDayDietVo;

public interface FpDayDietService {

	public List<FpDayDietVo> selectList();

	public FpDayDietVo selectOne(String dayDietCode);

	public int insert(FpDayDietVo vo);

	public int update(FpDayDietVo vo);

	public int delete(String dayDietCode);
}
