package kh.project.dml.calender.model.dao;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.dml.calender.model.vo.FpCalenderVo;
import kh.project.dml.member.model.vo.FpMemberVo;

@Repository
public class FpCalenderDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FpCalenderVo> selectList(String username) {
		return sqlSession.selectList("calender.selectList", username);
	}
	public List<FpCalenderVo> selectSearchList(int calendarno) {
		return sqlSession.selectList("calender.selectSearchList", calendarno);
	}
	public FpCalenderVo selectOne(int calendarno) {
		return sqlSession.selectOne("calender.selectOne", calendarno);
	}
	public int insert(String memberId, String title, String startDate, String endDate, String content) {
		System.out.println("DAO 동작");
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("title", title);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("content", content);
		return sqlSession.insert("calender.insert", map);
	}
	public int update(FpCalenderVo vo) {
		return sqlSession.update("calender.update", vo);
	}
	public int delete(FpCalenderVo vo) {
		return sqlSession.delete("calender.delete", vo);
	}
	public List<FpCalenderVo> selectOne(String memberId, String startDate) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("startDate", startDate);
		return sqlSession.selectList("calender.selectOne", map);
	}
	public String selectOne(String calendarno) {
		Map<String, Object> map = new HashMap<>();
		map.put("calendarno", calendarno);

		return sqlSession.selectOne("calender.selectOneContent", map);
	}
	
}
