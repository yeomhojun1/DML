package kh.project.dml.member.model.dao;

import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.users.model.vo.FpUsersVo;

@Mapper
public interface FpMemberRepository {
	Optional<FpUsersVo> findByUsername(String username);
	FpMemberVo findByMemberId(String username);
	
    void saveUser(FpUsersVo user);
    void saveMember(FpMemberVo member);
    void update(FpMemberVo member);
}
