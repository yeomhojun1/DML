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
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ck에디터적용코드  -->
<script language="javascript"
	src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Daily Muscle Life</h1>
					<!--   <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol> -->
					<jsp:include page="/WEB-INF/views/frame/menu9.jsp"></jsp:include>
					<button type="button" class="testdd" data-part="등"> test</button>
					<div class="test11"></div>
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
		<script>
		$(".testdd").click(whattest);
		function whattest(){
			console.log("dfasd");
			var url = "";
				$.ajax({
				url:"${pageContext.request.contextPath}/exercise/searchlist",
				type: "get"
					,data : {searchword : $(this).data("part")}
				, success : function(result){
					
					console.log("1231");
					htmlVal = '	<div class="mem_ex_set">';
					for (var i = 0; i < result.length; i++) {
						htmlVal += '<div class="mem_ex_set_one btn col-xl-12" data-part="'+result[i].dayExSet+'">'+result[i].exName+'</div>'
					}
					htmlVal +='</div>'
					$(".test11").append(htmlVal);
				}
				, dataType: "json"
				})
			}
		function displayMemberExSet(result){
			console.log("1231");
			htmlVal = '	<div class="mem_ex_set">';
			for (var i = 0; i < result.length; i++) {
				htmlVal += '<div class="mem_ex_set_one btn col-xl-12" data-part="'+result[i].dayExSet+'">'+result[i].exName+'</div>'
			}
			htmlVal +='</div>'
			$(".test11").append(htmlVal);
			};
	
	/* 	document.addEventListener('DOMContentLoaded', function() {
				$.ajax({
				url:"${pageContext.request.contextPath}/memberexset/list",
					type: "get"
					, success : function(result){displayMemberExSet(result)}		
					, dataType: "json"
				})

				function displayMemberExSet(){
				htmlVal = '	<div class="mem_ex_set">';
				for (var i = 0; i < result.length; i++) {
					htmlVal += '<div class="ex_part_one btn col-xl-12" data-part="'+result[i].dayExSet+'">'+result[i].exName+'</div>'
				}
				htmlVal +='</div>'
				$(".testdd").append(htmlVal);
				}
			}) */
		
		
		
		</script>
</body>
</html>
