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
<style>
.floatRight {
	float: right;
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
					<jsp:include page="/WEB-INF/views/frame/menu.jsp"></jsp:include>
					<h1 class="mt-4"></h1>
					<div class="card cardwidth mb-4">
						<div class="card-body">
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
							
							<div class="btn-group" role="group"
								aria-label="Basic outlined example">
								<button type="button"
									class="updateBoard btn btn-outline-primary">수정</button>
								<button type="button"
									class="deleteBoard btn btn-outline-primary">삭제</button>
								<button type="button" class="replyBoard btn btn-outline-primary">댓글
									달기</button>
									<button class="btn btn-outline-primary"><a href="${pageContext.request.contextPath}/board/list">목록으로</a></button>
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
	let replyreplyleftpadding="";
		window.onload = function() {
		/* 	const withOuthtmlCode = extractTextFromHTML($("#content").val());
			$("#content").html(withOuthtmlCode);
			console.log(${boardone.boardNo});
			console.log(${boardone.boardCount}); */
			replyreplyleftpadding=$(".cardwidth").width()*0.03;
			$.ajax({
		           type: "get",
		           url: "${pageContext.request.contextPath}/board/plusCount",
		           data: {  boardCount :${boardone.boardCount},boardNo:${boardone.boardNo}  },
		           success: function (result) {
		        	   console.log("plusCount : success");
					},error : function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}

					//,dataType : "json"
				});
			 var moreReply ="";
			$.ajax({
		           type: "get",
		           url: "${pageContext.request.contextPath}/replyboard/list",
		           data: { boardNo:${boardone.boardNo}},
		           success: function (result) {
		        	   console.log("success");
		        	  for (var i = 0; i < result.length; i++) {
		        		  if(result[i].rref==result[i].replyNo){
	        			var  htmlVal =  '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="firstReply card" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
	    		   		+'<div class="groupbtn col-xl-6 btn-group" role="group" aria-label="Basic outlined example"><button class="updatereply btn btn-outline-primary">수정</button><button class="btn btn-outline-primary" onclick="deletereplyHandler('+result[i].replyNo+');">삭제</button><button class="insertreplyreply btn btn-outline-primary">댓글 삽입</button>'
	    		   		+'<button class="moreReply btn btn-outline-primary" data-replyno="'+result[i].replyNo+'">댓글 더보기</button>';
	    		   	 	if(writerHtml=="${member.memberId}"){
	    		   	 		if(!${boardone.selectReplyNo}){
	    		   			htmlVal+='<button class="btn btn-outline-primary forPlusRequtation" onclick="forPlusReputationHandler(\''+result[i].replyNo+'\');">채택하기</button>'  		
	    		   	 		}
	        		    }
	    		   	 	htmlVal+='</div></div><div class="forAppendArea"></div>'
	    		   		$(".testappend").append(htmlVal);
		        		  } //if
		        	   }  // for
		        	/*   if(writerHtml=="${member.memberId}"){
  		   				var plusreputation='<button type="button" class="forPlusReputation" onclick="forPlusReputationHandler('+result[i].memberId+')">채택하기</button>'  		   				
  		   				$(".groupbtn").append(plusreputation); 
  		   			}*/ 	    		   	
		        	   $(".updatereply").click(updatereplyHandler);
		        	   $(".insertreplyreply").click(insertreplyreplyHandler);
		        	   $(".moreReply").click(moreReplyHandler);
						 if(${boardone.selectReplyNo}!=0){	
						//	$(".forPlusRequtation").remove();
							var firstReply = document.getElementsByClassName('firstReply');
		 					for (var i = 0; i < firstReply.length; i++){
					 			if($(firstReply[i]).data("replyno")==${boardone.selectReplyNo}){
									firstReply[i].classList.add('text-bg-warning');
									
								}   
							} 
						} 
					}, //success
					error : (request, status, error) => {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					dataType:"json"
				});
		}
		function forPlusReputationHandler(replyNo){
			 $.ajax({
				 async: false;
				type : "post",
				url : "${pageContext.request.contextPath}/board/selectReply",
				data: { selectReplyNo: replyNo, boardNo: ${boardone.boardNo}},
				success : function (result) {
					console.log(result);
					var forReply=result.selectReplyNo;
					$.ajax({
						type : "get",
						url : "${pageContext.request.contextPath}/member/plusReputation",
						data: { replyNo: forReply },
						success : function (result) {
							console.log("plusReputation : success");
							//$(".forPlusRequtation").remove();
							location.reload(true);
						},
						error : function(){
							console.log("error");
							}
						}); 
				},
				error : function(){
					console.log("error");
					}
				}); 
			
		}
	/* 	function plusReputationHandler(forReply){
			console.log("plusReputationHandler : "+forReply);
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/member/plusReputation",
				data: { replyNo: forReply },
				success : function (result) {
					console.log("plusReputation : success");
					$(".forPlusRequtation").remove();
					 location.reload(true);
				},
				error : function(){
					console.log("error");
					}
				}); 
		} */
		
		function moreReplyHandler(e){
			var rrefReplyNo=$(this).data("replyno");
			var eTarget=e.target;
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/replyboard/moreReplylist",
				data: { rref:rrefReplyNo},
				success : function (result) {
					$(".forAppendArea").html("");
					console.log(result.length);
					if(result.length==0){
						alert("답글이 없습니다.");
					}else{
					//console.log($(this).val());
					 for (var i = 0; i < result.length; i++) {
	        			var  htmlVal =  '<div class="firstReply card"  style="padding-left :'+replyreplyleftpadding+'px" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
	    		   		+'<div class="groupbtn"><button class="btn btn-outline-primary" onclick="deletereplyHandler('+result[i].replyNo+');">삭제</button></div>';
	    		   		$(eTarget).parents(".replyCard").find(".forAppendArea").append(htmlVal);
					 }
        		      }  
					
		        },  // success,
				error : function () {
		        	  console.log("error");
				},
				dataType:"json"
			});
		}
		let writerHtml = $("#writer").html().trim();
		$(".updateBoard").click(updateBoardHandler);
		function updateBoardHandler() {
			console.log(writerHtml);
			console.log("${member.memberId}");
			if (writerHtml != "${member.memberId}") {
				alert("작성자가 아닙니다.");
			}else{
				location.href = '${pageContext.request.contextPath}/board/update?boardNo=${boardone.boardNo}';
			}
		}
		$(".deleteBoard").click(deleteBoardHandler);
		function deleteBoardHandler() {
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
				<div class="card-body addaddreply contenttextarea">
						<label>댓글 작성자 : ${member.memberId}</label>
						<textarea rows="3" class="col-xl-12" name="replyContent" class="replyContent"></textarea>
						<button class="submitreply btn btn-outline-primary" type="button">댓글 작성</button>
				</form>
				</div>
				`
//			var addreplyVal = `<div class="card">↳작성자 : ${member.memberId}<div class="addaddreply card-body"><textarea class="col-xl-12 replyContent" name="boardTitle"></textarea><button class="submitreply">댓글 저장</button></div></div>`
			$(".contenttextarea").remove();
			$(".addreply").append(addreplyVal);
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
		    		   		var  htmlVal =  '<div class="card replyCard" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="firstReply card" data-replyno="'+result[i].replyNo+'" data-writer="'+ result[i].memberId+'"><div class="updatewriter">작성자 : '+ result[i].memberId+'</div><div class="updatereplyContent">내용 : '+result[i].replyContent+'</div><div class="updatereplyDate">입력날짜 : '+result[i].replyDate+'</div>'
		    		   		+'<div class="groupbtn col-xl-6 btn-group" role="group" aria-label="Basic outlined example"><button class="updatereply btn btn-outline-primary">수정</button><button class="btn btn-outline-primary" onclick="deletereplyHandler('+result[i].replyNo+');">삭제</button><button class="insertreplyreply btn btn-outline-primary">댓글 삽입</button>'
		    		   		+'<button class="moreReply btn btn-outline-primary" data-replyno="'+result[i].replyNo+'">댓글 더보기</button></div></div>';
		    				$(".testappend").append(htmlVal);   
		    				
		    	   		};
		    	   		$(".addreply").html("");
		    			$(".updatereply").click(updatereplyHandler);
		    			$(".insertreplyreply").click(insertreplyreplyHandler);
		    			 location.reload(true);
		    	   },
				error : function (){
					 console.log("error");
					},dataType:"json"
			});
			
		}
		function deletereplyHandler(forNumber){
			console.log(forNumber);
			 $.ajax({
			       type: "get",
			       url: "${pageContext.request.contextPath}/replyboard/one",
			       data: {replyNo :forNumber},
			       success: function (result) {
			    	   console.log(result.memberId);
			    	   console.log("${member.memberId}");
			    	
			    	  if(result.memberId != "${member.memberId}"){
			    		   alert("작성자가 아닙니다.");
			    	   }else{
			    		   $.ajax({
						       type: "post",
						       url: "${pageContext.request.contextPath}/replyboard/delete",
						       data: {replyNo :forNumber},
						       success: function (result) {
						    	   location.reload(true);
						    	   },
								error : function (){
									 console.log("error");
									},dataType:"json"
							});
			    	   }; 
			    	   },
					error : function (){
						 console.log("error");
						},dataType:"json"
				});
			
			/*  $.ajax({
			       type: "post",
			       url: "${pageContext.request.contextPath}/replyboard/delete",
			       data: {replyNo :forNumber},
			       success: function (result) {
			    	   location.reload(true);
			    	   },
					error : function (){
						 console.log("error");
						},dataType:"json"
				}); */
		}
		function updatereplyHandler(){
			var replyWriter= $(this).parents(".replyCard").data("writer");
			console.log("test123");
			if(replyWriter=="${member.memberId}"){
			$(this).parents(".replyCard").find(".updatereplyContent").html("");
			$(this).parents(".replyCard").find(".updatereplyDate").hide();
			//$(this).parents(".groupbtn").hide();
			var updateContent ='<textarea rows="3" class="col-xl-12 replyContent" name="replyContent1"></textarea>'
				
			$(this).parents(".replyCard").find(".updatereplyContent").html(updateContent);	
			 var updateDoBtn ='<button type="button" class="updateDoBtn">댓글 수정</button>'
			$(this).parents(".groupbtn").html(updateDoBtn); 
			 $(".updateDoBtn").click(updateDoBtnHandler);
			}else{
				alert("작성자가 아닙니다");
			}
		}
		function updateDoBtnHandler(){
			var replyContent1= $("[name=replyContent1]").val();
			 $.ajax({
			       type: "post",
			       url: "${pageContext.request.contextPath}/replyboard/update",
			       data: {replyNo : $(this).parents(".replyCard").data("replyno"), replyContent : replyContent1},
			       success: function (result) {
			    	   console.log("success");
			    	   location.reload(true);
			    	   },
					error : function (){
						 console.log("error");
						},dataType:"json"
				});
		}
		function insertreplyreplyHandler(){
			var replyreplywriter=$(this).parents(".replyCard").data("writer");
			var addreplyreply ='<div class="contenttextarea card replyreplycard" style="padding-left :'+replyreplyleftpadding+'px" data-writer="${member.memberId}"><div>↳작성자 : ${member.memberId}</div><div><textarea rows="3" class="col-xl-12 replyContent" name="replyreplyContent">↳@'+replyreplywriter+'</textarea></div><div><button class="submitreplyreply btn btn-outline-primary">답글 저장</button></div></div>'
			$(".contenttextarea").remove();
			$(this).parents(".replyCard ").append(addreplyreply);
			$(".submitreplyreply").click(submitreplyreplyHandler);
		}
	function submitreplyreplyHandler(){
			console.log("submitreplyreplyHandler");
			var replyreplyContent= $("[name=replyreplyContent]").val();
			console.log(replyreplyContent);
		  $.ajax({
			       type: "post",
			       url: "${pageContext.request.contextPath}/replyboard/replyinsert",
			       data: {memberId:"${member.memberId}",  replyContent : replyreplyContent, boardNo:${boardone.boardNo},rref : $(this).parents(".replyCard").data("replyno") },
			       success: function (result) {
			    	   console.log("success");
			    	  
			    	   },
					error : function (){
						 console.log("error");
						},dataType:"json"
				});
		  location.reload(true);
		}
	</script>
</body>
</html>

