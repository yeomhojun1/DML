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
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
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
		           // 달력 일정 목록 
		              events: [
		                 // 나의 일정 목록
		                 <c:forEach var="showList" items="${getCalendarList}">
		                 {
		                    id    : '${showList.getCalendarno()}',
		                    title : '${showList.getTitle()}',
		                    start : '${showList.getStartdate()}',
		                    end    : '${showList.getEnddate()}'
		                 },
		                 </c:forEach>
		                 {
		                    title : '',
		                    start : ''
		                 }
		              ],
				        
  				      dateClick : (info)=>{ // 선택한 날짜 값 뽑아내기
  				    	  console.log(info);
  				    	  var clickDate = info.dateStr;
//   				    	  function add_ClickSchedule(clickDate){ // 클릭된 날짜부터 일정 추가
  				    	  var url = "${pageContext.request.contextPath}/calendar/calendarSelected?startDate="+clickDate+"&endDate="+clickDate;
  				    	  var name = "일정 추가";
  				    	  var option = "width = 600, height = 600 left = 100, top=50,location=no";
  				    	  window.open(url,name,option)
  				    		//alert(year+"년"+month+"월"+day+"일");
//   				    	};
//   				    	  clickDate = clickDate.replaceAll("-", "");
//   				    	clickDate = parseInt(clickDate);
//   				    	alert(clickDate); //경고창d
//   				    	 $(".btn-primary").click(expartClickHandler);
  				    	  
  				      },
  				      eventClick: function(info){ // 클릭한 일정 값 뽑아내기
  				    	  const title = info.event.title;
  				    	alert(title); //경고창
  				      }
				     
				   }); // calendar
		   calendar.render();		
		   $(".ex_part").click(expartClickHandler);
			function expartClickHandler(){
				$.ajax({
				url:"${pageContext.request.contextPath}/exercise/searchlist",
					type: "get"
					, data : {searchword : $(this).data("part")}
					, success : function(result){displayExercisePart(result)}		
					, dataType: "json"
				})
			}
			
			function displayExercisePart(result){
				$(".ex_part_one_group").remove();
				$(".ex_one").remove();
				$(".ex_part_one").remove();
				$(".ex_one_group").remove();
				htmlVal = '	<div class="ex_part_one_group col-xl-4">';
				for (var i = 0; i < result.length; i++) {
					htmlVal += '<div class="ex_part_one btn col-xl-12" data-part="'+result[i].ecode+'">'+result[i].exName+'</div>'
				}
				htmlVal +='</div>'
				$(".exercisetest").append(htmlVal);
				$(".ex_part_one").click(expartoneHandler);
				//for()
				//$(".aaaa").html("<p>"+result[0].mid+"</p>");
				//$(".aaaa").show();
			}
			<!-- 운동 하나를 선택하면 그 운동에 대한 상세정보들이 나오도록함 -->
			function expartoneHandler(){
			
				$.ajax({
					url:"${pageContext.request.contextPath}/exercise/one",
					type: "get",
					data : {ecode : $(this).data("part")},
					success : displayExercisePartOne,
					dataType : "json"
				})
			}
			
			function displayExercisePartOne(result){
			
				$(".ex_one").remove();
				$(".ex_one_group").remove();
				htmlVal = "<div class='col-xl-4 ex_one_group'>"
				htmlVal += '<div class="ex_one col-xl-12" data-code="'+result.ecode+'" data-name="'+result.exName+'"><h4>'+result.epose+'</h4></div></div>'
				$(".exercisetest").append(htmlVal);
				$("#btn-modal").click(modalHandler);
				var testOjbect ={eposeLink: result.eposeLink,exName: result.exName };
				$("#btn-modal1").click(()=>youtubeModalHandler(testOjbect));
			
			}
			
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
}</style>
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
						<div class="modal fade" id="exampleModal" tabindex="-1"	aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-xl">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Modal
											title</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="main_content_part col-xl-12">
											<!-- <div class="appendtest123"></div> -->
											<div class="exercisetest row">
												<div class="col-xl-4 ex_part_group">
													<div class="ex_part btn col-xl-12" data-part="등">등</div>
													<div class="ex_part btn col-xl-12" data-part="가슴">가슴</div>
													<div class="ex_part btn col-xl-12" data-part="어깨">어깨</div>
													<div class="ex_part btn col-xl-12" data-part="팔">팔</div>
													<div class="ex_part btn col-xl-12" data-part="하체">하체</div>
												</div>
										
											</div>
										</div>
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
	
	
	</script>
		
</body>
</html>
