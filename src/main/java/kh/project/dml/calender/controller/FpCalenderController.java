package kh.project.dml.calender.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.project.dml.calender.model.service.FpCalenderService;
import kh.project.dml.calender.model.service.FpCalenderServiceImpl;
import kh.project.dml.common.interceptor.SessionNames;
import kh.project.dml.member.model.service.FpMemberService;
import kh.project.dml.member.model.vo.FpMemberVo;
import kh.project.dml.users.model.vo.FpUsersVo;

@Controller
@RequestMapping("/calendar")
public class FpCalenderController {

	@Autowired
	FpCalenderServiceImpl fpCalenderServiceImpl;
	
	@Autowired
	public FpMemberService fpMemberService; 
	
	@RequestMapping //기본 페이지 표시
	public String viewCalendar(Model model, HttpSession session){
		return "/fullcalendar/calendar";
	}


    @GetMapping("/event") //ajax 데이터 전송 URL
    @ResponseBody 
    public List<Map<String, Object>> getEvent(){
		  return fpCalenderServiceImpl.getEventList();
    }

}
