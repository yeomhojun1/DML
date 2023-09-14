package kh.project.dml.calender.model.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.dml.calender.model.dao.FpCalenderDao;
import kh.project.dml.calender.model.vo.FpCalenderVo;


public interface FpCalenderService {

	
	
	public List<FpCalenderVo> selectList();
	public FpCalenderVo seletOne(int calendarno);
	public int insert(FpCalenderVo vo);
	public int update(FpCalenderVo vo);
	public int delete(int calendarno);

	/*
	 * public List<Map<String, Object>> getEventList() { Map<String, Object> event =
	 * new HashMap<String, Object>(); List<Map<String, Object>> eventList = new
	 * ArrayList<Map<String, Object>>(); event.put("start", LocalDate.now());
	 * event.put("title", "test"); event.put("end",LocalDate.now());
	 * eventList.add(event); event = new HashMap<String, Object>();
	 * event.put("start", LocalDate.now().plusDays(3)); event.put("title", "test2");
	 * event.put("end",LocalDate.now().plusDays(4)); eventList.add(event); return
	 * eventList; }
	 */
}

