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
<title>Daily Muscle Life | 제품 추천</title>
<link rel="icon" type="image/x-icon"
	href="${pagecontext.request.contextPath }/resources/assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<!-- 템플릿의 기본 css -->
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<!-- 템플릿의 상세내용의 css -->
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/mypage.css"
	rel="stylesheet" />
<!-- JQuery 사용 -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<!-- 템플릿 아이콘 사용 -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- 템플릿에서 메뉴 클릭 시 서브메뉴 출력 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/product.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/sb-admin-2.css" rel="stylesheet">
<style>
.ranktable {
	margin-top: 10px;
	border: 1px solid #fff;
	padding: 5px;
}

.rankth {
	text-align: center;
}

.rankth, .ranktd {
	border: 1px solid #fff;
	padding: 5px;
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
					<div class="Menu_container">
						<ul class="Menu_list">
							<li style="font-weight: bold;"><a>제품 추천</a></li>
						</ul>
					</div>
					<jsp:include page="/WEB-INF/views/frame/menu.jsp"></jsp:include>
					<!-- 우리가 여기에 추가해야함 -->
					<jsp:include page="/WEB-INF/views/product/productFristTab.jsp"></jsp:include>
					<jsp:include page="/WEB-INF/views/product/productSecondTab.jsp"></jsp:include>
				<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
				</div>
			</main>

		</div>
		<!-- End of Page Wrapper  layoutSidenav_content -->
	</div>

	<!-- Bootstrap core JavaScript-->
	<!-- <script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

	<!-- Core plugin JavaScript-->
	<!-- <script src="vendor/jquery-easing/jquery.easing.min.js"></script> -->

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>


	<!-- Page level custom scripts -->
	<script>
		$('.btn1').click(function() {
			$('.difficulty-btn').removeClass('active');
			$('.btn1').addClass('active');
			$('.row-menu').removeClass('active');
			$('.beginner').addClass('active');
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-1').addClass('active');
			$('.menu-comment').removeClass('active');
		});
		$('.btn2').click(function() {
			$('.difficulty-btn').removeClass('active');
			$('.btn2').addClass('active');
			$('.row-menu').removeClass('active');
			$('.export').addClass('active');
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-7').addClass('active');
			$('.menu-comment').removeClass('active');
		});

		$('.btn-sub1').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-1').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment1').addClass('active');

		});
		$('.btn-sub2').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-2').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment2').addClass('active');
		});

		$('.btn-sub3').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-3').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment3').addClass('active');
		});
		$('.btn-sub4').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-4').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment4').addClass('active');
		});
		$('.btn-sub5').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-5').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment5').addClass('active');
		});
		$('.btn-sub6').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-6').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment6').addClass('active');
		});
		$('.btn-sub7').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-7').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment7').addClass('active');
		});
		$('.btn-sub8').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-8').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment8').addClass('active');
		});
		$('.btn-sub9').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-9').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment9').addClass('active');
		});
		$('.btn-sub10').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-10').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment10').addClass('active');
		});
		$('.btn-sub11').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-11').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment11').addClass('active');
		});
		$('.btn-sub12').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-12').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment12').addClass('active');
		});
	</script>
	<script>
		$(".tabmenu").click(function() {
			console.log($(this).data("tabmenu"));
			tabmenuDisplay($(this).data("tabmenu"));
		});

		const initTab = '${tab}'; //  controller에서 model . tab에 실어준 값  
		tabmenuDisplay(initTab); // 페이지 로딩되면 controller에서 정해준 tabmenu가 보이도록 함

		function tabmenuDisplay(tabmenu) {
			console.log(tabmenu);
			if (tabmenu == '1') {
				$("#tab1").show();
				$("#tab2").hide();
			} else {
				$("#tab2").show();
				$("#tab1").hide();
			}
		}
	</script>
</body>
</html>
