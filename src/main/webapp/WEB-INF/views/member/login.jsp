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
    <title>Daily Muscle Life | 로그인 페이지</title>
<jsp:include page="/WEB-INF/views/frame/logincss.jsp"></jsp:include>    
</head>
<body>
    <form action="${pageContext.request.contextPath }/member/login" method="post">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-key">
                    <img src="${pageContext.request.contextPath }/resources/images/dmlLogo.png" style="width:239px; height:100px;">
                </div>
                <div class="col-lg-12 login-title">
                    로그인 페이지
                </div>
				<c:if test="${not empty loginResult}">
			        <div class="alert alert-danger" role="alert">
			            <c:out value="${loginResult}"/>
			        </div>
			    </c:if>
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
					<div class="form-group">
						<label>
							<input type="checkbox" name="useCookie" id="useCookie">&nbsp<label class="form-control-label" for="useCookie">로그인유지</label>
						</label>
					</div>
                    <div class="form-group social-form">
						<a href="${ naver_url }"><img class="socialbtn" src="${pageContext.request.contextPath }/resources/images/social/navericon.png"></a>
						<a href="${ google_url }"><img class="socialbtn" src="${pageContext.request.contextPath }/resources/images/social/googleicon.png"></a>
						<a href="${ kakao_url }"><img class="socialbtn" src="${pageContext.request.contextPath }/resources/images/social/kakaoicon.png"></a>
					</div>
                    <div class="col-lg-12 loginbttm">
						<div class="col-lg-12 login-btm login-button">
						    <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/idSearch'" class="btn btn-outline-primary">아이디찾기</button>
						    <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/pwdSearch'" class="btn btn-outline-primary">비밀번호찾기</button>
						</div>
                    </div>
                    <div class="col-lg-12 loginbttm">
						<div class="col-lg-12 login-btm login-button">
						    <button type="submit" class="btn btn-outline-primary">LOGIN</button>
						    <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/signup'" class="btn btn-outline-primary">회원가입</button>
						</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
        </div>
        </div>
    </form>
</body>
</html>