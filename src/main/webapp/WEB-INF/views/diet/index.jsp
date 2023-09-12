<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Daily Muscle Life</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/scss.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
          <!-- jQuery library -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!-- jQuery UI library -->
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- jQuery UI CSS (스타일) -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    </head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">Daily Muscle Life</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
    </script>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<%-- 사용자가 로그인되어 있지 않은 경우 --%>
					<c:if test="${empty sessionScope.loginUser}">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/member/login">로그인</a></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/member/signup">회원가입</a></li>
					</c:if>

					<%-- 사용자가 로그인된 경우 --%>
					<c:if test="${not empty sessionScope.loginUser}">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/member/mypage">마이페이지</a></li>
						<li><a class="dropdown-item" href="#!">Activity Log</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/member/logout">로그아웃</a></li>
					</c:if>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">메인</div>
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 홈
						</a>
						<div class="sb-sidenav-menu-heading">체중/식단</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 체중관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">Static
									Navigation</a> <a class="nav-link" href="layout-sidenav-light.html">Light
									Sidenav</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 식단관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a
											class="nav-link" href="404.html">404 Page</a> <a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">운동/제품</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 운동 도우미
						</a> <a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 제품 추천
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Daily Muscle Life</h1>
					<!--   <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol> -->
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">식단짜기</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<!--          <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">밀프렙 도우미</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<!--         <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">보충제 활용</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<!--    <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">마이페이지</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<!--       <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="DateBars_date_bar__QeCa3" >
						<div class="DateBars_date__DyX0X">2023-09-04</div>
						<div class="DateBars_day_of_week__ShQrM">월</div>
						<div class="DateBars_date_selector__ajXTR">
							<div style="margin-top: 2px; margin-right: 10px;">
								<!-- <button type="button"
									class="ant-btn css-1s3dcof ant-btn-text ant-btn-icon-only"> -->
								<div class="ant-image css-1s3dcof"
									style="width: 10px; height: 14px;">
									<img class="ant-image-img"
										src="resources/beomjun/images/date_bar_left_arrow.png" width="10"
										height="14" style="height: 14px;">
								</div>
								
								</button>
							</div>
							<div>
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-circle ant-btn-text DateBars_date_selector_each__bZWnQ DateBars_date_selector_each_0__T7dgs">
									<span>2</span>
								</button>
							</div>
							<div>
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-circle ant-btn-text DateBars_date_selector_each__bZWnQ DateBars_date_selector_each_1__IBT1a">
									<span>3</span>
								</button>
							</div>
							<div>
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-circle ant-btn-text DateBars_date_selector_each__bZWnQ DateBars_date_selector_each_2__4qUCb">
									<span>4</span>
								</button>
							</div>
							<div>
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-circle ant-btn-text DateBars_date_selector_each__bZWnQ DateBars_date_selector_each_3__g1gCq">
									<span>5</span>
								</button>
							</div>
							<div>
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-circle ant-btn-text DateBars_date_selector_each__bZWnQ DateBars_date_selector_each_4__KA7Bh">
									<span>6</span>
								</button>
							</div>
							<div style="margin-top: 2px; margin-left: 10px;">
								<!-- <button type="button"
									class="ant-btn css-1s3dcof ant-btn-text ant-btn-icon-only"> -->
								<div class="ant-image css-1s3dcof"
									style="width: 10px; height: 14px;">
									<img class="ant-image-img date-pick1"
										src="resources/beomjun/images/date_bar_right_arrow.png" width="10"
										height="14" style="height: 14px;" >
								</div>
								</button>
								
							</div>
						</div>
						<div class="DateBars_date_picker__GCWt1">
							<div class="DateBars_date_picker_wrapper__8Axpy">
								<div
									class="ant-picker ant-picker-borderless css-1s3dcof DateBars_date_bar_calendar__XIcjP"
									style="margin-right: 13px; margin-top: 4px;">
									<div class="ant-picker-input">
										<input readonly="" placeholder="Select date" title=""
											size="12" autocomplete="off" value=""><span
											class="ant-picker-suffix"><div
												class="ant-image css-1s3dcof"
												style="width: 31px; height: 27px;">
												
												<input type="text" id="datepicker">
												
												<!--  <img
													class="ant-image-img DateBars_date_bar_calendar_icon__gPVOu"
													src="resources/images/date_bar_calendar_icon.png"
													width="31" height="27" style="height: 27px;"> -->
												</div>
											</div></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="Plan_top1__f4K0_">
						<div class="Plan_top1_title__wZHYO">섭취할 칼로리</div>
						<div class="Plan_top1_value1__JkpyX">
							<div>
								<div>
									<div class="Plan_top1_value1__JkpyX"></div>
								</div>
							</div>
						</div>
						<div class="Plan_top1_kcal__wgGCD">Kcal</div>
						<div class="Plan_top1_value3__USxBx"></div>
						<div class="Plan_span__XoR2b"></div>
						<div class="Plan_top1_value2__a0gQ9"></div>
						<div class="Plan_top1_kcal__wgGCD">필요</div>
					</div>
					<div class="Plan_bottom1_title_bar__g02PR">
						<div class="Plan_bottom1_item__L4ece">
							<button type="button"
								class="ant-btn css-1s3dcof ant-btn-text Plan_bottom1_btn__qLTZ7"
								style="font-weight: normal; color: white; border-radius: 20px; background-color: rgb(161, 235, 203);">
								<span>전체</span>
							</button>
						</div>
						<div class="Plan_meal_list__OB38F">
							<div class="Plan_bottom1_item__L4ece">
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-text Plan_bottom1_btn__qLTZ7"
									style="border-radius: 20px; background-color: rgb(153, 212, 234); font-weight: bold; color: white;">
									<span>아침</span>
								</button>
							</div>
							<div class="Plan_bottom1_item__L4ece">
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-text Plan_bottom1_btn__qLTZ7"
									style="border-radius: 20px; background-color: rgb(153, 185, 234); font-weight: normal; color: white;">
									<span>점심</span>
								</button>
							</div>
							<div class="Plan_bottom1_item__L4ece">
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-text Plan_bottom1_btn__qLTZ7"
									style="border-radius: 20px; background-color: rgb(241, 139, 136); font-weight: normal; color: white;">
									<span>저녁</span>
								</button>
							</div>
							<div class="Plan_bottom1_item__L4ece">
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-text Plan_bottom1_btn__qLTZ7"
									style="border-radius: 20px; background-color: rgb(255, 223, 122); font-weight: normal; color: white;">
									<span>간식</span>
								</button>
							</div>
						</div>
						<div class="Plan_bottom1_save____Cw1">
							<button type="button"
								class="ant-btn css-1s3dcof ant-btn-default Plan_bottom1_save_btn__14v5t Global_button__iJeUH">
								<span>저장하기</span>
							</button>
						</div>
					</div>
					<div class="Plan_bottom1_second_bar___Z7S8">
						<div class="Plan_bottom1_second_bar_foodcategory__Ew3pH">식사구분</div>
						<div class="Plan_bottom1_second_bar_food__Nea0w">음식</div>

						<div class="Plan_bottom1_second_bar_kcal__2i7Y2">
							칼로리<br> <span class="Plan_bottom1_second_bar_sub___m2EJ">kcal</span>
						</div>
						<div class="Plan_bottom1_second_bar_carb__0dt0o">
							탄수화물 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">g</span>
						</div>
						<div class="Plan_bottom1_second_bar_protein__BHBRu">
							단백질 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">g</span>
						</div>
						<div class="Plan_bottom1_second_bar_fat__8Tyy8">
							지방 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">g</span>
						</div>
						<div class="Plan_bottom1_second_bar_ctl__2Pelr">&nbsp;</div>
					</div>
				</div>
		</div>
	</div>
	</main>
	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">Copyright &copy; Your Website 2023</div>
				<div>
					<a href="#">Privacy Policy</a> &middot; <a href="#">Terms &amp;
						Conditions</a>
				</div>
			</div>
		</div>
	</footer>
	</div>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	<script>
	$(function() {
    // input을 datepicker로 선언
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        showMonthAfterYear: true,
        changeYear: true,
        changeMonth: true,
        showOn: "both",
        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 버튼 이미지 경로
        buttonImageOnly: true,
        buttonText: "선택",
        yearSuffix: "년",
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 달력의 월 부분 Tooltip
        ayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], // 달력의 요일 Tooltip
       onSelect: function(dateText, inst) {
           $(".DateBars_date__DyX0X").text(dateText); // 맨 위의 날짜 변경
           var date=new Date($("#datepicker").datepicker({dateFormat:"yy-mm-dd"}).val());
           //일요일 0~
           alert("date:"+date.getDay());
           
           week=new Array("일","월","화","수","목","금","토");
           $(".DateBars_day_of_week__ShQrM").text(week[date.getDay()]);
           
           
           var container = $(".DateBars_date_selector__ajXTR"); // 스크롤할 컨테이너
           var scrollTo = $(".ant-btn-circle span", container).filter(function() {
               return $(this).text() === inst.selectedDay.toString();
           }); // 선택한 날짜 버튼
           

           if (scrollTo.length) {
               container.scrollTop(scrollTo.offset().top - container.offset().top + container.scrollTop()); // 스크롤 이동
           }
           
       }
    

    });
    $('#datepicker').datepicker('setDate' , new Date());
});
	</script>
	
