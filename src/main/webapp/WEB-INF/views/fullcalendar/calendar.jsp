<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Daily Muscle Life</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ck에디터적용코드  -->
<script language="javascript"
	src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
<<<<<<< Updated upstream
	<script src='<c:url value="/js/fullcalendar.global.js" />'></script>
  <link href='<c:url value="/css/fullcalendar.css" />' rel='stylesheet' />
  <script>
=======
<script src='<c:url value="/js/fullcalendar.global.js" />'></script>
<link href='<c:url value="/css/fullcalendar.css" />' rel='stylesheet' />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<style>
.modal {
	display: none;
}
</style>
<script>
>>>>>>> Stashed changes
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
				     businessHours: true, // 주말 표시
				     
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
				      googleCalendarApiKey : "AIzaSyCrDZYze51w5DjhysFgTIdb7KEuynMof3k" 
				          ,eventSources : [
				          // 대한민국의 공휴일
				              {
				                    googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
				                  , color : "#FF0000"
				                  , textColor : "#FFFFFF"
				              }],
				     // api 관련 기능 추가 하기
				     events: 
				     [
					    { // this object will be "parsed" into an Event Object
					      title: '술+치킨먹는날',// a property!
					      start: '2023-09-01', // a property!
					      end: '2023-09-03', // a property! ** see important note below about 'end' **
					     
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
<<<<<<< Updated upstream
  					 
=======
>>>>>>> Stashed changes
  				      dateClick : (info)=>{ // 선택한 날짜 값 뽑아내기
  				    	  console.log(info);
  				    	  const clickDate = info.dateStr;
  				    	  alert(clickDate); //경고창d
  				    	  //
  				    	  $(".modal #date1").html(clickDate);
  				    	  $(".modal").show();
  				    	  
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
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
<<<<<<< Updated upstream
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
	  <div class="modal" >
	  <div class="modal-content">
	  ahekfckd
	  <span id="date"></span>
	  </div>
	  </div>
=======
					<h1 class="mt-4">Daily Muscle Life</h1>
					<!--   <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol> -->
					<jsp:include page="/WEB-INF/views/frame/menu9.jsp"></jsp:include>
					<div id='calendar'></div>
					<h2 style="text-align: center;">손범규님의 캘린더</h2>
					<h2 style="text-align: center;">${loginedMember.name}</h2>
					<div id='calendar' style="position: relative;">
						<c:if test="${loginedMember ne null}">
							<button class="login-btn" type="button"
								onclick="location.href='logout'">로그아웃</button>
						</c:if>
						<c:if test="${loginedMember ne null}">
							<button class="mypage-btn" type="button"
								onclick="location.href='mypage'">마이페이지</button>
						</c:if>
						<c:if test="${loginedMember ne null}">
							<button class="add-btn" type="button"
								onclick="add_btnSchedule();">일정추가</button>
						</c:if>
						<c:if test="${loginedMember eq null}">
							<button class="login-btn" type="button" onclick="login_form();">로그인</button>
						</c:if>
						<c:if test="${loginedMember eq null}">
							<button class="add-btn" type="button"
								onclick="location.href='join'">회원가입</button>
						</c:if>
					</div>
					<div class="modal">
						<div class="modal-content">

							<div id="date1"></div>
						</div>
					</div>
>>>>>>> Stashed changes
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
