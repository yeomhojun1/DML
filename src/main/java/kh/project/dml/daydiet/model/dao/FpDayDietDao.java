package kh.project.dml.daydiet.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.daydiet.model.vo.FpDayDietVo;



@Repository("fpDayDietDao")
public class FpDayDietDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FpDayDietVo> selectList()  {
		return sqlSession.selectList("daydiet.selectList");
	}
	public FpDayDietVo selectOne(int dayDietKey) {
		return sqlSession.selectOne("daydiet.selectOne", dayDietKey);
	}
	public int insert(FpDayDietVo vo)  {
		return sqlSession.insert("daydiet.insert", vo);
	}
	public int update(FpDayDietVo vo)  {
		return sqlSession.update("daydiet.update", vo);
	}
	public int delete(int dayDietKey) {
		return sqlSession.delete("daydiet.delete",  dayDietKey);
	}
}
