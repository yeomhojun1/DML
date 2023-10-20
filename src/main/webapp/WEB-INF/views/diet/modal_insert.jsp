<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="dietInsertModal" tabindex="-1"
	aria-labelledby="dietInsertModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl ">
		<div class="ant-modal-root css-1s3dcof">
			<div class="ant-modal-mask"></div>
			<div tabindex="-1" class="ant-modal-wrap ant-modal-centered">
				<div role="dialog" aria-modal="true"
					class="ant-modal css-1s3dcof Plan_modal_food__4_lTY"
					style="width: 1000px; transform-origin: 800px 679.641px;">
					<div tabindex="0" aria-hidden="true"
						style="width: 0px; height: 0px; overflow: hidden; outline: none;"></div>
					<div class="ant-modal-content">
						<div class="ant-modal-body">
							<div class="Plan_modal_food_container__cGtDo"
								style="width: 1000px; height: 837.28px;">
								<div class="Plan_modal_food_tabs_bar__JHpPi">
								<div class="Plan_modal_food_tab_each__3kNM_ Plan_modal_food_tab_selected__q_wCV">
								<div class="DietText" style="pointer-events: none;">식품</div>
								</div>

								</div>
								<div class="Plan_modal_food_contents__bU3Ad">
									<div>
										<div
											class="ant-input-group-wrapper ant-input-search ant-input-search-with-button Plan_modal_food_bar_search__8h6t_ css-1s3dcof">
											<input placeholder="식품 검색"
												class="ant-input ant-input-borderless css-1s3dcof"
												name="keyword" type="text" value="">
											<button type="button" onclick="getSearchList(this)"
												class="ant-btn css-1s3dcof ant-btn-default ant-input-search-button">검색</button>
										</div>
										<div class="ant-input-wrapper ant-input-group css-1s3dcof"></div>
										<div
											class="ant-input-affix-wrapper ant-input-affix-wrapper-borderless css-1s3dcof"></div>
										<div class="Plan_modal_food_contents_inside__qWooJ">
											<div class="Plan_modal_food_left__wihxs">
												<div class="Plan_modal_food_bar__ikK6Q">
													<div
														class="Plan_bottom1_second_bar_each__cBwag Plan_modal_food_bar_name__jMR4t">음식</div>
													<div class="Plan_bottom1_second_bar_each__cBwag ">kcal</div>
													<div class="Plan_bottom1_second_bar_each__cBwag ">탄(g)</div>
													<div class="Plan_bottom1_second_bar_each__cBwag ">단(g)</div>
													<div class="Plan_bottom1_second_bar_each__cBwag ">지(g)</div>
													<div
														class="Plan_bottom1_second_bar_each__cBwag Plan_modal_food_bar_ctl__CV6ad"></div>

												</div>
												<div class="Plan_brother"></div>
											</div>

											<div
												style="flex: 1 1 0%; font-weight: normal; justify-content: flex-end; text-align: right;">
												<div class="ant-input-number css-1s3dcof"
													style="width: 100px; font-size: 18px; border: 0px;"></div>
												<div class="Plan_modal_food_desc3__2QOT2 col-xl-6">
													<div></div>
												</div>
											</div>
										</div>
	
										


										<div class="Plan_modal_food_bottom_bar__r962X">
											<button type="button"
												class="ant-btn css-1s3dcof ant-btn-default Plan_modal_food_close_btn__QsNOd Global_button__iJeUH"
												id="closeButton">
												<span>닫기</span>
											</button>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div tabindex="0" aria-hidden="true"
			style="width: 0px; height: 0px; overflow: hidden; outline: none;"></div>
	</div>
</div>
</div>
<script>
$(document).ready(function() {

	   $("#closeButton").click(function() {
	      console.log(this);
	      $(".modal").modal("hide");
	   });
	   
	});
	


function getSearchList(thisElement){
	console.log($("form[name=search-form]").serialize());
	console.log($("[name=keyword]").val());
	$.ajax({
		type: 'get',
		url: "${pageContext.request.contextPath}/foodapi/getSearchList",
		data: {foodName : $("[name=keyword]").val()},
		success: function(result){
			$(".Plan_brother").html("");
			console.log(result);
			htmlVal ="";
			 for(var i=0; i<result.length; i++){
				htmlVal += `
				<div class="Plan_raw_food_bar__hNTTJ frm div_foodcd" data-foodcd="\${result[i].foodCd}">
					<div class="Plan_raw_food_bar_each__VYL98  Plan_modal_food_bar_name__jMR4t foodName">\${result[i].foodName}</div>
					<div class="Plan_raw_food_bar_each__VYL98  calorie">\${result[i].calorie}</div>
					<div class="Plan_raw_food_bar_each__VYL98  crabs">\${result[i].crabs}</div>
					<div class="Plan_raw_food_bar_each__VYL98  protein">\${result[i].protein}</div>
					<div class="Plan_raw_food_bar_each__VYL98  fat">\${result[i].fat}</div>
				 	<div class="Plan_raw_food_bar_each__VYL98  foodcd Plan_raw_food_bar_ctl__bADrg">
					<button type="button"  data-foodcd="\${vo.foodCd}" onclick="btnPlusClickHandler(this);"
						class="my-button" value="\${vo.foodCd}">
						<span>+<span>
					</button>
					</div>
				</div>
			`;	 
			}
			$(".Plan_brother").html(htmlVal);
		},
		error : function(e) {
			console.log(e);
		}
	})
} 


</script>
<script>
$("[name=keyword]").on('keydown', function(event) {
    if (event.key === "Enter") {
       getSearchList();
    }
 });
</script>

<style>
	.DietText {
	  background-color: skyblue; /* 배경색 설정 */
	  color: #666; /* 텍스트 색상 설정 */
	  border: 1px solid #00aeef; /* 테두리 없애기 */
	  padding: 10px 20px; /* 여백 설정 */
	}
	.my-button {
  	background-color: #007bff;
  	color: #fff;
  	border: none;
  	border-radius: 50%;
  	width: 32px;
 	height: 32px;
  	cursor: pointer;
 	display: flex;
 	justify-content: center;
  	align-items: center;
  	font-size: 18px;
	}

	.my-button:hover {
 	background-color: #0056b3;
	}

</style>