<!-- 	<script>
  		 $(function() {
       // input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd', // 달력 날짜 형태
           showOtherMonths: true, // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
           showMonthAfterYear: true, // 월-년 순서가 아닌 년도-월 순서
           changeYear: true, // 옵션값 년 선택 가능
           changeMonth: true, // 옵션값 월 선택 가능
           showOn: "both", // button: 버튼을 표시하고, 버튼을 눌러야만 달력 표시, both: 버튼을 표시하고, 버튼을 누르거나 input을 클릭하면 달력 표시
           buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 버튼 이미지 경로
           buttonImageOnly: true, // 버튼 이미지만 깔끔하게 보이게 함
           buttonText: "선택", // 버튼 호버 텍스트
           yearSuffix: "년", // 달력의 년도 부분 뒤 텍스트
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 달력의 월 부분 텍스트
           monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 달력의 월 부분 Tooltip
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 달력의 요일 텍스트
           dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], // 달력의 요일 Tooltip
           minDate: "-5Y", // 최소 선택일자(-1D: 하루전, -1M: 한달전, -1Y: 일년전)
           maxDate: "+5y" // 최대 선택일자(+1D: 하루후, -1M: 한달후, -1Y: 일년후)
        ,onSelect: function() { 
   	            var exerciseDate = $.datepicker.formatDate("yymmdd",$("#datepicker").datepicker("getDate")); 
   	            exerciseDate = $("#datepicker").val();
   	            alert(exerciseDate);
        }});

       // 초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); // (-1D: 하루전, -1M: 한달전, -1Y: 일년전), (+1D: 하루후, -1M: 한달후, -1Y: 일년후)
   });
</script> -->

</body>
</html>
