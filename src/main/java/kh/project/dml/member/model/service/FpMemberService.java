package kh.project.dml.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.project.dml.member.model.dao.FpMemberDao;
import kh.project.dml.member.model.dao.FpMemberRepository;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.member.model.vo.SocialCreateForm;
import kh.project.dml.member.model.vo.UserCreateForm;

import java.util.Date;
import java.util.Optional;

import javax.inject.Inject;

import kh.project.dml.users.model.vo.FpUsersVo;
import kh.project.dml.users.model.vo.LoginVo;


@Service
public class FpMemberService {
	
	@Inject
	private FpMemberDao dao;
	
	@Autowired
	private FpMemberRepository fpMemberRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public FpUsersVo getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            return null; // 미인증 사용자 또는 로그인하지 않은 경우 null 반환
        }

        String username = authentication.getName();
        Optional<FpUsersVo> userOptional = fpMemberRepository.findByUsername(username);

        return userOptional.orElse(null);
    }
    
    // 회원가입 시 users 테이블과 member 테이블에 정보 저장
    @Transactional
    public FpUsersVo create(UserCreateForm userMember) {
    	FpUsersVo user = new FpUsersVo();
        user.setUsername(userMember.getUsername());
        user.setPassword(passwordEncoder.encode(userMember.getPassword1()));
        user.setUserEnabled(1);
        user.setAuthorities("ROLE_MEMBER");
        this.fpMemberRepository.saveUser(user);
        
        FpMemberVo member = new FpMemberVo();
        member.setMemberId(userMember.getUsername());
        member.setMname(userMember.getName());
        member.setMbirthday(19900619);
        member.setGender(userMember.getGender());
        member.setHeight(userMember.getHeight());
        member.setWeight(userMember.getWeight());
        this.fpMemberRepository.saveMember(member);
        
        return user;
    }
    
    @Transactional
    public FpUsersVo socialCreate(SocialCreateForm userMember) {
    	FpUsersVo user = new FpUsersVo();
        user.setUsername(userMember.getUsername());
        user.setPassword(passwordEncoder.encode(userMember.getPassword1()));
        user.setUserEnabled(1);
        user.setAuthorities("ROLE_SOCIAL");
        this.fpMemberRepository.saveUser(user);
        
        FpMemberVo member = new FpMemberVo();
        member.setMemberId(userMember.getUsername());
        member.setMname(userMember.getName());
        member.setMbirthday(19900619);
        member.setGender(userMember.getGender());
        member.setHeight(userMember.getHeight());
        member.setWeight(userMember.getWeight());
        member.setNaverid(userMember.getNaverid());
        member.setGoogleid(userMember.getGoogleid());
        member.setKakaoid(userMember.getKakaoid());
        this.fpMemberRepository.saveMember(member);
        
        return user;
    }

	public FpUsersVo login(LoginVo vo) throws Exception {
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

