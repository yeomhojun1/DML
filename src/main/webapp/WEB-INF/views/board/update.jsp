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
<!-- 템플릿의 기본 css -->
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />

<!-- 템플릿의 상세내용의 css -->
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />

<!-- JQuery 사용 -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>

<!-- 템플릿 아이콘 사용 -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
<!-- 템플릿에서 메뉴 클릭 시 서브메뉴 출력 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<!-- 차트 기능 사용 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Daily Muscle Life</h1>
					<jsp:include page="/WEB-INF/views/frame/menu.jsp"></jsp:include>
					<div class="card">
						<form method="post"
							action=${pageContext.request.contextPath}/board/update
							enctype="multipart/form-data" class="">
							<input type="hidden" value="${member.memberId}" name="memberId">
							<input type="hidden" value="${boardone.boardNo}" name="boardNo">
							<div>
							제목 :
							<textarea rows="1" class="col-xl-12" name="boardTitle">${boardone.boardTitle}</textarea>
							</div>
							<div>
						내용 : 
							<textarea rows="10" cols="20" name="boardContent" id="editor1">${boardone.boardContent}</textarea>
							</div>

							<input type="submit" value="저장">
					</div>
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
	<script>
	const cloudName = "db7cajuz1";
	const unsignedUploadPreset = '<Your unsignedUploadPreset>';
		$(function() {
			CKEDITOR
					.replace(
							'editor1',
							{
								filebrowserUploadUrl : '${pageContext.request.contextPath}/board/upload'
							});
		});
		editor.on( 'fileUploadRequest', function(evt) {

			// Prepare request to Cloudinary
			var url = 'https://api.cloudinary.com/v1_1/'+cloudName+'/upload';
			var xhr = evt.data.fileLoader.xhr;
			xhr.open('POST', url, true);
			xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
			
			// Fill all necessary fields for Cloudinary
			var fd = new FormData();
			fd.append('upload_preset', unsignedUploadPreset);
			fd.append('folder', 'content/articles'); // Optional - place image at specific folder admin in Cloudinary
			fd.append('tags', 'browser_upload'); // Optional - add tag for image admin in Cloudinary
			fd.append('file', evt.data.fileLoader.file);
			
			// Send the request to Cloudinary server
			xhr.send(fd);

			// Prevented the default behavior.
			evt.stop();
		});

		// Change response to handle Cloudinary response
		editor.on( 'fileUploadResponse', function(evt) {

			// Prevent the default response handler.
			evt.stop();

			// Get XHR and response.
			var data = evt.data,
			xhr = data.fileLoader.xhr,
			response = JSON.parse(xhr.responseText);

			// Transfer the response to Ckeditor format
			data.uploaded = 1;
			data.fileName = response.public_id + '.' + response.format;
			data.url = response.secure_url;
		});
	</script>
</body>
</html>

