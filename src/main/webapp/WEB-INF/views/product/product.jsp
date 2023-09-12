<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<!-- <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content=""> -->

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<!-- <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css"> -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
<script src="resources/js/jquery-3.7.0.js"></script>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">메인</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="index.html"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>홈</span></a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">체중/식단</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>체중관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Components:</h6>
						<a class="collapse-item" href="buttons.html">Buttons</a> <a
							class="collapse-item" href="cards.html">Cards</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>식단관리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="utilities-color.html">Colors</a> <a
							class="collapse-item" href="utilities-border.html">Borders</a> <a
							class="collapse-item" href="utilities-animation.html">Animations</a>
						<a class="collapse-item" href="utilities-other.html">Other</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">운동/제품</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>운동 도우미</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>제품 추천</span>
			</a></li>


			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/undraw_profile_1.svg"
											alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler Â· 58m</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/undraw_profile_2.svg"
											alt="...">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun Â· 1d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/undraw_profile_3.svg"
											alt="...">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog Â· 2w</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Messages</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas
									McGee</span> <img class="img-profile rounded-circle"
								src="img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<button class="h3 mb-0 text-gray-800 card h-100 py-2 btn1_title active">보충제</button>
						<button class="h3 mb-0 text-gray-800 card h-100 py-2 btn2_title">닭가슴살</button>
						
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
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
							
									<button class="h5 mb-0 font-weight-bold text-gray-800 card-body difficulty-btn btn2">숙련자</button>
									
							</div>
						</div>
						
						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">기타건강
											</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">기타건강</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 50%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												식품 추천 제품</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">식품
												추천 제품</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
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

							<div class="row">

							<!-- Color System 1 -->
							<div class="row col-lg-6 beginner">
								<div class="col-lg-12 mb-2">
									<div class="card bg-primary text-white shadow">
										
										<button class="btn-menu card-body beginner-btn btn-sub1 active" data-toggle="menu-1"><h5>단백질</h5></button>
											
									</div>
								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-success text-white shadow">
									
											<button class="btn-menu card-body beginner-btn btn-sub2" data-toggle="menu-2"><h5>탄수화물</h5></button>
									
									</div>
								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-info text-white shadow">
										<button class="btn-menu card-body beginner-btn btn-sub3" data-toggle="menu-3"><h5>종합비타민</h5></button>
									</div>
								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-warning text-white shadow">
										<div class="card-body">
											<button class="btn-menu card-body beginner-btn btn-sub4" data-toggle="menu-4"><h5>유산균</h5></button>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-danger text-white shadow">
										<div class="card-body">
											<button class="btn-menu card-body beginner-btn btn-sub5" data-toggle="menu-5"><h5>섬유질</h5></button>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-secondary text-white shadow">
										<div class="card-body">
											<button class="btn-menu card-body beginner-btn btn-sub6" data-toggle="menu-6"><h5>글루타민</h5></button>
											
										</div>
									</div>

								</div>

							</div>
							<div class="row col-lg-6 btn-menu menu-1 active">
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/optimum-nutrition-gold-standard-100-whey-double-rich-chocolate-5-lbs-2-27-kg/27509">
											옵티멈 골드 스탠다드 웨이(WPI+WPC)  </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-success text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/allmax-classic-allwhey-100-whey-protein-chocolate-5-lbs-2-27-kg/69100">
											Allmax 웨이프로틴 (WPC+WPI)</a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-info text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/6424463926?itemId=13837679944&vendorItemId=3180840444&src=1139000&spec=10799999&addtag=400&ctag=6424463926&lptag=AF7910856&itime=20230912103354&pageType=PRODUCT&pageValue=6424463926&wPcid=11963655808335908086931&wRef=&wTime=20230912103354&redirect=landing&traceid=V0-181-0204c0f24c9440c6&mcid=91aaf995ffd744bc8c37fab610d907a4&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											옵티멈 골드스탠다드웨이(WPI+WPC)</a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-warning text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/6731349444?itemId=3071491018&vendorItemId=4041827021&src=1139000&spec=10799999&addtag=400&ctag=6731349444&lptag=AF7910856&itime=20230912103507&pageType=PRODUCT&pageValue=6731349444&wPcid=11963655808335908086931&wRef=&wTime=20230912103507&redirect=landing&traceid=V0-181-c7a4d267bbb9b282&mcid=1d0e234049574e3bae6b2a351a168973&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											컴뱃 100%(WPI+WPC)</a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-danger text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.myprotein.co.kr/sports-nutrition/impact-whey-protein/10530943.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=22450_1694482536_0d2c1e703e13a2c1d11128c5939d9dbb">
											임팩트 웨이프로틴(WPC)</a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-secondary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.myprotein.co.kr/sports-nutrition/impact-whey-isolate/10530911.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=22450_1694482609_08b0936e66a21fdc3f774b990c4f2535">
											임팩트 웨이 아이솔레이트(WPI)</a>
											
										</div>
									</div>

								</div>
								<!--  -->
									<div class="col-lg-12 mb-2">
									<div class="card bg-secondary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/6573830453?itemId=99053681&vendorItemId=3180840758&src=1139000&spec=10799999&addtag=400&ctag=6573830453&lptag=AF7910856&itime=20230912103733&pageType=PRODUCT&pageValue=6573830453&wPcid=11963655808335908086931&wRef=&wTime=20230912103733&redirect=landing&traceid=V0-181-b7758b3c4e64c943&mcid=d75014564b72438ea2db7b926b8ebdf0&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											신타6(WPC+WPI,맛 위주 제품)</a>
											
										</div>
									</div>

								</div>
									<div class="col-lg-12 mb-2">
									<div class="card bg-secondary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/6422282284?itemId=18367904981&vendorItemId=85511488783&src=1139000&spec=10799999&addtag=400&ctag=6422282284&lptag=AF7910856&itime=20230912103808&pageType=PRODUCT&pageValue=6422282284&wPcid=11963655808335908086931&wRef=&wTime=20230912103808&redirect=landing&traceid=V0-181-1b841015494d2887&mcid=cb4e14a5308546f1a15b89adf658b7dc&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											EVL Stacked</a>
											
										</div>
									</div>

								</div>
								<div class="col-lg-12 mb-2">
									<div class="card bg-secondary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/6422282333?itemId=13823103047&vendorItemId=81073326157&src=1139000&spec=10799999&addtag=400&ctag=6422282333&lptag=AF7910856&itime=20230912103900&pageType=PRODUCT&pageValue=6422282333&wPcid=11963655808335908086931&wRef=&wTime=20230912103900&redirect=landing&traceid=V0-181-64380bec0ffd71ad&mcid=34ffc08d7fcd49a896e78f52063220fc&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											EVL 100% Whey</a>
											
										</div>
									</div>

								</div>

							</div>
							<div class="row col-lg-6 btn-menu menu-2">
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/171730878?vendorItemId=4242511760&src=1139000&spec=10799999&addtag=400&ctag=171730878&lptag=AF7910856&itime=20230912143530&pageType=PRODUCT&pageValue=171730878&wPcid=11963655808335908086931&wRef=&wTime=20230912143530&redirect=landing&traceid=V0-181-d9af9bf788a73fe3&mcid=eb92a671da544bf0864236b6208f0f17&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											청년곡물 귀리가루 3kg 17,300원  </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/optimum-nutrition-gold-standard-100-whey-double-rich-chocolate-5-lbs-2-27-kg/27509">
											인스턴트오트  </a>
											
										</div>
									</div>
								</div>
							</div>
							
							<div class="row col-lg-6 btn-menu menu-3">
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/life-extension-two-per-day-multivitamin-60-capsules/86456">
											투퍼데이 캡슐  </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/life-extension-two-per-day-multivitamin-120-tablets/86454">
											투퍼데이 태블릿 </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.myprotein.co.kr/sports-nutrition/alpha-men-multivitamin-tablets/10530421.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1694498609_8e301a8cd3a40ceb430c6570ef43ff4c">
											알파맨 </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/thorne-basic-nutrients-2-day-60-capsules/85476">
											Thorne Research 종합비타민 </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/life-extension-two-per-day-multivitamin-120-tablets/86454">
											쏜리서치 종합비타민 </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/1152619585?itemId=2127383548&vendorItemId=70125946615&src=1139000&spec=10799999&addtag=400&ctag=1152619585&lptag=AF7910856&itime=20230912150443&pageType=PRODUCT&pageValue=1152619585&wPcid=11963655808335908086931&wRef=&wTime=20230912150443&redirect=landing&traceid=V0-181-b565f5bf26622b78&mcid=4bfe00782dbb4840a951eeae314632b9&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											얼라이브 </a>
											
										</div>
									</div>
								</div>
								
							</div>
							<div class="row col-lg-6 btn-menu menu-4 ">
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/california-gold-nutrition-lactobif-5-probiotics-5-billion-cfu-60-veggie-capsules/64006">
											캘리포니아골드 50억  </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/jarrow-formulas-jarro-dophilus-eps-10-billion-120-veggie-caps/7006">
											자로우 50억  </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/416189?itemId=277809413&vendorItemId=3179568952&src=1139000&spec=10799999&addtag=400&ctag=416189&lptag=AF7910856&itime=20230912161238&pageType=PRODUCT&pageValue=416189&wPcid=11963655808335908086931&wRef=&wTime=20230912161238&redirect=landing&traceid=V0-181-0a308c213d5fd665&mcid=39eb48a99a954aeab0e410ba92009191&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											자로우 50억  </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.myprotein.co.kr/sports-nutrition/daily-probiotic/11897338.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1694502785_824d28b0d6f9072c2c6479c0e4b2b8d5">
											프로바이오틱스 150억 </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/1528879?itemId=6662522&vendorItemId=3464692298&src=1139000&spec=10799999&addtag=400&ctag=1528879&lptag=AF7910856&itime=20230912161324&pageType=PRODUCT&pageValue=1528879&wPcid=11963655808335908086931&wRef=&wTime=20230912161324&redirect=landing&traceid=V0-181-8f3e5441fa09d7bc&mcid=26b12158329f4e1fb5dfde05bd5d610e&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											자로우 도필러스(쿠팡, 국내 로켓배송)  </a>
											
										</div>
									</div>
								</div>
								
								
								</div>
								
							<div class="row col-lg-6 btn-menu menu-5 ">
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/30606?itemId=73304&vendorItemId=3086191674&src=1139000&spec=10799999&addtag=400&ctag=30606&lptag=AF7910856&itime=20230912163414&pageType=PRODUCT&pageValue=30606&wPcid=11963655808335908086931&wRef=&wTime=20230912163414&redirect=landing&traceid=V0-181-399055c646def9eb&mcid=147b097a5941400b90234b970e9370a8&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											이눌린  </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/420194?itemId=1103903&vendorItemId=3181031489&src=1139000&spec=10799999&addtag=400&ctag=420194&lptag=AF7910856&itime=20230912163433&pageType=PRODUCT&pageValue=420194&wPcid=11963655808335908086931&wRef=&wTime=20230912163433&redirect=landing&traceid=V0-181-bf07ab4af31ca34a&mcid=f14a379efdd745c3a6aa4fa90afc6a40&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											복함섬유질 </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/now-foods-certified-organic-inulin-prebiotic-pure-powder-8-oz-227-g/1100">
											이눌린  </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/jarrow-formulas-gentle-fibers-soluble-insoluble-fibers-powder-16-5-oz-468-g-discontinued-item/201">
											복함섬유질 </a>
											
										</div>
									</div>
								</div>
								</div>
								<div class="row col-lg-6 btn-menu menu-6 ">
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://kr.iherb.com/pr/california-gold-nutrition-l-glutamine-powder-ajipure-gluten-free-16-oz-454-g/71027">
											글루타민(글루텐 미함유) </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.coupang.com/vp/products/209304?itemId=2075029&vendorItemId=3088278048&src=1139000&spec=10799999&addtag=400&ctag=209304&lptag=AF7910856&itime=20230912164259&pageType=PRODUCT&pageValue=209304&wPcid=11963655808335908086931&wRef=&wTime=20230912164259&redirect=landing&traceid=V0-181-ad2bddec3da0a155&mcid=9ea200b61c1f428887005dd54d75b596&placementid=&clickBeacon=&campaignid=&contentcategory=&imgsize=&tsource=&pageid=&deviceid=&token=&contenttype=&subid=&impressionid=&campaigntype=&requestid=&contentkeyword=&subparam=&isAddedCart=">
											글루타민 파우더 비건 </a>
											
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-2 btn-menu-sub">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											<a style="color: white;" href="https://www.myprotein.co.kr/sports-nutrition/l-glutamine-powder/10636931.html?affil=awin&utm_content=https%3A%2F%2Fblog.naver.com%2Fhyun_do&utm_term=Direct+Traffic&utm_source=AWin-504921&utm_medium=affiliate&utm_campaign=AffiliateWin&awc=10751_1694504606_8962bf6e3b1a6581fc9ffbdb94433a2d">
											글루타민 아미노산 </a>
											
										</div>
									</div>
								</div>
								</div>
							
