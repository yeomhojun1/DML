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
				     locale: 'ko', // 한국어 설정
				     height: '700px', // calendar 높이 설정
				     expandRows: true, // 화면에 맞게 높이 재설정
				     slotMinTime: '08:00', // Day 캘린더에서 시작 시간
				     slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
				    
				     
				        headerToolbar: { // todat,달,주,일,리스트 기능
				            left: 'prev,next today',
				            center: 'title',
				            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
				          },
				     //schedule(스케줄)이 생기면 아래 + 버튼을 누를면 스케줄이 표시되는코드
				     dayMaxEventRows: true, // for all non-TimeGrid views
				     views: {
				       timeGrid: {
				         dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
				       }
				     },
    
				     // api 관련 기능 추가 하기
				     events: 
				     [
					    { // this object will be "parsed" into an Event Object
					      title: '술+치킨먹는날',// a property!
					      start: '2023-09-01', // a property!
					      end: '2023-09-03', // a property! ** see important note below about 'end' **
					      display: 'background'
					    },
					    { // this object will be "parsed" into an Event Object
					      title: '곱창전골먹는날', // a property!
					      start: '2023-09-04', // a property!
					      end: '2023-09-07' // a property! ** see important note below about 'end' **
					     
						},
						{ // this object will be "parsed" into an Event Object
						      title: '삼겹살+술먹는날', // a property!
						      start: '2023-09-10', // a property!
						      end: '2023-09-17' // a property! ** see important note below about 'end' **
						     
							},
							//같은날짜에 스케줄이 있으면 아래에 (+2)가 생김
							 {
					            title: '점심 술약속',
					            start: '2023-09-10T12:20:10'
					          },	
					          {
						            title: '조퇴하는날',
						            start: '2023-09-10T13:10:00'
						      },
						      {
						            title: '결석하는날',
						            start: '2023-09-10T09:05:00'
						      },
						      {
						            title: '침대에누워있어야되는날',
						            start: '2023-09-10T07:10:00'
						      },	
						      {
						            title: 'KH 시험점수 확인하기',
						            url: 'https://www.kh-academy.co.kr/', // 클릭시 해당 url로 이동
						            start: '2023-09-26'
						          },
						      {
							            title: '곱창전골 꼭 먹어야되는날 (부엉이산장)',
							            url: 'https://www.owlmtcabin-official.com/home', // 클릭시 해당 url로 이동
							            start: '2023-09-26'
							       }

					    
						
  					 ],
  					 
  					  
  					 
  				      dateClick : function(info){ // 선택한 날짜 값 뽑아내기
  				    	  const clickDate = info.dateStr;
  				    	  alert(clickDate); //경고창
  				      },
  				      eventClick: function(info){ // 클릭한 일정 값 뽑아내기
  				    	  const title = info.event.title;
  				    	alert(title); //경고창
  				      }
  				      
				     
				     
				   });
				   calendar.render();		
  	});
  </script>
  </head>
  <body>
    <div id='calendar'></div>
    <h2 style="text-align:center;">손범규님의 캘린더</h2>
		<h2 style="text-align:center;">${loginedMember.name}</h2>
	  <div id='calendar' style="position: relative;" >
	  	<c:if test="${loginedMember ne null}"><button class="login-btn" type="button" onclick="location.href='logout'">로그아웃</button></c:if>
	  	<c:if test="${loginedMember ne null}"><button class="mypage-btn" type="button" onclick="location.href='mypage'">마이페이지</button></c:if>
	  	<c:if test="${loginedMember ne null}"><button class="add-btn" type="button" onclick="add_btnSchedule();">일정추가</button></c:if>
	  	<c:if test="${loginedMember eq null}"><button class="login-btn" type="button" onclick="login_form();">로그인</button></c:if>
	  	<c:if test="${loginedMember eq null}"><button class="add-btn" type="button" onclick="location.href='join'">회원가입</button></c:if>
	  </div>
  </body>
  
</html>