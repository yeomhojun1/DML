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
					<h1 class="mt-4"></h1>
					<div class="card cardwidth mb-4">
						<div class="card-body">
							<form method="post">
								<div class="mb-3 mt-3">
									<input type="hidden" class="form-control" id="noticeNo"
										name="noticeNo" value="${noticeone.noticeNo}" disabled>
								</div>
								<div class="mb-3">
									<label for="title" class="form-label">제목</label>
									<div class="form-control" id="title" name="title">${noticeone.noticeTitle}</div>
								</div>
								<div class="mb-3">
									<label for="content" class="form-label">내용</label>
									<div class="form-control" id="content" name="content">${noticeone.noticeContent}</div>
								</div>
								<div class="mb-3">
									<label for="writer" class="form-label">작성자</label>
									<div class="form-control" id="writer" name="writer">${noticeone.adminId}
									</div>
								</div>
								<div class="mb-3">
									<label for="regDate" class="form-label">작성일</label>
									<div class="form-control" id="regDate" name="regDate">${noticeone.noticeDate}</div>
								</div>
								<c:if test="${member.authorities.equals('ROLE_ADMIN')}">
									<button type="button" class="updateNotice">수정</button>
									<button type="button" class="deleteNotice">삭제</button>
								</c:if>
									<button type="button" class="ListNotice">목록으로</button>
							</form>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script>
	$(".ListNotice").on("click", function(){
		location.href="${pageContext.request.contextPath}/notice/list";
	});
	
	$(".deleteNotice").on("click",function(){
		/* var formData = $(".deleteNotice").serialize();
		alert(formData); */
		$.ajax({
			url: "${pageContext.request.contextPath}/notice/delete", 
			type: "POST",
			data: {noticeNo: ${noticeone.noticeNo} },
			success: function(data){
					alert("삭제완료");
			location.href="${pageContext.request.contextPath}/notice/list";	
			},
			error : (request, status, error) => {
				   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		});
	});
	
	let writerHtml = $("#writer").html().trim();
	$(".updateNotice").click(updateNoticeHandler);
	function updateNoticeHandler() {
		console.log(writerHtml);
		console.log("${member.authorities.equals('ROLE_ADMIN')}");
		if (writerHtml = "${member.authorities.equals('ROLE_ADMIN')}") {
			location.href = "${pageContext.request.contextPath}/notice/update?noticeNo=${noticeone.noticeNo}";
		}
		
	}
 	
	</script>

</body>
</html>
