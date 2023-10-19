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
    <title>Daily Muscle Life | 비밀번호 찾기</title>
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
                	비밀번호 찾기
                </div>
                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                        <form action="${pageContext.request.contextPath }/member/pwdSearch" method="post">
                            <jsp:include page="form_errors.jsp"/>
                            <div class="form-group">
                                <label class="form-control-label">아이디(E-Mail)</label>
                                <input type="text" name="username" class="form-control" placeholder="이메일 형식으로 입력해주세요">
								<c:if test="${not empty errorMessages}">
								    <div class="alert alert-danger">
								        <c:choose>
								            <c:when test="${errorMessages.contains('아이디는 필수항목입니다.')}">
								                <c:out value="아이디는 필수항목입니다."/><br/>
								            </c:when>
								            <c:when test="${errorMessages.contains('이메일 형식으로 입력해주세요.')}">
								                <c:out value="이메일 형식으로 입력해주세요."/><br/>
								            </c:when>
								        </c:choose>
								    </div>
								</c:if>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">이름</label>
                                <input type="text" name="name" class="form-control">
                                <!-- 이름 에러 메시지 -->
								<c:if test="${errorMessages.contains('이름은 필수항목입니다.')}">
								    <div class="alert alert-danger">
								        <c:out value="이름은 필수항목입니다."/><br/>
								    </div>
								</c:if>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">생년월일</label>
                                <input type="text" name="birthday" class="form-control" maxlength=8 onkeypress="return isNumber(event)" placeholder="YYYYMMDD 형식으로 입력해주세요">
                                <!-- 생년월일 에러 메시지 -->
								<c:if test="${errorMessages.contains('생년월일은 YYYYMMDD 형식으로 입력해주세요.')}">
								    <div class="alert alert-danger">
								        <c:out value="생년월일은 YYYYMMDD 형식으로 입력해주세요."/><br/>
								    </div>
								</c:if>
                            </div>
                            <div class="col-lg-12 loginbttm">
                                <div class="col-lg-6 login-btm login-button">
                                    <button type="submit" class="btn btn-outline-primary">비밀번호 찾기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
    </div>
	<script>
		function isNumber(event) {
		    const charCode = (event.which) ? event.which : event.keyCode;
		    if (charCode !== 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
	</script>
</body>
</html>