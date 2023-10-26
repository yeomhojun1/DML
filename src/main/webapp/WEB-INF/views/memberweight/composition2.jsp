<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Daily Muscle Life | 체조성 기록</title>
<link rel="icon" type="image/x-icon" href="${pagecontext.request.contextPath }/resources/assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/scss.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<style>
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
.insertdate{
	flex: 1 1;
	border-color: red;
	background-color: #fff;
	border-radius: 25px;
	font-size: 18px;
	padding: 20px;
	margin-top: 20px;

.ranktable { margin-top : 10px; border : 1px solid #fff; padding: 5px; }
.rankth { text-align : center; }
.rankth, .ranktd { border : 1px solid #fff; padding: 5px; }
}
</style>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	<div id="layoutSidenav">

		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="Menu_container">
							<ul class="Menu_list">
								<li style="font-weight: bold;"><a>체조성 기록</a></li>
							</ul>
						</div>
					<jsp:include page="/WEB-INF/views/frame/menu.jsp"></jsp:include>
					<div class="row">

					    <!-- Area Chart -->
                        <div class="col-xl-6 col-lg-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">1주일간 체조성 기록 차트</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

						<!-- Chart - Right -->
						<div class="col-xl-4 col-lg-5">
							<div class="col-xl-12">

								<div style="margin-top: 30px;" class="insertdate">
									<div>
										<h2>근육량/체지방량 입력</h2>
									</div>
									<form>
									<div class="col-xl-12 setdayweight">
										<div>
											<div>
												<div
													style="flex: 1 1 0%; display: flex; flex-direction: row; margin-bottom: 20px; margin-top: 20px;">
													<div
														style="flex: 0 1 0%; margin-right: 10px; min-width: 100px; align-self: center;">
														<h3>날짜</h3>
													</div>
													<div>
														<div>
															<input type="text" id="datepicker" name="date">
														</div>
													</div>
												</div>
												<div
													style="flex: 1 1 0%; display: flex; flex-direction: row;">
													<div
														style="flex: 0 1 0%; margin-right: 10px; min-width: 100px; align-self: center;">
														<h3>근육량</h3>
													</div>
													<span
														class="ant-input-affix-wrapper Track_input_basic__yj5u2 css-1s3dcof">
														<input
								class="ant-input css-1s3dcof Composition_input_basic2__HoLj8" name="muscleMass"
								type="text" value=${memberComposition.muscleMass }><span
														class="ant-input-suffix">kg</span>
													</span>
												</div>


											</div>
												<div
													style="flex: 1 1 0%; display: flex; flex-direction: row;">
													<div
														style="flex: 0 1 0%; margin-right: 10px; min-width: 100px; align-self: center;">
														<h3>체지방량</h3>
													</div>
													<span
														class="ant-input-affix-wrapper Track_input_basic__yj5u2 css-1s3dcof">
														<input
								class="ant-input css-1s3dcof Composition_input_basic2__HoLj8" name="bodyFatPet"
								type="text" value=${memberComposition.bodyFatPet }><span
														class="ant-input-suffix">%</span>
													</span>
												</div>

											<div class="my-4">* 이미 값이 존재하는 경우, 새 값으로 갱신됩니다.</div>
										</div>
											<input type="hidden" name="memberId" value="${member.memberId }" >
										<div>
											<button type="button" class="weightDate btn btn-outline-primary">
												<span>저장하기</span>
											</button>
											<button type="button" class="deleteComposition btn btn-outline-primary">
												<span>선택한 날짜의 데이터 삭제</span>
											</button>
											
										</div>
										
									</div>
									</form>
								</div>
								</div>

							</div>
						</div>
					</div>
				<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
			</main>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/resources/resources1/js/Chart.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>

    <script>
    
        // 날짜 데이터 배열
        const dates = [];
        // 근육량 체지방량 배열
        const musclemass = [];
        const bodyfatpet = [];
        
        const fpMemberWeightVoListJson = '${fpMemberWeightVoListJson}';
        const fpMemberWeightVoList = JSON.parse(fpMemberWeightVoListJson);
        for (var i=0; i<fpMemberWeightVoList.length; i++){
        	dates.push(fpMemberWeightVoList[i].weightDate);
        	// musclemass에서 null을 0으로 대체
            musclemass.push(fpMemberWeightVoList[i].muscleMass || 0);

            // bodyfatpet에서 null을 0으로 대체
            bodyfatpet.push(fpMemberWeightVoList[i].bodyFatPet || 0);
        }
        
        // 캔버스 요소 가져오기
        const ctx = document.getElementById('myAreaChart').getContext('2d');

     // Chart.js를 사용하여 선 그래프 생성
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: dates, // 날짜 라벨을 날짜 데이터로 설정
                datasets: [
                    {
                        label: '날짜별 근육량', // 첫 번째 데이터 세트 라벨
                        data: musclemass, // 첫 번째 데이터 세트 데이터
                        borderWidth: 1,
                        borderColor: 'blue', // 첫 번째 데이터 세트 선의 색상
                    },
                    {
                        label: '날짜별 체지방량', // 두 번째 데이터 세트 라벨
                        data: bodyfatpet, // 두 번째 데이터 세트 데이터
                        borderWidth: 1,
                        borderColor: 'red', // 두 번째 데이터 세트 선의 색상
                    },
                ],
            },
            options: {
                scales: {
                    yAxes: [{
                    	ticks: {
                    		max: 100,
                            min: 0,
                            stepSize: 10
                        }
                    }]
                }
            }
        });
     
      //delete
		$(".deleteComposition").click(deleteComposition);
		function deleteComposition(){
			var dateVal = $("#datepicker").val()
			//replace([기존문자],[바꿀문자])
			dateVal= dateVal.replaceAll("-", "");
			$.ajax({
				url:"${pageContext.request.contextPath}/memberweight/delete",
				type: "post",
				data : {memberId : "${member.memberId}"
					,weightDate: dateVal
					,}
				,success : function(){
					console.log("success");
					location.href="${pageContext.request.contextPath}/memberweight/composition";}
				,error : function(){
					console.log("error");
				}
			})
		}
    </script>
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
									var selectDate = $.datepicker.formatDate(
											"yymmdd", $("#datepicker")
													.datepicker("getDate"));
									selectDate = $("#datepicker").val();
									/* alert(exerciseDate); */
									selectDate= selectDate.replaceAll("-", "");
									console.log(selectDate);
									$.ajax({
										url:"${pageContext.request.contextPath}/memberweight/composition/nowdate",
										type: "post",
										data : {memberId : "${member.memberId}"
											,selectDate: selectDate
										}
										,success : function(result){
											console.log("success");
											console.log(result);
											$("[name=muscleMass]").val(result.muscleMass);
											$("[name=bodyFatPet]").val(result.bodyFatPet);
										}				
										,error : function(){
											console.log("error");
										}
									})
								}
							});

			//초기값을 오늘 날짜로 설정해줘야 합니다.
			$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
		});
		
		//날짜
		$(".weightDate").click(weightDate);
		function weightDate(){
			var dateVal = $("#datepicker").val()
			//replace([기존문자],[바꿀문자])
			dateVal= dateVal.replaceAll("-", "");
			console.log(dateVal);
			$.ajax({
				url:"${pageContext.request.contextPath}/memberweight/composition",
				type: "post",
				data : {memberId : "${member.memberId}"
					,weightDate: dateVal
					,muscleMass :  $("[name=muscleMass]").val()
					,bodyFatPet :  $("[name=bodyFatPet]").val()
				}
				,success : function(result){
					console.log("success");
					if(result == 0 ){
						alert("경고");	
					} else {
						//새로고침 방법1
					  location.href="${pageContext.request.contextPath}/memberweight/composition";
					  
					 /*  //새로고침 방법2
					  location.reload();
					 
					  //새로고침 방법3 
					  location.replace();  */
					}
				}				
				,error : function(){
					console.log("error");
				}
			})
		}
	</script>
</body>
</html>
