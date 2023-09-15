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

import kh.project.dml.calender.model.service.FpCalenderServiceImpl;

@Controller
@RequestMapping("/calendar")
public class FpCalenderController {

	@Autowired
	FpCalenderServiceImpl fpCalenderServiceImpl;
	
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
