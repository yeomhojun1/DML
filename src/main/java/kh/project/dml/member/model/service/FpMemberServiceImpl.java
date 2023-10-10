package kh.project.dml.member.model.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.project.dml.member.model.dao.FpMemberDao;
import kh.project.dml.member.model.dao.FpMemberRepository;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.member.model.vo.MailUtils;
import kh.project.dml.member.model.vo.PwdChangeForm;
import kh.project.dml.member.model.vo.SocialCreateForm;
import kh.project.dml.member.model.vo.TempKey;
import kh.project.dml.member.model.vo.UserCreateForm;
import kh.project.dml.users.model.vo.FpUsersVo;
import kh.project.dml.users.model.vo.LoginVo;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class FpMemberServiceImpl implements FpMemberService {
	
	private final FpMemberDao dao;
	private final FpMemberRepository fpMemberRepository;
	private final PasswordEncoder passwordEncoder;
	private final JavaMailSender mailSender;

	// SecurityConfig에서 로그인 유무 확인(미사용)
	@Override
	public FpUsersVo getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            return null; // 미인증 사용자 또는 로그인하지 않은 경우 null 반환
        }

        String username = authentication.getName();
        System.out.println(username);
        Optional<FpUsersVo> userOptional = fpMemberRepository.findByUsername(username);
        System.out.println(userOptional);
        return userOptional.orElse(null);
    }
    
    // 일반 계정 회원가입
    @Transactional
    @Override
    public FpUsersVo create(UserCreateForm userMember) throws Exception {
    	FpUsersVo user = new FpUsersVo();
        user.setUsername(userMember.getUsername());
        user.setPassword(passwordEncoder.encode(userMember.getPassword()));
        user.setUserEnabled(1);
        user.setAuthorities("ROLE_MEMBER");
        this.fpMemberRepository.saveUser(user);
        
        FpMemberVo member = new FpMemberVo();
        member.setMemberId(userMember.getUsername());
        member.setMname(userMember.getName());
        member.setMbirthday(userMember.getBirthday());
        member.setGender(userMember.getGender());
        member.setHeight(Double.parseDouble(userMember.getHeight()));
        member.setWeight(Double.parseDouble(userMember.getWeight()));
        this.fpMemberRepository.saveMember(member);

        String key = new TempKey().getKey(50,false);
		dao.createAuthKey(member.getMemberId(), key);
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[Daily Muscle Life 이메일 인증메일 입니다.]"); //메일제목
		sendMail.setText(
				"<h1>메일인증</h1>" +
						"<br/>"+member.getMname()+"님 "+
						"<br/>Daily Muscle Life에 회원가입해주셔서 감사합니다."+
						"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
						"<a href='http://localhost:8080/dml/member/signupEmail?memberId=" + member.getMemberId() +
						"&key=" + key +
						"' target='_blenk'>이메일 인증 확인</a>");
		sendMail.setFrom("dmlfinalproject@gmail.com", "DML");
		sendMail.setTo(member.getMemberId());
		sendMail.send();
        return user;
    }
    
    // 소셜 계정 회원가입
    @Transactional
    @Override
    public FpUsersVo socialCreate(SocialCreateForm userMember) {
    	FpUsersVo user = new FpUsersVo();
        user.setUsername(userMember.getUsername());
        user.setPassword(passwordEncoder.encode(userMember.getPassword()));
        user.setUserEnabled(1);
        user.setAuthorities("ROLE_SOCIAL");
        user.setMemberAuth(1);
        this.fpMemberRepository.saveUser(user);
        
        FpMemberVo member = new FpMemberVo();
        member.setMemberId(userMember.getUsername());
        member.setMname(userMember.getName());
        member.setMbirthday(userMember.getBirthday());
        member.setGender(userMember.getGender());
        member.setHeight(Double.parseDouble(userMember.getHeight()));
        member.setWeight(Double.parseDouble(userMember.getWeight()));
        member.setNaverid(userMember.getNaverid());
        member.setGoogleid(userMember.getGoogleid());
        member.setKakaoid(userMember.getKakaoid());
        this.fpMemberRepository.saveMember(member);
        return user;
    }
    
    // 중복 아이디 체크(미사용)
    @Override
    public String checkId(String memberId) {
    	return dao.checkId(memberId);
    }
    
    // 로그인 기능
    @Transactional
    @Override
	public FpMemberVo login(LoginVo vo) throws Exception {
		// 1. 사용자의 username을 사용하여 DB에서 사용자 정보를 가져옵니다.
	    FpUsersVo user = dao.normallogin(vo.getUsername());
	    
	    // 사용자가 존재하지 않으면 null 반환
	    if(user == null) {
	        return null;
	    }
	    
	    // 사용자가 정지 상태면 null 반환
	    if(user.getUserEnabled() == 0) {
	    	return null;
	    }
	    // 2. 사용자의 암호화된 비밀번호와 사용자가 입력한 평문 비밀번호를 암호화한 것을 비교합니다.
	    if(passwordEncoder.matches(vo.getPassword(), user.getPassword())) {
	        // 비밀번호가 일치하면, 사용자 정보 반환
	    	FpMemberVo member = dao.memberInfo(vo.getUsername());
	        return member;
	    }

	    // 비밀번호가 일치하지 않으면 null 반환
	    return null;
	}
	
    // 계정 정보 출력
    @Override
	public FpMemberVo memberInfo(String memberId) {
		return dao.memberInfo(memberId);
	}
    
    // 아이디 찾기
    @Override
    public List<FpMemberVo> idSearch(String name, String birthday) {
    	return dao.idSearch(name, birthday);
    }
    
    // 비밀번호 찾기
    @Override
	public FpMemberVo pwdSearch(String username, String name, String birthday) throws Exception {
    	FpMemberVo vo = dao.pwdSearch(username, name, birthday);
    	if(vo != null) {
    		String key = new TempKey().getKey(50,false);
    		dao.createAuthKey(vo.getMemberId(), key);
    		MailUtils sendMail = new MailUtils(mailSender);
    		sendMail.setSubject("[Daily Muscle Life 패스워드 재설정]"); //메일제목
    		sendMail.setText(
    				"<h1>패스워드 재설정</h1>" +
    						"<br/>"+vo.getMname()+"님 "+
    						"<br/>패스워드 재설정 요청으로 메일을 전달드립니다."+
    						"<br/>아래 [패스워드 재설정]을 눌러주세요."+
    						"<a href='http://localhost:8080/dml/member/pwdSearchResult?memberId=" + vo.getMemberId() +
    						"&key=" + key +
    				"' target='_blenk'>패스워드 재설정</a>");
    		sendMail.setFrom("dmlfinalproject@gmail.com", "DML");
    		sendMail.setTo(vo.getMemberId());
    		sendMail.send();
    		return vo;
    	} else {
    		return null;
    	}
    }
    
    // 비밀번호 변경
    @Override
    @Transactional
    public int pwdChange(PwdChangeForm pwdChange) {
    	int result = 0;
		try {
			FpUsersVo user = dao.normallogin(pwdChange.getUsername());
			System.out.println(passwordEncoder.matches(pwdChange.getPassword(), user.getPassword()));
			if(passwordEncoder.matches(pwdChange.getPassword(), user.getPassword())) {
				dao.pwdChange(pwdChange.getUsername(), passwordEncoder.encode(pwdChange.getPassword2()));
				result = 1;
			} else {
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
    
    // 비밀번호 찾기를 통한 비밀번호 재설정
    @Transactional
    @Override
    public int pwdChangeResult(String username, String password) throws Exception {
    	int result = 1;
		dao.pwdChange(username, passwordEncoder.encode(password));
		dao.pwdAuthDelete(username);
		return result;
    }
    
    // 회원가입 후 메일 인증
    @Transactional
    @Override
	public void memberAuth(String memberId, String key) throws Exception {
		dao.memberAuth(memberId, key);
		dao.usersAuth(memberId, key);
	}
    
    // 회원가입 인증 완료 후 정보 삭제
    @Override
    public void memberAuthDelete(String memberId) throws Exception {
    	dao.memberAuthDelete(memberId);
    }
    
    // 비밀번호 재설정 메일 인증
    @Override
    public String pwdAuth(String memberId, String key) throws Exception {
    	return dao.pwdAuth(memberId, key);
    }
	
    // 비밀번호 재설정 후 정보 삭제
    @Override
	public void update(FpMemberVo vo) {
		dao.update(vo);
	}
	
    // 회원탈퇴
	@Transactional
	@Override
	public void delete(String username) {
		dao.deleteUser(username);
	}
	
	// 로그인 유지(7일)
	@Override
	public void keepLogin(String memberId, String sessionId, Date expire) {
		dao.keepLogin(memberId, sessionId, expire);
	}
	
	// 로그인 유지 시 확인
	@Override
	public FpMemberVo checkLoginBefore(String loginCookie) {
		return dao.checkLoginBefore(loginCookie);
	}
	
	// SNS 계정 확인
	@Override
	public FpMemberVo getBySns(FpMemberVo snsMember) {
		return dao.getBySns(snsMember);
	}
	// 평판 정보
	@Override
	public int plusReputation(int replyNo) {
		return dao.plusReputation(replyNo);
	}
	@Override
	public List<FpMemberVo> memberReputation() {
		return dao.memberReputation();
	}
}
