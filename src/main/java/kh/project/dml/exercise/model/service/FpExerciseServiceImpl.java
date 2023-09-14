package kh.project.dml.exercise.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.exercise.model.dao.FpExerciseDao;
import kh.project.dml.exercise.model.vo.FpExerciseVo;

@Service("fpExerciseServiceImpl")
public class FpExerciseServiceImpl implements FpExerciseService  {
	
	@Autowired
	private FpExerciseDao fpExerciseDao;
	
	@Override
	public List<FpExerciseVo> selectList() {
		return fpExerciseDao.selectList();
	}
	
	@Override
	public List<FpExerciseVo> selectSearchList(String searchWord) {
		return fpExerciseDao.selectSearchList(searchWord);
	}
	
	@Override
	public FpExerciseVo selectOne(int ecode) {
		return fpExerciseDao.selectOne(ecode);
	}
	@Override
	public int insert(FpExerciseVo vo) {
		return fpExerciseDao.insert(vo);
	}
	@Override
	public int update(FpExerciseVo vo) {
		return fpExerciseDao.update(vo);
	}
	@Override
	public int delete(int ecode) {
		return fpExerciseDao.delete(ecode);
	}
}
