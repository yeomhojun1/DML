package kh.project.dml.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.notice.model.dao.FpNoticeDao;
import kh.project.dml.notice.model.vo.FpNoticeVo;

@Service("fpNoticeServiceImpl")
public class FpNoticeServiceImpl implements FpNoticeService  {
	
	@Autowired
	private FpNoticeDao fpNoticeDao;
	
	@Override
	public List<FpNoticeVo> selectList() {
		return fpNoticeDao.selectList();
	}
	@Override
	public FpNoticeVo selectOne(int noticeNumber) {
		return fpNoticeDao.selectOne(noticeNumber);
	}
	@Override
	public int insert(FpNoticeVo vo) {
		return fpNoticeDao.insert(vo);
	}
	@Override
	public int update(FpNoticeVo vo) {
		return fpNoticeDao.update(vo);
	}
	@Override
	public int delete(int noticeNumber) {
		return fpNoticeDao.delete(noticeNumber);
	}
}
