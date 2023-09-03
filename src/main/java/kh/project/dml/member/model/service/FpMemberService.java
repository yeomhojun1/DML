package kh.project.dml.member.model.service;

import org.springframework.stereotype.Service;

import kh.project.dml.member.model.dao.FpMemberDao;
import kh.project.dml.member.model.vo.FpMemberVo;

import java.util.Date;

import javax.inject.Inject;

import kh.project.dml.users.model.vo.LoginVo;


@Service
public class FpMemberService {
	
	@Inject
	private FpMemberDao dao;

	public FpMemberVo login(LoginVo vo) throws Exception {
		return dao.login(vo);
	}

	public void keepLogin(String mid, String sessionId, Date expire) {
		dao.keepLogin(mid, sessionId, expire);
	}

	public FpMemberVo checkLoginBefore(String loginCookie) {
		return dao.checkLoginBefore(loginCookie);
	}

	public FpMemberVo getBySns(FpMemberVo snsMember) {
		return dao.getBySns(snsMember);
	}

}

