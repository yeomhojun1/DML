<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
		<title>일정 추가</title>
</head>
<body style="text-align: center">
	 <div>
	 	<h1>일정 수정</h1>
	 </div>
	 <div>
	 	<form id="calendarData">
	 		<input type="hidden" name="calendarno" id="calendarno" value="${calendarno}" />
			<input type="hidden" name="memberId" id="memberId" value="${member.memberId}" />
	 		<div>
	 			제목 : <input type="text" name="title" id="title"  value="${title}" />
	 		</div>	
	 		<br>
	 		<div>
	 			시작 날짜 : <input type="text" name="startDate" id="startDate" size="12" value="${startDate}"/>
					
	 		</div>	
	 		<br>
	 		<div>
	 			종료 날짜 : <input type="text" name="endDate" id="endDate" size="12" value="${endDate}" />
			
	 		</div>	
	 		<br>
	 			설명 
	 		<div>
	 			<textarea name="content" id="content" rows="10" cols="30">${content}</textarea>
	 		</div>
	 		<br>
	 	</form>
	 		<input type= "button" value="수정" onclick="send_update()"/>
	 		<input type = "button" value="삭제" onClick="send_delete()">
	 </div>
</body>
</html>