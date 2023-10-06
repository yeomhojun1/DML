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
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css" />
<script
	src="${pageContext.request.contextPath }/resources/js/custom-calendar.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src='<c:url value="/js/fullcalendar.global.js" />'></script>
<link href='<c:url value="/css/fullcalendar.css" />' rel='stylesheet' />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>

<script>
 	window.onload = function() {
		  $("#exampleModal").hide();
	} 
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
		           // 달력 일정 목록 
		              events: [
		                 // 나의 일정 목록
		                 <c:forEach var="showList" items="${getCalendarList}">
		                 {
		                    id    : '${showList.calendarno}',
		                    title : '${showList.title}',
		                    start : '${showList.startDate}',
		                    end    : '${showList.endDate}',
		                   content : '${showList.content}'
		                 },
		                 </c:forEach>
		                 {
		                    title : '',
		                    start : ''
		                 }
		              ],
				        
  				      dateClick : (info)=>{ // 선택한 날짜 값 뽑아내기
  				    	  $("#insertPlan").modal("toggle");
  				    	 /*  console.log(info);
  				    	  var clickDate = info.dateStr;
//   				    	  function add_ClickSchedule(clickDate){ // 클릭된 날짜부터 일정 추가
  				    	  var url = "${pageContext.request.contextPath}/calendar/calendarSelected?startDate="+clickDate+"&endDate="+clickDate;
  				    	  var name = "일정 추가";
  				    	  var option = "width = 600, height = 600 left = 100, top=50,location=no";
  				    	  window.open(url,name,option) */
  				    		//alert(year+"년"+month+"월"+day+"일");
//   				    	};
//   				    	  clickDate = clickDate.replaceAll("-", "");
//   				    	clickDate = parseInt(clickDate);
//   				    	alert(clickDate); //경고창
//   				    	 $(".btn-primary").click(expartClickHandler);
  				    	  
  				      },
  				      eventClick: function(info){ // 클릭한 일정 값 뽑아내기
  				    	const title = info.event.title;
  				      	const id = info.event.id;
  				      	const start = info.event.startStr;
  				      	const end = info.event.endStr;
  				        const titles = info.event.title;
  				   	 	$("#startdate").html(start);
  				   	 	$("#startdate").html(start);
  				    	console.log(info);
				    	/*   var url = "${pageContext.request.contextPath}/calendar/calendarSelected?calendarno="+id+"&startDate="+start+"&endDate="+end+"&title="+titles;
  				    	  var name = "일정 추가";
  				    	  var option = "width = 600, height = 600 left = 100, top=50,location=no";
  				    	  window.open(url,name,option); */
  				    	 $("#updatePlan").modal("toggle");
  				      }
				     
				   }); // calendar
		   calendar.render();		
		  
			
  	});
  
  </script>
<style>
.btn {
	cursor: pointer;
}

.ex_part, ex_part_one, ex_one {
	display: block;
}

.btn:hover {
	background-color: red;
}

.exercisetest {
	height: 400px;
}

.ex_part {
	height: 20%;
}

.ex_part_one {
	height: 10%;
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

						<h2 style="text-align: center;">${member.mname }님의캘린더</h2>

						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
							Launch demo modal</button>
						<div class="modal fade" id="insertPlan" >
					<!-- 	tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true" -->
							
							<div class="modal-dialog modal-xl">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Modal
											title</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div>
											<form id="calendarData">
												<div>
													제목 : <input type="text" name="title" id="title"
														placeholder="제목 입력">
												</div>
												<br>
												<div>
													시작 날짜 : <input type="date" name="startDate" id="startDate"
														size="12" value="${startDate}" />
												</div>
												<br>
												<div>
													종료 날짜 : <input type="date" name="endDate" id="endDate"
														size="12" value="${endDate}" />

												</div>
												<br> 설명
												<div>
													<textarea name="content" id="content" rows="10" cols="30"></textarea>
												</div>
												<br> <input type="button" value="저장"
													onClick="send_save()">



											</form>
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save
											changes</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 모달창 -->
					<div class="modal fade" id="udpatePlan" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form>
										<div>
											<span>무게 : </span> <input type="number"
												class="addExerciseWeight text-center">
										</div>
										<div>
											<span>횟수 : </span> <input type="number"
												class="addExerciseNumber text-center">
										</div>
										<div>
											<span>세트 : </span> <input type="number"
												class="addExerciseSet text-center">
										</div>
										<button type="button"
											class="btn btn-primary updateDayExSet floatRight mt-3">저장</button>
										<button type="button"
											class="btn btn-secondary floatRight mt-3"
											data-bs-dismiss="modal">닫기</button>

									</form>
								</div>

							</div>

						</div>
					</div>
					<button type="button" data-bs-toggle="modal"
						data-bs-target="#exampleModal" class="sendDayExSet">수정</button>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script>
let contextPath = "${pageContext.request.contextPath }";
</script>
	<script
		src="${pageContext.request.contextPath }/resources/js/custom-calendar.js"></script>
</body>
</html>