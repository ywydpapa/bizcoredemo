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
		var salesTable;
		var salesSearhing = false || ${first eq 'N'};
		var salesSCB = false;
		$(function(){
			var obj = new Object();
			salesTable = $('#salesTable').DataTable({
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
				sAjaxSource : "${path}/sales/list/data",
				sServerMethod : "POST",
				fnServerParams : function (data){
					if(salesSearhing || salesSCB) {
						data.push({"name": "userNo", "value": $("#userNo").val()});							// 담당자
					} else {
						data.push({"name": "userNo", "value": ""});
					}
					data.push({"name":"soppNo", "value" : $("#soppNo").val()});
					data.push({"name":"custNo", "value" : $("#custNo").val()});
					data.push({"name":"salesType", "value" : $("#salesType option:selected").val()});
					if($("#targetDatefrom").val() != "" && $("#targetDateto").val() != ""){
						data.push({"name":"salesFrdatetime", "value" : $("#salesFrdatetime").val()});
						data.push({"name":"salesTodatetime", "value" : $("#salesTodatetime").val()});
					} else {
						data.push({"name":"salesFrdatetime", "value" : ""});
						data.push({"name":"salesTodatetime", "value" : ""});
					}
					if($("#regSDate").val() != "" && $("#regEDate").val() != ""){
						data.push({"name":"regSDate", "value" : $("#regSDate").val()});
						data.push({"name":"regEDate", "value" : $("#regEDate").val()});
					} else {
						data.push({"name":"regSDate", "value" : ""});
						data.push({"name":"regEDate", "value" : ""});
					}
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
						data: "regDatetime",
						column : '등록일',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return data.split(" ")[0];
							}
						},
					},
					{
						data: "salesTitle",
						column : '영업활동명',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<a href="javascript:fnSetPageEx(\''+row.salesNo+'\')" title="'+data+'">'+data+'</a>';
							}
						},
					},
					{
						data: "salesFrdatetime",
						column : '영업활동(시작)',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return data.split(" ")[0];
							}
						},
					},
					{
						data: "salesTodatetime",
						column : '영업활동(끝)',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return data.split(" ")[0];
							}
						},
					},
					{
						data: "soppTitle",
						column : '영업기회명',
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
						column : '담당사원',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return data;
							}
						},
					},
					{
						data: "custName",
						column : '매출처',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<span title="'+data+'">'+data+'</span>';
							}
						},
					},
					{
						data: "ptncName",
						column : '엔드유저',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<span title="'+data+'">'+data+'</span>';
							}
						},
					},
					/*{
						data: "salesTypeN",
						column : '활동형태',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return data;
							}
						},
					},*/
					{
						data: "salesDesc",
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

			$('#salesTable_filter input').unbind();
			$('#salesTable_filter input').bind('keyup', function (e){
				if(e.keyCode == 13){
					salesTable.search(this.value).draw();
				}
			});

			salesTable.on('draw', function () {
				setTimeout(fnDrawAfterCss, 10);
			});
		});

		function fnDrawAfterCss() {
			$("#salesTable").css("width","");
		}

		function fnListcon() {
			salesSCB = true;
			salesTable.search("").draw();
		}
	</script>
	<style>
		a {
			text-decoration:underline;
		}
		#salesTable > tbody > tr > td:nth-child(2){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
		#salesTable > tbody > tr > td:nth-child(5){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
		#salesTable > tbody > tr > td:nth-child(7){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
		#salesTable > tbody > tr > td:nth-child(8){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
		#salesTable > tbody > tr > td:nth-child(9){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
	</style>

	<c:if test="${preserveSearchCondition != 'Y'}">
		<!-- Page-header start 페이지 타이틀-->
		<div class="page-header2">
			<div class="row align-items-end">
				<div class="col-lg-12">
					<div class="page-header-title">
						<div class="d-inline">
							영업활동 조회
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
		<!--영업활동조회-->
		<div class="cnt_wr">
			<div class="row">
				<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
					<div class="col-sm-12">
						<div class="card_box sch_it">
							<div class="btn_wr text-right">
								<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
								<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>	
		      					<button class="btn btn-sm btn-outline"onClick="javascript:location='${path}/sales/write.do'"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
							</div>
							<div class="form-group row">
							<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="userName">담당사원</label>
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
							</div>
							<div class="col-sm-12 col-xl-3">
									<label class="col-form-label" for="soppTitle">영업기회</label>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="soppTitle"
											id="soppTitle" value="" readonly /> <input
											type="hidden" name="soppNo" id="soppNo"
											value="" /> <span class="input-group-btn">
											<button class="btn btn-primary sch-company"
												data-remote="${path}/modal/popup.do?popId=sopp"
												type="button" data-toggle="modal"
												data-target="#soppModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="soppModal" tabindex="-1"
											role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title">영업기회 검색</h4>
														<button type="button" class="close"
															data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>영업기회 목록</h5>
														<p>Loading!!!</p>
													</div>
													<div class="modal-footer">
														<button type="button"
															class="btn btn-default waves-effect "
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label" for="custName">매출처</label>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="custName"
												id="custName" value="" readonly /> <input
												type="hidden" name="custNo" id="custNo"
												value="" /> <span class="input-group-btn">
												<button class="btn btn-primary sch-company"
													data-remote="${path}/modal/popup.do?popId=cust"
													type="button" data-toggle="modal"
													data-target="#custModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="custModal" tabindex="-1"
												role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">매출처검색</h4>
															<button type="button" class="close"
																data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>매출처목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button"
																class="btn btn-default waves-effect "
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label" for="co_name">활동형태</label>
									<select name="select" class="form-control form-control-sm" id="salesType">
										<option value>선택</option>
										<c:forEach var = "acttype" items="${acttype}">
											<option value="${acttype.codeNo}">${acttype.desc03}</option>
										</c:forEach>
									</select>
								</div>
								
							</div>
							<div class="form-group row">
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">활동일</label>
									<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="salesFrdatetime" onChange="javascript:inputDate($('#salesFrdatetime').val(), $('#salesTodatetime').val(), this)"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="salesTodatetime" onChange="javascript:inputDate($('#salesFrdatetime').val(), $('#salesTodatetime').val(), this)">
									</p>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">등록일</label>
									<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="regSDate" onChange="javascript:inputDate($('#regSDate').val(), $('#regEDate').val(), this)"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="regEDate" onChange="javascript:inputDate($('#regSDate').val(), $('#regEDate').val(),this)">
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
					<table id="salesTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="4%"/>
								<col width="20%"/>
								<col width="4%"/>
								<col width="4%"/>
								<col width="20%"/>
								<col width="2%"/>
								<col width="15%"/>
								<col width="15%"/>
								<col width="12%"/>
							</colgroup>
							<thead>
								<tr>
									<%--<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>--%>
									<th>등록일</th>
									<th>영업활동명</th>
									<th>영업활동(시작)</th>
									<th>영업활동(끝)</th>
									<th>영업기회명</th>
									<th>담당사원</th>
									<th>매출처</th>
									<th>엔드유저</th>
									<th>일정설명</th>
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

		function fnSetPageEx(data){
			var url = "${path}/sales/detail/"+data;
			history.pushState(null, null, url);
			location.replace(url);
		}
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>