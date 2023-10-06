<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
let contextPath = "${pageContext.request.contextPath }";
</script>
<script src="${pageContext.request.contextPath }/resources/js/custom-calendar.js"></script>
<title>Insert title here</title>
</head>
<body style="text-align: center">
<div>
	<h1>일정 추가</h1>
</div>
<div>
	<form id="calendarData">
	<div>
		제목 : <input type="text" name="title" id="title" placeholder="제목 입력">
	</div>
	<br>
	<div>
		시작 날짜 : <input type="date" name="startDate" id="startDate" size="12" value="${startDate}"/>
	</div>
	<br>
	<div>
		종료 날짜 : <input type="date" name="endDate" id="endDate" size="12" value="${endDate}"/>
				 
	</div>
	<br>
		설명
	<div>
			<textarea name="content" id="content" rows="10" cols="30"></textarea>
	</div>
	<br>
			<input type = "button" value="저장" onClick="send_save()">
			

			
	</form>
</div>

</body>


</html>