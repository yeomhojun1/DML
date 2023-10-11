package kh.project.dml.board.model.service;

import java.util.List;
import org.springframework.stereotype.Service;
import kh.project.dml.board.model.vo.FpBoardParam;
import kh.project.dml.board.model.vo.FpBoardSelectReplyParam;
import kh.project.dml.board.model.vo.FpBoardVo;
import kh.project.dml.common.vo.Criteria;

@Service
public interface FpBoardService {

	
	public List<FpBoardVo> selectList(Criteria cri);
	public FpBoardVo selectOne(Integer boardNo);
	public int insert(FpBoardVo vo);
	public int update(FpBoardVo vo);
	public int delete(int boardNo);
	public int plusCount(FpBoardParam param);
	public FpBoardVo selectReply(FpBoardSelectReplyParam param);
	public int getTotalBoard(Criteria cri);
}
