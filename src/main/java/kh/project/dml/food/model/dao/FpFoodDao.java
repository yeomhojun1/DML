package kh.project.dml.food.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.food.model.vo.FpFoodVo;

@Repository("FpFoodVo")
public class FpFoodDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpFoodVo> selectList()  {
		return sqlSession.selectList("food.selectList");
	}
	public FpFoodVo selectOne(String foodCd) {
		return sqlSession.selectOne("food.selectOne", foodCd);
	}
	public int insert(FpFoodVo vo)  {
		return sqlSession.insert("food.insert", vo);
	}
	public int update(FpFoodVo vo)  {
		return sqlSession.update("food.update", vo);
	}
	public int delete(String foodCd) {
		return sqlSession.delete("food.delete", foodCd);
	}

}
