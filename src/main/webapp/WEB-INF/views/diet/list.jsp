 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Daily Muscle Life</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/scss.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- jQuery library -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!-- jQuery UI library -->
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- jQuery UI CSS (스타일) -->
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link href="${pageContext.request.contextPath}/css/style1.css"	rel="stylesheet" /> 
		<link href="${pageContext.request.contextPath}/css/style2.css"	rel="stylesheet" />
    </head>

    
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/views/diet/modal_insert.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/frame/nav.jsp"></jsp:include>
	
	<div id="layoutSidenav">
		<jsp:include page="/WEB-INF/views/frame/asidebar.jsp"></jsp:include>
		

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Daily Muscle Life</h1>
					<jsp:include page="/WEB-INF/views/frame/menu9.jsp"></jsp:include>
					
					
					
					<div class="DateBars_date_bar__QeCa3" >
						<div id = "myDiv" class="DateBars_date__DyX0X"><%String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());%>
								<%=Date%></div>
						<div class="DateBars_date_selector__ajXTR">

							</div>
							
							
						<div class="DateBars_date_picker__GCWt1">
							<div class="DateBars_date_picker_wrapper__8Axpy">
								<div
									class="ant-picker ant-picker-borderless css-1s3dcof DateBars_date_bar_calendar__XIcjP"
									style="margin-right: 13px; margin-top: 4px;">
									<div class="ant-picker-input">
										<input readonly="" placeholder="Select date" title=""
											size="12" autocomplete="off" value=""><span
											class="ant-picker-suffix"><div
												class="ant-image css-1s3dcof"
												style="width: 31px; height: 27px;">
												
												<input type="text" id="datepicker">
									

												<!--  <img
													class="ant-image-img DateBars_date_bar_calendar_icon__gPVOu"
													src="resources/images/date_bar_calendar_icon.png"
													width="31" height="27" style="height: 27px;"> -->
												</div>
											</div></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="totalSelectedPlan">
					<div class="totalParentPlan">
					
					
					<div class="Plan_top1__f4K0_">
					
						<div class="Plan_top1_title__wZHYO">섭취할 칼로리</div>
						<div class="Plan_top1_value1__JkpyX">
							<div>
								<div>
									<div class="Plan_top1_value1__JkpyX"> ${totalDietList.totalCal}</div>
								</div>
							</div>
						</div>
						<div class="Plan_top1_kcal__wgGCD">탄 : ${totalDietList.totalCrabs}</div>
						<div class="Plan_top1_value3__USxBx">단 : ${totalDietList.totalProtein}</div>
						<div class="Plan_span__XoR2b">지 : ${totalDietList.totalFat}</div>
						<div class="Plan_top1_value2__a0gQ9"></div>
						<div class="Plan_top1_kcal__wgGCD">필요</div>
					
					</div>
				 
					</div>
					
					</div> 
					
					
					<form>
					  <select name="language" id="selectbox"" name="selectbox" onchange="chageLangSelect()">
					    <option value="ALL">전체</option>
					    <option value="A">아침</option>
					    <option value="B">점심</option>
					    <option value="C">저녁</option>
					    <option value="Z">간식</option> 
					  </select>
					</form>
				
					
					<div class="Plan_bottom1_save____Cw1">
							<button type="button"
								class="ant-btn css-1s3dcof ant-btn-default Plan_bottom1_save_btn__14v5t Global_button__iJeUH save">
								<span>저장하기</span>
							</button>						
						</div>
					
					<div id="wrapSelectedPlan">
					<div class="Plan_bottom1_second_bar___Z7S8">
						<div class="Plan_bottom1_second_bar_foodcategory__Ew3pH">식사구분</div>
						<div class="Plan_bottom1_second_bar_food__Nea0w">음식</div>
						<div class="Plan_bottom1_second_bar_kcal__2i7Y2">수량</div>
						<div class="Plan_bottom1_second_bar_kcal__2i7Y2">
							칼로리<br> <span class="Plan_bottom1_second_bar_sub___m2EJ"></span>
						</div>
						<div class="Plan_bottom1_second_bar_carb__0dt0o">
							탄수화물 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ"></span>
						</div>
						<div class="Plan_bottom1_second_bar_protein__BHBRu">
							단백질 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ"></span>
						</div>
						<div class="Plan_bottom1_second_bar_fat__8Tyy8">
							지방 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ"></span>
						</div>
						<div class="Plan_bottom1_second_bar_ctl__2Pelr">&nbsp;</div>
					</div>
					
				 <c:forEach items="${dietList}" var="item"  varStatus="vs">	
				 
			<div class="Plan_bottom1_food_each__s9jUi">	
			 	<div class="Plan_bottom1_second_bar_foodcategory__Ew3pH foodTime">
				<span class="Plan_bottom1_second_bar_sub___m2EJ ">${item.foodTime}</span>
				</div>				
				<div class="Plan_bottom1_second_bar_food__Nea0w">${item.foodName}
				</div>
				 <div class="Plan_bottom1_second_bar_kcal__2i7Y2 foodQuality">
				수량<br> <span class="Plan_bottom1_second_bar_sub___m2EJ ">20</span>
				</div> 
				<div class="Plan_bottom1_second_bar_kcal__2i7Y2 calorie">
					칼로리<br> <span class="Plan_bottom1_second_bar_sub___m2EJ " >${item.calorie}</span>
				</div>
				<div class="Plan_bottom1_second_bar_carb__0dt0o carbs">
					탄수화물 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">${item.crabs}</span>
				</div>
				<div class="Plan_bottom1_second_bar_protein__BHBRu protein">
					단백질 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">${item.protein}</span>
				</div>
				<div class="Plan_bottom1_second_bar_fat__8Tyy8 fat">
					지방 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">${item.fat}</span>
				</div>
				<div class="Plan_bottom1_second_bar_ctl__2Pelr foodcd">
					<button type="button" onclick="btnDeleteClickHandler(this)" value="${foodGp}">삭제</button>
					
				</div>
			</div>
			
			</c:forEach> 
			
					</div>
					
					
					
					<div class="Plan_bottom1_food_list__gjfsu">
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div class="Plan_bottom1_control_panel__rpO5n">
							<div class="Plan_bottom1_control_panel_left__FH6wi">
								<div class="Plan_bottom1_control_panel_left_one__J2gfw">
								</div>
							</div>
						
								<div class="Plan_bottom1_control_panel_add__F5yxB" >
									<!-- Button trigger modal -->
									<button type="button" id="dietinsert"  onclick="doAction()" class="ant-btn css-1s3dcof ant-btn-default Plan_bottom1_control_panel_btn__3jlBx Global_button__iJeUH" style="float: right;">
										<span>식단 추가 +</span>
										<!-- data-bs-toggle="modal" data-bs-target="#dietInsertModal"  -->
									</button>
								</div>
						</div>
					</div>					
					</main>
				</div>
		</div>
	<script		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/js/scripts.js"></script>
	<script		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"		crossorigin="anonymous"></script>
