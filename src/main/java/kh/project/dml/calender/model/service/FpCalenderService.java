package kh.project.dml.calender.model.service;

import java.util.List;
import java.util.Map;


import kh.project.dml.calender.model.vo.FpCalenderVo;

public interface FpCalenderService {

	public List<FpCalenderVo> selectList();

	public FpCalenderVo seletOne(int calendarno);

	public int insert(FpCalenderVo vo);

	public int update(FpCalenderVo vo);

	public int delete(int calendarno);

	public List<Map<String, Object>> getEventList();

}
