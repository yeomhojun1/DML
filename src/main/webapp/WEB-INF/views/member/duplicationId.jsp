<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복ID</title>
</head>
<body>
<script>
	alert("동일한 Email로 가입되어 있습니다. 기존에 회원가입한 방식으로 로그인해주세요.");
	location.href="${pageContext.request.contextPath}/member/login";
</script>
</body>
</html>