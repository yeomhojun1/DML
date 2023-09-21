package kh.project.dml.memberexset.model.service;

import java.util.List;

import kh.project.dml.memberexset.model.vo.FpMemberExSetParam;
import kh.project.dml.memberexset.model.vo.FpMemberExSetVo;

public interface FpMemberExSetService {

	public List<FpMemberExSetVo> selectList(String dayExSet);

	public FpMemberExSetVo selectOne(String dayExSet);

	public List<FpMemberExSetVo> selectPart(FpMemberExSetParam param);

	public int insert(FpMemberExSetVo vo);

	public int update(FpMemberExSetVo vo);

	public int delete(String memberId);
}
