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
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLayouts" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 체중관리
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayouts">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link"
							href="${pageContext.request.contextPath }/memberweight/weight">체중관리</a>
						<a class="nav-link"
							href="${pageContext.request.contextPath }/memberweight/composition">체조성 기록</a>
						<a class="nav-link"
							href="${pageContext.request.contextPath }/memberweight/healthmap">주변 헬스장 찾기</a>
					</nav>
				</div>
				<a class="nav-link"
					href="${pageContext.request.contextPath }/diet/list">
					<div class="sb-nav-link-icon">
						<i class="fas fa-drumstick-bite"></i>
					</div> 식단 관리</a>
					
				<div class="sb-sidenav-menu-heading">운동/제품</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseHealth" aria-expanded="false"
					aria-controls="collapseHealth">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 운동 도우미
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseHealth">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link"
							href="${pageContext.request.contextPath }/memberexset/list">내 운동 리스트</a>
						<a class="nav-link"
							href="${pageContext.request.contextPath }/exercise/list">운동 추가</a>
					</nav>
				</div>
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
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseBoard" aria-expanded="false"
					aria-controls="collapseBoard">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 게시판
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseBoard"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link"
							href="${pageContext.request.contextPath }/notice/list">공지사항</a>
						<a class="nav-link"
							href="${pageContext.request.contextPath }/board/list">이벤트</a>
						<a class="nav-link"
							href="${pageContext.request.contextPath }/board/list">질문/답변</a>
					</nav>
				</div>
				<c:choose>
					<c:when test="${member.authorities eq 'ROLE_ADMIN'}">
				<div class="sb-sidenav-menu-heading">회원관리</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseMember" aria-expanded="false"
						aria-controls="collapseMember">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> 회원정보 
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseMember">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" 
								href="${pageContext.request.contextPath }/admin/memberlist">멤버 리스트</a> 
							<a class="nav-link" 
								href="${pageContext.request.contextPath }/admin/suspended">정지 멤버 리스트</a>
							<a class="nav-link" 
								href="${pageContext.request.contextPath }/admin/adminlist">관리자 리스트</a>
						</nav>
					</div>
					<div class="sb-sidenav-menu-heading">공지사항/이벤트</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
						data-bs-target="#collapseNotice" aria-expanded="false"
						aria-controls="collapseNotice">
						<div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i>
						</div> 게시판
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseNotice">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="${pageContext.request.contextPath }/notice/list">공지사항</a> 
							<a class="nav-link" href="${pageContext.request.contextPath }/board/list">이벤트</a>
						</nav>
					</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="sb-sidenav-footer">
		<div style="font-weight: bold;">답변 채택 순위</div>
			<div class="small rankingMember">
			</div>
		</div>
	</nav>
</div>
<script>
	window.onload = function() {
		$.ajax({
	           type: "get",
	           url: "${pageContext.request.contextPath}/member/memberReputation",
			success: function(result){
				 var htmlVal = "<table class='ranktable'><tr><th class='rankth'>등수</th><th class='rankth'>이름</th><th class='rankth'>점수</th><tr>";
				for(var i=0; i<3;i++){
					htmlVal += "<tr><td class='ranktd'>"+(i+1)+"등</td><td class='ranktd'>"+result[i].mname+"</td><td class='ranktd'>"+result[i].reputation+"점</td></tr>"
				}
				htmlVal += "</table>"
				$(".rankingMember").html(htmlVal); 
			
			},
			error : function(){
				console.log("asidebar error");
			}
		})
	}
</script>