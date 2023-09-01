package kh.project.dml.foodapi.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.foodapi.model.vo.FpFoodApiVo;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;

@Repository("FpFoodApiVo")
public class FpFoodApiDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FpFoodApiVo> selectList()  {
		return sqlSession.selectList("foodapi.selectList");
	}
	public FpFoodApiVo selectOne(String foodCd) {
		return sqlSession.selectOne("foodapi.selectOne", foodCd);
	}
	public int insert(FpFoodApiVo vo)  {
		return sqlSession.insert("foodapi.insert", vo);
	}
	public int update(FpFoodApiVo vo)  {
		return sqlSession.update("foodapi.update", vo);
	}
	public int delete(String foodCd) {
		return sqlSession.delete("foodapi.delete",  foodCd);
	}
	
}
