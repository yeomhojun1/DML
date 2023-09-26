package kh.project.dml.security.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kh.project.dml.member.model.dao.FpMemberRepository;
import kh.project.dml.users.model.vo.FpUsersVo;
import kh.project.dml.users.model.vo.UserRole;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserSecurityService implements UserDetailsService {

    private final FpMemberRepository fpMemberRepository;
    
    // 로그인 시 사용자 계정이 있는지 체크 및 admin 계정인 경우 admin 권한 그 외 계정은 user권한 부여
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<FpUsersVo> _fpUsersVo = this.fpMemberRepository.findByUsername(username);

        if(_fpUsersVo.isEmpty()) {
            throw new UsernameNotFoundException("사용자를 찾을수 없습니다.");
        }
        FpUsersVo fpUsersVo = _fpUsersVo.get();
        List<GrantedAuthority> authorities = new ArrayList<>();

        if("admin".equals(username)) {
            authorities.add(new SimpleGrantedAuthority(UserRole.ADMIN.getValue()));
        } else {
            authorities.add(new SimpleGrantedAuthority(UserRole.MEMBER.getValue()));
        }
        return new User(fpUsersVo.getUsername(), fpUsersVo.getPassword(), authorities);
    }
}
