<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Muscle Life | 회원가입 에러</title>
</head>
<body>
<script>
	alert("${msg}");
	location.href="${pageContext.request.contextPath}/member/signup";
</script>
</body>
</html>