package kh.project.dml.replyboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.chickenproduct.model.service.FpChickenproductService;
import kh.project.dml.replyboard.model.dao.FpReplyBoardDao;
import kh.project.dml.replyboard.model.vo.FpReplyBoardVo;


@Service("fpReplyBoardServiceImpl")
public class FpReplyBoardServiceImpl implements FpReplyBoardService{
	@Autowired
	private FpReplyBoardDao fpReplyBoardDao;
	
	@Override
	public List<FpReplyBoardVo> selectList()  {
		return fpReplyBoardDao.selectList();
	}
	@Override
	public FpReplyBoardVo selectOne(int replyNo)  {
		return fpReplyBoardDao.selectOne(replyNo);
	}
	@Override
	public int insert(FpReplyBoardVo vo)  {
		return fpReplyBoardDao.insert(vo);
	}
	@Override
	public int update(FpReplyBoardVo vo) {
		return fpReplyBoardDao.update(vo);
	}
	@Override
	public int delete(int chickenNo)  {
		return fpReplyBoardDao.delete(chickenNo);
	}
}
