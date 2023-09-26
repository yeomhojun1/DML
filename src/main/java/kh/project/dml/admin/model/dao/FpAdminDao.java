package kh.project.dml.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.admin.model.vo.FpAdminVo;
import kh.project.dml.common.vo.Criteria;

@Repository
public class FpAdminDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FpAdminVo> memberList(Criteria cri) {
		return sqlSession.selectList("admin.memberList", cri);
	}
	
	public List<FpAdminVo> suspendedList(Criteria cri) {
		return sqlSession.selectList("admin.suspendedList", cri);
	}
	
	public List<FpAdminVo> adminList(Criteria cri) {
		return sqlSession.selectList("admin.adminList", cri);
	}
	
	public void suspendedActive(String memberId) {
		sqlSession.update("admin.suspendedActive", memberId);
	}
	
	public void suspendedClear(String memberId) {
		sqlSession.update("admin.suspendedClear", memberId);
	}
	
	// 전체 멤버 리스트
	public int getTotal(Criteria cri) {
		return sqlSession.selectOne("admin.getTotal", cri);
	}
	
	// 활성화된 멤버 리스트
	public int getTotalActive(Criteria cri) {
		return sqlSession.selectOne("admin.getTotalActive", cri);
	}
	
	// 정지된 멤버 리스트
	public int getTotalSuspended(Criteria cri) {
		return sqlSession.selectOne("admin.getTotalSuspended", cri);
	}
	
	// 관리자 리스트
	public int getTotalAdmin(Criteria cri) {
		return sqlSession.selectOne("admin.getTotalAdmin", cri);
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
