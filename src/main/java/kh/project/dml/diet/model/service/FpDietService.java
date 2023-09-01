package kh.project.dml.diet.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.diet.model.dao.FpDietDao;
import kh.project.dml.diet.model.vo.FpDietVo;



@Service
public class FpDietService {

	@Autowired
	private FpDietDao fdDietDao;
	
	public List<FpDietVo> selectList()  {
		return fdDietDao.selectList();
	}
	public FpDietVo selectOne(String mealCode)  {
		return fdDietDao.selectOne(mealCode);
	}
	public int insert(FpDietVo vo)  {
		return fdDietDao.insert(vo);
	}
	public int update(FpDietVo vo) {
		return fdDietDao.update(vo);
	}
	public int delete(String mealCode)  {
		return fdDietDao.delete(mealCode);
	}
	
}
