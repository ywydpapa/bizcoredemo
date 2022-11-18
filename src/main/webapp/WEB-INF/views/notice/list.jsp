<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>
<div id="main_content">
	<script>
		var noticeTable;
		var noticeSearhing = false || ${first eq 'N'};
		var noticeSCB = false;
		$(function(){
			var obj = new Object();
			noticeTable = $('#noticeTable').DataTable({
				order: [[ 0, "desc" ]],
				paging : true, // 페이지 처리 여부
				ordering : true, // 컬럼 클릭 시 오더링을 적용 여부
				// info : true, // 페이지 상태에 대한 정보 여부
				filter : true, // 검색창 여부
				// lengthChange : true, // 블록 단위 변경 기능 여부
				// stateSave : false,
				pageLength: 20, // 한 페이지에 기본으로 보열줄 항목 수
				pagingType : "full_numbers",
				bPaginate: true,
				bLengthChange: true,
				lengthMenu: [[20, 40, 60, 80, 100], [20, 40, 60, 80, 100]], // 리스트 항목을 구성할 옵션들
				bProcessing: true,
				bServerSide: true,
				sAjaxSource : "${path}/notice/list/data",
				sServerMethod : "POST",
				fnServerParams : function (data){
					console.log(data);
					if(noticeSearhing || noticeSCB) {
						data.push({"name": "userNo", "value": $("#userNo").val()});							// 담당자
					} else {
						data.push({"name": "userNo", "value": ""});
					}
					
					if($("#regSDate").val() != "" && $("#regEDate").val() != ""){
						data.push({"name":"regSDate", "value" : $("#regSDate").val()});
						data.push({"name":"regEDate", "value" : $("#regEDate").val()});
					} else {
						data.push({"name":"regSDate", "value" : ""});
						data.push({"name":"regEDate", "value" : ""});
					}
					
					data.push({"name": "notiTitle", "value": $("#notiTitle").val()});
					data.push({"name": "notiContents", "value": $("#notiContents").val()});
				},
				// TODO 아래 주석은 서버로 부터 성공시 data 확인하는 용도
				/*
				fnServerData: function ( sSource, aoData, fnCallback, oSettings ) {
					oSettings.jqXHR = $.ajax({
						"dataType": 'json',
						"type": "POST",
						"url": sSource,
						"data": aoData,
						"success": function (data) {
							console.dir(data);
							return data.aaData;
						}
					});
				},
				*/
				columnDefs :[
					{
						defaultContent : "-",
						targets : "_all"
					}
				],	// ajax로 데이터가 날아오면서 list를 뿌려주는데 각 컬럼에서 만약 값이 없으면 오류대처
				columns : [
					{
						data: "row_num",
						column : '번호',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<span title="'+data+'">'+data+'</span>';
							}
						},
					},
					{
						data: "notiTitle",
						column : '제목',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<a href="javascript:fnSetPageEx(\''+row.notiNo+'\')">'+data+'</a>';
							}
						},
					},
					{
						data: "userName",
						column : '작성자',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<span title="'+data+'">'+data+'</span>';
							}
						},
					},
					{
						data: "regDatetime",
						column : '등록일',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<span class="yyyyMMddConvert">'+data+'</span>';
							}
						},
					},
				],
				oLanguage: {
					sZeroRecords : "일치하는 데이터가 존재하지 않습니다.",
					sInfo : "현재 _START_ - _END_ / _TOTAL_건",
					slengthMenu: "페이지당 _MENU_ 개씩 보기",
					sInfoEmpty: "데이터 없음",
					sInfoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
					sSearch : "내부검색 : ",
					sProcessing : '데이터 불러오는중...',
					oPaginate: {
						sFirst : '처음으로',
						sLast : '마지막으로',
						sPrevious: "이전",
						sNext: "다음"
					}
				},
				// docs : https://legacy.datatables.net/usage/i18n

			});

			$('#noticeTable_filter input').unbind();
			$('#noticeTable_filter input').bind('keyup', function (e){
				if(e.keyCode == 13){
					noticeTable.search(this.value).draw();
				}
			});

			noticeTable.on('draw', function () {
				setTimeout(fnDrawAfterCss, 10);
				
				var elementArrDay = $(".yyyyMMddConvert");
				for(var i=0; i<elementArrDay.length; i++){
					var temp = elementArrDay[i].innerText;
					elementArrDay[i].innerText = temp.split(" ")[0];
				}
			});
		});

		function fnDrawAfterCss() {
			$("#noticeTable").css("width","");
		}

		function fnListcon() {
			noticeSCB = true;
			noticeTable.search("").draw();
		}
	</script>
	<style>
		a {
			text-decoration:underline;
		}
		#noticeTable > tbody > tr > td:nth-child(2){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
		#noticeTable > tbody > tr > td:nth-child(5){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
		#noticeTable > tbody > tr > td:nth-child(7){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
		#noticeTable > tbody > tr > td:nth-child(8){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
		#noticeTable > tbody > tr > td:nth-child(9){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
	</style>

	<c:if test="${preserveSearchCondition != 'Y'}">
		<div class="page-header2">
			<div class="row align-items-end">
				<div class="col-lg-12">
					<div class="page-header-title" style="float:left;">
						<div style="margin-top:15px;">
							<h6 style="font-weight:600;">공지사항 조회</h6>
						</div>
					</div>
					<div class="btn_wr" style="float:right;">
						<!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold"
							onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2"
							onclick="acordian_action1()" style="display: none;">접기</button>
						<!-- hide and show -->
						<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
						<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()" id="search"><i class="icofont icofont-search"></i>검색</button>	
      					<button class="btn btn-sm btn-outline"onClick="javascript:location='${path}/notice/write.do'"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
					</div>
				</div>
			</div>
		</div>
		<div class="cnt_wr" id="acordian" style="display:none;">
			<div class="row">
				<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
				<div class="col-sm-12">
					<div class="card_box sch_it">
						<div class="form-group row">
							<%-- <div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="userName">작성자</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="userName"
										id="userName" value="${sessionScope.userName}" readonly /> <input type="hidden"
										name="userNo" id="userNo" value="${sessionScope.userNo}" /> <span
										class="input-group-btn">
										<button class="btn btn-primary sch-company"
											data-remote="${path}/modal/popup.do?popId=user" type="button"
											data-toggle="modal" data-target="#userModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="userModal" tabindex="-1"
										role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title"></h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>사용자목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect "
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> --%>
							<%-- <div class="col-sm-12 col-xl-3">
								<label class="col-form-label" for="userName">작성자</label>
								<input type="text" class="form-control form-control-sm" name="userName"
										id="userName"/> <input type="hidden"
										name="userNo" id="userNo" value="${sessionScope.userNo}" />
							</div> --%>
							<div class="col-sm-12 col-xl-2">
								<label class="col-form-label">제목</label>
								<input type="text" class="form-control form-control-sm" id="notiTitle" name="" placeholder="" value="${param.notiTitle}">
							</div>
							<div class="col-sm-12 col-xl-2">
								<label class="col-form-label">내용</label>
								<input type="text" class="form-control form-control-sm" id="notiContents" name="" placeholder="" value="${param.notiContents}">
							</div>
							<div class="col-sm-12 col-xl-3">
								<label class="col-form-label">등록일</label>
								<p class="input_inline">
									<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="regSDate"> ~ <input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="regEDate">
								</p>
							</div>
						</div>	
					</div>
				</div>
				</form>
			</div>
		</div>
		<!--//영업활동조회-->
	
	</c:if>

	 <!--리스트 table-->
	<div class="cnt_wr" id="list-container">
		<div class="row">
			<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table id="noticeTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="10%"/>
								<col width="60%"/>
								<col width="20%"/>
								<col width="10%"/>
							</colgroup>
							<thead>
								<tr>
									<%--<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>--%>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<%--<th>일정설명</th>--%>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//리스트 table-->
	<script>
	function acordian_action(){
		if($("#acordian").css("display") == "none"){
		    $("#acordian").show();
		    $("#fold").hide();
		    $("#fold2").show();

		} else {
		    $("#acordian").hide();
		    $("#fold").show();
		}
	}
	function acordian_action1(){
		if($("#acordian").css("display") != "none"){
		    $("#acordian").hide();
		    $("#fold").show();
		    $("#fold2").hide();

		} else {
		    $("#acordian").show();
		    $("#fold").hide();
		}
	}
