package kh.project.dml.exercise.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.exercise.model.dao.FpExerciseDao;
import kh.project.dml.exercise.model.vo.FpExerciseVo;

@Service
public class FpExerciseService {
	
	@Autowired
	private FpExerciseDao fpExerciseDao;
	
	public List<FpExerciseVo> selectList() {
		return fpExerciseDao.selectList();
	}public List<FpExerciseVo> selectSearchList(String searchWord) {
		return fpExerciseDao.selectSearchList(searchWord);
	}
	public FpExerciseVo selectOne(int ecode) {
		return fpExerciseDao.selectOne(ecode);
	}
	public int insert(FpExerciseVo vo) {
		return fpExerciseDao.insert(vo);
	}
	public int update(FpExerciseVo vo) {
		return fpExerciseDao.update(vo);
	}
	public int delete(int ecode) {
		return fpExerciseDao.delete(ecode);
	}
}
