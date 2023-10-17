<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Daily Muscle Life</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/scss.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet" />
<script	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"	crossorigin="anonymous"></script>
<style>
	.btn-outline-primary {
		margin-top:10px;
	}
</style>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="./frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="./frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="Menu_container">
						<ul class="Menu_list">
							<li style="font-weight: bold;"><a>Admin 비밀번호 변경</a></li>
						</ul>
					</div>
					<jsp:include page="./frame/adminmenu.jsp"></jsp:include>
					<form action="${pageContext.request.contextPath }/member/mypage/pwdChange" method="post">
						<input type="hidden" name="username" value="${member.memberId }">
						<div class="col-lg-8 login-form">
							<div class="col-lg-8 login-form">
								<div class="form-group">
									<label class="form-control-label">현재 비밀번호</label> <input
										type="password" name="password" id="password"
										class="form-control">
								</div>
								<div class="form-group">
									<label class="form-control-label">변경할 비밀번호</label> <input
										type="password" name="password2" id="password2"
										class="form-control">
								</div>
								<div class="form-group">
									<label class="form-control-label">변경할 비밀번호 확인</label> <input
										type="password" name="password3" id="password3"
										class="form-control">
								</div>
								<div class="col-lg-6 login-btm login-button">
									<button type="submit" class="btn btn-outline-primary">비밀번호 변경</button>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-2"></div>
					</form>
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>	
</body>
</html>
