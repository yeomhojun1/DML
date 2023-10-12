<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Muscle Life | 비밀번호 에러</title>
</head>
<body>
<script>
	alert("비밀번호가 맞지 않습니다. 다시 입력해주세요.");
	location.href="${pageContext.request.contextPath}/member/mypage";
</script>
</body>
</html>