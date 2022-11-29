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
	<div id="loadHtml"></div>
		<div style="width:100%;">
			<div style="float:left; margin-top:15px;">
				<h6 style="font-weight:600;">업무일지 조회</h6>
			</div>
			<div style="float:right;">
				<a href="${path}/sched/listMreport2.do" class="btn btn-primary" style="margin-right:5px;">업무일지(차주)</a>
				<button class="btn btn-primary" onclick="print_pdf()" style="margin-right:5px;">일괄다운로드(PDF)</button>
				<button type="button" class="btn btn-secondary" id="solPdf_btn" data-id="0" style="margin-right:5px;" disabled="disabled">PDF로 받기</button>
				<button type="button" class="btn btn-secondary" id="print_btn" data-id="0" disabled="disabled">출력</button>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
		<!--일정조회-->
		<div class="cnt_wr" id="list-container" style="border-top:1px solid #000;position:absolute; width:100%; top:60px;">
		<div class="row" style="margin-top:20px;">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive" width="100%;">
						<div style="float:left; width:10%;">
						<c:set var="length" value="${fn:length(mlist)}" />
						<table id="soppTable" class="table table-striped table-bordered nowrap">
							<colgroup>
								<col width="5%">
								<col width="5%">
							</colgroup>
							<thead>
							<tr>
								<th class="text-center">성명</th>
								<th class="text-center">선택</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${mlist}">
								<c:if test="${not empty row.sreportNo}">
									<tr>
										<td class="text-center">
											<script>
												function printTable(sreportNo, userNo){
													var obj = $("#loadHtml").append("<div id='loadHtml_"+sreportNo+"' style='margin-top:10px;'></div>");
													
													$("#loadHtml_"+sreportNo).load('${path}/sched/detailMreport/'+sreportNo+'?userNo='+userNo);
												}
												printTable(${row.sreportNo}, ${row.userNo});
											</script>
											<a href="javascript:titleClick(${row.sreportNo})" id="title_btn" data-id="0">${row.userName}</a>
										</td>
										<td class="text-center">
										<input type="checkbox" class="pdfcheck" onClick="checkClick(${row.sreportNo})" id="pdfchecked_${row.sreportNo}" checked>
										</td>
									</tr>
								</c:if>
							</c:forEach>
							</tbody>
						</table>
						</div>
						<div id="priviewTable" style="float:right;width:89%;">
							<table id="soppTable" class="table table-bordered">
								<thead>
								<tr>
									<th class="text-center">미리보기</th>
								</tr>
								</thead>
								<tbody style="background-color: #fff; overflow:scroll;">
									<tr>
										<td id="preview"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$("#loadHtml").hide();

function titleClick(id){
	$("#loadHtml_"+id).find(".table1 .first1").each(function() {
	  	var rows = $("#loadHtml_"+id).find(".table1 .first1:contains('" + $(this).text() + "')");
	  	
	  	if (rows.length > 1) {
	    	rows.eq(0).attr("rowspan", rows.length);
	    	rows.not(":eq(0)").remove();
	  	}
    	rows.eq(0).attr("style", "border-right:1px solid #e9ecef; border-bottom:1px solid #e9ecef;vertical-align:middle;");
	});
	
	$("#loadHtml_"+id).find(".table2 .first2").each(function() {
	  	var rows = $("#loadHtml_"+id).find(".table2 .first2:contains('" + $(this).text() + "')");
	  	
	  	if (rows.length > 1) {
	    	rows.eq(0).attr("rowspan", rows.length);
	    	rows.not(":eq(0)").remove();
	  	}
	  	
	  	rows.eq(0).attr("style", "border-right:1px solid #e9ecef; border-bottom:1px solid #e9ecef;vertical-align:middle;");
	});
	
	$("#preview").html($("#loadHtml_"+id).html());
	$("#title_btn").data("id", 1);
	$("#print_btn").data("id", id);
	$("#solPdf_btn").data("id", id);
	$("#print_btn").removeClass();
	$("#print_btn").attr("class", "btn btn-primary");
	$("#solPdf_btn").removeClass();
	$("#solPdf_btn").attr("class", "btn btn-primary");
	$("#print_btn").attr("disabled", false);
	$("#solPdf_btn").attr("disabled", false);
}

function checkClick(id){
	if ($("#pdfchecked_"+id).is(":checked") == true){
		$("#loadHtml_"+id).show();
	} else {
		$("#loadHtml_"+id).hide();
	}
}

$(document).ready(function(){
	$($("[id^=loadHtml_]").get().reverse()).each(function(index, item){
		var replaceNum = item.id.replace("loadHtml_", "");
		setTimeout(() => {
			titleClick(replaceNum);
		}, 1000);
	});	
});

$("#solPdf_btn").on("click", function(){
	solPdf($(this).data("id"));
});

$("#print_btn").on("click", function(){
	solPrint($(this).data("id"));
});

function solPdf(id){
	var now = new Date();
	var year = now.getFullYear();
	var month = parseInt(now.getMonth())+1;
	
	if(now.getDate() < 10){
		var date = "0" + now.getDate();
	}else{
		var date = now.getDate();
	}
	
	var nowDate = year + "-" + month + "-" + date;
	var element = document.getElementById("loadHtml_"+id);
	var name = $("#loadHtml_"+id).find("table .thUname").html().replace("담당 : ", "");
	
	$("#loadHtml_"+id).show();
	
	html2pdf().from(element).set({
	  margin: 5,
      filename: name + '(' + nowDate + ')' + '.pdf',
      html2canvas: { scale: 3 },
      jsPDF: {orientation: 'landscape', unit: 'mm', format: 'a4', compressPDF: true}
	}).save();
	
	setTimeout(() => {
		$("#loadHtml_"+id).hide();
	}, 100);
}

function solPrint(id){
	window.onbeforeprint = function(){
		//setSecondsr1();
		document.body.innerHTML = document.getElementById("loadHtml_" + id).innerHTML;
	}
	
	window.onafterprint = function(){
		location.href="${path}/sched/listMreport.do";
	}
	
	window.print();
	
	
}

function print_pdf(){
	$("#loadHtml").show();
	
	var element = document.getElementById("loadHtml");
	
	html2pdf().from(element).set({
	  margin: 5,
      filename: '주간업무일지.pdf',
      html2canvas: { scale: 3 },
      jsPDF: {orientation: 'landscape', unit: 'mm', format: 'a4', compressPDF: true}
	}).save();
	
	setTimeout(() => {
		$("#loadHtml").hide();
	}, 100);
}

function fnSetDetailReport(userNo, sreportNo) {
	var url = '${path}/sched/detailMreport/'+sreportNo+'?userNo='+userNo;
	console.log(url);
	history.pushState(null, null, url);
	location.replace(url);
}
</script>
<jsp:include page="../body-bottom.jsp"/>