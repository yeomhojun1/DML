<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" th:href="@{/css/bootstrap.min.css}">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <title>로그인 페이지</title>
    <style>
        body {
    background: #222D32;
    font-family: 'Roboto', sans-serif;
}

.login-box {
    margin-top: 75px;
    height: auto;
    background: #1A2226;
    text-align: center;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}

.login-key {
    height: 100px;
    font-size: 80px;
    line-height: 100px;
    background: -webkit-linear-gradient(#27EF9F, #0DB8DE);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.login-title {
    margin-top: 15px;
    text-align: center;
    font-size: 30px;
    letter-spacing: 2px;
    margin-top: 15px;
    font-weight: bold;
    color: #ECF0F5;
}

.login-form {
    margin-top: 25px;
    text-align: left;
}

input[type=text] {
    background-color: #1A2226;
    border: none;
    border-bottom: 2px solid #0DB8DE;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    margin-bottom: 20px;
    padding-left: 0px;
    color: #ECF0F5;
}

input[type=password] {
    background-color: #1A2226;
    border: none;
    border-bottom: 2px solid #0DB8DE;
    border-top: 0px;
    border-radius: 0px;
    font-weight: bold;
    outline: 0;
    padding-left: 0px;
    margin-bottom: 20px;
    color: #ECF0F5;
}

.form-group {
    margin-bottom: 40px;
    outline: 0px;
}

.form-control:focus {
    border-color: inherit;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-bottom: 2px solid #0DB8DE;
    outline: 0;
    background-color: #1A2226;
    color: #ECF0F5;
}

input:focus {
    outline: none;
    box-shadow: 0 0 0;
}

label {
    margin-bottom: 0px;
}

.form-control-label {
    font-size: 10px;
    color: #6C6C6C;
    font-weight: bold;
    letter-spacing: 1px;
}

.btn-outline-primary {
    border-color: #0DB8DE;
    color: #0DB8DE;
    border-radius: 0px;
    font-weight: bold;
    letter-spacing: 1px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.btn-outline-primary:hover {
    background-color: #0DB8DE;
    right: 0px;
}

.login-btm {
    float: left;
}

.login-button {
    padding-right: 0px;
    text-align: right;
    margin-bottom: 25px;
}

.login-text {
    text-align: left;
    padding-left: 0px;
    color: #A2A4A4;
}

.loginbttm {
    padding: 0px;
}

.social-form {
	text-align: center;
}

.socialbtn {
	width: 50px;
	height: 50px; 
	background-color: #FFF;
	border-radius: 50%;
	margin: 10px 0;
}

</style>
</head>
<body>
    <form action="${pageContext.request.contextPath }/member/login" method="post">
        <jsp:include page="form_errors.jsp"/>
        <c:if test="${param.error != null}">
		    <div class="alert alert-danger">
		        사용자ID 또는 비밀번호를 확인해 주세요.
		    </div>
		</c:if>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-key">
                    <i class="fa fa-key" aria-hidden="true"></i>
                </div>
                <div class="col-lg-12 login-title">
                    로그인 페이지
                </div>

                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
						<div class="form-group">
							<label class="form-control-label">USERNAME</label>
							<input type="text" name="username" id="username" class="form-control">
                    	</div>
					<div class="form-group">
						<label class="form-control-label">PASSWORD</label>
						<input type="password" name="password" id="password" class="form-control">
                    </div>
                    <div class="form-group social-form">
						<a href="${ naver_url }"><img class="socialbtn" src="${pageContext.request.contextPath }/resources/images/social/navericon.png"></a>
						<a href="${ google_url }"><img class="socialbtn" src="${pageContext.request.contextPath }/resources/images/social/googleicon.png"></a>
						<a href="${ kakao_url }"><img class="socialbtn" src="${pageContext.request.contextPath }/resources/images/social/kakaoicon.png"></a>
					</div>
                     <div class="col-lg-12 loginbttm">
						<div class="col-lg-6 login-btm login-text">
							<!-- Error Message -->
						</div>
						<div class="col-lg-6 login-btm login-button">
						    <button type="submit" class="btn btn-outline-primary">LOGIN</button>
						    <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/signup'" class="btn btn-outline-primary">회원가입</button>
						</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
    </form>
    </div>
        <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js}"></script>
</body>
</html>