</div>
						

</div>

						<div class="col-lg-6 mb-4">

							<!-- Illustrations---------------------------------------- -->
							
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
							

							<!-- Approach--------------------------------------------- -->
							
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
							</div>

						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">Ã</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="${pageContext.request.contextPath }/member/logout">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<!-- <script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

	<!-- Core plugin JavaScript-->
	<!-- <script src="vendor/jquery-easing/jquery.easing.min.js"></script> -->

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<!-- <script src="vendor/chart.js/Chart.min.js"></script> -->

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
	<script>
		$('.btn1').click(function() {
			$('.difficulty-btn').removeClass('active');
			$('.btn1').addClass('active');
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-1').addClass('active');
		});
		$('.btn2').click(function() {
			$('.difficulty-btn').removeClass('active');
			$('.btn2').addClass('active');
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-1').addClass('active');
		});
		
		$('.btn-sub1').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-1').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment1').addClass('active');
			
		});
		$('.btn-sub2').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-2').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment2').addClass('active');
		});
		
		$('.btn-sub3').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-3').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment3').addClass('active');
		});
		$('.btn-sub4').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-4').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment4').addClass('active');
		});
		$('.btn-sub5').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-5').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment5').addClass('active');
		});
		$('.btn-sub6').click(function() {
			$('.btn-menu').removeClass('active');
			$('.btn-sub').addClass('active');
			$('.menu-6').addClass('active');
			$('.menu-comment').removeClass('active');
			$('.comment6').addClass('active');
		});
	</script>

</body>

</html>