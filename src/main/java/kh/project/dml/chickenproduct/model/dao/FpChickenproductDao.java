package kh.project.dml.chickenproduct.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.chickenproduct.model.vo.FpChickenproductVo;


@Repository
public class FpChickenproductDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FpChickenproductVo> selectList()  {
		return sqlSession.selectList("chickenproduct.selectList");
	}
	public FpChickenproductVo selectOne(int chickenNo) {
		return sqlSession.selectOne("chickenproduct.selectOne", chickenNo);
	}
	public int insert(FpChickenproductVo vo)  {
		return sqlSession.insert("chickenproduct.insert", vo);
	}
	public int update(FpChickenproductVo vo)  {
		return sqlSession.update("chickenproduct.update", vo);
	}
	public int delete(int chickenNo) {
		return sqlSession.delete("chickenproduct.delete",  chickenNo);
	}
}
