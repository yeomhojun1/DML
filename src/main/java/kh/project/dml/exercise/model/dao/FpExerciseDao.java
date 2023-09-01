package kh.project.dml.exercise.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.exercise.model.vo.FpExerciseVo;

@Repository("fpExerciseDao")
public class FpExerciseDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpExerciseVo> selectList() {
		return sqlSession.selectList("exercise.selectList");
	}
	public List<FpExerciseVo> selectSearchList(String searchWord) {
		return sqlSession.selectList("exercise.selectSearchList", searchWord);
	}
	public FpExerciseVo selectOne(String ecode) {
		return sqlSession.selectOne("exercise.selectOne", ecode);
	}
	public int insert(FpExerciseVo vo) {
		return sqlSession.insert("exercise.insert", vo);
	}
	public int update(FpExerciseVo vo) {
		return sqlSession.update("exercise.update", vo);
	}
	public int delete(String ecode) {
		return sqlSession.delete("exercise.delete", ecode);
	}
}
