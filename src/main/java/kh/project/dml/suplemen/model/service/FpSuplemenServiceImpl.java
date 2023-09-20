package kh.project.dml.suplemen.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.suplemen.model.dao.FpSuplemenDao;
import kh.project.dml.suplemen.model.vo.FpSuplemenVo;


@Service("fpSuplemenServiceImpl")
public class FpSuplemenServiceImpl implements FpSuplemenService {

	@Autowired
	private FpSuplemenDao fpSuplemenDao;
	
	@Override
	public List<FpSuplemenVo> selectList()  {
		return fpSuplemenDao.selectList();
	}
	@Override
	public FpSuplemenVo selectOne(int suplemenno)  {
		return fpSuplemenDao.selectOne(suplemenno);
	}
	@Override
	public int insert(FpSuplemenVo vo)  {
		return fpSuplemenDao.insert(vo);
	}
	@Override
	public int update(FpSuplemenVo vo) {
		return fpSuplemenDao.update(vo);
	}
	@Override
	public int delete(int suplemenno)  {
		return fpSuplemenDao.delete(suplemenno);
	}
}
