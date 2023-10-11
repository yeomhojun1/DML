package kh.project.dml.calender.model.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nimbusds.jose.shaded.json.parser.ParseException;

import kh.project.dml.calender.model.dao.FpCalenderDao;
import kh.project.dml.calender.model.vo.FpCalenderVo;
import kh.project.dml.member.model.vo.FpMemberVo;

@Service("fpCalenderServiceImpl")
public class FpCalenderServiceImpl implements FpCalenderService  {

	@Autowired
	private FpCalenderDao fpcalenderDao;
	
	@Override
	public List<FpCalenderVo> selectList(String loginInfo){
		return fpcalenderDao.selectList(loginInfo);
	}
	
	//날짜를 클릭했을시 일정에 뜨는 그날의 데이터값
	@Override
	public List<FpCalenderVo> nowList(String username, String date){
		return fpcalenderDao.nowList(username, date);
	}
	
	public List<FpCalenderVo> table(String memberId, String startDate) {
		return fpcalenderDao.selectOne(memberId, startDate);
	}
	
	@Override
	public FpCalenderVo seletOne(int calendarno) {
		return fpcalenderDao.selectOne(calendarno);
	}
	@Override
	public int insert(String memberId, String title, String startDate, String endDate, String content) {
		System.out.println("Service 동작");
		return fpcalenderDao.insert(memberId, title, startDate, endDate, content);
	}
	@Override
	public int update(FpCalenderVo vo) {
		return fpcalenderDao.update(vo);
	}
	@Override
	public int delete(FpCalenderVo vo) {
		return fpcalenderDao.delete(vo);
	}
	@Override
    public List<Map<String, Object>> getEventList() {
        Map<String, Object> event = new HashMap<String, Object>();
        List<Map<String, Object>> eventList = new ArrayList<Map<String, Object>>();
        event.put("start", LocalDate.now());
        event.put("title", "test");
        event.put("end",LocalDate.now());
        eventList.add(event);
        event = new HashMap<String, Object>();
        event.put("start", LocalDate.now().plusDays(3));
        event.put("title", "test2");
        event.put("end",LocalDate.now().plusDays(4));
        eventList.add(event);
        return eventList;
    }
	@Override
	public String getContent(String calendarno) {
		return fpcalenderDao.selectOne(calendarno);
	}
	@Override
	public int editCalendar(FpCalenderVo vo) {
		return fpcalenderDao.update(vo);
	}
}

