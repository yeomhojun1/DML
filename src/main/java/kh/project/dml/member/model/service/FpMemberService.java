package kh.project.dml.member.model.service;

import java.util.Date;
import java.util.List;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.member.model.vo.PwdChangeForm;
import kh.project.dml.member.model.vo.SocialCreateForm;
import kh.project.dml.member.model.vo.UserCreateForm;
import kh.project.dml.users.model.vo.FpUsersVo;
import kh.project.dml.users.model.vo.LoginVo;

public interface FpMemberService {
	
	FpUsersVo getCurrentUser();
    FpUsersVo create(UserCreateForm userMember) throws Exception;
    void memberAuth(String memberId, String key) throws Exception;
    void memberAuthDelete(String memberId) throws Exception;
    String pwdAuth(String memberId, String key) throws Exception;
    FpUsersVo socialCreate(SocialCreateForm userMember);
    String checkId(String memberId);
    FpMemberVo login(LoginVo vo) throws Exception;
	FpMemberVo memberInfo(String memberId);
	List<FpMemberVo> idSearch(String name, String birthday);
	FpMemberVo pwdSearch(String username, String name, String birthday) throws Exception;
	int pwdChange(PwdChangeForm pwdChange);
	int pwdChangeResult(String username, String password) throws Exception;
	void update(FpMemberVo vo);
	void delete(String username);
	void keepLogin(String memberId, String sessionId, Date expire);
	FpMemberVo checkLoginBefore(String loginCookie);
	FpMemberVo getBySns(FpMemberVo snsMember);
	int plusReputation(int replyNo);
}
