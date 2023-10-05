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
	
	public List<FpMemberVo> selectList() {
		return dao.selectList();
	}
	
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
    
    // 회원가입 시 users 테이블과 member 테이블에 정보 저장
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
						"<br/>"+member.getMemberId()+"님 "+
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
    
    @Override
    public String checkId(String memberId) {
    	return dao.checkId(memberId);
    }
    
    @Override
	public FpUsersVo login(LoginVo vo) throws Exception {
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
	        return user;
	    }

	    // 비밀번호가 일치하지 않으면 null 반환
	    return null;
	}
	
    @Override
	public FpMemberVo memberInfo(String memberId) {
		return dao.memberInfo(memberId);
	}
    
    @Override
    public List<FpMemberVo> idSearch(String name, String birthday) {
    	return dao.idSearch(name, birthday);
    }
    
    @Override
	public FpMemberVo pwdSearch(String username, String name, String birthday) {
    	return dao.pwdSearch(username, name, birthday);
    }
    
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
    
    @Override
    public int pwdChangeResult(FpMemberVo vo, String password) {
    	int result = 1;
		dao.pwdChange(vo.getMemberId(), passwordEncoder.encode(password));
		return result;
    }
    
    @Override
	public void memberAuth(String memberId, String key) throws Exception {
		dao.memberAuth(memberId, key);
	}
    
    @Override
    public void memberAuthDelete(String memberId) throws Exception {
    	dao.memberAuthDelete(memberId);
    }
	
    @Override
	public void update(FpMemberVo vo) {
		dao.update(vo);
	}
	
	@Transactional
	@Override
	public void delete(String username) {
		dao.deleteMember(username);
		dao.deleteUser(username);
	}
	
	@Override
	public void keepLogin(String memberId, String sessionId, Date expire) {
		dao.keepLogin(memberId, sessionId, expire);
	}
	
	@Override
	public FpMemberVo checkLoginBefore(String loginCookie) {
		return dao.checkLoginBefore(loginCookie);
	}
	
	@Override
	public FpMemberVo getBySns(FpMemberVo snsMember) {
		return dao.getBySns(snsMember);
	}

	@Override
	public int plusReputation(String memberId) {
		return dao.plusReputation(memberId);
	}
	
}
