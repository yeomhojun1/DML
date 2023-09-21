<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 필요</title>
</head>
<body>
<script>
	alert("로그인 진행 중 사용가능 합니다..");
	location.href="${pageContext.request.contextPath}/member/login";
</script>
</body>
</html>