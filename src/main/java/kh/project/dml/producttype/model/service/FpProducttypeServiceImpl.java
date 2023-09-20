package kh.project.dml.producttype.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.producttype.model.dao.FpProducttypeDao;
import kh.project.dml.producttype.model.vo.FpProducttypeVo;

@Service("fpProducttypeServiceImpl")
public class FpProducttypeServiceImpl implements FpProducttypeService {

	@Autowired
	private FpProducttypeDao fpProducttypeDao;
	
	@Override
	public List<FpProducttypeVo> selectList()  {
		return fpProducttypeDao.selectList();
	}
	@Override
	public FpProducttypeVo selectOne(String type)  {
		return fpProducttypeDao.selectOne(type);
	}
	@Override
	public int insert(FpProducttypeVo vo)  {
		return fpProducttypeDao.insert(vo);
	}
	@Override
	public int update(FpProducttypeVo vo) {
		return fpProducttypeDao.update(vo);
	}
	@Override
	public int delete(String type)  {
		return fpProducttypeDao.delete(type);
	}
}
