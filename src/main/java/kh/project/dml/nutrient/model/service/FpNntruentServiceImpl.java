package kh.project.dml.nutrient.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.nutrient.model.dao.FpNntruentDao;
import kh.project.dml.nutrient.model.vo.FpNntruentVo;


@Service("fpNntruentServiceImpl")
public class FpNntruentServiceImpl implements FpNntruentService {

	@Autowired
	private FpNntruentDao fpNntruentDao;
	
	@Override
	public List<FpNntruentVo> selectList()  {
		return fpNntruentDao.selectList();
	}
	@Override
	public FpNntruentVo selectOne(int nutrientId)  {
		return fpNntruentDao.selectOne(nutrientId);
	}
	@Override
	public int insert(FpNntruentVo vo)  {
		return fpNntruentDao.insert(vo);
	}
	@Override
	public int update(FpNntruentVo vo) {
		return fpNntruentDao.update(vo);
	}
	@Override
	public int delete(int nutrientId)  {
		return fpNntruentDao.delete(nutrientId);
	}
}
