package kh.project.dml.calender.controller;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.project.dml.calender.model.service.FpCalenderService;
import kh.project.dml.calender.model.service.FpCalenderServiceImpl;
import kh.project.dml.calender.model.vo.FpCalenderVo;
import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.member.model.vo.FpMemberVo;

@Controller
@RequestMapping("/calendar")
public class FpCalenderController {

	@Autowired
	FpCalenderService fpCalenderServiceImpl;
	
//	@Autowired
//	SessionUtil sessionUtil;
	
	@RequestMapping //기본 페이지 표시
	public String viewCalendar(Model model, HttpSession session){
		
		// 로그인 정보 session
		FpMemberVo loginInfo = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		// sessionUtil.getMemberId();
		
		List<FpCalenderVo> list = fpCalenderServiceImpl.selectList(loginInfo);

		model.addAttribute("getCalendarList", list);
		return "/fullcalendar/calendar";
	}
	
	//클릭된날짜에 대한 일정 추가 팝업 show
	@GetMapping("/calendarSelected")
//	@RequestMapping(value = "/calendarSeleted", method = RequestMethod.GET)
	public String calendarSeleted(@RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate startDate,
									@RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate endDate, Model model) {
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return "/fullcalendar/addcalendar"; 
	}
	 
	// 버튼에 대한 일정 추가 팝업
	//@RequestMapping(value="/btnSelected", method=RequestMethod.GET)
	@GetMapping("/btnSelected")
	public String btnSelected() {
		return "/fullcalendar/addcalendar";
	}
	
	 @PostMapping("/save")
	    public ResponseEntity<String> saveCalendarEvent(@RequestParam String title, @RequestParam String startdate, @RequestParam String enddate, @RequestParam String content) {
	        String responseMessage = "일정이 성공적으로 저장되었습니다.";
	        return ResponseEntity.ok("{\"message\":\"" + responseMessage + "\"}");
	    }
	}
	


	


