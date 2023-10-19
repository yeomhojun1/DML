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
    <script	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
    <title>Daily Muscle Life | 회원가입</title>
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
                	회원가입
                </div>
                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                        <form action="${pageContext.request.contextPath }/member/signup" method="post">
                        	<c:if test="${not empty signupResult}">
						        <div class="alert alert-danger" role="alert">
						            <c:out value="${signupResult}"/>
						        </div>
						    </c:if>
                            <div class="form-group">
                                <label class="form-control-label">아이디(E-Mail)</label>
                                <input type="text" name="username" class="form-control" placeholder="이메일 형식으로 입력해주세요">
                                <div class="checkId">
                                </div>
                                <button type="button" onClick="isCheckId()" class="btn btn-outline-primary">ID중복체크</button>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">비밀번호</label>
                                <input type="password" name="password" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">비밀번호 확인</label>
                                <input type="password" name="password2" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">이름</label>
                                <input type="text" name="name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">생년월일</label>
                                <input type="text" name="birthday" class="form-control" maxlength=8 onkeypress="return isNumber(event)" placeholder="YYYYMMDD 형식으로 입력해주세요">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">성별</label>
                                <br>
                                <input type="radio" id="man" name="gender" class="gender" checked="checked" value="남"><label for="man">남</label>
                                <input type="radio" id="woman" name="gender" class="gender" value="여"><label for="woman">여</label>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">키</label>
                                <input type="text" name="height" maxlength=5 onkeypress="return isDouble(event)" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">몸무게</label>
                                <input type="text" name="weight" maxlength=5 onkeypress="return isDouble(event)" class="form-control">
                            </div>
                            
                            <div class="col-lg-12 loginbttm">
                                <div class="col-lg-6 login-btm login-text">
                                    <!-- Error Message -->
                                </div>
                                <div class="col-lg-6 login-btm login-button">
                                    <button type="submit" class="btn btn-outline-primary">회원가입</button>
                                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/index'" class="btn btn-outline-primary">홈</button>
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
		
		function isDouble(event) {
		    const value = event.target.value;
		    if (value === "") return true;
		    
		    const charCode = (event.which) ? event.which : event.keyCode;
		    if (charCode !== 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
		
		function isCheckId(event) {
			let username = $("[name=username]").val();
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/member/signup/checkId",
				data:{username: username},
				success: function(result) {
					if(result == 0) {
						alert("USERNAME을 입력해주세요.");
					} else if(result == 1) {
						alert("해당 USERNAME은 사용 가능합니다.");						
						htmlVal = "<label class='form-control-label checkIdResult' name='checkIdSuccess'>USERNAME 사용 가능</label>"
						$(".checkIdResult").remove();
						$(".checkId").html(htmlVal);
					} else if(result == 2) {
						alert("USERNAME이 중복되었습니다. 다른 USERNAME을 입력해주세요.");						
						htmlVal = "<label class='form-control-label checkIdResult' name='checkIdError'>USERNAME 중복</label>"
						$(".checkIdResult").remove();
						$(".checkId").html(htmlVal);
					}
				},
				error : (request, status, error) => {
					alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
				},
			})
		}
	</script>
</body>
</html>