<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">메인</div>
				<a class="nav-link" href="${pageContext.request.contextPath }/index">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> 홈
				</a>
				<div class="sb-sidenav-menu-heading">체중/식단</div>
				<a class="nav-link"
					href="${pageContext.request.contextPath }/memberweight/weight">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 체중관리</a>
				<a class="nav-link"
					href="${pageContext.request.contextPath }/diet/list">
					<div class="sb-nav-link-icon">
						<i class="fas fa-drumstick-bite"></i>
					</div> 식단 관리</a>
					
				<div class="sb-sidenav-menu-heading">운동/제품</div>
				<a class="nav-link"
					href="${pageContext.request.contextPath }/memberexset/list">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 운동 도우미</a>
				<a class="nav-link"
					href="${pageContext.request.contextPath }/product">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> 제품 추천</a>
					
				<div class="sb-sidenav-menu-heading">일정 관리</div>
				<a class="nav-link"
					href="${pageContext.request.contextPath }/calendar">
					<div class="sb-nav-link-icon">
						<i class="far fa-calendar-days"></i>
					</div> 캘린더</a>
				<div class="sb-sidenav-menu-heading">게시판</div>
				<a class="nav-link"
					href="${pageContext.request.contextPath }/notice/list">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 공지사항</a>
				<a class="nav-link"
					href="${pageContext.request.contextPath }/board/list">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 질문/답변</a>
			</div>
		</div>
		
	</nav>
</div>
