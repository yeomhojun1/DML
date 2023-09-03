package kh.project.dml.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import kh.project.dml.member.model.vo.FpMemberVo;

@Mapper
public interface FpMemberRepository {
    FpMemberVo findByMemail(String email);
    void save(FpMemberVo member);
    void update(FpMemberVo member);
}
