<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러</title>
</head>
<body>
<script>
	alert("패스워드가 맞지 않습니다. 다시 입력해주세요.");
	location.href="${pageContext.request.contextPath}/member/mypage";
</script>
</body>
</html>