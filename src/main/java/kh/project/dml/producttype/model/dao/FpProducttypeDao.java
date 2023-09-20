package kh.project.dml.producttype.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.producttype.model.vo.FpProducttypeVo;
import kh.project.dml.suplemen.model.vo.FpSuplemenVo;

@Repository
public class FpProducttypeDao {


	@Autowired
	private SqlSession sqlSession;
	
	public List<FpProducttypeVo> selectList()  {
		return sqlSession.selectList("producttype.selectList");
	}
	public FpProducttypeVo selectOne(String type) {
		return sqlSession.selectOne("producttype.selectOne", type);
	}
	public int insert(FpProducttypeVo vo)  {
		return sqlSession.insert("producttype.insert", vo);
	}
	public int update(FpProducttypeVo vo)  {
		return sqlSession.update("producttype.update", vo);
	}
	public int delete(String type) {
		return sqlSession.delete("producttype.delete",  type);
	}
}
