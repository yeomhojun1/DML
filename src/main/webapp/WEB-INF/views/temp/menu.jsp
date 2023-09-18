<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body" onClick="location.href='${pageContext.request.contextPath }/weight2';">체중관리</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between" onClick="location.href='${pageContext.request.contextPath }/main';">
									<!--          <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body" onClick="location.href='${pageContext.request.contextPath }/composition';">체조성 기록</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between" onClick="location.href='${pageContext.request.contextPath }/main';">
									<!--         <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body" onClick="location.href='${pageContext.request.contextPath }/main';">주변 헬스장 찾기</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between" onClick="location.href='${pageContext.request.contextPath }/main';">
									<!--    <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body" onClick="location.href='${pageContext.request.contextPath }/member/mypage';">마이페이지</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between" onClick="location.href='${pageContext.request.contextPath }/main';">
									<!--       <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>