<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    
  <script src='<c:url value="/js/fullcalendar.global.js" />'></script>
  
  <script>
  	document.addEventListener('DOMContentLoaded', function() {
  	
  	// div id 값 
    var calendarEl = document.getElementById('calendar');

    // FullCalendar API 호출
    var calendar = new FullCalendar.Calendar(calendarEl, {
				     initialView: 'dayGridMonth',
				     
				     // api 관련 기능 추가 하기
				     events: 
				     [
					    { // this object will be "parsed" into an Event Object
					      title: '술+치킨먹는날', // a property!
					      start: '2023-09-01', // a property!
					      end: '2023-09-03', // a property! ** see important note below about 'end' **
					      display: 'background'
					    },
					    { // this object will be "parsed" into an Event Object
					      title: '곱창전골먹는날', // a property!
					      start: '2023-09-04', // a property!
					      end: '2023-09-07' // a property! ** see important note below about 'end' **
						}
  					 ],
  					 
  				      dateClick : function(info){ // 선택한 날짜 값 뽑아내기
  				    	  const clickDate = info.dateStr;
  				    	  alert(clickDate);
  				      },
  				      eventClick: function(info){ // 클릭한 일정 값 뽑아내기
  				    	  const title = info.event.title;
  				    	alert(title);
  				      }
				     
				     
				   });
				   calendar.render();		
  	});
  </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
  
</html>