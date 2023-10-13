function checkCorrectDate(){ // 날짜 비교
	var startDate = new Date($("#startDate").val());
	var endDate = new Date($("#endDate").val());
	
	if (startDate > endDate){
		alert("날짜를 다시 입력 해주세요.");
		return false;
	}
	return true;
};

function add_btnSchedule(){ // 버튼 클릭 일정 추가
	var url = "btnSelected";
	var name = "일정 추가";
	var option = "width = 600, height = 600 left = 100, top=50,location=no";
	window.open(url,name,option)

};

function add_ClickSchedule(clickDate){ // 클릭된 날짜부터 일정 추가
	var url = "calendarSelected?date="+clickDate;
	var name = "일정 추가";
	var option = "width = 600, height = 600 left = 100, top=50,location=no";
	window.open(url,name,option)

	//alert(year+"년"+month+"월"+day+"일");
};

function click_Calendar(calendarNo){ // 클릭된 일정 정보 불러오기 - 수정
	var url = "calendarUpdate?no="+calendarNo;
	var name = "일정 수정";
	var option = "width = 600, height = 600 left = 100, top=50,location=no";
	window.open(url,name,option)
};

function send_save(){ // ajax 비동기 처리 - 일정 추가
	if(checkCorrectDate()){
		var data = {}; // input에 입력된 내용을 전달
		data["title"] = $("#title").val();
		data["startDate"] = $("#startDate").val();
		data["endDate"] = $("#endDate").val();
		data["content"] = $("#content").val();
		console.log("스크립트 시작");
		console.log(data);
		
		$.ajax({
			data : data,	//JSON.stringify(data)
			url : contextPath+"/calendar/insert",
			type : "POST",
			dataType : "json",
			success:function(response){
				console.log(response);
				if(response.key == "success"){
					alert(response.message);
        			// 캘린더 페이지로 리다이렉트
					location.href = contextPath+"/calendar";
				}else{
					alert(response.message);
				}
			},
			
			error:function(error){
				alert(error.message);
			}
		});		
	}
};

function send_update(){ // ajax 비동기 처리 - 일정 수정
	if(checkCorrectDate()){

		var data = {}; // input에 입력된 내용을 전달 - 하지만 내가 원하는건 클릭한 날짜를 전달해야하지만, null 이 전달됨
		data["calendarno"] = $("#updatePlan [name=calendarno]").val();
		data["title"] = $("#updatePlan [name=title]").val();
		data["startDate"] = $("#updatePlan [name=startDate]").val();
		data["endDate"] = $("#updatePlan [name=endDate]").val();
		data["content"] = $("#updatePlan [name=content]").val();
		console.log("스크립트 시작");
		console.log(data);
		
		$.ajax({
			data : data,	//JSON.stringify(data)
			url : contextPath + "/calendar/update",
			type : "POST",
			dataType : "json",
			success:function(response){
				if(response.key == "success"){
					alert(response.msg);
					// 캘린더 페이지로 리다이렉트
					location.href = contextPath+"/calendar";
				}else{
					alert(response.msg);				
				}
			},
			error:function(error){
				alert(error.message);
			}
		});
	}
};

function send_delete() { // ajax 비동기 처리 - 일정 삭제
    var data = { "calendarno": $("#calendarno").val(), "memberId": $("#memberId").val() };
    var result = confirm("해당 일정을 정말 삭제 하시겠습니까?");
    console.log(data);
    if (result) {
        $.ajax({
            //data: JSON.stringify(data), // JSON 형식으로 데이터 전송
            //contentType: "application/json; charset=UTF-8",
            data:data,
            url: contextPath + "/calendar/delete",
            type: "POST",
            dataType: "json",
            success: function (response) {
                if (response.key == "success") {
                    alert(response.msg);
                    // 캘린더 페이지로 리다이렉트
					location.href = contextPath+"/calendar";
                } else {
                    alert(response.msg);
                }
            },
            error: function (error) {
                alert(error.msg);
            }
        });
    }
};

function sendHiddenValues() {
    // hidden input 요소에서 값을 가져옵니다.
    var calendarno = document.getElementById("calendarno").value;
    var memberId = document.getElementById("memberId").value;

    // AJAX 요청을 보냅니다.
    $.ajax({
        type: "POST", // 또는 "GET"에 따라 서버 요청 방식을 선택합니다.
        url: contextPath+"/calendar/calendarNumber", // 서버로 데이터를 보낼 URL을 입력합니다.
        data: {
            calendarno: calendarno,
            memberId: memberId
        },
        success: function(response) {
            // 서버로부터의 응답을 처리합니다.
            alert("Hidden 값이 서버로 전송되었습니다."); // 예를 들어, 성공적으로 전송되었을 때 알림창을 표시합니다.
        },
        error: function(error) {
            // 에러를 처리합니다.
            console.log(error);
            alert("Hidden 값 전송 중 오류가 발생하였습니다."); // 오류 발생 시 알림창을 표시합니다.
        }
    });
}