<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 테스트</title>
<script src="https://accounts.google.com/gsi/client" async></script>
</head>
<body>
		<div id="g_id_onload"
		     data-client_id="289846789589-h7q4c15lija4ml3fi9frtdmk7qlbv98c.apps.googleusercontent.com"
		     data-context="signin"
		     data-ux_mode="popup"
		     data-login_uri="http://localhost:8080/dml/api/v1/oauth2/google"
		     data-itp_support="true">
		</div>
		
		<div class="g_id_signin"
		     data-type="icon"
		     data-shape="circle"
		     data-theme="outline"
		     data-text="signup_with"
		     data-size="large">
		</div>

</body>
</html>