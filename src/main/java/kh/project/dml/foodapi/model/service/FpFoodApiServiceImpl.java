package kh.project.dml.foodapi.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.foodapi.model.dao.FpFoodApiDao;
import kh.project.dml.foodapi.model.vo.FpFoodApiVo;
import kh.project.dml.memberexset.model.dao.FpMemberExSetDao;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;

@Service
public class FpFoodApiServiceImpl implements FpFoodApiService{


	@Autowired
	private FpFoodApiDao fdFoodApiDao;
	
	@Override
	public List<FpFoodApiVo> selectList()  {
		return fdFoodApiDao.selectList();
	}
	@Override
	public FpFoodApiVo selectOne(String foodCd)  {
		return fdFoodApiDao.selectOne(foodCd);
	}
	@Override
	public int insert(FpFoodApiVo vo)  {
		return fdFoodApiDao.insert(vo);
	}
	@Override
	public int update(FpFoodApiVo vo) {
		return fdFoodApiDao.update(vo);
	}
	@Override
	public int delete(String foodCd)  {
		return fdFoodApiDao.delete(foodCd);
	}
}
