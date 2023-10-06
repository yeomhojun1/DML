package kh.project.dml.diet.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.diet.model.vo.FpDietVo;
import kh.project.dml.diet.model.vo.TotalFoodListDTO;
import kh.project.dml.diet.model.vo.FpDietVo;

@Repository
public class FpDietDao {
	@Autowired
	private SqlSession sqlSession;

	public TotalFoodListDTO totalSelectList(FpDietVo dietVo) {
		return sqlSession.selectOne("diet.totalSelectList", dietVo);
	}

	public List<FpDietVo> selectList(FpDietVo dietVo) {
		return sqlSession.selectList("diet.selectList", dietVo);
	}

	public List<FpDietVo> selectDayList(String mealCode) {
		return sqlSession.selectList("diet.selectDayList", mealCode);
	}

	public List<FpDietVo> selectSearchList(FpDietVo fpDietVo) {
		return sqlSession.selectList("diet.selectSearchList", fpDietVo);
	}

	public FpDietVo selectOne(String mealCode) {
		return sqlSession.selectOne("diet.selectOne", mealCode);
	}

	public int insert(FpDietVo vo) {
		return sqlSession.insert("diet.insert", vo);
	}

	public int update(FpDietVo vo) {
		return sqlSession.update("diet.update", vo);
	}

	public int delete(FpDietVo FpDietVo) {
		return sqlSession.delete("diet.delete", FpDietVo);
	}
}
