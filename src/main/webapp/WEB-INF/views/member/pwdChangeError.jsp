<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 없음</title>
</head>
<body>
<script>
	alert("${msg}");
	location.href="${pageContext.request.contextPath}/member/login";
</script>
</body>
</html>