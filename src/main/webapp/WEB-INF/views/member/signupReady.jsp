<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <title>Daily Muscle Life | 메일 인증 필요</title>
<jsp:include page="/WEB-INF/views/frame/logincss.jsp"></jsp:include>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-key">
                    <img src="${pageContext.request.contextPath }/resources/images/dmlLogo.png" style="width:239px; height:100px;">
                </div>
                <div class="col-lg-12 login-title">
                    메일인증을 해야 로그인 가능합니다.
                </div>
                    <div class="col-lg-12 loginbttm">
						<div class="col-lg-12 login-btm login-button">
						    <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/login'" class="btn btn-outline-primary">Login</button>
						    <button type="button" onclick="location.href='${pageContext.request.contextPath}/index'" class="btn btn-outline-primary">홈</button>
						</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
</body>
</html>