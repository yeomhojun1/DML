package kh.project.dml.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.notice.model.dao.FpNoticeDao;
import kh.project.dml.notice.model.vo.FpNoticeVo;


public interface FpNoticeService {
	
	
	
	public List<FpNoticeVo> selectList();
	public FpNoticeVo selectOne(int noticeNumber);
	public int insert(FpNoticeVo vo);
	public int update(FpNoticeVo vo);
	public int delete(int noticeNumber);
}
