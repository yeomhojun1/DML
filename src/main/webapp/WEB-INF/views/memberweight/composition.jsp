<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Daily Muscle Life</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/resources1/css/sb-admin-2.css"
	rel="stylesheet" /> 
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/resources1/js/Chart.min.js"></script>	
	
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ck에디터적용코드  -->
<!-- <script language="javascript"
	src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
Bootstrap core JavaScript
<script src="resources/resources1/js/jquery.min.js"></script>
<script src="resources/resources1/bootstrap.bundle.min.js"></script>

Core plugin JavaScript
<script src="resources/resources1/js/jquery.easing.min.js"></script>

Custom scripts for all pages
<script src="resources/resources1/js/sb-admin-2.min.js"></script>

Page level plugins
<script src="resources/resources1/js/Chart.min.js"></script>

Page level custom scripts

<script src="resources/resources1/js/chart-area-demo.js"></script>
Custom styles for this template
<link href="resources/resources1/css/sb-admin-2.css" rel="stylesheet"> -->

<!-- Custom fonts for this template-->
<!-- <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css"> -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- <style>
.btn {
	cursor: pointer;
}

.setstartday {
	background-color: #fff;
	border-color: blue;
	border-radius: 25px%;
	height: 50px;
}

.setdayweight {
	background-color: #fff;
	border-color: blue;
	border-radius: 25px%;
	height: 300px;
}

.recordstart {
	flex: 1 1;
	background-color: #fff;
	border-radius: 25px;
	font-size: 18px;
	padding: 20px;
	margin-top: 20px;
}

.insertdate {
	flex: 1 1;
	border-color: red;
	background-color: #fff;
	border-radius: 25px;
	font-size: 18px;
	padding: 20px;
	margin-top: 20px;
}
.Composition_title__xkoMw{
	font-size :26px;
}
:where(.css-1s3dcof).ant-btn.ant-btn-round.ant-btn-lg{
    border-radius: 40px;
    padding-inline-start: 20px;
    padding-inline-end: 20px;
    width: auto;
}
:where(.css-1s3dcof).ant-btn.ant-btn-lg{
font-size:16px;
}
.Composition_btn_save2__9fpfG, .Composition_btn_save3__bVW2y {
    height: 50px!important;
}
    .Composition_btn_save2__9fpfG, .Composition_btn_save__XRscY {
    background-color: #97d4e9;
    border: 1px solid #97d4e9;
    font-weight: 700;
}
</style> -->
<style>

 element.style {
    width: 400px;
}

.Composition_datepicker2__OmJH_ {
    border-radius: 25px!important;
    border-color: #97d4e9;
    background-color: #97d4e9;
    height: 50px;}
    :where(.css-1s3dcof).ant-picker .ant-picker-input >input {
    position: relative;
    display: inline-block;
    /* width: 100%; */
    min-width: 1px;
    padding: 0;
    color: rgba(0, 0, 0, 0.88);
    font-size: 14px;
    line-height: 1.5714285714285714;
    background-color: #ffffff;
    background-image: none;
    border-width: 1px;
    border-style: solid;
    border-color: #d9d9d9;
    border-radius: 6px;
    transition: all 0.2s;
    flex: auto;
    height: auto;
    background: transparent;
    border: 0;
}
.Composition_datepicker2__OmJH_ input {
    font-size: 18px!important;
    padding-left: 10px!important;
    background-color: #97d4e9;
    color: #fff!important;
} */




