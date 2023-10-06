package kh.project.dml.foodapi.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.foodapi.model.dao.FpFoodApiDao;
import kh.project.dml.foodapi.model.vo.FpFoodApiVo;
import kh.project.dml.memberexset.model.dao.FpMemberExSetDao;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;

@Service("fpFoodApiServiceImpl")
public class FpFoodApiServiceImpl implements FpFoodApiService{


	@Autowired
	private FpFoodApiDao fpFoodApiDao;
	
	@Override
	public List<FpFoodApiVo> selectList()  {
		return fpFoodApiDao.selectList();
	}
	@Override
	public FpFoodApiVo selectOne(String foodCd)  {
		return fpFoodApiDao.selectOne(foodCd);
	}
	@Override
	public List<FpFoodApiVo> getSearchList(FpFoodApiVo fpFoodApiVo) {
		return fpFoodApiDao.selectSearchList(fpFoodApiVo);
	}
	@Override
	public int insert(FpFoodApiVo vo)  {
		return fpFoodApiDao.insert(vo);
	}
	@Override
	public int update(FpFoodApiVo vo) {
		return fpFoodApiDao.update(vo);
	}
	@Override
	public int delete(String foodCd)  {
		return fpFoodApiDao.delete(foodCd);
	}
}
