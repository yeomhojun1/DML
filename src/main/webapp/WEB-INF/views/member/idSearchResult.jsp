<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto">
    <title>Daily Muscle Life | 아이디 찾기 결과</title>
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
                	아이디 찾기 결과
                </div>
                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
						<div class="form-group">
							<c:forEach items="${memberlist }" var="member">
								<label class="form-control-label"><c:out value="${member.memberId}"/></label>
							</c:forEach>
						</div>
                    </div>
                    <div class="col-lg-12 loginbttm">
						<div class="col-lg-12 login-btm login-button">
						    <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/login'" class="btn btn-outline-primary">로그인</button>
						    <button type="button" onclick="location.href='${pageContext.request.contextPath}/index'" class="btn btn-outline-primary">홈</button>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>