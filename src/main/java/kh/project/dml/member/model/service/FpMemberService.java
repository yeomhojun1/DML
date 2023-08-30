package kh.project.dml.member.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.member.model.dao.FpMemberDao;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.users.model.dao.FpUsersDao;
import kh.project.dml.users.model.vo.FpUsersVo;

@Service
public class FpMemberService {
	
	@Autowired
	private FpMemberDao fpMemberDao;
	
	@Autowired
	private FpUsersDao fpUsersDao;

	// 회원가입
	public void insertMember(FpUsersVo uvo, FpMemberVo mvo) {		
		fpUsersDao.insertMember(uvo);
		fpMemberDao.insertMember(mvo);
	}

	// 로그인
	public FpUsersVo loginMember(FpUsersVo uvo) {
		FpUsersVo returnVo = null;
		try {
			returnVo = fpUsersDao.readMemberWithIDPW(uvo.getUserId(), uvo.getUserPwd());
			System.out.println("S: 로그인 아디: "+uvo.getUserId()+" 비번: "+uvo.getUserPwd());
		} catch (Exception e) {
			e.printStackTrace();
			returnVo = null; // 예외처리
		}
		return returnVo; 
	}
	
	// 회원가입시 아이디중복확인
	public String idCheck(String id) throws Exception {
		return fpUsersDao.idCheck(id);
	}

	// 회원정보보기
	public FpMemberVo readMember(String id) throws Exception {
		FpMemberVo vo = null;
		try {
			vo = fpMemberDao.readMember(id);
			System.out.println("S: 로그인 정보 리턴");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	// 회원정보 수정
	public void updateMember(FpMemberVo vo) throws Exception {
		try {
			fpMemberDao.updateMember(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	// 회원탈퇴
	public void deleteMember(FpMemberVo mvo) throws Exception {
	    try {
	    	fpMemberDao.deleteMember(mvo);
			System.out.println("S: vo 확인"+mvo);
	    } catch (Exception e) {
			e.printStackTrace();
		}
	}

	//구글 회원가입
	public void insertMemberByGoogle(FpUsersVo uvo, FpMemberVo mvo) throws Exception {
		fpUsersDao.insertMember(uvo);
		fpMemberDao.insertMember(mvo);
	}

	//구글 로그인
	public FpUsersVo loginMemberByGoogle(FpUsersVo uvo) throws Exception {
		FpUsersVo returnVo = null;
		try {
			returnVo = fpUsersDao.readMemberWithIDPW(uvo.getUserId(), uvo.getUserPwd());
			System.out.println("S: 로그인 아디: "+uvo.getUserId()+" 비번: "+uvo.getUserPwd());
		} catch (Exception e) {
			e.printStackTrace();
			returnVo = null; // 예외처리
		}
		return returnVo;
	}
}
