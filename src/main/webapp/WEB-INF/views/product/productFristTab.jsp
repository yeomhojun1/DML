<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<main id="tab1">
				<div class="container-fluid px-4">
					<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<button class="h3 mb-0 text-gray-800 card h-100 py-2 btn1_title tabmenu active" data-tabmenu="1">보충제</button>
						<button class="h3 mb-0 text-gray-800 card h-100 py-2 btn2_title tabmenu" data-tabmenu="2">닭가슴살</button>
						
						<a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="${pageContext.request.contextPath }/fullcalendar/calendar"><i
							class="fas fa-download fa-sm text-white-50"></i>calendar</a>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2 difficulty">
							
									<button class="h5 mb-0 font-weight-bold text-gray-800 card-body difficulty-btn btn1 active">초보자</button>
									
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2 difficulty">
							
									<button class="h5 mb-0 font-weight-bold text-gray-800 card-body difficulty-btn btn2 active">숙련자</button>
									
							</div>
						</div>
						
						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2 difficulty">
							
									<button class="h5 mb-0 font-weight-bold text-gray-800 card-body" onClick="location.href='https://ptsports.co.kr/'">운동기구 바로가기</button>
									
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2 difficulty">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											 <button class="h5 mb-0 font-weight-bold text-gray-800 card-body" onClick="location.href='https://www.myprotein.co.kr/'">단백질보충제 & 건강보조식품</button>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>



					<!-- Content Row -->
					<div class="row">

						<!-- Content Column -->
						<div class="col-lg-6 mb-2" >

					<div class="row row-menu beginner active">

						<!-- Color System 1 -->

						<!-- foreach로 목록들 불러오게 하는거 private List<FpSuplementVo> fpSuplemenList;  -->
						<div class="row col-lg-6 beginner">
							<!--  varStatus 숫자 자동으로 1,2,3~ 하게 하는것 -->
							<c:forEach items="${nutruentBeginerlist }" var="nutruent" varStatus="vs">
								<div class="col-lg-12 mb-2">
									<div class="card bg-primary text-white shadow">
										<button
											class="btn-menu card-body beginner-btn btn-sub${vs.count }"
											data-toggle="menu-${vs.count }">
											<h5>${nutruent.nutrient }</h5>
										</button>
									</div>

								</div>
							</c:forEach>
						</div>


						<c:forEach items="${nutruentBeginerlist }" var="a" varStatus="vs">
							<div class="row col-lg-6 btn-menu menu-${vs.count }">
								<c:forEach items="${a.fpSuplementList}" var="b" varStatus="ss"> 
									<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="${b.link }">${b.suplementname }</a>
										</div>
									</div>
									</div>
								</c:forEach>
							</div>
						</c:forEach>
					</div>




					<div class="row row-menu export">
						<!-- 숙련자 메뉴들 -->
						<div class="row col-lg-6 export">
							<c:forEach items="${nutruentExpertlist}" var="q" varStatus="vv">
								<div class="col-lg-12 mb-2">
									<div class="card bg-primary text-white shadow">

										<button
											class="btn-menu card-body export-btn btn-sub${vv.count } active"
											data-toggle="menu-${vv.count }">
											<h5>${q.nutrient }</h5>
										</button>
									</div>
								</div>
							</c:forEach>
						</div>
						
						
						
						<c:forEach items="${nutruentExpertlist }" var="q" varStatus="vv">
						<div class="row col-lg-6 btn-menu menu-${vv.count }">
							<c:forEach items="${q.fpSuplementList}" var="b" varStatus="ss">
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="${b.link}">
											${b.suplementname} </a>
											
										</div>
									</div>
								</div>
							</c:forEach>								
						</div>
						</c:forEach>
						
					</div>
				</div>


						<div class="col-lg-6 mb-4">

							<!-- 코멘트---------------------------------------- -->
							
							<div class="card shadow mb-4 ">
							
								<div class="card-header py-2">
									<h6 class="m-0 font-weight-bold text-primary">*A급 
										*B급 번외 성분</h6>
								</div>
								<div class="card-body menu-comment comment1">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4>
										</br>체중 1kg당 1.6~2g </br>
									</div>
									<div>
										<h4 style="line-height: 7">코멘트</h4>
										</br>
										<div>초보자는 2g이 좋다. 흰우유(500ml)를 잘못먹으면 WPI,잘 먹으면 WPC, 적당히 잘
											먹으면 WPI+WPC</div>
										</br>
									</div>
									<div>
										<h4>대상</h4>
										</br> 단백질을 잘 못챙겨먹는 사람,
									</div>
									</p>

								</div>
								<div class="card-body menu-comment comment2">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4 style="line-height: 7">코멘트</h4>
										</br>식사를 통한 섭취를 더 추천합니다. </br>
									</div>
									</p>

								</div>
								<div class="card-body menu-comment comment3">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4><br>
										1/2 ~ 1서빙
										
										<h4>코멘트</h4>
										</br>식사를 통한 섭취를 더 추천합니다.
									</div>
									</p>

								</div>
								<div class="card-body menu-comment comment4">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4><br>
										100억(10 Billion)
										
										<h4>코멘트</h4>
										</br>소화 능력이 약한 사람에게 추천
									</div>
									</p>

								</div>
								<div class="card-body menu-comment comment5">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4><br>
										25g
										
										<h4>코멘트</h4>
										</br>소화 능력이 약한 사람에게 추천, 익힌 채소 추천, 섭취량 한번에 늘리지 말것.
									</div>
									</p>

								</div>
									<div class="card-body menu-comment comment6">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4><br>
										5g
										
										<h4>코멘트</h4>
										</br>소화 능력이 약한 사람에게 추천
									</div>
									</p>
									

								</div>

									<div class="card-body menu-comment comment7">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4><br>
										체중 1kg당 3~6mg, 평균 200mg~250mg
										
										<h4>코멘트</h4>
										</br>사람마다 개인차 심함, 부스터의 카페인과 커피, 에너지 드링크의 카페인이 다름, 
										부스터가 더 빠르고 강함, 효과가 강하고 좋으나 불면, 피로, 혈압상승, 속쓰림 등 유발될 수 있음
										<h4>대상</h4>
										지구력(5~105분), 근력운동(짧은시간)
									</div>
								</div>
									<div class="card-body menu-comment comment8">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4><br>
										꾸준히 섭취 -5g,빠르게 로딩 -20g 7일동안
										
										<h4>코멘트</h4>
										</br>지속적 섭취를 통해 체내 보유량 증가 목표, 근육량이 좀 있어야 효과적임
										<h4>대상</h4>
										150초 이하 운동, 30초 이하 운동이 가장 효과적
									</div>
								</div>
									<div class="card-body menu-comment comment9">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4><br>
										65mg/kg, 따끔거림이 싫다면, 1g씩 나눠서 섭취
										
										<h4>코멘트</h4>
										</br>지속적 섭취를 통해 체내 보유량 증가 목표
										<h4>대상</h4>
										젖산이 생성되는 운동(30초~10분) 매우 짧은 운동
										</p>
									</div>
								</div>
									<div class="card-body menu-comment comment10">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4><br>
										310~560mg, 무, 비트 300g
										
										<h4>코멘트</h4>
										</br>섭취가 까다로움, 보충제도 존재하나, 식품 섭취 권장
										<h4>대상</h4>
										12분 미만은 애매, 12분 이상 40분 이하 효과
									</div>
									</p>
									

								</div>
								<div class="card-body menu-comment comment11">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4><br>
										0.2~0.4kg/kg
										
										<h4>코멘트</h4>
										</br>마트에 500원으로 살 수 있는 성분,
										 A급 성분으로 유명하지만, 왜 보충제로 안나오는지 먹어보면 알 수 있다. 
										속쓰림 주의, 노익스에 가스 소리 원인
										<h4>대상</h4>
										60초 ~ 10분, 길어질수록 효과 반감
										</p>
									</div>
								</div>
								<div class="card-body menu-comment comment12">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 50rem;">
									</div>
									<div>
										<p>
										<h4>섭취량</h4><br>
										게토레이, 포카리스웨트, 30분당 500ml(초과섭취x)
										
										<h4>코멘트</h4>
										</br>수분과 탄수화물(에너지)의 빠른 공급, 
										운동중에 공급이 가능하다는 장점, 운동 강도, 
										소화 능력에 따라 섭취량과 농도 조절 필수
										<h4>대상</h4>
										운동시간이 매우 긴 경우, 장시간 공복 후 운동할 경우 추천
										</p>
									</div>
								</div>
							

							<!-- 섭취방법--------------------------------------------- -->
							
							<div class="card shadow mb-4">
								<div class="card-header py-2 ">
									<h6 class="m-0 font-weight-bold text-primary">섭취 방법</h6>
								</div>
								<div class="card-body menu-comment comment1">
									<p>운동후 섭취 혹은 단백질이 적은 식사 후, 운동후 식사가 바로 있다면 20g, 운동후 식사가 바로
										없다면 40g타서 3/4을 바로 먹고 1/4은 30분후 섭취</p>

								</div>
								<div class="card-body menu-comment comment2">
									<p>인스턴트 오트는 아침식사로 적합하며, 마이프로틴 쉐이커에 2 1/3 (100g) 큰 스쿱과 물 또는 선호하는 음료를 넣어서 섭취하세요. 
									충분한 탄수화물을 섭취하면서 운동목표를 달성하는데 효과적입니다.
									 해당 제품은 직사광선을 피하여 서늘하고 건조한 장소에 보관하세요.</p>

								</div>
								<div class="card-body menu-comment comment3">
									<p>종합비타민에는 미네랄 성분과 지용성 비타민이 함께 들어있어 식사 후에 복용하는 것이 좋다.
									 또, 신체 활력에 도움을 주기 때문에 아침 식후에 먹는 것이 좋다.
									  아침 식사를 안 한다면, 점심 식사 후에 복용하는 것을 추천한다.
									 공복에 아연을 먹으면 속이 쓰릴 수 있다.</p>

								</div>
								<div class="card-body menu-comment comment4">
									<p>먼저 식후에 섭취하면 유산균이 먹이로 삼을 수 있는 것이 많아 균의 활동력이 좋아질 수 있다. 
									또 식전이나 공복에 섭취하면 균의 대장 도달력이 높아질 수 있으나 위산의 영향을 많이 받을 수 있으므로 
									물을 많이 마시면서 섭취하는 것이 권장됩니다.</p>

								</div>
								<div class="card-body menu-comment comment5">
									<p>전문가들은 평소 잡곡밥(보리, 현미 등)과 채소(매 끼니 1~2접시), 
									과일 1~2회(과일주스보다는 생과일) 정도의 식단이면 하루 식이섬유 섭취량을 충분히 보충할 수 있다고 조언합니다. 
									특히 자녀의 변비가 걱정돼 식이섬유를 일부러 많이 먹게 하는 부모님들도 계시는데요.</p>

								</div>
								<div class="card-body menu-comment comment6">
									<p>1일 1회, 1회 1포를 물에 타서 섭취하십시오.</p>

								</div>
								<div class="card-body menu-comment comment7">
										<p>카페인 섭취시간은 5시 이전으로. 5시 이우에 카페인 식품과 음료를 피하는것이 좋습니다.
											카페인은 우리몸에 들어오면 30분이후부터 효과가 나타나며 효과는 4시간~5시간 지속되는데 잠들기 5시간
											이전까지는 카페인 섭취를 하지 않아야 숙면에 방해가 되지 않습니다.</p>

									</div>
									<div class="card-body menu-comment comment8">
													<p>1.빠른 로딩: 하루 약 20g의 크레아틴을 6일간 섭취(5g씩 4번)<br> 2.느린 로딩: 하루 약
														3g의 크레아틴을 섭취</p>

									</div>
									<div class="card-body menu-comment comment9">
													<p>스포츠 경기와 운동을 즐기는 모든 분께 효과적인 베타알라닌은 널리 알려진 제품이며 단백질 합성에 필요한 20종의 아미노산 중 하나입니다. 
													무향 제품이기 때문에 즐겨 마시는 쉐이크에 첨가하기 좋습니다.
													 ⅓ 작은 스쿱 (1.5g)을 선호하는 양의 물이나 주스에 섞어 섭취하십시오.</p>

									</div>
									<div class="card-body menu-comment comment10">
													<p>x</p>

									</div>
									<div class="card-body menu-comment comment11">
													<p>성인 : 탄산수소나트륨으로서 1회 1 ~ 5g (12 ~ 60mEq)씩 정맥주사한다. 
													산증(아시도시스)에 통상용량은 일반적으로 다음 식에 의하여 산출하고 정맥주사한다. 
													연령 및 증상에 따라 적절히 증감한다.</p>

									</div>
									<div class="card-body menu-comment comment12">
													<p>운동 2-3시간 전에 체중당 5~7ml의 음료를 섭취한다. 
													· 소변이 잘 나오지 않거나 색이 어두운 경우, 운동 2시간 전에 추가로 체중당 3~5ml를 섭취한다. 
													· 나트륨이 포함된 음료 또는 소금기가 있는 과자가 체액을 유지하는데 도움을 준다.</p>

									</div>
									
							</div>

						</div>
					</div>

				</div>
			</div> <!-- End of Page Content -->

		</div>
		<!-- End of Content Wrapper container-fluid px-4 -->

			</main>
		