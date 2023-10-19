<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto">
    <title>Daily Muscle Life | 소셜 회원가입</title>
<jsp:include page="/WEB-INF/views/frame/logincss.jsp"></jsp:include>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-key">
                    <i class="fa fa-key" aria-hidden="true"></i>
                </div>
                <div class="col-lg-12 login-title">
                	소셜 회원가입
                </div>
                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                        <form action="${pageContext.request.contextPath }/member/agreement" method="post">
                            <jsp:include page="form_errors.jsp"/>
                            <div class="form-group">
                                <label class="form-control-label">생년월일</label>
                                <input type="text" name="birthday" class="form-control" maxlength=8 onkeypress="return isNumber(event)" placeholder="YYYYMMDD 형식으로 입력해주세요">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">성별</label>
                                <br>
                                <input type="radio" id="man" name="gender" class="gender" checked="checked" value="남"><label for="man" style="color:#fff;">남</label>
                                <input type="radio" id="woman" name="gender" class="gender" value="여"><label for="woman" style="color:#fff;">여</label>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">키</label>
                                <input type="text" name="height" maxlength=5 onkeypress="return isDouble(event)" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">몸무게</label>
                                <input type="text" name="weight" maxlength=5 onkeypress="return isDouble(event)" class="form-control">
                            </div>
                            <input type="hidden" name="username" value="${member.memberId}">
                            <input type="hidden" name="password" value="SOCIAL_USER">
                            <input type="hidden" name="name" value="${member.mname}">
                            <input type="hidden" name="googleid" value="${member.googleid}">
						    <input type="hidden" name="naverid" value="${member.naverid}">
						    <input type="hidden" name="kakaoid" value="${member.kakaoid}">
                            
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
			    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
			        return false;
			    }
			    return true;
			}
			
			function isDouble(event) {
			    const charCode = (event.which) ? event.which : event.keyCode;
			    if (charCode !== 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
			        return false;
			    }
			    return true;
			}
		</script>
</body>
</html>