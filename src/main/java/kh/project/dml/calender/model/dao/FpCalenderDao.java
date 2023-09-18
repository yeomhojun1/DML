package kh.project.dml.calender.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.calender.model.vo.FpCalenderVo;
import kh.project.dml.member.model.vo.FpMemberVo;

@Repository
public class FpCalenderDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FpCalenderVo> selectList(FpMemberVo loginInfo) {
		return sqlSession.selectList("calender.selectList", loginInfo);
	}
	public List<FpCalenderVo> selectSearchList(int calendarno) {
		return sqlSession.selectList("calender.selectSearchList", calendarno);
	}
	public FpCalenderVo selectOne(int calendarno) {
		return sqlSession.selectOne("calender.selectOne", calendarno);
	}
	public int insert(FpCalenderVo vo) {
		return sqlSession.insert("calender.insert", vo);
	}
	public int update(FpCalenderVo vo) {
		return sqlSession.update("calender.update", vo);
	}
	public int delete(int calendarno) {
		return sqlSession.delete("calender.delete", calendarno);
	}
}
