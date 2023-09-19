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
<title>Daily Muscle Life | 마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/scss.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet" />
<script	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="ant-drawer-body">
						<div class="Menu_container">
							<ul class="Menu_list">
								<li style="font-weight: bold;"><a>마이페이지</a></li>
							</ul>
						</div>
						<jsp:include page="/WEB-INF/views/frame/menu.jsp"></jsp:include>
						<div>
							<div>
								<div class="MyPage_basic_input_row">
									<div class="MyPage_basic_input_title">아이디</div>
									<div class="MyPage_basic_input_content">
										<input disabled=""
											class="MyPage_basic_input"
											type="text" id="memberId" value="${member.memberId }">
									</div>
									<div class="MyPage_basic_input_title">성별</div>
									<div class="MyPage_basic_input_content">
										<input disabled=""
											class="MyPage_basic_input"
											type="text" value="${member.gender }">
									</div>
								</div>
								<div class="MyPage_basic_input_row">
									<div class="MyPage_basic_input_title">이름/별명</div>
									<div class="MyPage_basic_input_content">
										<input class="MyPage_basic_input"
											type="text" id="mname" value="${member.mname }">
									</div>
								</div>
								<div class="MyPage_basic_input_row">
									<div class="MyPage_basic_input_title">키</div>
									<div class="MyPage_basic_input_content">
										<input class="MyPage_basic_input"
											type="text" id="height" value="${member.height }">
									</div>
									<div class="MyPage_basic_input_title">몸무게</div>
									<div class="MyPage_basic_input_content">
										<input class="MyPage_basic_input"
											type="text" id="weight" value="${member.weight }">
									</div>
								</div>
								
								<button class="MyPage_basic_btn" onclick="sendData()">저장하기</button>

								<button class="MyPage_basic_btn MyPage_basic_red MyPage_btn_right" 
									onclick="location.href='${pageContext.request.contextPath}/member/deleteCheck'">회원탈퇴</button>

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
	<script>
		
		function sendData() {
	        var member = {
	        		memberId: $("#memberId").val(),
	                mname: $("#mname").val(),
	                height: $("#height").val(),
	                weight: $("#weight").val()
	        };

	        $.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath}/member/update",
	            contentType: "application/json",
	            data: JSON.stringify(member),
	            success: function(response) {
	            	alert("수정이 완료되었습니다.");
	            	window.location.href = "${pageContext.request.contextPath}/member/mypage";
	            }
	        });
	    }
	</script>
</body>
</html>
