<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-xl-3 col-md-6">
		<div class="card bg-secondary text-white mb-4">
			<div class="card-body card-cursorcollapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseWeight" aria-expanded="false">
					체중 / 식단
			</div>
			<div class="collapse" id="collapseWeight">
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/memberweight/weight';">
					체중 관리
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/diet/list';">
					식단 관리
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/memberweight/composition';">
					체조성 기록
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/memberweight/healthmap';">
					주변 헬스장 찾기
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6">
		<div class="card bg-secondary text-white mb-4">
			<div class="card-body card-cursorcollapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseHealth" aria-expanded="false">
					운동 / 제품
			</div>
			<div class="collapse" id="collapseHealth">
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/memberexset/list';">
					내 운동 리스트
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/exercise/list';">
					운동 추가
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/product';">
					제품 추천
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6">
		<div class="card bg-secondary text-white mb-4">
			<div class="card-body card-cursorcollapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseBoard" aria-expanded="false">
					게시판
			</div>
			<div class="collapse" id="collapseBoard">
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/notice/list';">
					공지사항
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/board/list';">
					질문 / 답변
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6">
		<div class="card bg-secondary text-white mb-4">
			<div class="card-body card-cursorcollapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseCalendar" aria-expanded="false">
					일정 관리
			</div>
			<div class="collapse" id="collapseCalendar">
				<div
					class="card-footer d-flex align-items-center justify-content-between card-cursor" onClick="location.href='${pageContext.request.contextPath }/calendar';">
					캘린더
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>