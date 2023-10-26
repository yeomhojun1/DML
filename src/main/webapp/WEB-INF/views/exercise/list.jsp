<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Calendar"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Daily Muscle Life | 운동 추가</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script language="javascript"
	src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet" />

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
	z-index: 9999;
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

.btn {
	cursor: pointer;
}

.ex_part, ex_part_one, ex_one {
	display: block;
}

.btn:hover {
	color: #00aeef;
	border : white;
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

.ranktable { margin-top : 10px; border : 1px solid #fff; padding: 5px; }
.rankth { text-align : center; }
.rankth, .ranktd { border : 1px solid #fff; padding: 5px; }
</style>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="Menu_container">
							<ul class="Menu_list">
								<li style="font-weight: bold;"><a>운동 추가</a></li>
							</ul>
						</div>
					<jsp:include page="/WEB-INF/views/frame/menu.jsp"></jsp:include>
					<!-- 우리가 만져야하는 부분임 -->
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
							<!-- <div class="appendtest"></div>
					 	<textarea name="bookIntro" id="bookIntro_textarea"></textarea>
						<textarea name="bookContents" id="bookContents_textarea"></textarea> -->
						</div>
					</div>
					<!-- 여기까지 만지면 됨 -->
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>


	<!-- 	<div id="modal" class="modal-overlay ">
		<div class="modal-window">
			<div class="title">
				<h2>운동 루틴 추가</h2>
			</div>
			<div class="close-area">X</div>
			<div class="content">
				<div>
					<span>날짜 : </span><input type="text" id="datepicker"
						name="calendarNo">
				</div>
				<div class="divAddExerciseWeight">
					<span>무게 : </span><input type="text" class="addExerciseWeight"
						name="ExerciseWeight">
				</div>
				<div class="divAddExerciseNumber">
					<span>횟수 : </span><input type="number" class="addExerciseNumber"
						name="ExerciseNumber">
				</div>
				<div class="divAddExerciseSet">
					<span>세트 : </span><input type="number" class="addExerciseSet"
						name="ExerciseSet">
				</div>

				<div class="divButtonMemberExSet"></div>

			</div>
		</div>
	</div> -->

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
	<!-- 모달 연습 -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">운동 추가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<span>날짜 : </span><input type="text" id="datepicker"
							name="calendarNo">
					</div>
					<div class="divAddExerciseWeight">
						<span>무게 : </span><input type="text" class="addExerciseWeight"
							name="ExerciseWeight">
					</div>
					<div class="divAddExerciseNumber">
						<span>횟수 : </span><input type="number" class="addExerciseNumber"
							name="ExerciseNumber">
					</div>
					<div class="divAddExerciseSet">
						<span>세트 : </span><input type="number" class="addExerciseSet"
							name="ExerciseSet">
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-outline-primary divButtonMemberExSet">저장</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 두번째 모달 연습 -->
	<div class="modal fade modal-xl" id="exampleModal6" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title exModalTitle" id="exampleModalLabel"></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body exModalContent"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	<script>
	window.onload = function() {
		$(".divAddExerciseWeight").hide();
		$(".divAddExerciseNumber").hide();
		$(".divAddExerciseSet").hide();
	}
	<!-- 운동부위를 선택하면 관련운동 나오도록하거나 검색했을때 나오도록함-->
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
		htmlVal += '<div class="ex_one col-xl-12" data-code="'+result.ecode+'" data-name="'+result.exName+'">'+result.epose+'<br><div class="btn-group" role="group" aria-label="Basic outlined example"><button type="button" class="btn btn-outline-primary btn-modal1 " data-bs-toggle="modal" data-bs-target="#exampleModal6">'
		  +'유튜브 보기</button><button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"'
			+'data-bs-target="#exampleModal">운동 추가</button></div></div></div>'
		
		$(".exercisetest").append(htmlVal);
		var testOjbect ={eposeLink: result.eposeLink,exName: result.exName };
		$(".btn-modal1").click(()=>youtubeModalHandler(testOjbect));
	
	}
	function youtubeModalHandler(result){
		console.log("youtubeModalHandler : "+result);
		const eposeLink1 = '<div class="eposeLinkCss">'+result.eposeLink+'</div>'
		$(".exModalTitle").html(result.exName);
		$(".exModalContent").html(eposeLink1);
		$(".eposeLinkCss>iframe").prop("width", "100%");
	}
	 $(function() {
	       //input을 datepicker로 선언
	       $("#datepicker").datepicker({
	          dateFormat: 'yy-mm-dd' //달력 날짜 형태
	           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	           ,changeYear: true //option값 년 선택 가능
	           ,changeMonth: true //option값  월 선택 가능                
	           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
	           ,buttonText: "선택" //버튼 호버 텍스트              
	           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	           ,maxDate: "+5Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
	     	 ,onSelect: function() { 
	            var exerciseDate = $.datepicker.formatDate("yymmdd",$("#datepicker").datepicker("getDate")); 
	            exerciseDate = $("#datepicker").val();
	            exerciseDate=exerciseDate.replaceAll("-", "");
	            var dayExSet = exerciseDate+"${member.memberId}"+ $(".ex_one").data("code")
	             $.ajax({
	    			url:"${pageContext.request.contextPath}/memberexset/one",
	    			type: "get",
	    			data : {dayExSet : dayExSet}
	    			,success : function(result){
	    				if(result){
	    					$(".divAddExerciseWeight").show();
	    					$(".divAddExerciseNumber").show();
	    					$(".divAddExerciseSet").show();
	    					//$(".addExerciseWeight").val(result.exerciseweight);
							$("[name=ExerciseWeight]").val(result.exerciseWeight);
							$("[name=ExerciseNumber]").val(result.exerciseNumber);
							$("[name=ExerciseSet]").val(result.exerciseSet);
							$(".addMemberExSet").remove();
							var appendButton=`
							<button class="updateMemberExSet">수정</button>
							`
							$(".divButtonMemberExSet").html("수정");
							$(".divButtonMemberExSet").removeClass("divButtonMemberExSet");
							$(".divButtonMemberExSet").addClass("updateMemberExSet");
							$(".updateMemberExSet").click(updateMemberExSetHandler);
	    				}else{
	    					console.log("result is null");
	    					$(".divAddExerciseWeight").show();
	    					$(".divAddExerciseNumber").show();
	    					$(".divAddExerciseSet").show();
	    					$("[name=ExerciseWeight]").val(0);
							$("[name=ExerciseNumber]").val(0);
							$("[name=ExerciseSet]").val(0);
							$(".updateMemberExSet").remove();
							var appendButton=`
								<button class="addMemberExSet">등록</button>
								`
							$(".divButtonMemberExSet").html("등록");
							$(".divButtonMemberExSet").removeClass("updateMemberExSet");
							$(".divButtonMemberExSet").addClass("addMemberExSet");
							$(".addMemberExSet").click(addMemberExSetHandler);
	    				}
	    				
	    				},
	    			error : function(){
	    				console.log("error");
	    			}, 
	    			dataType: "json"
	    		
	    		}) 
	        	  
	       }});                   
	       //초기값을 오늘 날짜로 설정해줘야 합니다.
	       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	   });
	
		$(".addMemberExSet").click(addMemberExSetHandler);
		function addMemberExSetHandler(){
		var dateVal = $("#datepicker").val()
		//replace([기존문자],[바꿀문자])
		dateVal= dateVal.replaceAll("-", "");
				$.ajax({
			url:"${pageContext.request.contextPath}/memberexset/insert",
			type: "post",
			data : {ecode : $(".ex_one").data("code")
				,exName : $(".ex_one").data("name")
			,memberId : "${member.memberId}"
			,exerciseDate: dateVal
			,exerciseSet : $(".addExerciseSet").val()
			,exerciseNumber : $(".addExerciseNumber").val()
			,exerciseWeight : $(".addExerciseWeight").val()}
			,success : function(){
				
				$(".divAddExerciseWeight").hide();
				$(".divAddExerciseNumber").hide();
				$(".divAddExerciseSet").hide();
				location.reload(true);
			}
			,error : function(){
				console.log("error");
				}
			})
		}
		$(".updateMemberExSet").click(updateMemberExSetHandler);
		function updateMemberExSetHandler(){
		var dateVal = $("#datepicker").val()
		//replace([기존문자],[바꿀문자])
		dateVal= dateVal.replaceAll("-", "");
				$.ajax({
			url:"${pageContext.request.contextPath}/memberexset/update",
			type: "post",
			data : {
			dayExSet: dateVal+"${member.memberId}"+$(".ex_one").data("code")
			,exerciseSet : $(".addExerciseSet").val()
			,exerciseNumber : $(".addExerciseNumber").val()
			,exerciseWeight : $(".addExerciseWeight").val()}
			,success : function(){
				
				$(".divAddExerciseWeight").hide();
				$(".divAddExerciseNumber").hide();
				$(".divAddExerciseSet").hide();
				location.reload(true);
			}
			,error : function(){
				console.log("error");
				}
			})
		}
	
</script>
</body>
</html>
