<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 테스트</title>
<!-- <script src="https://accounts.google.com/gsi/client" async></script> -->
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</head>
<body>
		<!-- <div id="g_id_onload"
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
		</div> -->
		<span id="google_login" class="circle google" onclick="init();"><i class="fa fa-google-plus fa-fw"></i> </span>
</body>
<!-- google signin api -->
<script>
// google signin API
var googleUser = {};
function init() {
	 gapi.load('auth2', function() {
	  console.log("init()시작");
	  auth2 = gapi.auth2.init({
	        client_id: '289846789589-h7q4c15lija4ml3fi9frtdmk7qlbv98c.apps.googleusercontent.com'
	        cookiepolicy: 'http://localhost:8080',
	      });
	      attachSignin(document.getElementById('google_login'));
	 });
}

//google signin API2
function attachSignin(element) {
    auth2.attachClickHandler(element, {},
        function(googleUser) {
    	var profile = googleUser.getBasicProfile();
    	var id_token = googleUser.getAuthResponse().id_token;
	  	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  	  console.log('ID토큰: ' + id_token);
	  	  console.log('Name: ' + profile.getName());
	  	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			$(function() {
				$.ajax({
				    url: '/member/loginGoogle',
				    type: 'post',
				    data: {
						"id" : <!-- 필요한 데이터 담기 -->,
						"pw" : <!-- 필요한 데이터 담기 -->
					    },
				    success: function (data) {
				            alert("구글아이디로 로그인 되었습니다");
				            location.href="/member/main";
				        }
				});
			})
        }, function(error) {
          alert(JSON.stringify(error, undefined, 2));
        });
    console.log("구글API 끝");
  }
</script>
</html>