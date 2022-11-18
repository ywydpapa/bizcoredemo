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
		var techdTable;
		var techdSearhing = false || ${first eq 'N'};
		var techdSCB = false;
		$(function(){
			var obj = new Object();
			techdTable = $('#techdTable').DataTable({
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
				sAjaxSource : "${path}/techd/list/data",
				sServerMethod : "POST",
				fnServerParams : function (data){
					if(techdSearhing || techdSCB) {
						data.push({"name": "userNo", "value": $("#userNo").val()});
					} else {
						data.push({"name": "userNo", "value" : ""});
					}
					data.push({"name":"custNo", "value" : $("#custNo").val()});
					data.push({"name":"custmemberNo", "value" : $("#custmemberNo").val()});
					data.push({"name":"techdSteps", "value" : $("#techdSteps option:selected").val()});
					data.push({"name":"cntrctMth", "value": $("#cntrctMth option:selected").val()});
					if($("#targetDatefrom").val() != "" && $("#targetDateto").val() != ""){
						data.push({"name":"targetDatefrom", "value" : $("#targetDatefrom").val()});
						data.push({"name":"targetDateto", "value" : $("#targetDateto").val()});
					} else {
						data.push({"name":"targetDatefrom", "value" : ""});
						data.push({"name":"targetDateto", "value" : ""});
					}
					if($("#regSDate").val() != "" && $("#regEDate").val() != ""){
						data.push({"name":"regSDate", "value" : $("#regSDate").val()});
						data.push({"name":"regEDate", "value" : $("#regEDate").val()});
					} else {
						data.push({"name":"regSDate", "value" : ""});
						data.push({"name":"regEDate", "value" : ""});
					}
					data.push({"name":"techdDesc","value":$("#techdDesc").val()});
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
						targets : 0,
						orderable: false
					}
				],	// ajax로 데이터가 날아오면서 list를 뿌려주는데 각 컬럼에서 만약 값이 없으면 오류대처
				columns : [
					{
						data: "regdatetime",
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
						column : '등록구분',
						render : function (data, type, row) {
							if(row.cntrctMth == 10247) return '신규 영업지원';
							if(row.cntrctMth == 10248) return '유지보수';
							return '-';
						}
					},
					{
						data: "techdTitle",
						column : '요청명',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<a href="javascript:fnSetPageEx(\''+row.techdNo+'\')" title="'+data+'">'+data+'</a>';
							}
						},
					},
					{
						data: "techdDesc",
						column : '기술지원 요청내용',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<span title="'+data+'">'+data+'</span>';
							}
						},
					},
					{
						data: "custName",
						column : '엔드유저',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return '<span title="'+data+'">'+data+'</span>';
							}
						},
					},
					{
						data: "techdStepsN",
						column : '접수단계',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return data;
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
						data: "techdFrom",
						column : '기술지원(시작)',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return data.split(" ")[0];
							}
						},
					},
					{
						data: "techdTo",
						column : '기술지원(끝)',
						render : function ( data, type, row ) {
							if(data == null || data == undefined) {
								return '';
							} else {
								return data.split(" ")[0];
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

			$('#techdTable_filter input').unbind();
			$('#techdTable_filter input').bind('keyup', function (e){
				if(e.keyCode == 13){
					techdTable.search(this.value).draw();
				}
			});

			techdTable.on('draw', function () {
				setTimeout(fnDrawAfterCss, 10);
			});

		});

		function fnDrawAfterCss() {
			$("#techdTable").css("width","");
		}

		function fnListcon() {
			techdSCB = true;
			techdTable.search("").draw();
		}
	</script>
	<style>
		a {
			text-decoration:underline;
		}
		#techdTable > tbody > tr > td:nth-child(2){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 300px;
			white-space: nowrap;
		}
		#techdTable > tbody > tr > td:nth-child(3){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 200px;
			white-space: nowrap;
		}
		#techdTable > tbody > tr > td:nth-child(4){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 100px;
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
								기술지원 조회
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Page-header end 페이지 타이틀 -->


			<!--기술지원 대상조회-->
			<div class="cnt_wr">
				<div class="row">
					<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
						<div class="col-sm-12">
							<div class="card_box sch_it">
								<div class="btn_wr text-right">
									<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
									<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>
									<button class="btn btn-sm btn-outline"onClick="javascript:location='${path}/techd/write.do'"><i class="icofont icofont-pencil-alt-2"></i>등록</button>

								</div>
								<div class="form-group row">
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label" for="userName">담당사원</label>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="userName" id="userName" value="${sessionScope.userName}" readonly />
											<input type="hidden" name="userNo" id="userNo" value="${sessionScope.userNo}" />
											<span class="input-group-btn">
												<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=user" type="button" data-toggle="modal" data-target="#userModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="userModal" tabindex="-1"
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
															<h5>사용자목록</h5>
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
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label" for="custName">엔드유저</label>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="custName" id="custName" value="" readonly />
											<input type="hidden" name="custNo" id="custNo" value="" />
											<span class="input-group-btn">
												<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=cust" type="button" data-toggle="modal" data-target="#custModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="custModal" tabindex="-1"
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
															<h5>거래처목록</h5>
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
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label" for="custmemberName">엔드유저 담당자</label>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="custmemberName" id="custmemberName" value="" readonly />
											<input type="hidden" name="custmemberNo" id="custmemberNo" value="" />
											<span class="input-group-btn">
												<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=custmem&compNo=" type="button" data-toggle="modal" data-target="#custmemberModal" id="custmemberModalbtn">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="custmemberModal" tabindex="-1" role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title"></h4>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>고객목록</h5>
															<p>거래처를 먼저 입력해주셔야 목록이 보입니다.</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-1.5">
										<label class="col-form-label" for="co_name">진행단계</label>
										<select name="select" class="form-control form-control-sm" id="techdSteps">
											<option value>선택</option>
											<c:forEach var ="techdSteps" items="${techdSteps}">
												<option value = "${techdSteps.codeNo}">${techdSteps.desc03}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-1.5" style="margin-left: 20px;">
										<label class="col-form-label" for="co_name">등록구분</label>
										<select name="select" class="form-control form-control-sm" id="cntrctMth">
											<option value>선택</option>
											<c:forEach var ="contractType" items="${contractType}">
												<option value = "${contractType.codeNo}">${contractType.desc03}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label">일정시작일</label>
										<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="targetDatefrom" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val(),this)"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="targetDateto" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val(),this)">
										</p>
									</div>
									<div class="col-sm-12 col-xl-3">
										<label class="col-form-label">등록일</label>
										<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="regSDate" onChange="javascript:inputDate($('#regSDate').val(), $('#regEDate').val(),this)"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="regEDate" onChange="javascript:inputDate($('#regSDate').val(), $('#regEDate').val(),this)">
										</p>
									</div>
									<div class="col-sm-12 col-xl-6">
										<label class="col-form-label">기술지원요청내용</label>
										<input type="text" class="form-control form-control-sm" id="techdDesc" name="" placeholder="" onsubmit="return false">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--//기술지원 대상조회-->
		</c:if>

		 <!--리스트 table-->
		<div class="cnt_wr" id="list-container">
			<div class="row">
				<div class="col-sm-12">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table id="techdTable" class="table table-striped table-bordered nowrap">
								<%--<colgroup>
									<col width="1%"/>
									<col width="7%"/>
									<col width="30%"/>
									<col width="24%"/>
									<col width="15%"/>
									<col width="8%"/>
									<col width="5%"/>
									<col width="10%"/>
								</colgroup>	--%>
								<thead>
									<tr>
										<%--<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>--%>
										<th>등록일</th>
										<th>등록구분</th>
										<th>요청명</th>
										<th>기술지원요청내용</th>
										<th>매출처</th>
										<th>진행단계</th>
										<th>담당사원</th>
										<th>기술지원(시작)</th>
										<th>기술지원(끝)</th>
									</tr>
								</thead>
								<%--<tbody>
									<c:forEach var="row" items="${list}">
									<tr>
										<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
										<td>
											<c:if test="${row.soppNo != 0}">신규 영업지원</c:if>
											<c:if test="${row.contNo != 0}">유지보수</c:if>
										</td>
										<td><a href="javascript:fnSetPage('${path}/techd/detail/${row.techdNo}')">${row.techdTitle}</a></td>
										<td>${row.techdDesc}</td>
										<td>${row.custName}</td>
										<td>${row.techdStepsN}</td>
										<td>${row.userName}</td>
										<td>
											<fmt:parseDate value="${row.techdFrom}" var="techdFrom" pattern="yyyy-MM-dd HH:mm:ss"/>
											<fmt:formatDate value="${techdFrom}" pattern="yyyy-MM-dd"/>
										</td>
									</tr>
									</c:forEach>
								</tbody>--%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--//리스트 table-->


	<script>
		$('#userModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#custModal').on('show.bs.modal', function(e) {
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
		function fnSetUserData(a, b) {
			$("#userName").val(b);
			$("#userNo").val(a);
			$(".modal-backdrop").remove();
			$("#userModal").modal("hide");
		}
		function fnSetCustData(a, b) {
			$("#custNo").val(b);
			$("#custName").val(a);
			$(".modal-backdrop").remove();
			$("#custModal").modal("hide");
		}
		function fnSetCustmereData(a, b) {
			$("#custmemberNo").val(a);
			$("#custmemberName").val(b);
			$(".modal-backdrop").remove();
			$("#custmemberModal").modal("hide");
		}

		function fnSetPageEx(data){
			var url = "${path}/techd/detail/"+data;
			// var obj = {};
			// obj.userNo = $("#userNo").val();
			// obj.userName = $("#userName").val();
			// obj.custNo = $("#custNo").val();
			// obj.custName = $("#custName").val();
			// obj.custmemberNo = $("#custmemberNo").val();
			// obj.custmemberName = $("#custmemberName").val();
			// obj.targetDatefrom = $("#targetDatefrom").val();
			// obj.targetDateto = $("#targetDateto").val();
			// obj.regSDate = $("#regSDate").val();
			// obj.regEDate = $("#regEDate").val();
			// obj.techdDesc = $("#techdDesc").val();
			// obj.search = $("#techdTable_filter").find("input[type=search]").val();
			// var parm = '?';
			// var first = true;
			// for(var key in obj){
			// 	if(first){
			// 		parm = parm + key + "=" + obj[key];
			// 		first = false;
			// 	} else {
			// 		parm = parm + "&" + key + "=" + obj[key];
			// 	}
			// }
			// var temp = url + parm;
			history.pushState(null, null, url);
			location.replace(url);
		}

		// 기술지원요청내용 엔터키 누를경우 원치않는 행동발생하여 이벤트 방지 코드 추가
		$('#techdDesc').keydown(function(event) {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
		})
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>