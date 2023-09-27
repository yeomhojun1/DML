<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/memberlist';">멤버리스트</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/memberlist';">
									<!--          <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/suspended';">정지 멤버 리스트</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/suspended';">
									<!--         <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/adminlist';">관리자 리스트</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/adminlist';">
									<!--    <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/mypage/pwdChange';">Admin 패스워드 변경</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/admin/mypage/pwdChange';">
									<!--       <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>