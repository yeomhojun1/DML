<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Daily Muscle Life</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ck에디터적용코드  -->
<script language="javascript"
	src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
                    <!-- 마이페이지 내용 추가 필요 -->
                    <h1>기본 정보 표시</h1>
						<div>
							<div class="MyPage_basic_input_row__MlwU7">
								<div class="MyPage_title">이름/별명</div>
								<div class="MyPage_content">
									<input class="ant-input css-1s3dcof MyPage_basic_input__6F21f" type="text" value="Suhyeon Yoo">
								</div>
								<div class="MyPage_title">이메일</div>
								<div class="MyPage_content">
									<input disabled="" class="ant-input ant-input-disabled css-1s3dcof MyPage_basic_input__6F21f" type="text" value="codesh123@gmail.com">
								</div>
							</div>
							<div class="MyPage_basic_input_row__MlwU7">
								<div class="MyPage_title">키</div>
								<div class="MyPage_content">
									<input class="ant-input css-1s3dcof MyPage_basic_input__6F21f" type="text" value="162">
								</div>
								<div class="MyPage_title">몸무게</div>
								<div class="MyPage_content">
									<input class="ant-input css-1s3dcof MyPage_basic_input__6F21f" type="text" value="80">
								</div>
								<div class="MyPage_title">성별</div>
								<div class="MyPage_content">
									<div class="ant-radio-group ant-radio-group-solid css-1s3dcof">
										<label class="ant-radio-button-wrapper ant-radio-button-wrapper-checked MyPage_gender_btn__Obpkp MyPage_gender_btn_selected__dCSN_ css-1s3dcof"><span class="ant-radio-button ant-radio-button-checked"><input type="radio" class="ant-radio-button-input" value="M" checked=""><span class="ant-radio-button-inner"></span></span><span>남자</span></label><label class="ant-radio-button-wrapper MyPage_gender_btn__Obpkp  css-1s3dcof"><span class="ant-radio-button"><input type="radio" class="ant-radio-button-input" value="F"><span class="ant-radio-button-inner"></span></span><span>여자</span></label>
									</div>
								</div>
							</div>
							<button type="button" class="ant-btn css-1s3dcof ant-btn-default ant-btn-block MyPage_basic_btn__7B7sc">
								<span>저장하기</span>
							</button>
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
