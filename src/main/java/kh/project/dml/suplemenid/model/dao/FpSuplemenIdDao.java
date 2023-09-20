package kh.project.dml.suplemenid.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.suplemenid.model.vo.FpSuplemenIdVo;

@Repository
public class FpSuplemenIdDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpSuplemenIdVo> selectList()  {
		return sqlSession.selectList("suplemenid.selectList");
	}
	public FpSuplemenIdVo selectOne(int suplemenno) {
		return sqlSession.selectOne("suplemenid.selectOne", suplemenno);
	}
	public int insert(FpSuplemenIdVo vo)  {
		return sqlSession.insert("suplemenid.insert", vo);
	}
	public int update(FpSuplemenIdVo vo)  {
		return sqlSession.update("suplemenid.update", vo);
	}
	public int delete(int suplemenno) {
		return sqlSession.delete("suplemenid.delete",  suplemenno);
	}
}
