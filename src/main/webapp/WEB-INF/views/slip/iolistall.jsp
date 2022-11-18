<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top3.jsp"/>

<div id="main_content">
	<script>
	$(function(){
		$('#contTable').DataTable({
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
		#contTable > tbody > tr > td:nth-child(4){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 220px;
			white-space: nowrap;
		}
		#contTable > tbody > tr > td:nth-child(5){
			overflow: hidden;
			text-overflow: ellipsis;
			max-width: 220px;
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
							매입매출자료 목록
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
		
		<!--계약조회-->
		<div class="cnt_wr">
			<div class="row">
					<div class="col-sm-12">
						<div class="card_box sch_it">
							<div>
								<div class="btn_wr" style="float:left">
									<button class="btn btn-sm btn-outline" onClick="javascript:location='${path}/cont/iolist.do'"><i class="icofont icofont-pencil-alt-2"></i>합계목록 확인</button>
								</div>
								<div class="btn_wr" style="float:right" >
									<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
									<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search" id="search"></i>검색</button>
									<button class="btn btn-sm btn-outline" onClick="javascript:location='${path}/cont/iowrite.do'"><i class="icofont icofont-pencil-alt-2"></i>자료등록</button>
								</div>
							</div>
							<div class="form-group row" style="clear:both;">
								<div class="col-sm-12 col-xl-3">
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
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">매입/매출 구분</label>
									<select name="select" class="form-control form-control-sm" id="cntrctMth">
										<option value="">선택</option>
										<option value="1101">매입</option>
										<option value="1102">매출</option>
									</select>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">계산서 발행일자</label>
									<p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="freemaintSdate"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="freemaintEdate">
									</p>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">담당자</label>
									<input type="text" class="form-control form-control-sm" id="userName" name="" placeholder="">
								</div>
							</div>
						</div>
					</div>
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
						<table id="contTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="10%"/>
								<col width="10%"/>
								<col width="10%"/>
								<col width="15%"/>
								<col width="15%"/>
								<col width="20%"/>
								<col width="20%"/>
							</colgroup>							
							<thead>
								<tr>
									<th class="text-center">구분</th>
									<th class="text-center">영업기회명</th>
									<th class="text-center">거래처</th>
									<th class="text-center">공급금액</th>
									<th class="text-center">부가세액</th>
									<th class="text-center">합계금액</th>
									<th class="text-center">적요</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${listall}">
								<tr>
									<td class="text-center">
									<c:if test="${row.dataType eq '1101'}">매입</c:if>
									<c:if test="${row.dataType eq '1102'}">매출</c:if>
									</td>
									<td>
										<a href="${path}/cont/iodetail/${row.soppNo}">${row.soppTitle}</a>
									</td>
									<td>${row.custName}</td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.dataAmt}" /></td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.dataVat}" /></td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.dataTotal}" /></td>
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
	
	$("#targetDatefrom").change(function(){
		var dateValue = $(this).val();
		var dateValueArr = dateValue.split("-");
		var dateValueCom = new Date(dateValueArr[0], dateValueArr[1], dateValueArr[2]);
		var EdateValue = $("#targetDateto").val();
		var EdateDateArr = EdateValue.split("-");
		var EdateDateCom = new Date(EdateDateArr[0], EdateDateArr[1], EdateDateArr[2]);
		
		if(EdateValue == ""){
			dateValueCom.setDate(dateValueCom.getDate()+1);
		}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
			alert("시작일이 종료일보다 클 수 없습니다.");
			dateValueCom.setDate(dateValueCom.getDate()+1);
		}else{
			return null;
		}
		
		var year = dateValueCom.getFullYear();
		var month = dateValueCom.getMonth();
		var day = dateValueCom.getDate();
		
		if(day < 10){
			day = "0" + day;
		}
		
		$("#targetDateto").val(year + "-" + month + "-" + day);
	});
	
	$("#targetDateto").change(function(){
		var SdateValue = $("#targetDatefrom").val();
		var SdateValueArr = SdateValue.split("-");
		var SdateValueCom = new Date(SdateValueArr[0], SdateValueArr[1], SdateValueArr[2]);
		var thisDateValue = $(this).val();
		var thisDateArr = thisDateValue.split("-");
		var thisDateCom = new Date(thisDateArr[0], thisDateArr[1], thisDateArr[2]);
		
		if(SdateValue == ""){
			thisDateCom.setDate(thisDateCom.getDate()-1);
		}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
			alert("종료일이 시작일보다 작을 수 없습니다.");
			thisDateCom.setDate(thisDateCom.getDate()-1);
		}else{
			return null;
		}
		
		var year = thisDateCom.getFullYear();
		var month = thisDateCom.getMonth();
		var day = thisDateCom.getDate();
		
		if(day < 10){
			day = "0" + day;
		}
		
		$("#targetDatefrom").val(year + "-" + month + "-" + day);
	});
	
	$("#freemaintSdate").change(function(){
		var dateValue = $(this).val();
		var dateValueArr = dateValue.split("-");
		var dateValueCom = new Date(dateValueArr[0], dateValueArr[1], dateValueArr[2]);
		var EdateValue = $("#freemaintEdate").val();
		var EdateDateArr = EdateValue.split("-");
		var EdateDateCom = new Date(EdateDateArr[0], EdateDateArr[1], EdateDateArr[2]);
		
		if(EdateValue == ""){
			dateValueCom.setDate(dateValueCom.getDate()+1);
		}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
			alert("시작일이 종료일보다 클 수 없습니다.");
			dateValueCom.setDate(dateValueCom.getDate()+1);
		}else{
			return null;
		}
		
		var year = dateValueCom.getFullYear();
		var month = dateValueCom.getMonth();
		var day = dateValueCom.getDate();
		
		if(day < 10){
			day = "0" + day;
		}
		
		$("#freemaintEdate").val(year + "-" + month + "-" + day);
	});
	
	$("#freemaintEdate").change(function(){
		var SdateValue = $("#freemaintSdate").val();
		var SdateValueArr = SdateValue.split("-");
		var SdateValueCom = new Date(SdateValueArr[0], SdateValueArr[1], SdateValueArr[2]);
		var thisDateValue = $(this).val();
		var thisDateArr = thisDateValue.split("-");
		var thisDateCom = new Date(thisDateArr[0], thisDateArr[1], thisDateArr[2]);
		
		if(SdateValue == ""){
			thisDateCom.setDate(thisDateCom.getDate()-1);
		}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
			alert("종료일이 시작일보다 작을 수 없습니다.");
			thisDateCom.setDate(thisDateCom.getDate()-1);
		}else{
			return null;
		}
		
		var year = thisDateCom.getFullYear();
		var month = thisDateCom.getMonth();
		var day = thisDateCom.getDate();
		
		if(day < 10){
			day = "0" + day;
		}
		
		$("#freemaintSdate").val(year + "-" + month + "-" + day);
		$("#freemaintEdate").val(year + "-" + month + "-" + day);
	});
	
	$("#regSDate").change(function(){
		var dateValue = $(this).val();
		var dateValueArr = dateValue.split("-");
		var dateValueCom = new Date(dateValueArr[0], dateValueArr[1], dateValueArr[2]);
		var EdateValue = $("#regEDate").val();
		var EdateDateArr = EdateValue.split("-");
		var EdateDateCom = new Date(EdateDateArr[0], EdateDateArr[1], EdateDateArr[2]);
		
		if(EdateValue == ""){
			dateValueCom.setDate(dateValueCom.getDate()+1);
		}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
			alert("시작일이 종료일보다 클 수 없습니다.");
			dateValueCom.setDate(dateValueCom.getDate()+1);
		}else{
			return null;
		}
		
		var year = dateValueCom.getFullYear();
		var month = dateValueCom.getMonth();
		var day = dateValueCom.getDate();
		
		if(day < 10){
			day = "0" + day;
		}
		
		$("#regEDate").val(year + "-" + month + "-" + day);
	});
	
	$("#regEDate").change(function(){
		var SdateValue = $("#regSDate").val();
		var SdateValueArr = SdateValue.split("-");
		var SdateValueCom = new Date(SdateValueArr[0], SdateValueArr[1], SdateValueArr[2]);
		var thisDateValue = $(this).val();
		var thisDateArr = thisDateValue.split("-");
		var thisDateCom = new Date(thisDateArr[0], thisDateArr[1], thisDateArr[2]);
		
		if(SdateValue == ""){
			thisDateCom.setDate(thisDateCom.getDate()-1);
		}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
			alert("종료일이 시작일보다 작을 수 없습니다.");
			thisDateCom.setDate(thisDateCom.getDate()-1);
		}else{
			return null;
		}
		
		var year = thisDateCom.getFullYear();
		var month = thisDateCom.getMonth();
		var day = thisDateCom.getDate();
		
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
	$('#endCustModal').on('show.bs.modal', function(e) {
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
	function fnSetEndCustData(a, b) {
		$("#endCustNo").val(b);
		$("#endCustName").val(a);
		$(".modal-backdrop").remove();
		$("#endCustModal").modal("hide");
	}
	function fnListcon() {
		var contData = {};
		contData.userName = $('#userName').val();
		contData.cntrctMth = $('#cntrctMth').val();
		contData.freemaintSdate = $('#freemaintSdate').val();
		contData.freemaintEdate = $('#freemaintEdate').val();
		contData.userNo = $("#userNo").val() ? Number($("#userNo").val()) : 0;
		contData.salesCustNo = $("#custNo").val() ? Number($("#custNo").val()) : 0;
		contData.vatDatefrom = $("#vatSdate").val() ? $("#vatSdate").val() : null;
		contData.vatDateto = $("#vatEdate").val() ? $("#vatEdate").val() : null;
		contData.dataType = $("#ioType").val() ? $("#ioType").val() : null;
		var param = "?";
		var paramFirst = true;
		for (variable in contData) {
			console.log("key: " + variable + ", value: " + contData[variable]);
			if(contData[variable] != null && contData[variable] != 0) {
				if(paramFirst){
					param = param + variable + "=" + contData[variable];
					paramFirst = false;
				} else {
					param = param + "&" + variable + "=" + contData[variable];
				}
			}
		}

		if(param == "?"){
			param = "";
		}

		var url = '${path}/cont/iolistall.do'+param;
		location.href = url;
	}
	
	$("input[type='text']").keyup(function(e){
		if(e.keyCode == 13){
			$("#search").click();
		}
	});

	$(document).ready(function() {
		var targetDatefrom = '${param.targetDatefrom}';
		var targetDateto = '${param.targetDateto}';
		var freemaintSdate = '${param.freemaintSdate}';
		var freemaintEdate = '${param.freemaintEdate}';
		var regSDate = '${param.regSDate}';
		var regEDate = '${param.regEDate}';

		if(targetDatefrom != '') $("#targetDatefrom").val(targetDatefrom);
		if(targetDateto != '') $("#targetDateto").val(targetDateto);
		if(freemaintSdate != '') $("#freemaintSdate").val(freemaintSdate);
		if(freemaintEdate != '') $("#freemaintEdate").val(freemaintEdate);
		if(regSDate != '') $("#regSDate").val(regSDate);
		if(regEDate != '') $("#regEDate").val(regEDate);

		if(window.location.search.toString().startsWith('?')){
			if('${param.userName}' == ''){
				$("#userName").val("");
			} else {
				var userName = '${param.userName}';
				$("#userName").val(userName);
			}
		} /* else {
			var userName = '${sessionScope.userName}';
			$("#userName").val(userName);
		} */
	});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>
