package kh.project.dml.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.admin.model.vo.FpAdminVo;

@Repository
public class FpAdminDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpAdminVo> selectList() {
		return sqlSession.selectList("admin.selectList"); 
	}
	public FpAdminVo selectOne(String adminId) {
		return sqlSession.selectOne("admin.selectOne", adminId);
	}
	public int insert(FpAdminVo vo) {
		return sqlSession.insert("admin.insert", vo);
	}
	public int update(FpAdminVo vo) {
		return sqlSession.update("admin.update", vo);
	}
	public int delete(String adminId) {
		return sqlSession.delete("admin.delete", adminId);
	}
 }
