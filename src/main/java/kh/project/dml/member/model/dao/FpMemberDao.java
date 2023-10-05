package kh.project.dml.member.model.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.member.model.vo.PwdChangeForm;
import kh.project.dml.users.model.vo.FpUsersVo;
import kh.project.dml.users.model.vo.LoginVo;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class FpMemberDao {

	private final SqlSession session;

	private static final String NS = "kh.project.dml.MemberMapper";
	private static final String CHECK_ID = NS + ".checkId";
	private static final String LOGIN = NS + ".login";
	private static final String SELECT_LIST = NS + ".selectList";
	private static final String NORMAL_LOGIN = NS + ".normallogin";
	private static final String INFO = NS + ".info";
	private static final String ID_SEARCH = NS + ".idSearch";
	private static final String PWD_SEARCH = NS + ".pwdSearch";
	private static final String PWD_CHANGE = NS + ".pwdChange";
	private static final String UPDATE = NS + ".update";
	private static final String DELETE_MEMBER = NS + ".deleteMember";
	private static final String DELETE_USER = NS + ".deleteUser";
	private static final String KEEP_LOGIN = NS + ".keepLogin";
	private static final String CHECK_LOGIN_BEFORE = NS + ".checkLoginBefore";
	private static final String GET_BY_SNS_NAVER = NS + ".getBySnsNaver";
	private static final String GET_BY_SNS_GOOGLE = NS + ".getBySnsGoogle";
	private static final String GET_BY_SNS_KAKAO = NS + ".getBySnsKakao";
	private static final String PLUS_REPUTATION = NS + ".plusreputation";

	public List<FpMemberVo> selectList() {
		return session.selectList(SELECT_LIST);
	}
	
	public String checkId(String memberId) {
		return session.selectOne(CHECK_ID, memberId);
	}
	
	public FpUsersVo login(LoginVo vo) throws Exception {
		return session.selectOne(LOGIN, vo);
	}
	
	public FpUsersVo normallogin(String username) throws Exception {
		return session.selectOne(NORMAL_LOGIN, username);
	}
	
	public FpMemberVo memberInfo(String memberId) {
		return session.selectOne(INFO, memberId);
	}
	
	public List<FpMemberVo> idSearch(String name, String birthday) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("birthday", birthday);
		return session.selectList(ID_SEARCH, map);
	}
	
	public FpMemberVo pwdSearch(String username, String name, String birthday) {
		Map<String, Object> map = new HashMap<>();
		map.put("username", username);
		map.put("name", name);
		map.put("birthday", birthday);
		return session.selectOne(PWD_SEARCH, map);
	}
	
	public void pwdChange(String username, String password) {
		Map<String, Object> map = new HashMap<>();
		map.put("username", username);
		map.put("password", password);
		session.update(PWD_CHANGE, map);
	}
	
	public void update(FpMemberVo vo) {
		session.update(UPDATE, vo);
	}
	
	public void deleteMember(String username) {
		session.delete(DELETE_MEMBER, username);
	}
	
	public void deleteUser(String username) {
		session.delete(DELETE_USER, username);
	}

	public void keepLogin(String memberId, String sessionId, Date expire) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memberId", memberId);
		paramMap.put("sessionkey", sessionId);
		paramMap.put("sessionlimit", expire);
		session.update(KEEP_LOGIN, paramMap);
	}

	public FpMemberVo checkLoginBefore(String loginCookie) {
		return session.selectOne(CHECK_LOGIN_BEFORE, loginCookie);
	}

	public FpMemberVo getBySns(FpMemberVo snsMember) {
		if (StringUtils.isNotEmpty(snsMember.getNaverid())) {
			return session.selectOne(GET_BY_SNS_NAVER, snsMember.getNaverid());
		} else if (StringUtils.isNotEmpty(snsMember.getGoogleid())) {
			return session.selectOne(GET_BY_SNS_GOOGLE, snsMember.getGoogleid());
		} else {
			return session.selectOne(GET_BY_SNS_KAKAO, snsMember.getKakaoid());
		}
	}
	public int plusReputation(String memberId) {
		return session.update(PLUS_REPUTATION, memberId);
	}
}

