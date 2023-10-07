<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body card-cursor" onClick="location.href='${pageContext.request.contextPath }/exercise/list';">나의 운동</div>
								<%-- <div
									class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/exercise/list';">
									<!--          <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div> --%>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body card-cursor" onClick="location.href='${pageContext.request.contextPath }/diet/list';">나의 식단</div>
								<%-- <div
									class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/diet/list';">
									<!--         <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div> --%>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body card-cursor" onClick="location.href='${pageContext.request.contextPath }/board/list';">커뮤니티</div>
								<%-- <div
									class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/memberweight/healthmap';">
									<!--    <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div> --%>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body card-cursor" onClick="location.href='${pageContext.request.contextPath }/member/mypage';">마이페이지</div>
								<%-- <div
									class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/member/mypage';">
									<!--       <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div> --%>
							</div>
						</div>
					</div>