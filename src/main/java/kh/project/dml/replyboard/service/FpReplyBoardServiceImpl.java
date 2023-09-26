package kh.project.dml.replyboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.project.dml.chickenproduct.model.service.FpChickenproductService;
import kh.project.dml.replyboard.model.dao.FpReplyBoardDao;
import kh.project.dml.replyboard.model.vo.FpReplyBoardVo;

@Service("fpReplyBoardServiceImpl")
public class FpReplyBoardServiceImpl implements FpReplyBoardService {
	@Autowired
	private FpReplyBoardDao fpReplyBoardDao;

	@Override
	public List<FpReplyBoardVo> selectList(int boardNo) {
		return fpReplyBoardDao.selectList(boardNo);
	}

	@Override
	public FpReplyBoardVo selectOne(int replyNo) {
		return fpReplyBoardDao.selectOne(replyNo);
	}

	@Override
	@Transactional
	public List<FpReplyBoardVo> insert(FpReplyBoardVo vo) {
		int resultinsert = fpReplyBoardDao.insert(vo);
		List<FpReplyBoardVo> replyList = fpReplyBoardDao.selectList(vo.getBoardNo());
		return replyList;
	}

	@Override
	@Transactional
	public FpReplyBoardVo update(FpReplyBoardVo vo) {
		int resultinsert = fpReplyBoardDao.update(vo);
		FpReplyBoardVo replyList = fpReplyBoardDao.selectOne(vo.getBoardNo());
		return replyList;
	}

	@Override
	@Transactional
	public List<FpReplyBoardVo> delete(int replyNo) {
		FpReplyBoardVo vo =fpReplyBoardDao.selectOne(replyNo);
		int replyVoNo= vo.getBoardNo();
		int resultdelete = fpReplyBoardDao.delete(replyNo);
		List<FpReplyBoardVo> replyList = fpReplyBoardDao.selectList(replyVoNo);
		return replyList;
	}
}
