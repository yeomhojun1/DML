
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath }/resources/css/fontello.css"
	rel="stylesheet">








<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description"
	content="Fitness - provide the easy responsive free website templates. You can easily customize and make your own website for your startup business.">
<meta name="keywords"
	content="bootstrap template, Responsive Template, Website Template, free website templates, free website template download ">
<title>Fitness-The Gym Club | Bootstrap | Free Responsive
	Website Templates</title>

<!-- style CSS -->


<!-- Font Awesome CSS -->


<!-- font css -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i%7cRoboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.main1 {
	width: 1750px;
	height: 1000px;
	margin: 0 0 0 175px;
}

#modal {
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

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
	background: rgba(69, 139, 197, 0.70);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
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
	color: white;
}

.btn {
	cursor: pointer;
}
</style>
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
</head>

<body class="animsition">
	<div class="top-bar">
		<!-- top-bar -->
		<div class="container">
			<div class="row">
				<div class="col-md-3 hidden-sm hidden-xs bdr">
					<div class="time-info">
						<p class="time-text">Mon - Sat : 6 am-9pm - Sun : 8am-6pm</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-4 hidden-xs bdr">
					<div class="call-info">
						<!-- call-info -->
						<p class="call-no">+1 (800)-123-456 / 856</p>
					</div>
					<!-- /.call-info -->
				</div>
				<div class="col-md-3 col-sm-4 hidden-xs bdr">
					<div class="mail-info">
						<p class="mail-text">ghwnswkd123@naver.com</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-4 col-xs-12">
					<div class="top-search">
						<div class="custom-search-input">
							<div class="input-group  ">
								<input type="text" class="  search-query form-control"
									placeholder="Search"> <span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-header">
		<div class="header">
			<!-- navigation -->
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<div class="logo">
							<a href="index.html"><img
								src="${pageContext.request.contextPath }/resources/images/logo.png"></a>
						</div>
					</div>
					<div class="col-md-9 col-sm-12">
						<div class="navigation pull-right" id="navigation">
							<ul>
								<li class="active"><a href="index.html" title="Home"
									class="animsition-link">Home</a></li>
								<li><a href="classes-list.html" title="Classes"
									class="animsition-link">체중관리</a>
									<ul>
										<li><a href="classes-list.html" title="Classes List"></a>체중관리</li>
										<li><a href="classes-list.html" title="Classes List"></a>체조성
											기록</li>
										<li><a href="classes-list.html" title="Classes List"></a>활동
											관리</li>

									</ul></li>
								<li><a href="blog-default.html" title="Blog"
									class="animsition-link">식단 관리</a>
									<ul>
										<li><a href="blog-default.html" title="Blog"
											class="animsition-link">식단 짜기</a></li>
										<li><a href="blog-default.html" title="Blog"
											class="animsition-link">밀프랩 도우미</a></li>
										<li><a href="blog-default.html" title="Blog"
											class="animsition-link">보충제 활용</a></li>

									</ul></li>
								<li><a href="testimonial.html" title="Features"
									class="animsition-link">운동 도우미</a>
									<ul>
										<li><a href="testimonial.html" title="Testimonial"
											class="animsition-link">다이어트 도우미</a></li>
										<li><a href="testimonial.html" title="Testimonial"
											class="animsition-link">바디프로필 도우미</a></li>
										<li><a href="testimonial.html" title="Testimonial"
											class="animsition-link">치팅데이 도우미</a></li>
										<li><a href="testimonial.html" title="Testimonial"
											class="animsition-link">유지어트 도우미</a></li>
										<li><a href="testimonial.html" title="Testimonial"
											class="animsition-link">밴딩/로딩 도우미</a></li>
										<li><a href="testimonial.html" title="Testimonial"
											class="animsition-link">탄수화물 사이클링</a></li>

									</ul></li>
								<li><a href="contact.html" title="Contact Us"
									class="animsition-link">로그인</a></li>
								<li><a href="style-guide.html" title="Style Guide"
									class="animsition-link">회원가입</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="page-caption pinside40">
						<h1 class="page-title">여기는 차근차근 채워갈 예정</h1>
						<p>dml은 daily muscle life의 줄임말이다</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  -->
	<!-- 체중관리 -->
	<div class="Menu_container__AYim3">
		<ul class="Menu_list__XupHS">
			<li style="font-weight: 900;"><a href="/weight/track">체중 관리</a></li>
			<li style="font-weight: 100;"><a href="/weight/composition">체조성
					기록</a></li>
			<li><a href="/weight/activity">활동 관리</a></li>
		</ul>
	</div>
	<div id="container">
		<h2>Lorem Ipsum</h2>

		<div id="lorem-ipsum"></div>
	</div>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2>모달</h2>
			</div>
			<div class="close-area">X</div>
			<div class="content">
				<div>
					<span>세트</span><input type="text" name="exerciseSet">
				</div>
				<div>
					<span>횟수</span><input type="text" name="exerciseNumber">
				</div>
			</div>
		</div>
	</div>
	<div>
		<form
			action="<%=request.getContextPath()%>/exercise/searchlist?searchWord=${searchWord}"
			method="get">
			<input type="search" name="searchWord" placeholder="검색"> <input
				type="submit" value="찾기">
		</form>
	</div>



	<div class="main_content_part">
		<div class="ex_part btn" data-part="등">등</div>
		<div class="ex_part btn" data-part="가슴">가슴</div>
		<div class="ex_part btn" data-part="어깨">어깨</div>
		<div class="ex_part btn" data-part="팔">팔</div>
		<div class="ex_part btn" data-part="하체">하체</div>
	</div>
	<div>
		<div class="main_content_exercise"></div>
		<div class="main_content_exercise_one"></div>
		<div class="add_exercise"></div>
	</div>
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
		htmlVal += '<table><tr><td>자세</td><td>유튜브링크</td></table><div class="ex_one btn" data-code="'+result.ecode+' data-name="'+result.exName+'">'+result.epose+'<div>'+result.eposeLink+'</div><button id="btn-modal">모달 창 열기 버튼</button>'
		$(".main_content_exercise_one").html(htmlVal);
		<!--모달이 나올수있도록 displayExercisePartOne함수 안에 넣음-->
		const modal = document.getElementById("modal")
		const btnModal = document.getElementById("btn-modal")
		btnModal.addEventListener("click", e => {
		    modal.style.display = "flex"
		})
		const closeBtn = modal.querySelector(".close-area");
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none"
    }
})
window.addEventListener("keyup", e => {
    if(modal.style.display === "flex" && e.key === "Escape") {
        modal.style.display = "none"
    }
})
		$(".main_content_exercise_one").show();
	}
 /**이거는 day_ex에 넣어야하는 문장
	function insertExHandler(){
		$.ajax({
			url:"${pageContext.request.contextPath}/memberexset/insert",
			type: "post",
			data : {ecode : $(".ex_one").data("code")
				,exName : $(".ex_one").data("name")},
				//여기는 todo임, 컨트롤러에서 변수를 받아서 설정해서 getattribute를 써야할것같음
				//,exerciseSet : $(this).value
				//,exerciseNumber : $(this).data("number")},
			//success : displayExercisePartOne, 이 success부분도 다시 생각해야함
			dataType : "json"
		})
	}
	*/
	
	
		</script>

</body>
</html>