<script>
	$(function() {
 	var container = $(".DateBars_date_selector__ajXTR"); // 스크롤할 컨테이너
 	var today = new Date();
 	
 	
 	

  // 스크롤 좌 우 버튼 클릭 시 이동
  $(".ant-image-img").click(function() {
    var currentDay = parseInt($(".DateBars_date__DyX0X").text());
    var nextDay = currentDay + 1;
	

    var scrollTo = $(".ant-btn-circle span", container).filter(function() {
      return parseInt($(this).text()) === nextDay;
    });
   

    if (scrollTo.length) {
      container.scrollTop(scrollTo.offset().top - container.offset().top + container.scrollTop());
      $(".DateBars_date__DyX0X").text(nextDay);
    }
  });
  console.log(scrollTo);
  // input을 datepicker로 선언
  $("#datepicker").datepicker({
	    dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        showMonthAfterYear: true,
        changeYear: true,
        changeMonth: true,
        showOn: "both",
       	buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", // 버튼 이미지 경로
        buttonImageOnly: true,
        buttonText: "선택",
        yearSuffix: "년",
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 달력의 월 부분 Tooltip
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 달력의 요일 텍스트
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], // 달력의 요일 Tooltip
        defaultDate: today,

		 
	       onSelect: function(dateText, inst) {
	           $(".DateBars_date__DyX0X").text(dateText); // 맨 위의 날짜 변경
	           var date=new Date($("#datepicker").datepicker({dateFormat:"yy-mm-dd"}).val());
	           //일요일 0~
	          var selectDate = $.datepicker.formatDate("yymmdd",$("#datepicker").datepicker("getDate")); 
         		selectDate = $("#datepicker").val();
         		
         		var selectDate1= selectDate.replaceAll("-", "");
	           alert(selectDate1);
	           week=new Array("일","월","화","수","목","금","토");
	           $(".DateBars_day_of_week__ShQrM").text(week[date.getDay()]);
	           
	           
		     var scrollTo = $(".ant-btn-circle span", container).filter(function() {
		       return parseInt($(this).text()) === inst.selectedDay;
		     });
		
		     if (scrollTo.length) {
		       container.scrollTop(scrollTo.offset().top - container.offset().top + container.scrollTop());
		     }
		 	/* 	replace([기존문자],[바꿀문자])
				dateVal= dateVal.replaceAll("-", ""); */
		 	  $.ajax({
					url:"${pageContext.request.contextPath}/diet/search",
					type: "get"
					,contentType: "application/json"
					, data: {mealCode: selectDate1 + "${member.memberId}" }
					, success : function(result){
						console.log("success");
						
						}
					
					, error : function(){
						console.log("error")
					}
					});
					
		     // onSelect 
		 	},
   onChangeMonthYear:function(year, month, inst){
     setTimeout(function(){
       var selectedDay = parseInt($(".ui-datepicker-calendar .ui-state-active a", inst.dpDiv).text());
      
       if (!isNaN(selectedDay)) {
         $(".DateBars_date__DyX0X").text(selectedDay);

         var scrollTo = $(".ant-btn-circle span", container).filter(function() {
           return parseInt($(this).text()) === selectedDay;
         });

         if (scrollTo.length) {
           container.scrollTop(scrollTo.offset().top - container.offset().top + container.scrollTop());
         }
       }
     }, 0);
   }
 });
/*  $('#datepicker').datepicker('setDate', new Date()); */
 $('#datepicker').datepicker('setDate', today);
});
	</script>
	
	<script>
	$("#dietinsert").click(dietClickHandler);
	function dietClickHandler() {		
		console.log("dietClickHandler");
		$.ajax({
			url:"${pageContext.request.contextPath}/foodapi/list",
			type: "get"
			,dataType:"json"
			, success : function(result){
				console.log(result);
				var htmlVal = '';
				result.map((vo)=>{
					htmlVal+=`
						<div class="Plan_raw_food_bar__hNTTJ frm div_foodcd" data-foodcd="\${vo.foodCd}">
						<div class="Plan_raw_food_bar_each__VYL98  Plan_modal_food_bar_name__jMR4t foodName">\${vo.foodName}</div>
						<div class="Plan_raw_food_bar_each__VYL98  calorie">\${vo.calorie}kcal</div>
						<div class="Plan_raw_food_bar_each__VYL98  crabs">\${vo.crabs}g</div>
						<div class="Plan_raw_food_bar_each__VYL98  protein">\${vo.protein}g</div>
						<div class="Plan_raw_food_bar_each__VYL98  fat">\${vo.fat}g</div>
					 	<div class="Plan_raw_food_bar_each__VYL98  foodcd Plan_raw_food_bar_ctl__bADrg">
							<button type="button"  data-foodcd="\${vo.foodCd}" onclick="btnPlusClickHandler(this);"
								class="ant-btn css-1s3dcof ant-btn-circle ant-btn-default ant-btn-icon-only Plan_raw_food_bar_icon__GUMkf foodcdval" value="\${vo.foodCd}"
								ant-click-animating-without-extra-node="false">
								<span role="img" aria-label="plus"
									class="anticon anticon-plus Plan_raw_food_bar_icon_plus__lIKKS"><svg
										viewBox="64 64 896 896" focusable="false"	
										data-icon="plus" width="1em" height="1em"
										fill="currentColor" aria-hidden="true">
										<defs>
										<style></style></defs>
										<path
											d="M482 152h60q8 0 8 8v704q0 8-8 8h-60q-8 0-8-8V160q0-8 8-8z"></path>
										<path
											d="M176 474h672q8 0 8 8v60q0 8-8 8H176q-8 0-8-8v-60q0-8 8-8z"></path></svg></span>
							</button>
						</div>
					</div>
					
					`;
				});
				  
				$(".Plan_modal_food_left__wihxs > .frm").remove();
				$(".Plan_modal_food_left__wihxs").append(htmlVal);
				
			}
			,error: function(e){
				console.log(e);	
			}
			
		
		})
	}
	
	function doAction()
 	{
		var foodTime = document.getElementById("selectbox");
		
		var foodTimeValue = foodTime.options[foodTime.selectedIndex].value;
		
		if("ALL" == foodTimeValue)
		{
			alert("식사 구분으로 전체를 선택 할 수 없습니다.");
			
		
		}
		else{
			 $('#dietInsertModal').modal('show');
		}
 	}
	
	function btnPlusClickHandler(thisElement){
		
		var foodTime = document.getElementById("selectbox");
		
		var foodTimeValue = foodTime.options[foodTime.selectedIndex].value;
		
		var foodTimeValueConvert = "";
		
		
		
		console.log("foodCd : " +  $(thisElement).data("foodcd"));
		var foodcd = $(thisElement).data("foodcd");
		foodName = $(thisElement).parent().prevAll(".foodName").text();
		calorie = $(thisElement).parent().prevAll(".calorie").text();
		carbs = $(thisElement).parent().prevAll(".crabs").text();
		protein = $(thisElement).parent().prevAll(".protein").text();
		fat = $(thisElement).parent().prevAll(".fat").text();
        
	
		
		
		
		switch (foodTimeValue) {
		  case 'A':
			  foodTimeValueConvert = "아침"
		    break;
		  case 'B':
			  foodTimeValueConvert = "점심"
			break;
		  case 'C':
			  foodTimeValueConvert = "저녁"
		    break;
		  case 'Z':
			  foodTimeValueConvert = "간식"
		    break;	  
		  default:
			  foodTimeValueConvert = "전체"
		}
		
		htmlVal = '';
		htmlVal += `
			<div class="Plan_bottom1_food_each__s9jUi" style="background-color: yellow;">	
			 	<div class="Plan_bottom1_second_bar_foodcategory__Ew3pH foodTime">
				<span class="Plan_bottom1_second_bar_sub___m2EJ ">\${foodTimeValueConvert}</span>
				</div>				
				<div class="Plan_bottom1_second_bar_food__Nea0w">\${foodName}
				</div>
				 <div class="Plan_bottom1_second_bar_kcal__2i7Y2 foodQuality">
				수량<br> <span class="Plan_bottom1_second_bar_sub___m2EJ ">20</span>
				</div> 
				<div class="Plan_bottom1_second_bar_kcal__2i7Y2 calorie">
					칼로리<br> <span class="Plan_bottom1_second_bar_sub___m2EJ " >\${calorie}</span>
				</div>
				<div class="Plan_bottom1_second_bar_carb__0dt0o carbs">
					탄수화물 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">\${carbs}</span>
				</div>
				<div class="Plan_bottom1_second_bar_protein__BHBRu protein">
					단백질 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">\${protein}</span>
				</div>
				<div class="Plan_bottom1_second_bar_fat__8Tyy8 fat">
					지방 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">\${fat}</span>
				</div>
				<div class="Plan_bottom1_second_bar_ctl__2Pelr foodcd">
					<button type="button" onclick="btnDeleteClickHandler(this)" value=\${foodcd}>삭제</button>
					
				</div>
			</div>
		`;
		
		
		$("#wrapSelectedPlan").append(htmlVal);
		//modal 
		
	}  // btnPlusClickHandler
	
	function btnDeleteClickHandler(thisElement) {
	    	var foodCdToDelete = $(thisElement).val();
			console.log(foodCdToDelete);
			if(foodCdToDelete == null){
			}  else {
				
				
				var pattern = /^[A-Za-z]/;
				
				
				let objfinal = {foodGp : foodCdToDelete };
				
				$(thisElement).closest(".Plan_bottom1_food_each__s9jUi").remove();
				
				if(pattern.test(foodCdToDelete))
					return;
				
				
		   		// TODO: AJAX를 사용하여 서버로 삭제 요청 보내기
		    	 $.ajax({
		        url: "${pageContext.request.contextPath}/diet/delete", 
		        type: "post",
		        contentType: "application/json",
			    data: JSON.stringify(objfinal),
	
		        success: function (result) {
		            console.log(result); 
		            console.log("result"); 
		            
		            chageLangSelect();
		            
			        },
			        
			        
			        
		        error: function (error) {
		            console.log("error"); 
		        }, 
		    	 });
		}  // else
			
			
			
			
	}// btnDeleteClickHandler
			/* 	function btnDeleteClickHandler(thisElement){
					console.log(thisElement);
					console.log($(thisElement).data("foodcd"));
					// TODO :ajax : food table delete
					var deleteForDiet = $()
					

					$(thisElement).closest(".Plan_bottom1_food_each__s9jUi").remove();
				}
		 */
	$("button.save").click(btnSaveHandler);
	function btnSaveHandler(){
		var food_length = $(".Plan_bottom1_food_each__s9jUi").length;
		console.log(food_length);
		if(food_length < 1){
			alert("추가된 식단이 없습니다. 식단 추가 후 저장해주세요.");
			return;
		}
		
		let objfinal= {};
		let arr1= [];
		
		$("#datepicker").datepicker({
		    dateFormat: 'yy-mm-dd',
		    // ... 다른 옵션들 ...
		    onSelect: function(dateText, inst) {
		        // 선택한 날짜를 selectedDate 변수에 할당
		        selectedDate = dateText;
		        selectedDate = selectedDate.replaceAll("-", ""); 
		    	/* replace([기존문자],[바꿀문자])
				dateVal= dateVal.replaceAll("-", "");  */
		        // 날짜와 요일을 업데이트하는 부분
		        $(".DateBars_date__DyX0X").text(dateText);
		        var date = new Date(dateText);
		        alert("date: " + date.getDay());
		        week = new Array("일", "월", "화", "수", "목", "금", "토");
		        $(".DateBars_day_of_week__ShQrM").text(week[date.getDay()]);
		    }
		});
		let memberId = "${member.memberId}";  // TODO
		
		Array.from(document.querySelectorAll(".Plan_bottom1_food_each__s9jUi")).map(function(eachElement){
			console.log(eachElement);
			console.log($(eachElement));
			console.log($(eachElement).children(".foodQuality").children("span").text());
			console.log($(eachElement).children(".foodcd").children("button").val());
			var quality = $(eachElement).children(".foodQuality").children("span").text();
			var cd =$(eachElement).children(".foodcd").children("button").val();
			var foodTime =$(eachElement).children(".foodTime").children("span").text();
			
			var obj2= {};
			obj2.foodCd = cd;
			obj2.foodQuality =quality;	
			obj2.foodTime = foodTime;  // Service에서 조합할 예정 mealCode
			arr1.push(obj2);
		});
		let selectedDate = $(".DateBars_date__DyX0X").text();
		selectedDate = selectedDate.replaceAll("-","");
		objfinal.foodlist = arr1;
		objfinal.foodDate = selectedDate.trim();
		console.log("selectedDate.trim()"+selectedDate.trim());
		objfinal.memberId = memberId;
		objfinal.foodCd = $(".foodcdval").val();
		//private String foodCd;
		//private int foodQuality;
		//private String mealCode;
		
		console.log(objfinal);		
		// TODO :ajax : food table, diet table - insert
		// var dateVal = $("#datepicker").val()
		//replace([기존문자],[바꿀문자])
		//dateVal= dateVal.replaceAll("-", "");
 	  	 $.ajax({
			url:"${pageContext.request.contextPath}/diet/insert",
			type: "post"
			,contentType: "application/json"
			, data: JSON.stringify(objfinal)
		/* 	, data: {foodDate: selectDate1, memberId : "${member.memberId}",foodCd : $(eachElement).children(".foodcd").children("button").val(),  mealCode : selectDate1+"${member.memberId}"+ }
				 */
			//, dataType:"json"
			, success : function(result) {
				console.log(result);
				console.log("success");
				
				chageLangSelect();
				
			}
			, error : function(e){
				console.log(e);	
				console.log("error");
			}
		});  // ajax
	}
	
	
	function chageLangSelect(){
	    var langSelect = document.getElementById("selectbox");
	     
	    // select element에서 선택된 option의 value가 저장된다.
	    var selectValue = langSelect.options[langSelect.selectedIndex].value;
	 
	    // select element에서 선택된 option의 text가 저장된다.
	    var selectText = langSelect.options[langSelect.selectedIndex].text;
	    
	    // div의 id를 사용하여 해당 div 요소를 선택합니다.
	    var divElement = document.getElementById('myDiv');
	    
	    // div의 내용을 가져와서 JavaScript 변수에 저장합니다.
	    var divContent =  divElement.innerText;
	    var foodDate = divContent.replaceAll("-", "").toString();
	    
	
		
	    
	    var objfinal= {foodTime : selectValue, foodDate : foodDate};
	    
	    console.log(selectValue);
	    
	    $.ajax({
			url:"${pageContext.request.contextPath}/diet/list",
			type: "post"
			,contentType: "application/json"
			, data: JSON.stringify(objfinal)
			, success : function(result) {
				console.log(result.dietList);
				console.log("success");
				
				renderData(result.dietList);
				
				
				totalSelectList(result.totalDietList);
				
			}
			, error : function(e){
				console.log(e);	
				console.log("error");
			}
		});  // ajax
	    
	}
	
	
	 function totalSelectList(data)
	{
		 
		
		 
		 var planDiv = document.querySelector('.totalParentPlan');
		
		htmlVal = "";
		
		
			htmlVal += `
			  
				<div class="Plan_top1__f4K0_">
					<div class="Plan_top1_title__wZHYO">총 칼로리 </div>
					<div class="Plan_top1_value1__JkpyX">
						<div>
							<div>
								<div class="Plan_top1_value1__JkpyX">\${data.totalCal} </div>
							</div>
						</div>
					</div>
					<div class="Plan_top1_kcal__wgGCD">탄 : \${data.totalCrabs}</div>
					<div class="Plan_top1_value3__USxBx">단 : \${data.totalProtein}</div>
					<div class="Plan_span__XoR2b">지 : \${data.totalFat}</div>
					<div class="Plan_top1_value2__a0gQ9"></div>
					<div class="Plan_top1_kcal__wgGCD">필요</div>
				</div>
			`;
			  
	
		
		    $(".Plan_top1__f4K0_").remove();
		    $("#totalSelectedPlan").append(htmlVal); 
	
		
	} 
	
	function renderData(data)
	{
		var planBarDiv = document.querySelector('.Plan_bottom1_second_bar___Z7S8');
		var foodTimeValueConvert = '';
		htmlVal = "";
		
		console.log("data : " +  data);
	
	
	    // 데이터를 해당 요소에 동적으로 추가
	     data.forEach(function(item) {
	    	
	    	switch (item.foodTime) {
			  case 'A':
				  foodTimeValueConvert = "아침"
			    break;
			  case 'B':
				  foodTimeValueConvert = "점심"
				break;
			  case 'C':
				  foodTimeValueConvert = "저녁"
			    break;
			  case 'Z':
				  foodTimeValueConvert = "간식"
			    break;	  
			  default:
				  foodTimeValueConvert = "전체"
			}
	    	
			htmlVal += `
				<div class="Plan_bottom1_food_each__s9jUi">	
				 	<div class="Plan_bottom1_second_bar_foodcategory__Ew3pH foodTime">
					<span class="Plan_bottom1_second_bar_sub___m2EJ ">\${foodTimeValueConvert}</span>
					</div>				
					<div class="Plan_bottom1_second_bar_food__Nea0w">\${item.foodName}
					</div>
					 <div class="Plan_bottom1_second_bar_kcal__2i7Y2 foodQuality">
					수량<br> <span class="Plan_bottom1_second_bar_sub___m2EJ ">20</span>
					</div> 
					<div class="Plan_bottom1_second_bar_kcal__2i7Y2 calorie">
						칼로리<br> <span class="Plan_bottom1_second_bar_sub___m2EJ " >\${item.calorie}</span>
					</div>
					<div class="Plan_bottom1_second_bar_carb__0dt0o carbs">
						탄수화물 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">\${item.crabs}</span>
					</div>
					<div class="Plan_bottom1_second_bar_protein__BHBRu protein">
						단백질 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">\${item.protein}</span>
					</div>
					<div class="Plan_bottom1_second_bar_fat__8Tyy8 fat">
						지방 <br> <span class="Plan_bottom1_second_bar_sub___m2EJ">\${item.fat}</span>
					</div>
					<div class="Plan_bottom1_second_bar_ctl__2Pelr foodcd">
						<button type="button" onclick="btnDeleteClickHandler(this)" value=\${item.foodGp}>삭제</button>
						
					</div>
				</div>
			`;
		
			
	    }); 
	    
	    $(".Plan_bottom1_food_each__s9jUi").remove();
	    $("#wrapSelectedPlan").append(htmlVal);
	  
		
	}
	

	
	</script>


