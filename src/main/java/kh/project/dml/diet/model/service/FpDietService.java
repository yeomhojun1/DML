package kh.project.dml.diet.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.diet.model.dao.FpDietDao;
import kh.project.dml.diet.model.vo.FpDietVo;




public interface FpDietService {

	
	
	public List<FpDietVo> selectList();
	public FpDietVo selectOne(String mealCode);
	public int insert(FpDietVo vo);
	public int update(FpDietVo vo);
	public int delete(String mealCode);
	
}
