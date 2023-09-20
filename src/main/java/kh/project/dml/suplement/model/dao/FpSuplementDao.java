package kh.project.dml.suplement.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.suplement.model.vo.FpSuplementVo;

@Repository
public class FpSuplementDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpSuplementVo> selectList()  {
		return sqlSession.selectList("suplement.selectList");
	}
	public FpSuplementVo selectOne(int suplemenno) {
		return sqlSession.selectOne("suplement.selectOne", suplemenno);
	}
	public int insert(FpSuplementVo vo)  {
		return sqlSession.insert("suplement.insert", vo);
	}
	public int update(FpSuplementVo vo)  {
		return sqlSession.update("suplement.update", vo);
	}
	public int delete(int suplemenno) {
		return sqlSession.delete("suplement.delete",  suplemenno);
	}
}
