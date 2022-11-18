<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top4.jsp"/>

<div id="main_content">
	<script>
	$(function(){
		$('#ioTable').DataTable({
			info:false,
			searching: true,
			order: [[ 0, "desc" ]],
		});
	});
	</script>
	<style>
		a {
			text-decoration:underline;
		}
		#ioTable > tbody > tr > td:nth-child(4){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 220px;
			white-space: nowrap;
		}
		#ioTable > tbody > tr > td:nth-child(5){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 220px;
			white-space: nowrap;
		}
		.reduce_width {
			width: 70%;
		}
		
	</style>
	<c:if test="${preserveSearchCondition != 'Y'}">
		<!-- Page-header start 페이지 타이틀-->
		<div class="page-header2">
			<div class="row align-items-end">
				<div class="col-lg-12">
					<div class="page-header-title" style="float:left;">
						<div style="margin-top:15px;">
							<h6 style="font-weight:600;">매입매출자료 목록</h6>
						</div>
					</div>
					<div class="btn_wr" style="float:right;">
						<!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold"
							onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2"
							onclick="acordian_action1()" style="display: none;">접기</button>
						<!-- hide and show -->
						<button class="btn btn-sm btn-danger" onClick="javascript:location='${path}/cont/iolistall.do'"><i class="icofont icofont-pencil-alt-2"></i>개별목록 확인</button>
						<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
						<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search" id="search"></i>검색</button>
						<button class="btn btn-sm btn-outline" onClick="javascript:location='${path}/cont/iowrite.do/0'"><i class="icofont icofont-pencil-alt-2"></i>자료등록</button>
					</div>
				</div>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
		
		<!--계약조회-->
		<div class="cnt_wr" id="acordian" style="display:none;">
			<div class="row">
				<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
					<div class="col-sm-12">
						<div class="card_box sch_it">
							<div class="form-group row" style="clear:both;">
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label">거래처</label>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="custName" id="custName" value="${param.custName}" readonly />
										<input type="hidden" name="custNo" id="custNo" value="${param.custNo}" />
										<span class="input-group-btn">
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
														<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label" for="userName">담당사원</label>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="userName"
											id="userName" readonly /> <input type="hidden"
											name="userNo" id="userNo" /> <span
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
														<h4 class="modal-title">담당사원</h4>
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
							</div>
						</div>
					</div>
					</form>
				</div>
			</div>
		</c:if>
	<!--//계약조회-->
	 	 <!--리스트 table-->
	<div class="cnt_wr" id="list-container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="ioTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="5%"/>
								<col width="25%"/>
								<col width="10%"/>
								<col width="15%"/>
								<col width="15%"/>
								<col width="15%"/>
								<col width="15%"/>
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">영업기회일자</th>
									<th class="text-center">영업기회명</th>
									<th class="text-center">거래처</th>
									<th class="text-center">매입합계</th>
									<th class="text-center">매출합계</th>
									<th class="text-center">차액</th>
									<th class="text-center">적요</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${listsum}">
								<tr>
									<td class="text-center">${fn:substring(row.regDatetime,0,10)}</td>
									<td>
										<a href="${path}/cont/iodetail/${row.soppNo}">${row.soppTitle}</a>
									</td>
									<td class="text-center">${row.custName}</td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.amount}" /></td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.take}" /></td>
									<td class="text-right" id="absSum"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.take-row.amount}" /></td>
									<td></td>
								</tr>
							</c:forEach>								
							</tbody>
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
	$("#ioTable tbody tr").find("#absSum").each(function(index, item){
		var absValue = $(item).html().replace(/[\D\s\._\-]+/g, "");
		var absSum = 0;
		
		if(absValue < 0){
			absSum = absValue * -1;
		}else{
			absSum = absValue;
		}
		
		$(item).html(Number(absSum).toLocaleString("en-US"));
	});
	
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
	$('#endCustModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});

	function fnSetUserData(a, b) {
		localStorage.setItem("userName", b);
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
	function fnSetEndCustData(a, b) {
		$("#endCustNo").val(b);
		$("#endCustName").val(a);
		$(".modal-backdrop").remove();
		$("#endCustModal").modal("hide");
	}

	function fnListcon() {
		var ioData = {};
		ioData.custNo = $("#custNo").val() ? Number($("#custNo").val()) : 0;
		ioData.userName = $("#userName").val() ? $("#userName").val() : null;
		var param = "?";
		var paramFirst = true;
		for (variable in ioData) {
			console.log("key: " + variable + ", value: " + ioData[variable]);
			if(ioData[variable] != null && ioData[variable] != 0) {
				if(paramFirst){
					param = param + variable + "=" + ioData[variable];
					paramFirst = false;
				} else {
					param = param + "&" + variable + "=" + ioData[variable];
				}
			}
		}

		if(param == "?"){
			param = "";
		}
		
		localStorage.setItem("custNo", ioData.custNo);
		localStorage.setItem("custName", $("#custName").val());
		localStorage.setItem("userName", ioData.userName);

		if(document.querySelector('#acordian').style.cssText == "display: none;"){
			var testAco1 = document.querySelector('#acordian').style.cssText;
			localStorage.setItem('lastAco1', testAco1);	
		}else {
			var testAco2 = document.querySelector('#acordian').style.cssText;
			localStorage.setItem('lastAco2', testAco2);
		}
		
		var url = '${path}/mis/iolist.do'+param;
		location.href = url;
	}
	
	$("input[type='text']").keyup(function(e){
		if(e.keyCode == 13){
			$("#search").click();
		}
	});

	$(document).ready(function() {
		if(window.location.search.toString().startsWith('?')){
			if('${param.userName}' == ''){
				$("#userName").val("");
			} else {
				$("#userName").val(localStorage.getItem("userName"));
			}
			
			if('${param.custNo}' == ''){
				$("#custNo").val("");
				$("#custName").val("");
			} else {
				$("#custNo").val(localStorage.getItem("custNo"));
				$("#custName").val(localStorage.getItem("custName"));
			}
		} /* else {
			var userName = '${sessionScope.userName}';
			$("#userName").val(userName);
		} */
		var lastAco1 = localStorage.getItem('lastAco1');
		var lastAco2 = localStorage.getItem('lastAco2');
		if(lastAco1 == null && lastAco2 != null) {
			 $("#acordian").css("display", "block");
		}
		localStorage.clear();
	});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>
