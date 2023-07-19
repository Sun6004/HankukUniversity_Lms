<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">
<style>
.row{
	--bs-gutter-x: 10px;
}
.table-wrap {
	overflow: scroll;
	height: 275px;
	margin-top: 13px;
}
.thead-dark{
	position: sticky;
	top: 0px;
}
.table-info-td{
	font-size: 1.2em;
	font-weight: bold;
	text-align: center;
	color: whitesmoke;
	background-color: #800000;
}
.form-label{
	color: #800000;
}
.table tbody th, .table tbody td {
    border: none;
    padding: 1px;
    font-size: 18px;
    color: black;
}
.table thead tr th {
    padding: 1px;
}
.card-body{
 margin-top: -18px;
}
</style>

<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">교수행정</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">휴강신청 관리</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6">
				<div class="row">
					<div class="col-lg-12">
						<div class="card" id="card-title-1">
							<div class="card-header border-0 pb-0 ">
								<h5 class="card-title">휴강신청 목록</h5>
							</div>
							<div class="card-body" style="height: 350px; overflow: visible">
								<div class="table-wrap">
									<table class="table" style="margin-top: -22px;">
										<thead class="thead-dark">
											<tr>
												<th style="width:100px;">교번</th>
												<th style="width:100px;">교수명</th>
												<th style="width:100px;">수업명</th>
											</tr>
										</thead>
										<tbody id="lecTbody">
											<c:forEach var="lecCancel" items="${lecCancelList}">
												<tr>
													<td>
														<c:out value="${lecCancel.proNo }"/>
														<input type="hidden" id="lecapNo" value="<c:out value="${lecCancel.lecapNo }"/>">
														<input type="hidden" id="subclAplyWk" value="<c:out value="${lecCancel.subclAplyWk }"/>">
													</td>
													<td>
														<c:out value="${lecCancel.proNm }"/>
													</td>
													<td>
														<c:out value="${lecCancel.subNm }"/>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="card" id="card-title-1" style="margin-top: -21px">
							<div class="card-header border-0 pb-0 ">
								<h5 class="card-title">학생목록</h5>
							</div>
							<div class="card-body" style="height: 453px; overflow: visible">
								<div class="table-wrap">
									<table class="table" style="margin-top: -22px;">
										<thead class="thead-dark">
											<tr>
												<th style="width:100px;">학번</th>
												<th style="width:100px;">이름</th>
												<th style="width:100px;">전화번호</th>
												<th style="width:100px;">학과</th>
												<th style="width:10px;">
													<input type="checkbox" class="form-check-input" id="checkAll">
												</th>
											</tr>
										</thead>
										<tbody id="stdTBody">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6" style="height: 809px;">
				<div class="card" id="card-title-1">
					<div class="card-header border-0 pb-0 ">
						<h5 class="card-title">메세지 보내기</h5>
					</div>
					<div class="card-body" style="height: 350px; overflow: visible">
						<div class="row">
							<div class="col-lg-12 mb-3">
								<label class="text-label form-label" style="font-size: 1.5em; font-weight: bold;">수신자</label>
								<textarea rows="10" cols="30" class="form-control" id="receiver" name="receiver" readonly></textarea>
							</div>
							<div class="col-lg-12 mb-3">
								<label class="text-label form-label" style="font-size: 1.5em; font-weight: bold;">내용</label>
								<textarea rows="10" cols="30" class="form-control" id="msg" name="msg" readonly></textarea>
							</div>
							<div class="col-lg-12 mb-3" style="text-align: right;">
								<br><br><br><br>
								<br><br><br>
								<button type="button" class="btn btn-danger light" id="cancelBtn">취소</button>
								<button type="button" class="btn btn-primary" id="msgSendBtn">전송</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="card" id="card-title-1" style="margin-top: -39px;">
					<div class="card-header border-0 pb-0 ">
						<h5 class="card-title">발송내역</h5>
					</div>
					<div class="card-body" style="height: 350px; overflow: visible">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var lecTbody = $('#lecTbody');
	var checkAll = $('#checkAll');
	var stdInfo = [];
	var msgSendBtn = $('#msgSendBtn');
	var cancelBtn = $('#cancelBtn');
	
	
	cancelBtn.on('click', function(){
		$('#receiver').text("");
		$('#msg').text("");
		checkAll.click();
	});
	
	msgSendBtn.on('click',function(){
		var msg = $('#msg').text();
		if (msg == "" || msg == null) {
			swal({
				title: "휴강 정보를 선택해주세요.", 
				icon: "error"
			});
			return false;
		}
		
		if (stdInfo == null || stdInfo.length == 0) {
			swal({
				title: "수신자를 선택해주세요.", 
				icon: "error"
			});
			return false;
		}
		stdInfo.push(msg);
		console.log("전송 로직 구현해야함");
		console.log("전송 하기전 데이터 > ", stdInfo);
	});
	
	lecTbody.on('click', 'tr' ,function(){
		let lecapNo = $(this).find('#lecapNo').val();
		getStdList(lecapNo);
		
		$('#receiver').text("");
		
		
		let msgText = {
			pro: $(this).find('td').eq(1).text().trim(),
			sub: $(this).find('td').eq(2).text().trim(),
			week: $(this).find('#subclAplyWk').val()
		};
		if (checkAll.is(':checked')) {
			checkAll.click();
		}
		checkStd();
		insertMsgText(msgText);
	});
	
	function getStdList(pLecapNo){
		console.log(pLecapNo);

		let sendData = {lecapNo : pLecapNo};

		
		$.ajax({
			type : "get",
			url : "/hku/admin/student-in-lecture",
			contentType: "application/json;charset=utf-8",
			data : sendData,
			dataType: 'json',
			success: function(res){
				console.log(res);
				var stdTBody = $('#stdTBody');
				let stdStr = "";
				for(let i=0; i<res.length; i++){
					let stdData = res[i];
					stdStr +=`<tr>
								<td>\${stdData.stdNo}</td>
								<td>\${stdData.stdNm}</td>
								<td>\${stdData.stdTelno}</td>
								<td>\${stdData.deptNm}</td>
								<td>
									<input type="checkbox" name="stdCk" class="form-check-input stdCk" id="checkbox\${i}" value="\${stdData.stdNm}">
								</td>
							  </tr>`;
				}
				stdTBody.html(stdStr);
			}
		});
	}
	
	function insertMsgText(text){
		console.log(text);
		let msg = $('#msg');
		let msgStr = `한국대학교 에서 전해 드립니다. \n\${text.week} <\${text.sub}> 수업은 \${text.pro}교수님에 사정으로 인해 휴강되었습니다.`;
		msg.text(msgStr);
	}
	
	checkAll.on('click',function(){
		setTimeout(() => {
			if (checkAll.is(':checked')) {
		    	checkStd();
		  	}else{
				checkStd();
			}
		}, 300);
	});
	
	$(document).on('change', "input[name='stdCk']", function() {
		  checkStd();
		  if(noCheck()){
			  checkAll.prop('checked', false);
		  }
	});
	
	function checkStd(){
		var selectedCheckboxes = $(stdTBody).find("input[name='stdCk']:checked");
		
		var receiver = $('#receiver');
		receiver.text("");
		let receiverStr = "";
		let saveData = [];
	 	selectedCheckboxes.each(function() {
	 		let savaInfo = {
	 			stdNo:$(this).parents('tr').find('td').eq(0).text().trim(),
	 			stdTelNo:$(this).parents('tr').find('td').eq(2).text().trim()
	 		};
	 		saveData.push(savaInfo);
	      	var value = $(this).val();
	      	receiverStr += value + " ";
      		console.log(value);
	    });
	 	receiver.text(receiverStr);
	 	console.log("================")
	 	console.log("결과 => ",saveData);
	 	stdInfo = saveData;
	 	console.log("전송해야할 데이터들 => ",stdInfo);
	}
	
	function noCheck(){
		var selectedCheckboxes = $(stdTBody).find("input[name='stdCk']");
		var isNoCheck = false;
		selectedCheckboxes.each(function() {
			if ($(this).is(':checked')) {
				isNoCheck = true;
				return;
			}
	    });
		return isNoCheck;
	}
});
</script>