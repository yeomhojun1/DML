<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body card-cursor" onClick="location.href='${pageContext.request.contextPath }/member/mypage';">기본 정보</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/member/mypage';">
									<!--          <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body card-cursor" onClick="location.href='${pageContext.request.contextPath }/member/mypage/pwdChange';">비밀번호 변경</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/member/mypage/pwdChange';">
									<!--         <a class="small text-white stretched-link" href="#">View Details</a> -->
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>