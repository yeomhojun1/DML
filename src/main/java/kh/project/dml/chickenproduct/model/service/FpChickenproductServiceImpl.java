package kh.project.dml.chickenproduct.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.chickenproduct.model.dao.FpChickenproductDao;
import kh.project.dml.chickenproduct.model.vo.FpChickenproductVo;

@Service("fpChickenproductServiceImpl")
public class FpChickenproductServiceImpl implements FpChickenproductService  {

	@Autowired
	private FpChickenproductDao fpChickenproductDao;
	
	@Override
	public List<FpChickenproductVo> selectList()  {
		return fpChickenproductDao.selectList();
	}
	@Override
	public FpChickenproductVo selectOne(int chickenNo)  {
		return fpChickenproductDao.selectOne(chickenNo);
	}
	@Override
	public int insert(FpChickenproductVo vo)  {
		return fpChickenproductDao.insert(vo);
	}
	@Override
	public int update(FpChickenproductVo vo) {
		return fpChickenproductDao.update(vo);
	}
	@Override
	public int delete(int chickenNo)  {
		return fpChickenproductDao.delete(chickenNo);
	}
}
