package kh.project.dml.calender.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.project.dml.calender.model.service.FpCalenderService;
import kh.project.dml.calender.model.vo.FpCalenderVo;
import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.member.model.service.FpMemberServiceImpl;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.users.model.vo.FpUsersVo;

@Controller
@RequestMapping("/calendar")
public class FpCalenderController {

	@Autowired
	FpCalenderService fpCalenderServiceImpl;

	private FpMemberServiceImpl service;

//	@Autowired
//	SessionUtil sessionUtil;
	
	@GetMapping
	public String viewCalendar(Model model, HttpSession session) {
		FpMemberVo member = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
		List<FpCalenderVo> list = fpCalenderServiceImpl.selectList(member.getMemberId());
		model.addAttribute("getCalendarList", list);

		return "/fullcalendar/calendar";
	}
	
	@PostMapping("/dateNow")
	public ResponseEntity<Map<String, Object>> dateNow(Model model, HttpSession session, @RequestParam(name = "date", required = false) String localDate) {
	    FpMemberVo member = (FpMemberVo) session.getAttribute(SessionNames.LOGIN);
	    String date = localDate.replace("-", "");
	    List<FpCalenderVo> list = fpCalenderServiceImpl.nowList(member.getMemberId(), date);
	    model.addAttribute("dateNowList", list);

	    Map<String, Object> responseMap = new HashMap<>();
	    responseMap.put("dateNowList", list);

	    return new ResponseEntity<>(responseMap, HttpStatus.OK);
	}


	// 클릭된날짜에 대한 일정 추가 팝업 show
	@GetMapping("/calendarSelected")
	//@RequestMapping(value = "/calendarSeleted", method = RequestMethod.GET)
	public String calendarSeleted(
			//@RequestParam(name="calendarno") String calendarno,
			@RequestParam(name="calendarno", required=false) String calendarno,
			@RequestParam(name="startDate", required=false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate startDate,
			@RequestParam(name="endDate", required=false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate endDate, 
			@RequestParam(name="title", required=false) String title,
			Model model, HttpSession session) {
		
		model.addAttribute("startDate", startDate);
		
		// 등록된 일정이 startDate endDate 동일하면 fullCalendar api endDate 가 null 값으로 인식
		// 이거를 해결하기 위해 startDate endDate 동일하면 endDate는 null 값으로 서버던짐
		// 결론 endDate = startDate 
		if(endDate == null) {
			endDate = startDate;
		}
		
		model.addAttribute("endDate", endDate);
		model.addAttribute("calendarno", calendarno);
		model.addAttribute("title", title);
		
		Object memberObj = session.getAttribute(SessionNames.LOGIN);
		String memberId = "";
		if (memberObj instanceof FpUsersVo) {
			FpUsersVo userMember = (FpUsersVo) memberObj;
			memberId = userMember.getUsername();
		} else if (memberObj instanceof FpMemberVo) {
			FpMemberVo member = (FpMemberVo) memberObj;
			memberId = member.getMemberId();
		}
		DateTimeFormatter dFormat = DateTimeFormatter.ofPattern("yyyyMMdd");
		String sDate = startDate.format(dFormat);
		
		// 등록된 일정이 없을 경우 일정추가 팝업 Show
		if(fpCalenderServiceImpl.table(memberId, sDate).size() < 1) {
			return "/fullcalendar/addcalendar";
		} else {
			
			String content = fpCalenderServiceImpl.getContent(calendarno);
			model.addAttribute("content", content);
			return "/fullcalendar/deletecalendar";			
		}
		
	}

	// 버튼에 대한 일정 추가 팝업
	@RequestMapping(value = "/btnSelected", method = RequestMethod.GET)
	public String btnSelected() {
		return "/fullcalendar/addcalendar";
	}

	@PostMapping("/insert")
	public ResponseEntity<String> saveCalendarEvent(
			@RequestParam String title, @RequestParam String startDate,
			@RequestParam String endDate, @RequestParam String content
			, HttpSession session) {
		System.out.println("컨트롤러 동작");
		Object memberObj = session.getAttribute(SessionNames.LOGIN);
		String memberId = "";
		if (memberObj instanceof FpUsersVo) {
			FpUsersVo userMember = (FpUsersVo) memberObj;
			memberId = userMember.getUsername();
		} else if (memberObj instanceof FpMemberVo) {
			FpMemberVo member = (FpMemberVo) memberObj;
			memberId = member.getMemberId();
		}
		fpCalenderServiceImpl.insert(memberId, title, startDate, endDate, content);
		String responseMessage = "일정이 성공적으로 저장되었습니다.";
		
		return ResponseEntity.ok("{\"message\":\"" + responseMessage + "\", \"key\":\"success\"}");
	}
	
	//캘린더 번호랑 멤버 아이디 불러오는 param
	@PostMapping("/calendarNumber")
	public String calendarNumber(@RequestParam int calendarno, @RequestParam String memberId, Model model, HttpSession session) {
		session.setAttribute("calendarno", calendarno);
		model.addAttribute("memberId",memberId);
		return "/fullcalendar/deletecalendar";
	}
	
	
	@PostMapping("/delete")
	@ResponseBody
	public HashMap deleteschedule(FpCalenderVo vo) {
		int result = fpCalenderServiceImpl.delete(vo);
		HashMap map = new HashMap();

			if (result < 1) {
				map.put("key","failed");
				map.put("msg","일정 삭제 실패");
			} else {
				map.put("key","success");
				map.put("msg","일정 삭제 성공");		
			}
			return map;
	} 
	
	// ajax 통신 - 일정 수정
	@PostMapping(value="/update")
	@ResponseBody
	public HashMap edit(FpCalenderVo vo, HttpSession session) throws Exception{
		HashMap map = new HashMap<String, Object>();
		vo.setStartDate(vo.getStartDate().replace("-", "")); // 2023-10-04 -> 20231004
		vo.setEndDate(vo.getEndDate().replace("-", "")); // 2023-10-04 -> 20231004
		
		int result = fpCalenderServiceImpl.editCalendar(vo);
		
		if (result > 0) {
			map.put("key","success");
			map.put("msg","일정 수정 성공");
		} else {
			map.put("key","failed");
			map.put("msg","일정 수정 실패");
		}	
		return map;
	}
}



