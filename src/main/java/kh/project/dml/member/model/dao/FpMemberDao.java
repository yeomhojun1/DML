package kh.project.dml.member.model.dao;

import java.util.Date;
import java.util.HashMap;
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
	private static final String LOGIN = NS + ".login";
	private static final String KEEP_LOGIN = NS + ".keepLogin";
	private static final String CHECK_LOGIN_BEFORE = NS + ".checkLoginBefore";
	private static final String GET_BY_SNS_NAVER = NS + ".getBySnsNaver";
	private static final String GET_BY_SNS_GOOGLE = NS + ".getBySnsGoogle";
	private static final String GET_BY_SNS_KAKAO = NS + ".getBySnsKakao";

	public FpUsersVo login(LoginVo vo) throws Exception {
		return session.selectOne(LOGIN, vo);
	}

	public void keepLogin(String mid, String sessionId, Date expire) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("mid", mid);
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
}

