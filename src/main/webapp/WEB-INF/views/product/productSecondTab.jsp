<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="tab2">
	<div class="container-fluid px-4">
		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<button
					class="h3 mb-0 text-gray-800 card h-100 py-2 btn1_title tabmenu "
					data-tabmenu="1">보충제</button>
				<button
					class="h3 mb-0 text-gray-800 card h-100 py-2 btn2_title tabmenu active"
					data-tabmenu="2">닭가슴살</button>

				<a class="d-none d-sm-inline-block btn btn-sm btn-white shadow-sm"
					href="${pageContext.request.contextPath }/calendar"><i
					class="fas fa-download fa-sm text-white-10"></i>calendar</a>
			</div>

			<!-- Content Row -->
			<div class="row">

				<!-- Content Column -->
				<div class="col-lg-9 mb-2">

					<div class="row row-menu beginner active">

						<!-- Color System 1 -->
						<div class="col-lg-12 beginner">
							<c:forEach items="${chickenproductlist }" var="chickenproduct"
								varStatus="vs">
								<div class="col-lg-12 mb-2">

									<div class="row bg-white text-white shadow">
										<div class="col-lg-10">
											<h5 style="color: gray;">${chickenproduct.type}급
												${chickenproduct.productName}</h5>
											<h5 style="color: gray;">${chickenproduct.productName},
												${chickenproduct.price}</h5>
										</div>
										<div class="col-lg-2">
											<a style="color: blue;" href="${chickenproduct.link }">상품보기</a>
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
									<div class="ant-image css-1s3dcof" style="width: 100%">
										<img alt class="ant-image-img"
											src="https://beta.wintersleeping.com/images/supplement_top_1.png">
										<div class="Chicken_legend_each_name__2Oo4Z">큰기업 도축장,
											HACCP, 냉장, 무항생제</div>
									</div>
								</div>
							</div>


							<div class="Chicken_legend_each__iGyUd1">
								<div class="Chicken_kegend_each_img_wIDG_1">
									<div class="ant-image css-1s3dcof1" style="width: 100%">
										<img alt class="ant-image-img1"
											src="https://beta.wintersleeping.com/images/supplement_top_3.png">
										<div class="Chicken_legend_each_name__2Oo4Z11">큰기업 도축장,
											HACCP, 냉장</div>
									</div>
								</div>
							</div>

							<div class="Chicken_legend_each__iGyUd2">
								<div class="Chicken_kegend_each_img_wIDG_2">
									<div class="ant-image css-1s3dcof2" style="width: 100%">
										<img alt class="ant-image-img2"
											src="https://beta.wintersleeping.com/images/supplement_top_5.png">
										<div class="Chicken_legend_each_name__2Oo4Z12">도축장 미표기,
											HACCP, 냉동</div>
									</div>
								</div>
							</div>

							<div class="Chicken_legend_each__iGyUd3">
								<div class="Chicken_kegend_each_img_wIDG_3">
									<div class="ant-image css-1s3dcof3" style="width: 100%">
										<img alt class="ant-image-img3"
											src="https://beta.wintersleeping.com/images/supplement_top_6.png">
										<div class="Chicken_legend_each_name__2Oo4Z13">도축장 미표기,
											HACCP</div>
									</div>
								</div>
							</div>

							<div class="Chicken_legend_each__iGyUd4">
								<div class="Chicken_kegend_each_img_wIDG_4">
									<div class="ant-image css-1s3dcof4" style="width: 100%">
										<img alt class="ant-image-img3"
											src="https://beta.wintersleeping.com/images/supplement_top_7.png">
										<div class="Chicken_legend_each_name__2Oo4Z14">도축장 미표기</div>
									</div>
								</div>
							</div>
						</div>
					</div>





					<!-- 섭취방법--------------------------------------------- -->

					<div class="card shadow mb-4">
						<div class="card-header py-2 ">
							<h4 class="m-0 font-weight-bold text-primary">해당 링크를 통해 구매시
								DML에게 도움이 됩니다.</h4>
						</div>


					</div>
				</div>
			</div>
			<!-- End of Page Content -->
		</div>
	</div>

	<!-- End of Content Wrapper container-fluid px-4 -->

</div>
