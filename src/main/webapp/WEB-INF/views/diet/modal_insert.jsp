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
									<div
										class="Plan_modal_food_tab_each__3kNM_ Plan_modal_food_tab_selected__q_wCV">
										<button type="button"
											class="ant-btn css-1s3dcof ant-btn-text ant-btn-block">
											<span>식품</span>
										</button>
									</div>

								</div>
								<div class="Plan_modal_food_contents__bU3Ad">
									<div>
										<%-- 	<div class="search-container">

											<form class="search-form"
												action="<%=request.getContextPath()%>/Board" method="get">
												<input type="text" name="keyword"
													placeholder="검색어를 입력하세요">
												<button type="submit">검색</button>
											</form>
										</div> --%>

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
											<!-- 	<div class="Plan_modal_food_right__sg_CE row">
												<div class="Plan_modal_food_desc__QsT8R col-xl-6"  >
													<div class="Plan_modal_food_desc_title__GwIXK">
														식품
														<div
															style="flex: 1 1 0%; font-weight: normal; justify-content: flex-end; text-align: right;"></div>
													</div>
													<div class="Plan_modal_food_desc_subtitle__t8EOz">
														탄수화물
														<div
															style="flex: 1 1 0%; font-weight: normal; justify-content: flex-end; text-align: right;"></div>
													</div>
													<div class="Plan_modal_food_desc_subtitle__t8EOz">
														단백질
														<div
															style="flex: 1 1 0%; font-weight: normal; justify-content: flex-end; text-align: right;"></div>
													</div>
													<div class="Plan_modal_food_desc_subtitle__t8EOz">
														지방
														<div
															style="flex: 1 1 0%; font-weight: normal; justify-content: flex-end; text-align: right;"></div>
													</div>
												</div> -->

											<div
												style="flex: 1 1 0%; font-weight: normal; justify-content: flex-end; text-align: right;">
												<div class="ant-input-number css-1s3dcof"
													style="width: 100px; font-size: 18px; border: 0px;"></div>
												<div class="Plan_modal_food_desc3__2QOT2 col-xl-6">
													<div></div>
												</div>
											</div>
										</div>
										<!-- <div class="Plan_modal_food_desc3_title__sFhbK Plan_modal_food_desc_title__GwIXK">식사구분</div>
														<div class="Plan_modal_food_meal_list__cNfE0">
															<div class="ant-radio-group ant-radio-group-outline css-1s3dcof">
																<label class="ant-radio-button-wrapper Plan_modal_food_manual_radio__94nNy css-1s3dcof"
																	style="border-radius: 20px; background-color: orange; color: black; margin-right: 10px; margin-bottom: 10px;"><span
																	class="ant-radio-button">
																	<input type="radio"  name="meal" value="breakfast"
																		class="ant-radio-button-input"
																		value="64f153a05b87822374c5eb44"><span
																		class="ant-radio-button-inner"></span></span><span>아침</span></label><label
																	class="ant-radio-button-wrapper Plan_modal_food_manual_radio__94nNy css-1s3dcof"
																	style="border-radius: 20px; background-color: blue; color: black; margin-right: 10px; margin-bottom: 10px;"><span
																	class="ant-radio-button"><input type="radio" name="meal" value="lunch"
																		class="ant-radio-button-input"
																		value="64f153a05b87822374c5eb43"><span
																		class="ant-radio-button-inner"></span></span><span>점심</span></label><label
																	class="ant-radio-button-wrapper Plan_modal_food_manual_radio__94nNy css-1s3dcof"
																	style="border-radius: 20px; background-color: green; color: black; margin-right: 10px; margin-bottom: 10px;"><span
																	class="ant-radio-button"><input type="radio" name="meal" value="dinner"
																		class="ant-radio-button-input"
																		value="64f153a05b87822374c5eb42"><span
																		class="ant-radio-button-inner"></span></span><span>저녁</span></label><label
																	class="ant-radio-button-wrapper Plan_modal_food_manual_radio__94nNy css-1s3dcof"
																	style="border-radius: 20px; background-color: red; color: black; margin-right: 10px; margin-bottom: 10px;"><span
																	class="ant-radio-button"><input type="radio" name="meal" value="snack"
																		class="ant-radio-button-input"
																		value="64f153a05b87822374c5eb41"><span
																		class="ant-radio-button-inner"></span></span><span>간식</span></label>
															</div>
														</div> -->


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
						<button type="button"  data-foodcd="\${result[i].foodCd}" onclick="btnPlusClickHandler(this);"
							class="ant-btn css-1s3dcof ant-btn-circle ant-btn-default ant-btn-icon-only Plan_raw_food_bar_icon__GUMkf foodcdval" value="\${result[i].foodCd}"
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
			}
			$(".Plan_brother").html(htmlVal);
		},
		error : function(e) {
			console.log(e);
		}
	})
} 
</script>




