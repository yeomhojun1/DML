package kh.project.dml.calender.model.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import kh.project.dml.calender.model.vo.FpCalenderVo;
import kh.project.dml.member.model.vo.FpMemberVo;

public interface FpCalenderService {
	

	public List<FpCalenderVo> selectList(String username);

	public FpCalenderVo seletOne(int calendarno);

	public int insert(String memberId, String title, String startDate, String endDate, String content);

	public int update(FpCalenderVo vo);

	public int delete(FpCalenderVo vo);

	public List<Map<String, Object>> getEventList();

	public List<FpCalenderVo> table(String memberId, String startDate);

	public String getContent(String calendarno);

	public int editCalendar(FpCalenderVo vo);
	
}
