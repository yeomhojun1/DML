<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과창</title>
</head>
<body>
<h1>업로드가 완료되었습니다.</h1>
<label>작성자 : </label>
<input type="text" name="memberId" value="${map.memberId}" readonly><br>
<label>제목 : </label>
<input type="text" name="boardTitle" value="${map.boardTitle}" readonly><br>
<label>내용 : </label>
<input type="text" name="boardContent" value="${map.boardContent}" readonly><br>
 
<div class="result-images">
    <c:forEach var="imageFileName" items="${map.fileList}">
        <img src=
        "${pageContext.request.contextPath}/board/upload?imageFileName=${imageFileName}">
        <br><br>
    </c:forEach>
</div>

<a href="${pageContext.request.contextPath}/board/form">다시 업로드 하기</a>
</body>
</html>