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
	private static final String CREATE_AUTH_KEY = NS + ".createAuthKey";
	private static final String MEMBER_AUTH = NS + ".memberAuth";
	private static final String MEMBER_AUTH_DELETE = NS + ".memberAuthDelete";
	private static final String PWD_AUTH = NS + ".pwdAuth";
	private static final String PWD_AUTH_DELETE = NS + ".pwdAuthDelete";
	private static final String UPDATE = NS + ".update";
	private static final String DELETE_USER = NS + ".deleteUser";
	private static final String KEEP_LOGIN = NS + ".keepLogin";
	private static final String CHECK_LOGIN_BEFORE = NS + ".checkLoginBefore";
	private static final String GET_BY_SNS_NAVER = NS + ".getBySnsNaver";
	private static final String GET_BY_SNS_GOOGLE = NS + ".getBySnsGoogle";
	private static final String GET_BY_SNS_KAKAO = NS + ".getBySnsKakao";
	private static final String PLUS_REPUTATION = NS + ".plusreputation";
	private static final String member_Reputation = NS + ".memberReputation";

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
	
	// 회원가입 시 인증 정보 생성
	public void createAuthKey(String memberId, String authKey) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("authKey", authKey);
		
		session.selectOne(CREATE_AUTH_KEY, map);
		
	}
	
	// 회원가입 인증 메일 클릭 시
	public void memberAuth(String memberId, String key) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("key", key);
		session.update(MEMBER_AUTH, map);
	}
	public void usersAuth(String username, String key) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("key", key);
		session.update(MEMBER_AUTH, map);
	}
	
	// 회원가입 인증 후 인증 필요 정보 삭제
	public void memberAuthDelete(String memberId) throws Exception {
		session.delete(MEMBER_AUTH_DELETE, memberId);
	}
	
	// 패스워드 재설정 페이지 접근 시
	public String pwdAuth(String memberId, String key) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("key", key);
		return session.selectOne(PWD_AUTH, map);
	}
	
	// 패스워드 재설정 후 인증 정보 삭제
	public void pwdAuthDelete(String memberId) throws Exception {
		session.delete(PWD_AUTH_DELETE, memberId);
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
	public int plusReputation(int replyNo) {
		return session.update(PLUS_REPUTATION, replyNo);
	}
	public List<FpMemberVo> memberReputation(){
		return session.selectList(member_Reputation);
	}
}

