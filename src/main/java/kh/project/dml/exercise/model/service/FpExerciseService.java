package kh.project.dml.exercise.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.exercise.model.dao.FpExerciseDao;
import kh.project.dml.exercise.model.vo.FpExerciseVo;


public interface FpExerciseService {
	
	
	
	public List<FpExerciseVo> selectList();

	public List<FpExerciseVo> selectSearchList(String searchWord);

	public FpExerciseVo selectOne(int ecode);
	public int insert(FpExerciseVo vo);
	public int update(FpExerciseVo vo);
	public int delete(int ecode);
}
