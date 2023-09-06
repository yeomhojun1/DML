package kh.project.dml.calender.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.calender.model.vo.FpCalenderVo;
import kh.project.dml.exercise.model.vo.FpExerciseVo;

@Repository
public class FpCalenderDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FpCalenderVo> selectList() {
		return sqlSession.selectList("calender.selectList");
	}
	public List<FpCalenderVo> selectSearchList(int calendarno) {
		return sqlSession.selectList("calender.selectSearchList", calendarno);
	}
	public FpCalenderVo selectOne(int calendarno) {
		return sqlSession.selectOne("calender.selectOne", calendarno);
	}
	public int insert(FpCalenderVo vo) {
		return sqlSession.insert("calender.insert", vo);
	}
	public int update(FpCalenderVo vo) {
		return sqlSession.update("calender.update", vo);
	}
	public int delete(int calendarno) {
		return sqlSession.delete("calender.delete", calendarno);
	}
}
