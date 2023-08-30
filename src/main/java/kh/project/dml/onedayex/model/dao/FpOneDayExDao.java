package kh.project.dml.onedayex.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.onedayex.model.Vo.FpOneDayExVo;

@Repository("FpOneDayExVo")
public class FpOneDayExDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FpOneDayExVo> selectList()  {
		return sqlSession.selectList("onedayex.selectList");
	}
	public FpOneDayExVo selectOne(int exerciesId) {
		return sqlSession.selectOne("onedayex.selectOne", exerciesId);
	}
	public int insert(FpOneDayExVo vo)  {
		return sqlSession.insert("onedayex.insert", vo);
	}
	public int update(FpOneDayExVo vo)  {
		return sqlSession.update("onedayex.update", vo);
	}
	public int delete(int exerciesId) {
		return sqlSession.delete("onedayex.delete",  exerciesId);
	}
}
