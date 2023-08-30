package kh.project.dml.diet.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.diet.model.vo.FpDietVo;




@Repository("FpDietVo")
public class FdDietDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpDietVo> selectList()  {
		return sqlSession.selectList("diet.selectList");
	}
	public FpDietVo selectOne(String mid) {
		return sqlSession.selectOne("diet.selectOne", mid);
	}
	public int insert(FpDietVo vo)  {
		return sqlSession.insert("diet.insert", vo);
	}
	public int update(FpDietVo vo)  {
		return sqlSession.update("diet.update", vo);
	}
	public int delete(String mid) {
		return sqlSession.delete("diet.delete",  mid);
	}
}
