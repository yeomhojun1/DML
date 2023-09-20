package kh.project.dml.suplemenid.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.suplemenid.model.dao.FpSuplemenIdDao;
import kh.project.dml.suplemenid.model.vo.FpSuplemenIdVo;


@Service("fpSuplemenServiceImpl")
public class FpSuplemenIdServiceImpl implements FpSuplemenIdService {

	@Autowired
	private FpSuplemenIdDao fpSuplemenIdDao;
	
	@Override
	public List<FpSuplemenIdVo> selectList()  {
		return fpSuplemenIdDao.selectList();
	}
	@Override
	public FpSuplemenIdVo selectOne(int suplemenno)  {
		return fpSuplemenIdDao.selectOne(suplemenno);
	}
	@Override
	public int insert(FpSuplemenIdVo vo)  {
		return fpSuplemenIdDao.insert(vo);
	}
	@Override
	public int update(FpSuplemenIdVo vo) {
		return fpSuplemenIdDao.update(vo);
	}
	@Override
	public int delete(int suplemenno)  {
		return fpSuplemenIdDao.delete(suplemenno);
	}
}
