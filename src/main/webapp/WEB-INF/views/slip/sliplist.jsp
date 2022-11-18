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

					<div class="page-header-title" style="float:left;">
						<div style="margin-top:15px;">
							<h6 style="font-weight:600;">등록 전표 목록</h6>
						</div>
					</div>
					
					<div class="btn_wr text-right">
						<!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold"
							onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2"
							onclick="acordian_action1()" style="display: none;">접기</button>
						<!-- hide and show -->
						<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
						<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search" id="search"></i>검색</button>
						<button class="btn btn-sm btn-outline" onClick="javascript:location='${path}/cont/slipwrite.do'"><i class="icofont icofont-pencil-alt-2"></i>전표등록</button>
					</div>
				</div>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
		
		<!--계약조회-->
		<div class="cnt_wr" id="acordian" style="display:none;">
			<div class="row">
					<div class="col-sm-12">
						<div class="card_box sch_it">
							<div class="form-group row">
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
							</div>
							<div class="form-group row">
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label">계정과목</label>
									<select name="select" class="form-control form-control-sm" id="cntrctMth">
										<option value="">선택</option>
									</select>
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">전표 작성일자</label>
									<div class="ms-selectable sales_date">
									<p class="input_inline">
										<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="targetDatefrom" > ~ <input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="targetDateto" >
									</div>
								</div>
								<div class="col-sm-12 col-xl-3 ex_reduce">
									<label class="col-form-label">전표 승인일자</label>
									<p class="input_inline">
										<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="freemaintSdate"> ~ <input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="freemaintEdate">
									</p>
								</div>
								
							</div>
							<div class="form-group row" style="margin-top: -17px;">
								<div class="col-sm-12 col-xl-2">
									<label class="col-form-label">담당자</label>
									<input type="text" class="form-control " id="searchuserName" name="" placeholder="">
								</div>
								<div class="col-sm-12 col-xl-2">
										<label class="col-form-label">적요</label>
									<input type="text" class="form-control " id="searchslipRemark" name="" placeholder="">
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
								<col width="10%"/>
								<col width="10%"/>
								<col width="25%"/>
								<col width="10%"/>
							</colgroup>							
							<thead>
								<tr>
									<th class="text-center">전표구분</th>
									<th class="text-center">등록일</th>
									<th class="text-center">승인일</th>
									<th class="text-center">계정과목</th>
									<th class="text-center">거래처</th>
									<th class="text-center">차변금액</th>
									<th class="text-center">대변금액</th>
									<th class="text-center">적요</th>
									<th class="text-center">상태</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${list}">
								<tr>
									<td></td>
									<td>
										<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>
									</td>
									<td>
										<fmt:formatDate value="${vatDatetime}" pattern="yyyy-MM-dd"/>
									</td>
									<td>${row.cntrctMthN}</td>
									<td>${row.custName}</td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.contAmt}" /></td>
									<td>${row.userName}</td>
									<td>${row.contOrddate}</td>
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
		if($("#cntrctMth").val() == "10126"){													// 계약방식
			contData.soppNo = 1;
			contData.exContNo = 0;
		} else if($("#cntrctMth").val() == "10127"){
			contData.soppNo = 0;
			contData.exContNo = 1;
		}
		contData.cntrctMth = $("#cntrctMth").val() ? Number($("#cntrctMth").val()) : 0;
		contData.custNo = $("#custNo").val() ? Number($("#custNo").val()) : 0;
		contData.custName = $("#custName").val() ? $("#custName").val() : 0;
		contData.buyrNo = $("#endCustNo").val() ? Number($("#endCustNo").val()) : 0;
		contData.buyrName = $("#endCustName").val() ? $("#endCustName").val() : 0;
		contData.contTitle = $("#contTitle").val() ? $("#contTitle").val() : null;
		contData.contType = $("#contType").val() ? $("#contType").val() : null;						// 판매방식
		contData.targetDatefrom = $("#targetDatefrom").val() ? $("#targetDatefrom").val() : null;
		contData.targetDateto = $("#targetDateto").val() ? $("#targetDateto").val() : null;
		contData.userName = $("#userName").val() ? $("#userName").val() : null;
		contData.freemaintSdate = $("#freemaintSdate").val() ? $("#freemaintSdate").val() : null;
		contData.freemaintEdate = $("#freemaintEdate").val() ? $("#freemaintEdate").val() : null;
		contData.regSDate = $("#regSDate").val() ? $("#regSDate").val() : null;
		contData.regEDate = $("#regEDate").val() ? $("#regEDate").val() : null;

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
		
		if(document.querySelector('#acordian').style.cssText == "display: none;"){
			var testAco1 = document.querySelector('#acordian').style.cssText;
			localStorage.setItem('lastAco1', testAco1);	
		}else {
			var testAco2 = document.querySelector('#acordian').style.cssText;
			localStorage.setItem('lastAco2', testAco2);
		}

		var url = '${path}/cont/sliplist.do'+param;
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
