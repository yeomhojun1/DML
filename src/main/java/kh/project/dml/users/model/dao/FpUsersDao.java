package kh.project.dml.users.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kh.project.dml.users.model.vo.FpUsersVo;

public class FpUsersDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입구현
	public int insertMember(FpUsersVo vo) {
		return sqlSession.insert("users.insertMember", vo);
	}
	
	// ID체크
	public String idCheck(String userid) throws Exception {
		String checkId = sqlSession.selectOne("users.idCheck", userid);
		return checkId;
	}
	
	//회원 정보 조회 - ID,PW정보에 해당하는 사용자 정보
	public FpUsersVo readMemberWithIDPW(String userid, String userpw) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("userpw", userpw);

		return sqlSession.selectOne("users.readMemberWithIDPW", map);		
	}
}
