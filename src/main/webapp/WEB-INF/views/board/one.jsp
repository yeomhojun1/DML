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
					<div class="card mb-4">
						<div class="card-body">
							<form>
								<div class="mb-3 mt-3">

									<input type="hidden" class="form-control" id="boardNo"
										name="boardNo" value="${boardone.boardNo}" disabled>
								</div>
								<div class="mb-3">
									<label for="title" class="form-label">제목</label>
									<div class="form-control" id="title" name="title">${boardone.boardTitle}</div>
								</div>
								<div class="mb-3">
									<label for="content" class="form-label">내용</label>
									<div class="form-control" id="content" name="content" disabled>${boardone.boardContent}</div>
								</div>
								<div class="mb-3">
									<label for="writer" class="form-label">작성자</label>
									<div class="form-control" id="writer" name="writer">${boardone.memberId}
									</div>
								</div>
								<div class="mb-3">
									<label for="regDate" class="form-label">작성일</label>
									<div class="form-control" id="regDate" name="regDate">${boardone.boardDate}</div>
								</div>
								<%-- <a href="list" class="btn btn-outline-secondary">list</a> <a
						href="modify?bno=${boardone.boardNo}" class="btn btn-outline-warning">modify</a>
					<a href="remove?bno=${boardone.boardNo}" class="btn btn-outline-danger"
						onclick="return confirm('삭제하시겠습니까?')">remove</a> --%>
								<button type="button" class="updateBoard">수정</button>
								<button type="button" class="deleteBoard">삭제</button>
								<button type="button" class="replyBoard">댓글 달기</button>
							</form>
						</div>
					</div>
						<div class="card-body addreply"></div>
						<div class="testappend"></div>
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script>
		window.onload = function() {
		/* 	const withOuthtmlCode = extractTextFromHTML($("#content").val());
			$("#content").html(withOuthtmlCode);
			console.log(${boardone.boardNo});
			console.log(${boardone.boardCount}); */
			$.ajax({
		           type: "get",
		           url: "${pageContext.request.contextPath}/board/plusCount",
		           data: {  boardCount :${boardone.boardCount},boardNo:${boardone.boardNo}  },
		           success: function (result) {
		        	   console.log("plusCount : success");
					},error : function(result){
						console.log("error");
					}
					//,dataType : "json"
				});
			$.ajax({
		           type: "get",
		           url: "${pageContext.request.contextPath}/replyboard/list",
		           data: { boardNo:${boardone.boardNo}},
		           success: function (result) {
		        	  for (var i = 0; i < result.length; i++) {
			    		   var  htmlVal = '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" ><div>작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div><span><button class="deletereply">삭제</button><button class="updatereply">수정</button><button class="insertreplyreply">댓글 삽입</button></span></div>'
							$(".testappend").append(htmlVal);
		        	   };
		        	   $(".deletereply").click(deletereplyHandler);
					},
					error : function(result){
						console.log("error");
					},
					dataType:"json"
				});
		
		}
		
		
		/* function extractTextFromHTML(html) {
			const tempDiv = document.createElement('div');
			tempDiv.innerHTML = html;
			return tempDiv.textContent || tempDiv.innerText || '';
		} */
		$(".updateBoard").click(updateBoardHandler);
		function updateBoardHandler() {
			console.log($("#writer").val());
			console.log("${member.memberId}");
			if ($("#writer").val() == "${member.memberId}") {
				location.href = '${pageContext.request.contextPath}/board/update?boardNo=${boardone.boardNo}';
			}
		}
		$(".deleteBoard").click(deleteBoardHandler);
		function deleteBoardHandler() {
			var writerHtml = $("#writer").html().trim();
			console.log(writerHtml);
			console.log($("#boardNo").val());
			console.log("${member.memberId}");
			if (writerHtml == "${member.memberId}") {
				if(confirm("정말 삭제하시겠습니까?")){
				         $.ajax({
				           type: "post",
				           url: "${pageContext.request.contextPath}/board/delete",
				           data: { boardNo: $("#boardNo").val() },
				           success: function (result) {
				        	   location.href = "${pageContext.request.contextPath}/board/list"
				        	   alert("삭제했습니다.");
							}
						})
				}
			}else{
				alert("작성자가 아닙니다.");
			}
		}
		$(".replyBoard").click(replyBoardInsertHandler);
		function replyBoardInsertHandler(){
			$(".addreply").html("");
			var addreplyVal = `
				<div class="card">
				<form method="post" action="${pageContext.request.contextPath}/replyboard/insert">
				<div class="card-body addaddreply">
						<label>댓글 작성자 : ${member.memberId}</label>
						<textarea rows="3" class="col-xl-12" name="replyContent" class="replyContent"></textarea>
						<button class="submitreply" type="button">댓글 작성</button>
				</form>
				</div>
				`
//			var addreplyVal = `<div class="card">↳작성자 : ${member.memberId}<div class="addaddreply card-body"><textarea class="col-xl-12 replyContent" name="boardTitle"></textarea><button class="submitreply">댓글 저장</button></div></div>`
			$(".addreply").html(addreplyVal);
			$(".submitreply").click(submitreplyHandler);
		}
		function submitreplyHandler(){
			var replyContent=$("[name=replyContent]").val();
			 $.ajax({
		       type: "post",
		       url: "${pageContext.request.contextPath}/replyboard/insert",
		       data: {memberId: "${member.memberId}" ,replyContent: replyContent, boardNo: $("#boardNo").val(),rstep : ${boardone.bstep}+1 ,rlevel : ${boardone.blevel}+1},
		       success: function (result) {
		    		   $(".testappend").html("");
						for (var i = 0; i < result.length; i++) {
		    		   		var  htmlVal =  '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" ><div>작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div><span><button class="deletereply">삭제</button><button class="updatereply">수정</button><button class="insertreplyreply">댓글 삽입</button></span></div>'
		    				$(".testappend").append(htmlVal);   
		    	   		};
		    	   		$(".addreply").html("");
		    	   },
				error : function (){
					 console.log("error");
					},dataType:"json"
			});
			$(".deletereply").click(deletereplyHandler);
		}
		function deletereplyHandler(){
			console.log($(this).parents(".replyCard").data("replyno"));
			 $.ajax({
			       type: "post",
			       url: "${pageContext.request.contextPath}/replyboard/delete",
			       data: {replyNo : $(this).parents(".replyCard").data("replyno")},
			       success: function (result) {
			    	   location.reload(true);
			    	   },
					error : function (){
						 console.log("error");
						},dataType:"json"
				});
		}
	</script>
</body>
</html>
