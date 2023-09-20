package kh.project.dml.suplement.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.suplement.model.dao.FpSuplementDao;
import kh.project.dml.suplement.model.vo.FpSuplementVo;


@Service("fpSuplementServiceImpl")
public class FpSuplementServiceImpl implements FpSuplementService {

	@Autowired
	private FpSuplementDao fpSuplementDao;
	
	@Override
	public List<FpSuplementVo> selectList()  {
		return fpSuplementDao.selectList();
	}
	@Override
	public FpSuplementVo selectOne(int suplemenno)  {
		return fpSuplementDao.selectOne(suplemenno);
	}
	@Override
	public int insert(FpSuplementVo vo)  {
		return fpSuplementDao.insert(vo);
	}
	@Override
	public int update(FpSuplementVo vo) {
		return fpSuplementDao.update(vo);
	}
	@Override
	public int delete(int suplemenno)  {
		return fpSuplementDao.delete(suplemenno);
	}
}
