package kh.project.dml.nutrient.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.diet.model.vo.FpDietVo;
import kh.project.dml.nutrient.model.vo.FpNntruentVo;

@Repository
public class FpNntruentDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FpNntruentVo> selectList()  {
		return sqlSession.selectList("nutruent.selectList");
	}
	public FpNntruentVo selectOne(int nutrientId) {
		return sqlSession.selectOne("nutruent.selectOne", nutrientId);
	}
	public int insert(FpNntruentVo vo)  {
		return sqlSession.insert("nutruent.insert", vo);
	}
	public int update(FpNntruentVo vo)  {
		return sqlSession.update("nutruent.update", vo);
	}
	public int delete(int nutrientId) {
		return sqlSession.delete("nutruent.delete",  nutrientId);
	}
	
}
