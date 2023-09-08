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
import kh.project.dml.users.model.vo.FpUsersVo;
import kh.project.dml.users.model.vo.LoginVo;

@Repository
public class FpMemberDao {

	@Inject
	private SqlSession session;

	private static final String NS = "kh.project.dml.MemberMapper";
	private static final String CHECK_ID = NS + ".checkId";
	private static final String LOGIN = NS + ".login";
	private static final String SELECT_LIST = NS + ".selectList";
	private static final String NORMAL_LOGIN = NS + ".normallogin";
	private static final String KEEP_LOGIN = NS + ".keepLogin";
	private static final String CHECK_SESSION = NS + ".checkSession";
	private static final String CHECK_LOGIN_BEFORE = NS + ".checkLoginBefore";
	private static final String GET_BY_SNS_NAVER = NS + ".getBySnsNaver";
	private static final String GET_BY_SNS_GOOGLE = NS + ".getBySnsGoogle";
	private static final String GET_BY_SNS_KAKAO = NS + ".getBySnsKakao";

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

	public void keepLogin(String memberId, String sessionId, Date expire) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("memberId", memberId);
		paramMap.put("sessionkey", sessionId);
		paramMap.put("sessionlimit", expire);
		session.update(KEEP_LOGIN, paramMap);
	}
	
	public String checkSession(String sessionId) {
		return session.selectOne(CHECK_SESSION, sessionId);
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
}

