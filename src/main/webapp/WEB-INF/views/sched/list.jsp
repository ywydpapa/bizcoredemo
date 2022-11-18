<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
	<script>
		var schedTable;
		var schedSearhing = false || ${first eq 'N'};
		var schedSCB = false;
		$(function(){
			var obj = new Object();
			schedTable = $('#schedTable').DataTable({
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
				sAjaxSource : "${path}/sched/list/data",
				sServerMethod : "POST",
				fnServerParams : function (data){
					if(schedSearhing || schedSCB){
						data.push({"name":"userNo", "value" : $("#userNo").val()});
					} else {
						data.push({"name":"userNo", "value" : ""});
					}
					data.push({"name":"soppNo", "value" : $("#soppNo").val()});
					data.push({"name":"custNo", "value" : $("#custNo").val()});
					data.push({"name":"contNo", "value" : $("#contNo").val()});
					data.push({"name":"schedType", "value" : $("#schedType").val()});
					data.push({"name":"schedCat", "value" : $("#schedCat option:selected").val()});
					//data.push({"name":"userName", "value" : $("#userName").val()});
					if($("#schedFrom").val() != "" && $("#schedTo").val() != ""){
						data.push({"name":"schedFrom", "value" : $("#schedFrom").val()});
						data.push({"name":"schedTo", "value" : $("#schedTo").val()});
					} else {
						data.push({"name":"schedFrom", "value" : ""});
						data.push({"name":"schedTo", "value" : ""});
					}
					if($("#regSDate").val() != "" && $("#regEDate").val() != ""){
						data.push({"name":"regSDate", "value" : $("#regSDate").val()});
						data.push({"name":"regEDate", "value" : $("#regEDate").val()});
					} else {
						data.push({"name":"regSDate", "value" : ""});
						data.push({"name":"regEDate", "value" : ""});
					}
					data.push({"name":"columns","value":this.columns});
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
					},
					{
						targets : 1,
						orderable: false
					}
				],	// ajax로 데이터가 날아오면서 list를 뿌려주는데 각 컬럼에서 만약 값이 없으면 오류대처
				columns : [
					{
						data: "regDatetime",
						column: '등록일',
						render : function (data, type, row) {
							return data.split(" ")[0];
						}
					},
					{data: "schedTypeN", column : '일정구분'},
					{
						data: "schedTitle",
						column : '일정제목',
						render : function ( data, type, row) {
							return '<a href="javascript:fnSetDetailLink(\''+row.schedTypeN+'\','+row.schedNo+')" title="'+data+'">'+data+'</a>';
						}
					},
					{data: "schedFrom", column : '일정'},
					{
						data: "custName",
						column : '고객사',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<span title="'+data+'">'+data+'</span>';
							}
						},
					},
					{
						data: "userName",
						column : '담당자',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return data;
							}
						},
					},
					{
						data: "schedPlace",
						column : '장소',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<span title="'+data+'">'+data+'</span>';
							}
						},
					},
					{
						data: "schedCatN",
						column : '활동형태',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return data;
							}
						},
					},
					{
						data: "schedDesc",
						column : '일정설명',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<span title="'+data+'">'+data+'</span>';
							}
						},
					}
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

			$('#schedTable_filter input').unbind();
			$('#schedTable_filter input').bind('keyup', function (e){
				if(e.keyCode == 13){
					schedTable.search(this.value).draw();
				}
			});

			schedTable.on( 'draw', function () {
				setTimeout(fnDrawAfterCss, 10);
			});
		});

		function fnDrawAfterCss() {
			$("#schedTable").css("width","");
		}

		function fnListcon() {
			schedSCB = true;
			schedTable.search("").draw();
		}
	</script>
	<style>
		a {
			text-decoration:underline;
		}
		#schedTable > tbody > tr > td:nth-child(3){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 250px;
			white-space: nowrap;
		}
		#schedTable > tbody > tr > td:nth-child(5){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 160px;
			white-space: nowrap;
		}
		#schedTable > tbody > tr > td:nth-child(7){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 230px;
			white-space: nowrap;
		}
		#schedTable > tbody > tr > td:nth-child(9){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 340px;
			white-space: nowrap;
		}
	</style>

		<c:if test="${preserveSearchCondition != 'Y'}">
			<div class="page-header2">
				<div class="row align-items-end">
					<div class="col-lg-12">
						<div class="page-header-title" style="float:left;">
							<div style="margin-top:15px;">
								<h6 style="font-weight:600;">일정조회</h6>
							</div>
						</div>
						<div class="btn_wr text-right" style="float:right;">
						<!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold"
							onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2"
							onclick="acordian_action1()" style="display: none;">접기</button>
						<!-- hide and show -->
						<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall(this);">
								<i class="icofont icofont-spinner-alt-3"></i>초기화
							</button>
							<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()">
								<i class="icofont icofont-search"></i>검색
							</button>
							<button class="btn btn-sm btn-outline"
								onClick="javascript:location='${path}/sched/write.do'">
								<i class="icofont icofont-pencil-alt-2"></i>등록
							</button>
						</div>
					</div>
				</div>
			</div>
			<!--Page-header end 페이지 타이틀 -->
			<!--일정조회-->
		<div class="cnt_wr"  id="acordian" style="display:none;">
			<div class="row">
				<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
					<div class="card_box sch_it">
						<div class="form-group row">
							<div class="col-sm-12 col-xl-2">
								<label class="col-form-label" for="userName">담당사원</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="userName" id="userName" list="userName_list" onchange="dataListChange(this);" autocomplete="off"> 
									<datalist id="userName_list">
										<c:forEach var="list" items="${sessionScope.listUser}">
											<option data-value="${list.userNo}" value="${list.userName}">${list.userName}</option>
										</c:forEach>
									</datalist>
									<input type="hidden" name="userNo" id="userNo" value="" /> 
									<%-- <span class="input-group-btn">
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
									</div> --%>
								</div>
							</div>
							<div class="col-sm-12 col-xl-2">
								<label class="col-form-label" for="soppTitle">영업기회</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="soppTitle" id="soppTitle"  list="soppTitle_list" onchange="dataListChange(this);" autocomplete="off"> 
									<datalist id="soppTitle_list">
										<c:forEach var="list" items="${sessionScope.listSopp}">
											<option data-value="${list.soppNo}" value="${list.soppTitle}">${list.soppTitle}</option>
										</c:forEach>
									</datalist>
									<input type="hidden" name="soppNo" id="soppNo" value="" /> 
									<%-- <span class="input-group-btn">
										<button class="btn btn-primary sch-company"
											data-remote="${path}/modal/popup.do?popId=sopp" type="button"
											data-toggle="modal" data-target="#soppModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="soppModal" tabindex="-1"
										role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title">영업기회 검색</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>영업기회 목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect "
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div> --%>
								</div>
							</div>
							<div class="col-sm-12 col-xl-2">
								<label class="col-form-label" for="custName">매출처</label>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="custName" id="custName" list="custName_list" onchange="dataListChange(this);" autocomplete="off">
									<datalist id="custName_list">
										<c:forEach var="list" items="${sessionScope.listCust}">
											<option data-value="${list.custNo}" value="${list.custName}">${list.custName}</option>
										</c:forEach>
									</datalist>
									<input type="hidden" name="custNo" id="custNo" value="" />
									<%-- <span class="input-group-btn">
										<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=cust" type="button" data-toggle="modal" data-target="#custModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="custModal" tabindex="-1"
										role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title">매출처검색</h4>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>매출처목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div> --%>
								</div>
							</div>
								<!-- 계약관련 일치되는 데이터가 일정상에 존재할수 없음. -->
								<div class="col-sm-12 col-xl-2" style="display:none;">
									<label class="col-form-label" for="custmemberName">계약</label>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="contTitle"
											id="contTitle" value="" readonly /> <input type="hidden"
											name="contNo" id="contNo" value="" /> <span
											class="input-group-btn">
											<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=cont" type="button" data-toggle="modal" data-target="#contModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="contModal" tabindex="-1"
											role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title"></h4>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>계약목록</h5>
														<p>Loading!!!</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 계약관련 일치되는 데이터가 일정상에 존재할수 없음. -->
							<div class="col-sm-1">
								<label class="col-form-label" for="co_name">일정구분</label>
								<select name="select" class="form-control form-control-sm" id="schedType">
									<option value>선택</option>
									<c:forEach var ="listschedcat" items="${listSchdType}">
										<option value = "${listschedcat.codeNo}">${listschedcat.desc03}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-1">
								<label class="col-form-label" for="co_name">활동형태</label>
								<select	name="select" class="form-control form-control-sm" id="schedCat">
									<option value>선택</option>
									<c:forEach var ="listschedcat" items="${listschedcat}">
										<option value = "${listschedcat.codeNo}">${listschedcat.desc03}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-12 col-xl-3">
								<label class="col-form-label" for="co_name">일정시작일</label>
								<p class="input_inline">
									<input class="form-control form-control-sm col-xl-6" type="date" id="schedFrom"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="schedTo">
								</p>
							</div>
							<div class="col-sm-12 col-xl-3 ex_reduce">
								<label class="col-form-label">등록일</label>
								<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="regSDate"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="regEDate">
								</p>
							</div>
						</div>
					</div>
				</div>
				</form>
				<div class="col-sm-12">
			</div>
		</div>
		</c:if>
		<!-- Page-header start 페이지 타이틀-->
	<!--일정조회-->
	<!--회원리스트 table-->
	<div class="cnt_wr" id="list-container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="schedTable" class="table table-striped table-bordered nowrap">
							<colgroup>
								<col width="2%">
								<col width="2%">
								<col width="15%">
								<col width="3%">
								<col width="8%">
								<col width="2%">
								<col width="13%">
								<col width="2%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th>등록일</th>
									<th>일정구분</th>
									<th>일정제목</th>
									<th>일정</th>
									<th>고객사</th>
									<th>담당자</th>
									<th>장소</th>
									<th>활동형태</th>
									<th>일정설명</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//table-->
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
		$("#schedFrom").change(function(){
			var dateValue = $(this).val();
			var dateValueArr = dateValue.split("-");
			var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
			var EdateValue = $("#schedTo").val();
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
			
			if(day < 10){
				day = "0" + day;
			}
			
			$("#schedTo").val(year + "-" + month + "-" + day);
		});
		
		$("#schedTo").change(function(){
			var SdateValue = $("#schedFrom").val();
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
			
			$("#schedFrom").val(year + "-" + month + "-" + day);
		});
		
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
		
		$('#custModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#userModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#soppModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#custmemberModal').on('show.bs.modal', function(e) {
			var custNo = $("#custNo").val();
			var url = '${path}/modal/popup.do?popId=custmem&compNo=' + custNo;
			$("#custmemberModalbtn").data("remote",url);
			
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#contModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});

	 	function fnSetCustData(a, b) {
			$("#custNo").val(b);
			$("#custName").val(a);
			$(".modal-backdrop").remove();
			$("#custModal").modal("hide");
		}
    	function fnSetUserData(a, b) {
			$("#userName").val(b);
			$("#userNo").val(a);
			$(".modal-backdrop").remove();
			$("#userModal").modal("hide");
		}
    	function fnSetSoppData(a, b) {
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		}
    	function fnSetCustmereData(a, b) {
    		$("#custmemberNo").val(a);
    		$("#custmemberName").val(b);
    		$(".modal-backdrop").remove();
    		$("#custmemberModal").modal("hide");
    	}
    	function fnSetContData(a, b) {
			$("#contNo").val(b);
			$("#contTitle").val(a);
			$(".modal-backdrop").remove();
			$("#contModal").modal("hide");
		}

    	function fnSetDetailLink(schedTypeN, schedNo) {
    		var typePath;
   
    		if(schedTypeN == '영업일정') {
    			typePath = 'sales'; 			
    		}else if(schedTypeN == '기술지원') {
    			typePath = 'techd';
    		}else if(schedTypeN == '기타일정') {
    			typePath = 'sched';
    		}
			var url = '${path}/' + typePath + '/detail/' + schedNo;

			history.pushState(null, null, url);
			location.replace(url);
    	}

    	// 클리어 버튼 누를시 이 페이지 특화 스크립트
    	function fnClearallExt(){
	 		// console.log("click")
			schedSCB = false;
		}
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>