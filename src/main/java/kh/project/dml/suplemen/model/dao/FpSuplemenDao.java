package kh.project.dml.suplemen.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.suplemen.model.vo.FpSuplemenVo;

@Repository
public class FpSuplemenDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpSuplemenVo> selectList()  {
		return sqlSession.selectList("suplemen.selectList");
	}
	public FpSuplemenVo selectOne(int suplemenno) {
		return sqlSession.selectOne("suplemen.selectOne", suplemenno);
	}
	public int insert(FpSuplemenVo vo)  {
		return sqlSession.insert("suplemen.insert", vo);
	}
	public int update(FpSuplemenVo vo)  {
		return sqlSession.update("suplemen.update", vo);
	}
	public int delete(int suplemenno) {
		return sqlSession.delete("suplemen.delete",  suplemenno);
	}
}
