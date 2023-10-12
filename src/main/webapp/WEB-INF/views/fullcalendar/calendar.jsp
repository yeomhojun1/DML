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
				     height: '1000px', // calendar 높이 설정
				     expandRows: true, // 화면에 맞게 높이 재설정
				     slotMinTime: '08:00', // Day 캘린더에서 시작 시간
				     slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
				     businessHours: true, // 주말 표시
				     
				        headerToolbar: { // today,달,주,일,리스트 기능
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
  				    	$("#listPlan [name=startDate]").val(info.dateStr);
  				    	$("#listPlan [name=endDate]").val(info.dateStr);
  				   	 	$("#listPlan").modal("toggle");
						$(".testContent div").remove();
  				   	 	$("#dmllist").html(info.dateStr);
  				   	 	
  				   		forPk=info.dateStr;
				 		forPk= forPk.replaceAll("-", "");
						forPk=forPk+"${member.memberId}";
				   		console.log(forPk);
				   		
				   		// view display
				   		dateVal=info.dateStr;
				 		dateVal=forPk.replaceAll("-", ".");
				 		//$(".testContent").html("");
				   		$(".forExercise").click(forExercisehandler);
				   		
				   		
				   		foodDate = info.dateStr;
				   		foodDate = foodDate.replaceAll("-", "");  // 20231012
				   		$(".forDiet").click(forDiethandler);
				   		

  				    	 /*  console.log(info);
  				    	  var clickDate = info.dateStr;
//   				    	  function add_ClickSchedule(clickDate){ // 클릭된 날짜부터 일정 추가
  				    	  var url = "${pageContext.request.contextPath}/calendar/calendarSelected?startDate="+clickDate+"&endDate="+clickDate;
  				    	  var name = "일정 추가";
  				    	  var option = "width = 600, height = 600 left = 100, top=50,location=no";
  				    	  window.open(url,name,option) */
  				    		//alert(year+"년"+month+"월"+day+"일");
//   				    	};
   				    	  // clickDate = clickDate.replaceAll("-", "");
  				    	// clickDate = parseInt(clickDate);
//   				    	alert(clickDate); //경고창
//   				    	 $(".btn-primary").click(expartClickHandler);
  				    	  
  				      },
  				      eventClick: (info) => { // 클릭한 일정 값 뽑아내기
  				     	$("#updatePlan [name=calendarno]").val(info.event.id);
  				     	$("#updatePlan [name=title]").val(info.event.title);
  				     	$("#updatePlan [name=startDate]").val(info.event.startStr);
  				    	$("#updatePlan [name=endDate]").val(info.event.endStr); 
  				    	$("#updatePlan [name=content]").val(info.event.extendedProps.content); 
  				    	$("#updatePlan").modal("toggle");
  				    	const title = info.event.title;
  				      	const id = info.event.id;
  				      	const start = info.event.startStr;
  				      	const end = info.event.endStr;
  				        const content = info.event.extendedProps.content; 
  				    	console.log(info);
				    	  /*  var url = "${pageContext.request.contextPath}/calendar/calendarSelected?calendarno="+id+"&startDate="+start+"&endDate="+end+"&title="+titles;
  				    	  var name = "일정 추가";
  				    	  var option = "width = 600, height = 600 left = 100, top=50,location=no";
  				    	  window.open(url,name,option);  */
  				    	 
  				      }
  				      
				     
				   }); // calendar
		   calendar.render();		
		  
			
  	});
	let forPk="";
	let dateVal="";
	let foodDate="";
	  function forExercisehandler(){
		  $.ajax({
				url : "${pageContext.request.contextPath}/memberexset/list.ajax",
				type : "get",
				data : {dayExSet :forPk },
				success : function(result) {
					displayHome(result);
				//	addEventAfterDisplay(".dayExSetPart", displayDayExSetPartHandler);
						},error : (request, status, error) => {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						},
						dataType : "json"
					})
	  }
	  function displayHome(result){
			htmlVal = '	<div class="exSetForDay row">';
			for (var i = 0; i < result.length; i++) {
				htmlVal += '<div class="exSetForDay_one card col-xl-3 text-center" data-dayexset="'+result[i].dayExSet+'" data-ecode="'+result[i].ecode+'"><div>'+result[i].exName+'</div><div>'+result[i].exerciseWeight+'kg</div><div>'+result[i].exerciseNumber+
				'회</div><div>'+result[i].exerciseSet+
				'세트</div><div ></div></div>'
					/* 	+ result[i].exerciseSet+'</div><div>
						+ result[i].exerciseNumber+'</div><div>
						+ result[i].exerciseNumber+'</div> */
			}
			htmlVal += '</div>'
			//addEventAfterDisplay(".deleteDayExSet", deleteDayExSetHandler);
			$(".testContent").html(htmlVal);
	  }
	  
		  function forDiethandler(){
			  $(".testContent").html("");
			    $.ajax({
					url:"${pageContext.request.contextPath}/diet/list",
					type: "post"
					//,contentType: "application/json"
					, data: 
						//JSON.stringify(objfinal)
					 {foodTime:"ALL" , foodDate: foodDate, memberId:"${member.memberId}"} 
					, dataType:"json"
					, success : function(result) {
						console.log("success");
						console.log(result);
						renderData(result.dietList);
					}
					, error : (request, status, error) => {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
				});  // ajax
		  }  // function forDiethandler
			
			function renderData(data)
			{
				var planBarDiv = document.querySelector('.Plan_bottom1_second_bar___Z7S8');
				var foodTimeValueConvert = '';
				htmlVal = "";
				
				console.log("data : " +  data);
			
			
			    // 데이터를 해당 요소에 동적으로 추가
			     data.forEach(function(item) {
			    	
			    	switch (item.foodTime) {
					  case 'A':
						  foodTimeValueConvert = "아침"
					    break;
					  case 'B':
						  foodTimeValueConvert = "점심"
						break;
					  case 'C':
						  foodTimeValueConvert = "저녁"
					    break;
					  case 'Z':
						  foodTimeValueConvert = "간식"
					    break;	  
					  default:
						  foodTimeValueConvert = "전체"
					}
			    	
					htmlVal += `
						<div class="Plan_bottom1_food_each__s9jUi">	
						 	<div class="Plan_bottom1_second_bar_foodcategory__Ew3pH foodTime">
							<span class="Plan_bottom1_second_bar_sub___m2EJ ">\${foodTimeValueConvert}</span>
							</div>				
							<div class="Plan_bottom1_second_bar_food__Nea0w">\${item.foodName}
							</div>
							 <div class="Plan_bottom1_second_bar_kcal__2i7Y2 foodQuality">
							수량<br> <span class="Plan_bottom1_second_bar_sub___m2EJ ">\${item.foodQuality}</span>
							</div> 
							<div class="Plan_bottom1_second_bar_kcal__2i7Y2 calorie">
								칼로리<br> <span class="Plan_bottom1_second_bar_sub___m2EJ " >\${item.calorie}</span>
							</div>
							<div class="Plan_bottom1_second_bar_carb__0dt0o carbs">
								탄수화물 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">\${item.crabs}</span>
							</div>
							<div class="Plan_bottom1_second_bar_protein__BHBRu protein">
								단백질 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">\${item.protein}</span>
							</div>
							<div class="Plan_bottom1_second_bar_fat__8Tyy8 fat">
								지방 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">\${item.fat}</span>
							</div>
							<div class="Plan_bottom1_second_bar_ctl__2Pelr foodcd">
								<button type="button" onclick="btnDeleteClickHandler(this)" value=\${item.foodGp}>삭제</button>
								
							</div>
						</div>
					`;
				
					
			    });   // each
			    
			 
				$(".testContent").html(htmlVal); 
				
			}// function renderData 
			
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
					
					<h2 style="text-align: center;">${member.mname }님의캘린더</h2> <!-- 멤버이름 님의 캘린더 -->
					
					
						<div>   <!-- 일정추가버튼 눌렀을시 일정추가 -->
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#insertPlan">
							일정추가</button>
						<div class="modal fade" id="insertPlan">
							<div class="modal-dialog modal-l">
							
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="add">${member.mname }의
											일정추가</h3>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="insertContent">
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
												<br>
												<!-- <input type="button" value="저장"
													onClick="send_save()"> -->
											</form>
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal" onClick="send_save()">저장</button>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal fade" id="listPlan"> <!--날짜를 클릭했을떄 나오는 모달창  -->
						<!-- 	tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true" -->

						<div class="modal-dialog modal-xl">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="dmllist">Modal
										title</h5>
									<button type="button" class="btn-close"
										data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div>
										<ul class="col-xl-12 nav justify-content-center">
											<li class="col-xl-4 nav-item text-center forExercise"><a
												class="nav-link active " aria-current="page" href="#">운동</a>
											</li>
											<li class="col-xl-4 nav-item text-center forDiet"><a
												class="nav-link active " aria-current="page" href="#">식단</a></li>
											<li class="col-xl-4 nav-item text-center forcalendar"><a
												class="nav-link" href="#">일정</a></li>
										</ul>
									</div>
								<script> /* 날짜 클릭시 일정부분에서 그날에 해당하는 데이터값 불러오는 ajax */
								 $(".forcalendar").click(forExecisehandler);
								  function forExecisehandler() {
									    var date = $("#dmllist").html();
									    console.log(date);
									    $.ajax({
									        type: "POST",
									        url: "${pageContext.request.contextPath}/calendar/dateNow",
									        data: { "date": date }, // 데이터를 JSON 객체로 전달
									        success: function(response) {
									            // 성공 처리 코드
									        	var now = response.dateNowList;
												  console.log(JSON.stringify(now));
												  $(".testContent div").remove();
												  $(".testContent").append("<div>"+JSON.stringify(now)+"</div>");
									        },
									        error: (request, status, error) => {
									            alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + request.error);
									        }
									    });
									}
								</script>
									<div class="testContent">
										
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div id='calendar'></div> <!-- 캘린더 불러오는 코드 -->
					
					<!-- 모달창 -->

					<div class="modal fade" id="updatePlan"> <!--수정페이지 모달창  -->
						<div class="modal-dialog modal-xm">
							<div class="modal-content">
								<div class="modal-header">
									<h3 class="modal-title" id="fix">${member.mname }의
										일정수정</h3>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div>
										<form id="calendarUpDate">
											<input type="hidden" name="calendarno" id="calendarno"
												value="${calendarno}" /> <input type="hidden"
												name="memberId" id="memberId" value="${member.memberId}" />
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
											<br>
										</form>
										<input type="button" value="수정" onclick="send_update()" /> <input
											type="button" value="삭제" onClick="send_delete()">
									</div>


								</div>





							</div>


						</div>
					</div>

					<!-- 	<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal" onclick="send_update()">수정</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal" onClick="send_delete()">삭제</button>

									</div> -->
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
	<script>
			
		</script>
</body>
</html>