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
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: beige;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
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

.btn {
	cursor: pointer;
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
					<h1 class="mt-4">Daily Muscle Life</h1>
					<!--   <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol> -->
					<jsp:include page="/WEB-INF/views/frame/menu9.jsp"></jsp:include>
					<!-- 우리가 만져야하는 부분임 -->
					<div class="main_content_part">
						<div class="ex_part btn" data-part="등">등</div>
						<div class="ex_part btn" data-part="가슴">가슴</div>
						<div class="ex_part btn" data-part="어깨">어깨</div>
						<div class="ex_part btn" data-part="팔">팔</div>
						<div class="ex_part btn" data-part="하체">하체</div>
						<textarea name="bookIntro" id="bookIntro_textarea"></textarea>
						<textarea name="bookContents" id="bookContents_textarea"></textarea>


						<div id="modal" class="modal-overlay ">
							<div class="modal-window">
								<div class="title">
									<h2>운동 루틴 추가</h2>
								</div>
								<div class="close-area">X</div>
								<div class="content">
									<div>
										날짜 : <input type="text" id="datepicker" name="calendarNo">
									</div>
									<div>
										횟수 : <input type="number" name="exerciseNumber">
									</div>
									<div>
										세트 : <input type="number" name="exerciseSet">
									</div>
									<div>
										무게 : <input type="number" name="exerciseWeight">
									</div>
									<div>
										<button class="addMemberExSet">등록</button>
									</div>

								</div>
							</div>
						</div>
						<div>

							<div class="main_content_exercise"></div>
							<div class="main_content_exercise_one"></div>
							<div class="add_exercise"></div>
						</div>
					</div>
					<!-- 여기까지 만지면 됨 -->
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
<script>

	window.onload = function(){
		$(".main_content_exercise").hide();
		$(".main_content_exercise_one").hide();
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
		htmlVal = "	<div>운동 이름</div>";
		for (var i = 0; i < result.length; i++) {
			htmlVal += '<div class="ex_part_one btn" data-part="'+result[i].ecode+'">'+result[i].exName+'</div>'
		}
		$(".main_content_exercise").html(htmlVal);
		$(".ex_part_one").click(expartoneHandler);
		$(".main_content_exercise").show();
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
		console.log(result);
		htmlVal = ""
		htmlVal += '<div class="ex_one" data-code="'+result.ecode+'" data-name="'+result.exName+'">'+result.epose+'<div>'+result.eposeLink+'</div><button id="btn-modal">모달 창 열기 버튼</button></div>'
		$(".main_content_exercise_one").html(htmlVal);
		$("#btn-modal").click(modalHandler);
		$(".main_content_exercise_one").show();
	}
	function modalHandler(){
	/** 모달부분*/
	const modal = document.getElementById("modal")
	function modalOn() {
	    modal.style.display = "flex"
	}
	function isModalOn() {
	    return modal.style.display === "flex"
	}
	function modalOff() {
	    modal.style.display = "none"
	}
	const btnModal = document.getElementById("btn-modal")
	btnModal.addEventListener("click", e => {
	    modalOn()
	})
	const closeBtn = modal.querySelector(".close-area")
	closeBtn.addEventListener("click", e => {
	    modalOff()
	})
	modal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("modal-overlay")) {
	        modalOff()
	    }
	})
	window.addEventListener("keyup", e => {
	    if(isModalOn() && e.key === "Escape") {
	        modalOff()
	    }
	})
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
	            alert(exerciseDate);
	        	  
	       }});                   
	       
	       //초기값을 오늘 날짜로 설정해줘야 합니다.
	       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	   });
	
		$(".addMemberExSet").click(onMemberExSetHandler);
	function onMemberExSetHandler(){
		console.log("123");
		$.ajax({
			url:"${pageContext.request.contextPath}/memberexset/insert",
			type: "post",
			data : {ecode : $(".ex_one").data("code")
				,exName : $(".ex_one").data("name")
			,memberId : ""
			,exerciseSet : ""
			,exerciseNumber : ""
			,exerciseWeight : ""}
			,success : "${pageContext.request.contextPath}/memberexset/list"
			,dataType : "json"
		})
	}
	/* 책 소개 */
	ClassicEditor
		.create(document.querySelector('#bookIntro_textarea'))
		.catch(error=>{
			console.error(error);
		});
		
	/* 책 목차 */	
	ClassicEditor
	.create(document.querySelector('#bookContents_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
	
		</script>
</html>
