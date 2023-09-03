package kh.project.dml.calender.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.project.dml.calender.model.service.FpCalenderService;

@Controller
@RequestMapping("/calender")
public class FpCalenderController {

	@Autowired
	FpCalenderService fpcalenderservice;
	
	@RequestMapping //기본 페이지 표시
	public String viewCalendar(){
		return "/fullcalendar/calendar";
	}

    @GetMapping("/event") //ajax 데이터 전송 URL
    public @ResponseBody List<Map<String, Object>> getEvent(){
		  return fpcalenderservice.getEventList();
    }

}
