package kh.project.dml.diet.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.diet.model.vo.FpDietVo;
import kh.project.dml.diet.model.vo.FpDietVo;

@Repository
public class FpDietDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpDietVo> selectList()  {
		return sqlSession.selectList("diet.selectList");
	}
	public List<FpDietVo> selectDayList(String mealCode)  {
		return sqlSession.selectList("diet.selectDayList", mealCode);
	}
	
	public FpDietVo selectOne(String mealCode) {
		return sqlSession.selectOne("diet.selectOne", mealCode);
	}
	public int insert(FpDietVo vo)  {
		return sqlSession.insert("diet.insert", vo);
	}
	public int update(FpDietVo vo)  {
		return sqlSession.update("diet.update", vo);
	}
	public int delete(String foodCd) {
		return sqlSession.delete("diet.delete", foodCd);
	}
}
