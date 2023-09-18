<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <script src='<c:url value="/resources/js/custom-calendar.js"/>'></script>
   <script src='<c:url value="/resources/js/AjaxSerializeObject.js"/>'></script>
<title>Insert title here</title>
</head>
<body style="text-align: center">
<div>
	<h1>일정 추가</h1>
</div>
<div>
	<from id="calendarData">
	<div>
		제목 : <input type="text" name="title" id="title" placeholder="제목 입력">
	</div>
	<br>
	<div>
		시작 날짜 : <input type="text" name="startdate" id="startdate" size="12" value="${startDate}"/>
				 <input type="button" value="달력" onclick="${'#startdate'}.datepicker('show');"/>
	</div>
	<br>
	<div>
		종료 날짜 : <input type="text" name="enddate" id="enddate" size="12" value="${endDate}"/>
				  <input type="button" value="달력" onclick="${'#enddate'}.datepicker('show');"/>
	</div>
	<br>
		설명
	<div>
			<textarea name="content" id="content" rows="10" cols="30"></textarea>
	</div>
	<br>
	</from>
			<input type = "button" value="저장" onclick="send_save()"/>
</div>

</body>
</html>