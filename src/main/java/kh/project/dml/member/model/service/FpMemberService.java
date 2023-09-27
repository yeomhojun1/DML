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
	
	List<FpMemberVo> selectList();
	FpUsersVo getCurrentUser();
    FpUsersVo create(UserCreateForm userMember);
    FpUsersVo socialCreate(SocialCreateForm userMember);
    String checkId(String memberId);
    FpUsersVo login(LoginVo vo) throws Exception;
	FpMemberVo memberInfo(String memberId);
	int pwdChange(PwdChangeForm pwdChange);
	void update(FpMemberVo vo);
	void delete(String username);
	void keepLogin(String memberId, String sessionId, Date expire);
	FpMemberVo checkLoginBefore(String loginCookie);
	FpMemberVo getBySns(FpMemberVo snsMember);
}
