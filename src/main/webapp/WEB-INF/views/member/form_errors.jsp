<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 아래의 코드는 errors 객체가 모델에 존재하고 에러 메시지가 있는 경우에만 에러를 표시합니다. --%>
<% if(request.getAttribute("errors") != null && !((List<String>)request.getAttribute("errors")).isEmpty()) { %>
    <div class="alert alert-danger" role="alert">
        <c:forEach var="err" items="${errors}">
            <div><c:out value="${err}"/></div>
        </c:forEach>
    </div>
<% } %>