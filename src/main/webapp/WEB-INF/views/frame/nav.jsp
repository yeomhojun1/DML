<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<<style>
.rankingMember{
	padding-top : 20px;
	color : white;
	border: 0;
	
}
</style>
<script>
	window.onload = function() {
		$.ajax({
	           type: "get",
	           url: "${pageContext.request.contextPath}/member/memberReputation",
			success: function(result){
				var htmlVal ="<p><MARQUEE>답변 채택 순위 : "
				for(var i=0; i<3;i++){
					 htmlVal += (i+1)+"등 - "+result[i].mname+"님 - "+result[i].reputation+"점 / ";
				}
				htmlVal+="축하드립니다! </MARQUEE></p>"
				$(".rankingMember").html(htmlVal); 
			
			},
			error : function(){
				console.log("asidebar error");
			}
		})
	}
</script>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="${pageContext.request.contextPath }/index">
			<img src="${pageContext.request.contextPath }/resources/images/dmlLogo.png" style="width:120px; height:50px;">
		</a>
		<div class="rankingMember"></div>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<%-- 사용자가 로그인되어 있지 않은 경우 --%>
					<c:if test="${empty sessionScope.loginUser}">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/member/login">로그인</a></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/member/signup">회원가입</a></li>
					</c:if>

					<%-- 사용자가 로그인된 경우 --%>
					<c:if test="${not empty sessionScope.loginUser}">
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/member/mypage">마이페이지</a></li>
						<li><a class="dropdown-item"
							href="${pageContext.request.contextPath }/member/logout">로그아웃</a></li>
					</c:if>
				</ul></li>
		</ul>
	</nav>