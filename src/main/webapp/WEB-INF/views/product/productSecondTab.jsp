<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
	<main id="tab2">
		<div class="container-fluid px-4">
			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading -->
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<button class="h3 mb-0 text-gray-800 card h-100 py-2 btn1_title tabmenu " data-tabmenu="1">보충제</button>
					<button class="h3 mb-0 text-gray-800 card h-100 py-2 btn2_title tabmenu active" data-tabmenu="2">닭가슴살</button>
					
					<a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="${pageContext.request.contextPath }/calendar"><i
						class="fas fa-download fa-sm text-white-50"></i>calendar</a>
				</div>

				<!-- Content Row -->
				<div class="row">

					<!-- Content Column -->
					<div class="col-lg-9 mb-2" >

						<div class="row row-menu beginner active">

							<!-- Color System 1 -->
							<div class="col-lg-12 beginner">
							<c:forEach items="${chickenproductlist }" var="chickenproduct" varStatus="vs">
								<div class="col-lg-12 mb-2">
								
									<div class="row bg-secondary text-white shadow">
										<div  class="col-lg-10">
											<h5>${chickenproduct.type},  ${chickenproduct.productName}</h5>
											<h5>${chickenproduct.productName},  ${chickenproduct.price}</h5>
										</div>
										<div  class="col-lg-2">
											<a style="color: white;" href="${chickenproduct.link }">상품보기</a>
										</div>
									</div>
								</div>
							</c:forEach>
							</div>
								
						</div>  

					</div> 

					<div class="col-lg-3 mb-4">

							<!-- 코멘트---------------------------------------- -->
						
							<div class="card shadow mb-4 ">
							
								<div class="card-header py-2">
									<div class="Chicken_legend_each__iGyUd">
									<div class="Chicken_kegend_each_img_wIDG_">
									<div class="ant-image css-1s3dcof" style="width: 20%">
									<img alt class="ant-image-img" src="https://beta.wintersleeping.com/images/supplement_top_1.png">
									<div class="Chicken_legend_each_name__2Oo4Z">
									A급 : 큰기업 도축장, HACCP, 냉장, 무항생제
									</div>
									</div>
									</div>
									
									<div class="Chicken_legend_each__iGyUd1">
									<div class="Chicken_kegend_each_img_wIDG_1">
									<div class="ant-image css-1s3dcof1" style="width: 20%">
									<img alt class="ant-image-img1" src="https://beta.wintersleeping.com/images/supplement_top_3.png">
									<div class="Chicken_legend_each_name__2Oo4Z11">
									B급 : 큰기업 도축장, HACCP, 냉장
									</div>
									</div>
									</div>
									</div>
									
									<div class="Chicken_legend_each__iGyUd2">
									<div class="Chicken_kegend_each_img_wIDG_2">
									<div class="ant-image css-1s3dcof2" style="width: 20%">
									<img alt class="ant-image-img2" src="https://beta.wintersleeping.com/images/supplement_top_5.png">
									<div class="Chicken_legend_each_name__2Oo4Z12">
									C급 : 도축장 미표기, HACCP, 냉동
									</div>
									</div>
									</div>
									</div>
									
									<div class="Chicken_legend_each__iGyUd3">
									<div class="Chicken_kegend_each_img_wIDG_3">
									<div class="ant-image css-1s3dcof3" style="width: 20%">
									<img alt class="ant-image-img3" src="https://beta.wintersleeping.com/images/supplement_top_6.png">
									<div class="Chicken_legend_each_name__2Oo4Z13">
									D급 : 도축장 미표기, HACCP
									</div>
									</div>
									</div>
									</div>
									
									<div class="Chicken_legend_each__iGyUd4">
									<div class="Chicken_kegend_each_img_wIDG_4">
									<div class="ant-image css-1s3dcof4" style="width: 20%">
									<img alt class="ant-image-img3" src="https://beta.wintersleeping.com/images/supplement_top_7.png">
									<div class="Chicken_legend_each_name__2Oo4Z14">
									E급 : 도축장 미표기
									</div>
									</div>
									</div>
									</div>
								</div>
								<div class="card-body menu-comment comment">
									<div class="text-center">
										<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
											style="width: 5px;">
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
								<div class="card-body menu-comment comment">
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
								<div class="card-body menu-comment comment">
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
								<div class="card-body menu-comment comment">
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
								<div class="card-body menu-comment comment">
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
									<div class="card-body menu-comment comment">
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
									<h4 class="m-0 font-weight-bold text-primary">해당 링크를 통해 구매시 DML에게 도움이 됩니다.</h4>
								</div>
								

				</div>
			</div> <!-- End of Page Content -->

		</div>
		<!-- End of Content Wrapper container-fluid px-4 -->

			</main>
		