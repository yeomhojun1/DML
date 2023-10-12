<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Muscle Life | 에러</title>
</head>
<body>
<script>
	alert("${msg}");
	if(${member.authorities == "ROLE_ADMIN"}) {
		location.href="${pageContext.request.contextPath}/admin/mypage/pwdChange";
	} else {
		location.href="${pageContext.request.contextPath}/member/mypage/pwdChange";		
	}
</script>
</body>
</html>