</script>
	<script>
		$("#regSDate").change(function(){
			var dateValue = $(this).val();
			var dateValueArr = dateValue.split("-");
			var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
			var EdateValue = $("#regEDate").val();
			var EdateDateArr = EdateValue.split("-");
			var EdateDateCom = new Date(EdateDateArr[0], parseInt(EdateDateArr[1])-1, EdateDateArr[2]);
			
			
			if(EdateValue == ""){
				dateValueCom.setDate(dateValueCom.getDate()+1);
			}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
				alert("시작일이 종료일보다 클 수 없습니다.");
				dateValueCom.setDate(dateValueCom.getDate()+1);
			}else{
				return null;
			}
			
			var year = dateValueCom.getFullYear();
			var month = dateValueCom.getMonth()+1;
			var day = dateValueCom.getDate();
			
			if(month < 10){
				month = "0" + month;
			}
			
			console.log(month);
			if(day < 10){
				day = "0" + day;
			}
			
			$("#regEDate").val(year + "-" + month + "-" + day);
		});
		
		$("#regEDate").change(function(){
			var SdateValue = $("#regSDate").val();
			var SdateValueArr = SdateValue.split("-");
			var SdateValueCom = new Date(SdateValueArr[0], parseInt(SdateValueArr[1])-1, SdateValueArr[2]);
			var thisDateValue = $(this).val();
			var thisDateArr = thisDateValue.split("-");
			var thisDateCom = new Date(thisDateArr[0], parseInt(thisDateArr[1])-1, thisDateArr[2]);
			
			if(SdateValue == ""){
				thisDateCom.setDate(thisDateCom.getDate()-1);
			}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
				alert("종료일이 시작일보다 작을 수 없습니다.");
				thisDateCom.setDate(thisDateCom.getDate()-1);
			}else{
				return null;
			}
			
			var year = thisDateCom.getFullYear();
			var month = thisDateCom.getMonth()+1;
			var day = thisDateCom.getDate();
			
			if(month < 10){
				month = "0" + month;
			}
			
			if(day < 10){
				day = "0" + day;
			}
			
			$("#regSDate").val(year + "-" + month + "-" + day);
		});
		
		$("input[type='text']").keyup(function(e){
			if(e.keyCode == 13){
				$("#search").click();
			}
		});

		$('#userModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});

		function fnSetPageEx(data){
			var url = "${path}/notice/detail/"+data;
			history.pushState(null, null, url);
			location.replace(url);
		}
		
		function fnSetUserData(a, b) {
			$("#userNo").val(a);
			$("#userName").val(b);
			$("#userModal").modal("hide");
		}
		function fnClearallExt(){
			schedSCB = false;
		}
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>
</body>
</html>

<style>
	#noticeTable_filter {
		display:none;
	}
</style>