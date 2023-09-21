package kh.project.dml.nutrient.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.diet.model.vo.FpDietVo;
import kh.project.dml.nutrient.model.vo.FpNutrientVo;

@Repository
public class FpNutrientDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FpNutrientVo> selectList(int workmanship)  {
		return sqlSession.selectList("nutrient.selectList",workmanship);
	}
	public FpNutrientVo selectOne(int nutrientId) {
		return sqlSession.selectOne("nutrient.selectOne", nutrientId);
	}
	public int insert(FpNutrientVo vo)  {
		return sqlSession.insert("nutrient.insert", vo);
	}
	public int update(FpNutrientVo vo)  {
		return sqlSession.update("nutrient.update", vo);
	}
	public int delete(int nutrientId) {
		return sqlSession.delete("nutrient.delete",  nutrientId);
	}
	
}
