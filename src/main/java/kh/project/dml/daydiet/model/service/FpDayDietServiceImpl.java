package kh.project.dml.daydiet.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.daydiet.model.dao.FpDayDietDao;
import kh.project.dml.daydiet.model.vo.FpDayDietVo;



@Service("fpDayDietServiceImpl")
public class FpDayDietServiceImpl implements FpDayDietService {
	
	@Autowired
	private FpDayDietDao fpDayDietDao;
	
	@Override
	public List<FpDayDietVo> selectList()  {
		return fpDayDietDao.selectList();
	}
	@Override
	public FpDayDietVo selectOne(String dayDietCode)  {
		return fpDayDietDao.selectOne(dayDietCode);
	}
	@Override
	public int insert(FpDayDietVo vo)  {
		return fpDayDietDao.insert(vo);
	}
	@Override
	public int update(FpDayDietVo vo) {
		return fpDayDietDao.update(vo);
	}
	@Override
	public int delete(String dayDietCode)  {
		return fpDayDietDao.delete(dayDietCode);
	}
}
