<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<div class="collapse" id="collapseLayouts"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link"
							href="${pageContext.request.contextPath }/memberweight/weight">체중관리</a>
						<a class="nav-link"
							href="${pageContext.request.contextPath }/memberweight/composition">체조성
							기록</a> <a class="nav-link"
							href="${pageContext.request.contextPath }/memberweight/healthmap">주변
							헬스장 찾기</a>
					</nav>
				</div>
				<a class="nav-link collapsed"
					href="${pageContext.request.contextPath }/diet/list"
					data-bs-toggle="collapse" data-bs-target="#collapsePages"
					aria-expanded="false" aria-controls="collapsePages">
					<div class="sb-nav-link-icon">
						<i class="fas fa-book-open"></i>
					</div> 식단관리
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapsePages"
					aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav accordion"
						id="sidenavAccordionPages">
						<a class="nav-link"
							href="${pageContext.request.contextPath }/exercise/list">운동
							도우미</a> <a class="nav-link"
							href="${pageContext.request.contextPath }/product">제품 추천</a>
					</nav>
				</div>
				<%-- <div class="sb-sidenav-menu-heading">운동/제품</div>
				<a class="nav-link"
					href="${pageContext.request.contextPath }/exercise/list">
					<div class="sb-nav-link-icon">
						<i class="fas fa-chart-area"></i>
					</div> 운동 도우미
				</a> <a class="nav-link"
					href="${pageContext.request.contextPath }/product">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> 제품 추천
				</a> --%>
			</div>
		</div>
		<div class="sb-sidenav-footer">
		<div>답변 채택 순위</div>
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
				 var htmlVal = "";
				for(var i=1; i<4;i++){
					htmlVal +=
						'<div> '+i+'등 '+result[i].memberId+' </div>'
				}
				$(".rankingMember").html(htmlVal); 
			
			},
			error : function(){
				console.log("asidebar error");
			}
		})
	}



</script>