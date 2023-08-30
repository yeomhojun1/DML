package kh.project.dml.onedayex.model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.onedayex.model.Vo.FpOneDayExVo;
import kh.project.dml.onedayex.model.dao.FpOneDayExDao;

@Service
public class FpOneDayExService {
	@Autowired
	private FpOneDayExDao fpOneDayExDao;
	
	public List<FpOneDayExVo> selectList()  {
		return fpOneDayExDao.selectList();
	}
	public FpOneDayExVo selectOne(int exerciesId)  {
		return fpOneDayExDao.selectOne(exerciesId);
	}
	public int insert(FpOneDayExVo vo)  {
		return fpOneDayExDao.insert(vo);
	}
	public int update(FpOneDayExVo vo) {
		return fpOneDayExDao.update(vo);
	}
	public int delete(int exerciesId)  {
		return fpOneDayExDao.delete(exerciesId);
	}
}
