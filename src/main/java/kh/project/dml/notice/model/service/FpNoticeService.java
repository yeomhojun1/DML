package kh.project.dml.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.notice.model.dao.FpNoticeDao;
import kh.project.dml.notice.model.vo.FpNoticeVo;

@Service
public class FpNoticeService {
	
	@Autowired
	private FpNoticeDao fpNoticeDao;
	
	public List<FpNoticeVo> selectList() {
		return fpNoticeDao.selectList();
	}
	public FpNoticeVo selectOne(int noticeNumber) {
		return fpNoticeDao.selectOne(noticeNumber);
	}
	public int insert(FpNoticeVo vo) {
		return fpNoticeDao.insert(vo);
	}
	public int update(FpNoticeVo vo) {
		return fpNoticeDao.update(vo);
	}
	public int delete(int noticeNumber) {
		return fpNoticeDao.delete(noticeNumber);
	}
}
