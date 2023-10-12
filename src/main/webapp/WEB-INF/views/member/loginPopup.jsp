<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Muscle Life | 로그인 필요</title>
</head>
<body>
<script>
	alert("로그인을 해야 사용가능 합니다..");
	location.href="${pageContext.request.contextPath}/member/login";
</script>
</body>
</html>