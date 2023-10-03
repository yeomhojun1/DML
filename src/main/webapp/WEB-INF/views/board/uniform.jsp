<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 하기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	var cnt = 1;
	function fn_addFile() {
		$("#d_file").append(
				"<br>" + "<input type='file' name='file" + cnt + "' />");
		cnt++;
	}
</script>

</head>
<body>
	<h1>파일 업로드 하기</h1>
	<form method="post"
		action=${pageContext.request.contextPath}/board/upload
		enctype="multipart/form-data">
		<input type="hidden" value="${member.memberId}" name="memberId">
		<label>제목 : </label> <input type="text" name="boardTitle"><br>
		<label>내용 : </label>
		<textarea rows="10" cols="20" name="boardContent"></textarea>
		<br> <input type="button" value="파일 추가" onClick="fn_addFile()"><br>

		<div id="d_file"></div>
		<input type="submit" value="업로드">
	</form>
</body>
</html>
