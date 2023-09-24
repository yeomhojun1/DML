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
<!-- 템플릿의 기본 css -->
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />

<!-- 템플릿의 상세내용의 css -->
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />

<!-- JQuery 사용 -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>

<!-- 템플릿 아이콘 사용 -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- ck에디터적용코드  -->
<script language="javascript"
	src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
<!-- 템플릿에서 메뉴 클릭 시 서브메뉴 출력 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>

<!-- 차트 기능 사용 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>


<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Daily Muscle Life</h1>
					<jsp:include page="/WEB-INF/views/frame/menu.jsp"></jsp:include>
					<div>
						<table
							class="table table-hover table-sm text-center align-middle caption-top table-striped">
							<thead class="table-light">
							<caption>서로 물어봐요!</caption>
							<tr>
								<th scope="col ">번호</th>
								<th scope="col ">제목</th>
								<th scope="col ">작성자</th>
								<th scope="col ">등록일</th>
								<th scope="col ">조회수</th>
							</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="vo">
									<tr>
										<th>${vo.boardNo}</th>
										<td><a href="${pageContext.request.contextPath }/board/one?boardNo=${vo.boardNo}"> ${vo.boardTitle}</a></td>
										<td>${vo.memberId}</td>
										<td>${vo.boardDate}</td>
										<td>${vo.boardCount}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<a href="${pageContext.request.contextPath }/board/insert"><button
								type="btn btn-default" class="addBoard">질문 등록</button></a>
					</div>
					<div class="text-align">
						<ul class="pagination justify-center-center">
							<li><a href="#" style="margin-right:5px">1</a></li>
							<li><a href="#" style="margin-right:5px">2</a></li>
							<li><a href="#" style="margin-right:5px">3</a></li>
							<li><a href="#" style="margin-right:5px">4</a></li>
							<li><a href="#" style="margin-right:5px">5</a></li>

						</ul>
					</div>
					
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	
</body>
</html>
