<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
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

<script src='<c:url value="/js/fullcalendar.global.js" />'></script>
<link href='<c:url value="/css/fullcalendar.css" />' rel='stylesheet' />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>

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
  				      dateClick : (info)=>{ // 선택한 날짜 값 뽑아내기
  				    	  console.log(info);
  				    	  const clickDate = info.dateStr;
  				    	  alert(clickDate); //경고창d
  				    	  
  				      },
  				      eventClick: function(info){ // 클릭한 일정 값 뽑아내기
  				    	  const title = info.event.title;
  				    	alert(title); //경고창
  				      }
				     
				   });
				   calendar.render();		
  	});
  	$("#btn-modal1").click(()=>youtubeModalHandler(testOjbect));
  	function youtubeModalHandler(result){
		console.log(result);
		$("#youtubeModal").remove();
		const bigModal=`
			<div id="youtubeModal" class="modal-overlay">
			<div class="modal-window ">
				<div class="title">
					<h2 class="exModalTitle"></h2>
				</div>
				<div class="close-area">X</div>
				<div class="content col-xl-12">
					<div class="col-xl-12">
						<div class="exModalContent col-xl-12"></div>
						<div class="close-area">닫기</div>
					</div>
				</div>
			</div>
		</div>
		`
		$(".bigModalCss").append(bigModal);
		const youtubeModal= document.getElementById("youtubeModal")
	   	if(!isYoutubeModalOn()) {
	   		youtubeModalOn();
    	}
		youtubeModal.addEventListener("click", e => {
	    	const evTarget = e.target
	  		  if(evTarget.classList.contains("modal-overlay")) {
		    	if(isYoutubeModalOn) {
		    		youtubeModalOff()
		    	}
		    }
		})
		function isYoutubeModalOn(){
			return modal.style.display === "flex"
		}
		function youtubeModalOn() {
			youtubeModal.style.display ="flex"
		}
		function youtubeModalOff() {
			youtubeModal.style.display = "none"
		}
		const closeBtn1 = youtubeModal.querySelector(".close-area")
			closeBtn1.addEventListener("click", e => {
			youtubeModalOff()
		})
		const eposeLink1 = '<div class="eposeLinkCss">'+result.eposeLink+'</div>'
		$(".exModalTitle").append(result.exName);
		$(".exModalContent").append(eposeLink1);
		$(".eposeLinkCss>iframe").prop("width", "100%");
	}
  </script>
<style>
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: beige;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 35%;
	height: 500px;
	position: relative;
	top: -200px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: black;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: black;
}

#youtubeModal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#youtubeModal .modal-window {
	background: beige;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 50%;
	height: 80%;
	position: fix;
	right: 20%;
	left: 30%;
	top: 20%;
	padding: 10px;
}

#youtubeModal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: black;
}

#youtubeModal .title h2 {
	display: inline;
}

#youtubeModal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#youtubeModal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: black;
}
</style>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">

					<div>
						<h1 class="mt-4">Daily Muscle Life</h1>
					</div>
					<!--   <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol> -->
					<jsp:include page="/WEB-INF/views/frame/menu9.jsp"></jsp:include>
					<div id='calendar'></div>
					<div>
						<h2 style="text-align: center;">손범규님의 캘린더</h2>
						<button id="btn-modal1">일정추가</button>
					</div>
				</div>
				<div class="bigModalCss">
					<div id="youtubeModal" class="modal-overlay">
						<div class="modal-window ">
							<div class="title">
								<h2 class="exModalTitle"></h2>
							</div>
							<div class="close-area">X</div>
							<div class="content col-xl-12">
								<div class="col-xl-12">
									<div class="exModalContent col-xl-12"></div>
									<div class="close-area">닫기</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
</body>
</html>
