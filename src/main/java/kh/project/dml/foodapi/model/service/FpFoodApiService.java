package kh.project.dml.foodapi.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.foodapi.model.dao.FdFoodApiDao;
import kh.project.dml.foodapi.model.vo.FpFoodApiVo;
import kh.project.dml.memberexset.model.dao.FpMemberExSetDao;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;

@Service
public class FpFoodApiService {


	@Autowired
	private FdFoodApiDao fdFoodApiDao;
	
	public List<FpFoodApiVo> selectList()  {
		return fdFoodApiDao.selectList();
	}
	public FpFoodApiVo selectOne(int foodCd)  {
		return fdFoodApiDao.selectOne(foodCd);
	}
	public int insert(FpFoodApiVo vo)  {
		return fdFoodApiDao.insert(vo);
	}
	public int update(FpFoodApiVo vo) {
		return fdFoodApiDao.update(vo);
	}
	public int delete(int foodCd)  {
		return fdFoodApiDao.delete(foodCd);
	}
}