</style>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Daily Muscle Life</h1>
					<!--   <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol> -->
					<jsp:include page="/WEB-INF/views/frame/menu.jsp"></jsp:include>
					<div class="row">

						
					</div>
				</div>
				<div class="Composition_graph2__fM1o6">
					<div
						style="display: flex; flex: 1 1 0%; position: relative; flex-direction: column; margin: 20px;">
						<div style="display: flex; flex-direction: row;">
							<div class="Composition_title__xkoMw"
								style="flex: 1 1 0%; min-width: 200px; font-weight: 900; align-self: center;">체조성그래프</div>
								
							<div
								style="flex: 1 1 0%; display: flex; flex-direction: row; justify-content: flex-end;">
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-round ant-btn-default ant-btn-lg Composition_btn_save2__9fpfG Global_button__iJeUH"
									style="margin-right: 10px;">
									<span>이번주</span>
								</button>
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-round ant-btn-default ant-btn-lg Composition_btn_save2__9fpfG Global_button__iJeUH"
									style="margin-right: 10px;">
									<span>2주간</span>
								</button>
								<button type="button"
									class="ant-btn css-1s3dcof ant-btn-round ant-btn-default ant-btn-lg Composition_btn_save2__9fpfG Global_button__iJeUH"
									style="margin-right: 10px;">
									<span>이번달</span>
								</button>
								
								<div
									class="ant-picker ant-picker-range css-1s3dcof Composition_datepicker2__OmJH_"
									style="width: 400px;">
									<div class="ant-picker-input ant-picker-input-active">
									
										<input text="" placeholder="시작" size="12"
											autocomplete="off" value="">
											
											
											<input readonly="" placeholder="끝" size="12"
											autocomplete="off" value="">
									</div>
									
									<!-- <div class="ant-picker-range-separator">
										<div style="font-size: 22px; color: white;">-</div>
									</div>
									<div class="ant-picker-input">
										<input readonly="" placeholder="끝" size="12"
											autocomplete="off" value="">
									</div> -->
									<div class="ant-picker-active-bar"
										style="left: 0px; width: 165px; position: absolute;"></div>
									<span class="ant-picker-suffix"><span role="img"
										aria-label="calendar" class="anticon anticon-calendar"
										style="font-size: 18px; color: white;"><svg
												viewBox="64 64 896 896" focusable="false"
												data-icon="calendar" width="1em" height="1em"
												fill="currentColor" aria-hidden="true">
												<path
													d="M880 184H712v-64c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v64H384v-64c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v64H144c-17.7 0-32 14.3-32 32v664c0 17.7 14.3 32 32 32h736c17.7 0 32-14.3 32-32V216c0-17.7-14.3-32-32-32zm-40 656H184V460h656v380zM184 392V256h128v48c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-48h256v48c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-48h128v136H184z"></path></svg></span></span>
								</div>
							</div>
						</div>
						 <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						
						
						
						
						
						
						<div style="height: 400px;">
							<%-- <div class="recharts-responsive-container" width="874.390625"
								height="400" style="width: 99%; height: 100%;">
								<div class="recharts-wrapper"
									style="position: relative; cursor: default; width: 874px; height: 400px;">
									<svg class="recharts-surface" width="874" height="400"
										viewBox="0 0 874 400" version="1.1">
										<title></title><desc></desc>
										<defs>
										<clipPath id="recharts105-clip">
										<rect x="120" y="70" height="295" width="634"></rect></clipPath></defs>
										<g class="recharts-cartesian-grid">
										<g class="recharts-cartesian-grid-horizontal">
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="349.33333333333337"
											x2="754" y2="349.33333333333337"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="317.9999999999999"
											x2="754" y2="317.9999999999999"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="286.6666666666667"
											x2="754" y2="286.6666666666667"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="255.33333333333346"
											x2="754" y2="255.33333333333346"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="223.99999999999994"
											x2="754" y2="223.99999999999994"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="192.66666666666674"
											x2="754" y2="192.66666666666674"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="161.33333333333323"
											x2="754" y2="161.33333333333323"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="130" x2="754" y2="130"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="70" x2="754" y2="70"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="365" x2="754" y2="365"></line></g>
										<g class="recharts-cartesian-grid-vertical">
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="120" y1="70" x2="120" y2="365"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="210.57142857142856" y1="70"
											x2="210.57142857142856" y2="365"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="301.1428571428571" y1="70"
											x2="301.1428571428571" y2="365"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="391.7142857142857" y1="70"
											x2="391.7142857142857" y2="365"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="482.2857142857143" y1="70"
											x2="482.2857142857143" y2="365"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="572.8571428571429" y1="70"
											x2="572.8571428571429" y2="365"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="663.4285714285714" y1="70"
											x2="663.4285714285714" y2="365"></line>
										<line stroke-dasharray="1 2" stroke="#d1e5f4" fill="none"
											x="120" y="70" width="634" height="295"
											offset="[object Object]" x1="754" y1="70" x2="754" y2="365"></line></g></g>
										<g
											class="recharts-layer recharts-cartesian-axis recharts-xAxis xAxis">
										<line stroke="#d1e5f4" stroke-width="3" orientation="bottom"
											width="634" height="30" type="category" x="120" y="365"
											class="recharts-cartesian-axis-line" fill="none" x1="120"
											y1="365" x2="754" y2="365"></line>
										<g class="recharts-cartesian-axis-ticks">
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(120, 373)">
										<text x="0" y="0" dy="20" text-anchor="middle" fill="#000"
											style="font-weight: 400;">09.07</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(210.57142857142856, 373)">
										<text x="0" y="0" dy="20" text-anchor="middle" fill="#000"
											style="font-weight: 400;">09.08</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(301.1428571428571, 373)">
										<text x="0" y="0" dy="20" text-anchor="middle" fill="#000"
											style="font-weight: 400;">09.09</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(391.7142857142857, 373)">
										<text x="0" y="0" dy="20" text-anchor="middle" fill="#000"
											style="font-weight: 400;">09.10</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(482.2857142857143, 373)">
										<text x="0" y="0" dy="20" text-anchor="middle" fill="#000"
											style="font-weight: 400;">09.11</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(572.8571428571429, 373)">
										<text x="0" y="0" dy="20" text-anchor="middle" fill="#000"
											style="font-weight: 400;">09.12</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(663.4285714285714, 373)">
										<text x="0" y="0" dy="20" text-anchor="middle" fill="#000"
											style="font-weight: 400;">09.13</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(754, 373)">
										<text x="0" y="0" dy="20" text-anchor="middle" fill="#000"
											style="font-weight: 900;">09.14</text></g></g></g></g>
										<g
											class="recharts-layer recharts-cartesian-axis recharts-yAxis yAxis">
										<line stroke="#d1e5f4" stroke-width="3" orientation="left"
											width="60" height="295" type="number" x="60" y="70"
											class="recharts-cartesian-axis-line" fill="none" x1="120"
											y1="70" x2="120" y2="365"></line>
										<g class="recharts-cartesian-axis-ticks">
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(112, 349.33333333333337)">
										<text x="0" y="0" dx="-13" text-anchor="end" fill="#000">18.2</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(112, 317.9999999999999)">
										<text x="0" y="0" dx="-13" text-anchor="end" fill="#000">18.6</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(112, 286.6666666666667)">
										<text x="0" y="0" dx="-13" text-anchor="end" fill="#000">19</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(112, 255.33333333333346)">
										<text x="0" y="0" dx="-13" text-anchor="end" fill="#000">19.4</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(112, 223.99999999999994)">
										<text x="0" y="0" dx="-13" text-anchor="end" fill="#000">19.8</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(112, 192.66666666666674)">
										<text x="0" y="0" dx="-13" text-anchor="end" fill="#000">20.2</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(112, 161.33333333333323)">
										<text x="0" y="0" dx="-13" text-anchor="end" fill="#000">20.6</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(112, 130)">
										<text x="0" y="0" dx="-13" text-anchor="end" fill="#000">21</text></g></g></g>
										<g>
										<text x="-15" y="75" dx="25" text-anchor="start" fill="#000"
											style="font-weight: 900; font-size: 16px;">골격근량(kg)</text></g></g>
										<g
											class="recharts-layer recharts-cartesian-axis recharts-yAxis yAxis">
										<line stroke="#d1e5f4" stroke-width="3" orientation="right"
											width="60" height="295" type="number" x="754" y="70"
											class="recharts-cartesian-axis-line" fill="none" x1="754"
											y1="70" x2="754" y2="365"></line>
										<g class="recharts-cartesian-axis-ticks">
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(762, 365)">
										<text x="0" y="0" dx="13" text-anchor="start" fill="#000">14</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(762, 329.74999999999994)">
										<text x="0" y="0" dx="13" text-anchor="start" fill="#000">14.3</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(762, 294.50000000000006)">
										<text x="0" y="0" dx="13" text-anchor="start" fill="#000">14.6</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(762, 259.24999999999994)">
										<text x="0" y="0" dx="13" text-anchor="start" fill="#000">14.9</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(762, 224.0000000000001)">
										<text x="0" y="0" dx="13" text-anchor="start" fill="#000">15.2</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(762, 188.75)">
										<text x="0" y="0" dx="13" text-anchor="start" fill="#000">15.5</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(762, 153.49999999999991)">
										<text x="0" y="0" dx="13" text-anchor="start" fill="#000">15.8</text></g></g>
										<g class="recharts-layer recharts-cartesian-axis-tick">
										<g transform="translate(762, 130)">
										<text x="0" y="0" dx="13" text-anchor="start" fill="#000">16</text></g></g></g>
										<g>
										<text x="749" y="75" dx="25" text-anchor="start" fill="#000"
											style="font-weight: 900; font-size: 16px;">체지방률(%)</text></g></g>
										<g class="recharts-layer recharts-line">
										<path name="골격근량" fill="none" stroke="#f49352"
											stroke-width="3"
											points="[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]"
											width="634" height="295"
											class="recharts-curve recharts-line-curve"
											stroke-dasharray="0px 0px" type="linear"
											d="M754,208.33333333333334Z"></path>
										<g class="recharts-layer recharts-line-dots">
										<circle r="3" name="골격근량" fill="#f49352" stroke="#eb7841"
											stroke-width="5"
											points="[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]"
											width="634" height="295" cx="754" cy="208.33333333333334"
											class="recharts-dot recharts-line-dot"></circle></g></g>
										<g class="recharts-layer recharts-line">
										<path name="체지방률" fill="none" stroke="#f6e133"
											stroke-width="3"
											points="[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]"
											width="634" height="295"
											class="recharts-curve recharts-line-curve"
											stroke-dasharray="0px 0px" type="linear" d="M754,247.5Z"></path>
										<g class="recharts-layer recharts-line-dots">
										<circle r="3" name="체지방률" fill="#f6e133" stroke="#f6cf1a"
											stroke-width="5"
											points="[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object],[object Object]"
											width="634" height="295" cx="754" cy="247.5"
											class="recharts-dot recharts-line-dot"></circle></g></g></svg>
									<div class="recharts-legend-wrapper"
										style="position: absolute; width: 300px; height: auto; left: 60px; top: 0px;">
										<ul
											style="display: flex; flex-direction: row; margin-left: -75px; margin-bottom: 50px; height: 100px; margin-top: -30px;">
											<li
												style="flex: 1 1 0%; color: rgb(235, 120, 65); font-size: 20px; align-self: center;"><div
													style="color: black; font-size: 16px; width: 100px; align-self: center;">골격근량
													kg</div></li>
											<li
												style="flex: 1 1 0%; color: rgb(246, 207, 26); font-size: 20px; align-self: center;"><div
													style="color: black; font-size: 16px; width: 100px; align-self: center;">체지방률
													%</div></li>
										</ul>
									</div>
									<div tabindex="-1" role="dialog"
										class="recharts-tooltip-wrapper recharts-tooltip-wrapper-right recharts-tooltip-wrapper-bottom"
										style="pointer-events: none; visibility: hidden; position: absolute; top: 0px; left: 0px; transform: translate(120px, 70px);">
										<div class="recharts-default-tooltip"
											style="margin: 0px; padding: 10px; background-color: rgb(255, 255, 255); border: 1px solid rgb(204, 204, 204); white-space: nowrap;">
											<p class="recharts-tooltip-label" style="margin: 0px;"></p>
										</div>
									</div>
								</div>
							</div>
						</div> --%>
					</div>
				</div>
				
				<form action="${pageContext.request.contextPath }/memberweight/composition" method="post">
				<div class="Composition_input_by_date___OJGT">
					<div class="Composition_input_by_date_bar__A_IXv">
						<div class="ant-picker css-1s3dcof Composition_datepicker2__OmJH_">
							<input type="hidden" name="memberId" value="${member.memberId }">
							<div class="ant-picker-input">
								<input type="text" id="datepicker" name="weightDate"><span
									class="ant-picker-suffix"><span role="img"
									aria-label="calendar" class="anticon anticon-calendar"
									style="font-size: 18px; color: white;"><!-- <svg
											viewBox="64 64 896 896" focusable="false"
											data-icon="calendar" width="1em" height="1em"
											fill="currentColor" aria-hidden="true"> -->
											<path
												d="M880 184H712v-64c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v64H384v-64c0-4.4-3.6-8-8-8h-56c-4.4 0-8 3.6-8 8v64H144c-17.7 0-32 14.3-32 32v664c0 17.7 14.3 32 32 32h736c17.7 0 32-14.3 32-32V216c0-17.7-14.3-32-32-32zm-40 656H184V460h656v380zM184 392V256h128v48c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-48h256v48c0 4.4 3.6 8 8 8h56c4.4 0 8-3.6 8-8v-48h128v136H184z"></path></svg></span></span><span
									class="ant-picker-clear" role="button"><span role="img"
									aria-label="close-circle" class="anticon anticon-close-circle"><svg
											viewBox="64 64 896 896" focusable="false"
											data-icon="close-circle" width="1em" height="1em"
											fill="currentColor" aria-hidden="true">
											<path
												d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm165.4 618.2l-66-.3L512 563.4l-99.3 118.4-66.1.3c-4.4 0-8-3.5-8-8 0-1.9.7-3.7 1.9-5.2l130.1-155L340.5 359a8.32 8.32 0 01-1.9-5.2c0-4.4 3.6-8 8-8l66.1.3L512 464.6l99.3-118.4 66-.3c4.4 0 8 3.5 8 8 0 1.9-.7 3.7-1.9 5.2L553.5 514l130 155c1.2 1.5 1.9 3.3 1.9 5.2 0 4.4-3.6 8-8 8z"></path></svg></span></span>
							</div>
						</div>
						<div style="justify-content: flex-end; display: flex;">
									<button type="submit"
								class="ant-btn css-1s3dcof ant-btn-round ant-btn-default ant-btn-lg Composition_btn_save3__bVW2y Global_button__iJeUH">
								<span>저장하기</span>
							</button>
							<button type="button"
								class="ant-btn css-1s3dcof ant-btn-round ant-btn-default ant-btn-lg Composition_btn_save3__bVW2y Global_button__iJeUH delete_btn " >
								<span>삭제하기</span>
							</button>
							
							</button>
							
						
						</div>
						<div class="Composition_input_by_date_input_box__Ykpf3">
						<div
							style="flex: 1 1 0%; margin-left: 20px; display: flex; flex-direction: row; justify-content: space-between;">
							<div class="Composition_input_by_date_input_box_label__qZP2t">근육량</div>
							<input
								class="ant-input css-1s3dcof Composition_input_basic2__HoLj8" name="muscleMass"
								type="text" value="20">
							<div
								style="font-size: 18px; align-self: center; margin-left: 10px; padding-right: 30px;">kg</div>
						</div>
						<div style="width: 100px;"></div>
						<div
							style="flex: 1 1 0%; margin-left: 20px; display: flex; flex-direction: row; justify-content: space-between;">
							<div class="Composition_input_by_date_input_box_label__qZP2t">체지방량</div>
							<input
								class="ant-input css-1s3dcof Composition_input_basic2__HoLj8" name="bodyFatPet"
								type="text" value="15">
							<div
								style="font-size: 18px; align-self: center; margin-left: 10px; padding-right: 30px;">%</div>
						</div>
					</div>
						</form>
					</div>
						
					
				</div>
			</main>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>




	<script>
		$(function() {
			//input을 datepicker로 선언
			$("#datepicker")
					.datepicker(
							{
								dateFormat : 'yy-mm-dd' //달력 날짜 형태
								,
								showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
								,
								showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
								,
								changeYear : true //option값 년 선택 가능
								,
								changeMonth : true //option값  월 선택 가능                
								,
								showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
								,
								buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
								,
								buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
								,
								buttonText : "선택" //버튼 호버 텍스트              
								,
								yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
								,
								monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월', '10월',
										'11월', '12월' ] //달력의 월 부분 텍스트
								,
								monthNames : [ '1월', '2월', '3월', '4월', '5월',
										'6월', '7월', '8월', '9월', '10월', '11월',
										'12월' ] //달력의 월 부분 Tooltip
								,
								dayNamesMin : [ '일', '월', '화', '수', '목', '금',
										'토' ] //달력의 요일 텍스트
								,
								dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
										'금요일', '토요일' ] //달력의 요일 Tooltip
								,
								minDate : "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
								,
								maxDate : "+5Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
								,
								onSelect : function() {
									var weightDate = $.datepicker.formatDate(
											"yymmdd", $("#datepicker")
													.datepicker("getDate"));
									weightDate = $("#datepicker").val();
									weightDate = weightDate.replaceAll("-", "");
									console.log(weightDate);
									

								}
							});

			//초기값을 오늘 날짜로 설정해줘야 합니다.
			$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
		});
		
		
		

		//delete
		$(".delete_btn").click(deleteWeight);
		function deleteWeight(){
			var dateVal = $("#datepicker").val()
			//replace([기존문자],[바꿀문자])
			dateVal= dateVal.replaceAll("-", "");
			$.ajax({
				url:"${pageContext.request.contextPath}/memberweight/delete",
				type: "post",
				data : {memberId : "${member.memberId}"
					,weightDate: dateVal}
				,success : function(){
					console.log("success");
					location.href="${pageContext.request.contextPath}/memberweight/composition";}
				,error : function(){
					console.log("error");
				}
			})
		}
		
	
		 const ctx = document.getElementById('myAreaChart');

		  new Chart(ctx, {
		    type: 'line',
		    data: {
		      labels: ['${member.weight}', 'Yellow', 'Green', 'Purple', 'Orange'],
		      datasets: [{
		        label: '# 날짜별 몸무게',
		        data: ['${member.weight}', 19, 3, 5, 2, 3],
		        borderWidth: 1
		      }]
		    },
		    options: {
		      scales: {
		        y: {
		          beginAtZero: true
		        }
		      }
		    }
		  });
		
		
		
		
		
				
	</script>
</body>
</html>
