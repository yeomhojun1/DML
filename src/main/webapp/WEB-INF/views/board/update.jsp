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
					<h1>${boardOne.boardTitle}</h1>
					<form method="post"
						action=${pageContext.request.contextPath}/board/insert
						enctype="multipart/form-data" id="updateForm">
						<input type="hidden" value="${boardone.boardNo}" name="boardNo">
						<span>제목 : </span>
						<textarea class="updateBoardTitle" rows="1" cols="50" name="boardTitle" placeholder="${boardone.boardTitle}"></textarea>
				</div>
				<div>
					<span>내용 : </span>
					<textarea class="updateBoardContent" rows="10" cols="20" name="boardContent" id="editor" placeholder="${boardone.boardContent}"></textarea>
				</div>
					<button type="button" class="saveUpdate">저장</button>
				<!--게시글 추가한 뒤에 이미지추가도 시작할예정 -->
				<!-- <input type="button" value="파일 추가" onClick="fn_addFile()"><br>
				<div id="d_file"></div>
				<input type="submit" value="업로드"> -->
				</form>
		</div>
		</main>
		<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
	</div>
	</div>
	 <script>
		ClassicEditor.create(document.querySelector('#editor'));
		/* var cnt = 1;
		function fn_addFile() {
			$("#d_file").append(
					"<br>" + "<input type='file' name='file" + cnt + "' />");
			cnt++;
		} */
	</script> 
	<script>
	$(".saveUpdate").click(updateDoBoardHandler);
	function updateDoBoardHandler(){
		var title1= $(".updateBoardTitle").val();
		var Content1= $(".updateBoardContent").val();
	console.log(title1);
	console.log(Content1);
	/*  $.ajax({
	            type: "post",
	            url: "${pageContext.request.contextPath}/board/update",
	           data: {memberId:${member.memberId} ,boardTitle : title1,boardContent: Content1,boardNo :	${boardone.boardNo}},
	         //   data: $("#updateForm").serialize(),
	            //dataType: "json",
	            success: function(response){
	            	console.log(response);
	                    location.href = "${pageContext.request.contextPath}/board/list";
	              
	                },error: function(){
	                	console.log("error");
	                }
	            });  */
	        } 
	
	/* 	 $.ajax({
				url:"${pageContext.request.contextPath}/memberexset/update",
				type: "post",
				data : 
				,success : function(result){
					location.reload(true);
					}
				,error : function(){
					console.log("error");
					}
				});
			 event.preventDefault();
			} */
	
	</script>
	<!--  <script>
    CKEDITOR.replace('editor', {
      filebrowserUploadUrl: '/upload_image.php',  // 이미지 업로드 처리 URL
    });
  </script> -->
</body>
</html>

