<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div id="layoutSidenav_nav">
<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
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
								<a class="nav-link" href="${pageContext.request.contextPath }/memberweight/weight">체중관리</a> 
								<a class="nav-link" href="${pageContext.request.contextPath }/memberweight/composition">체조성 기록</a>
								<a class="nav-link" href="${pageContext.request.contextPath }/memberweight/healthmap">주변 헬스장 찾기</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="${pageContext.request.contextPath }/diet/list" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
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
								<a class="nav-link" href="${pageContext.request.contextPath }/diet/list">식단관리</a> 
								<a class="nav-link" href="${pageContext.request.contextPath }/diet/list">밀프렙 도우미</a> 
								<a class="nav-link" href="${pageContext.request.contextPath }/diet/list">보충제 활용</a> 
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">운동/제품</div>
						<a class="nav-link" href="${pageContext.request.contextPath }/exercise/list">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 운동 도우미
						</a> 
						<a class="nav-link" href="${pageContext.request.contextPath }/product">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 제품 추천
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
				</div>