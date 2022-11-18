<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/js/jquery.tablesorter.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/assets/css/bootstrap/css/bootstrap.min.css">

<style>
	table {
		table-layout: fixed;
		word-break: break-all;
	}
	
	table thead tr{
		line-height: 1%;
	}
	
	table tbody tr{
		line-height: 1%;
	}
</style>

<body>
	<div>
		<div style="text-align:center;">
			<h3>거래처 원장</h3>
		</div>
		<c:set var="balanceB" value="${custBalance.settleDRbalance}" scope="request"/>
		<input type="hidden" id="hideBalance" value="${balanceB}" />
		<%-- <div id="tableDiv" style="padding: 20px;">
			<c:set var="dateArray" value="${fn:split('01,02,03,04,05,06,07,08,09,10,11,12', ',')}" />
			<c:forEach var="dateValue" items="${dateArray}" varStatus="status">
				<c:choose>
					<c:when test="${dateValue < 10 }">
						<div style="border:1px solid #ccc;">${fn:substring(dateValue, 1, 2)}월</div>
					</c:when>
					<c:otherwise>
						<div style="border:1px solid #ccc;">${dateValue}월</div>
					</c:otherwise>
				</c:choose>
				<table id="vatTable_${dateValue}" class="table table-bordered">
					<colgroup>
                        <col width="10%"/>
                        <col width="60%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                    </colgroup>
					<thead>
						<tr>
							<th style="text-align:center;">일자</th>
							<th style="text-align:center;">적요</th>
							<th style="text-align:center;">차변</th>
							<th style="text-align:center;">대변</th>
							<th style="text-align:center;">잔액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="row" items="${ledgerList}">
							<c:set var="dateMonth" value="${fn:substring(row.baclogTime, 5, 7)}" />
							<c:if test="${(dateValue eq dateMonth)}">
								<c:set var="balanceB" value="${balanceB + row.receive_data}" scope="request"/>
								<tr id="divisionTrVat">
									<td style="text-align:center;">${fn:substring(row.baclogTime, 0, 10)}</td>
									<td style="text-align:center;">${row.vatProductName}</td>
									<td style="text-align:right;" id="totalTd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.receive_data}" /></td>
									<td style="text-align:right;" id="receiveTd"></td>
									<td style="text-align:right;" id="balanceTd"></td>
								</tr>
								<c:set var="calTotalReceive" value="${calTotalReceive + row.receive_data}" />
							</c:if>
						</c:forEach>
						<c:forEach var="row" items="${custVatList}" varStatus="status">
							<c:set var="dateMonth" value="${fn:substring(row.vatIssueDate, 5, 7)}" />
							<c:if test="${(dateValue eq dateMonth)}">
								<c:set var="balanceB" value="${balanceB - row.vatTotal}" scope="request"/>
								<tr id="divisionTrVat">
									<td style="text-align:center;">${row.vatIssueDate}</td>
									<td style="text-align:center;">${row.vatProductName}</td>
									<td style="text-align:right;" id="totalTd"></td>
									<td style="text-align:right;" id="receiveTd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.vatTotal}" /></td>
									<td style="text-align:right;" id="balanceTd"></td>	
								</tr>
								<c:set var="calTotal" value="${calTotal + row.vatTotal}" />
							</c:if>
						</c:forEach>
						<tr>
							<th colspan="2" style="text-align:center;">월 계</th>
							<th style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${calTotal}" /></th>
							<th style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${calTotalReceive}" /></th>
							<th></th>
						</tr>
						<c:remove var="calTotal"/>
						<c:remove var="calTotalReceive"/>
					</tbody>
				</table>
			</c:forEach>
		</div> --%>
		<div id="tableDiv" style="padding: 20px;">
			<table id="vatTable" class="table table-bordered">
				<colgroup>
                    <col width="10%"/>
                    <col width="60%"/>
                    <col width="10%"/>
                    <col width="10%"/>
                    <col width="10%"/>
                </colgroup>
				<thead>
					<tr>
						<th style="text-align:center;">일자</th>
						<th style="text-align:center;">적요</th>
						<th style="text-align:center;">차변</th>
						<th style="text-align:center;">대변</th>
						<th style="text-align:center;">잔액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${custVatList}" varStatus="status">
						<c:set var="dateMonth" value="${fn:substring(row.vatIssueDate, 5, 7)}" />
						<c:set var="balanceB" value="${balanceB - row.vatTotal}" scope="request"/>
						<c:choose>
							<c:when test="${row.detailId > 0}">
								<tr id="divisionTrVat">
									<td style="text-align:center;" id="vatIssueDate">${fn:substring(row.vatIssueDate, 0, 10)}</td>
									<td style="text-align:center;">${row.vatProductName}</td>
									<td style="text-align:right;" id="totalTd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.vatTotal}" /></td>
									<td style="text-align:right;" id="receiveTd"></td>
									<td style="text-align:right;" id="balanceTd"></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr id="divisionTrVat">
									<td style="text-align:center;" id="vatIssueDate">${fn:substring(row.vatIssueDate, 0, 10)}</td>
									<td style="text-align:center;">${row.vatProductName}</td>
									<td style="text-align:right;" id="totalTd"></td>
									<td style="text-align:right;" id="receiveTd"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.vatTotal}" /></td>
									<td style="text-align:right;" id="balanceTd"></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		var hideBalance = $("#hideBalance").val() ? $("#hideBalance").val() : 0;
		var temp = [];
		var calTotal = [0,0];
		var calYearTotal = [0,0];
		
		temp[0] = parseInt(hideBalance);
		
		$("#vatTable").each(function(index, item){
			if($(item).find("tbody #divisionTrVat").length == 0 && $(item).find("tbody #divisionTrLedger").length == 0){
				$(item).prev().remove();
				$(item).remove();
			}
		});
		
		$("#vatTable").tablesorter({
			sortList: [[0,0]]
		});
		
		$("#vatTable").trigger('destroy');
		
		setTimeout(() => {
			$("#vatTable tbody #divisionTrVat").each(function(index, item){
				if(index == 0){
					$(item).parents("tbody").prepend("<tr id='hiddenTr' style='background-color: #e9ecef;'><th></th><th style='text-align: center;'>전기이월</th></th><th><th style='text-align: right;'>"+parseInt(temp[0]).toLocaleString("en-US")+"</th><th style='text-align: right;'>"+parseInt(temp[0]).toLocaleString("en-US")+"</th></tr>");
				}
				
				var totalTd = isNaN(parseInt($(item).find("#totalTd").html().replaceAll(",", ""))) ? 0 : parseInt($(item).find("#totalTd").html().replaceAll(",", ""));
				var receiveTd = isNaN(parseInt($(item).find("#receiveTd").html().replaceAll(",", ""))) ? 0 : parseInt($(item).find("#receiveTd").html().replaceAll(",", ""));
				
				temp[0] = parseInt(temp[0]) - totalTd + receiveTd;
				calTotal[0] = isNaN(calTotal[0]) ? 0 : parseInt(calTotal[0]) + totalTd;
				calTotal[1] = isNaN(calTotal[1]) ? 0 : parseInt(calTotal[1]) + receiveTd;
				
				$(item).find("#balanceTd").html(parseInt(temp[0]).toLocaleString("en-US"));
				
				if(typeof $(item).next().find("#vatIssueDate").html() === "undefined"){
					var nextHtml = "00";
				}else{
					var nextHtml = $(item).next().find("#vatIssueDate").html().substring(5, 7);
				}
				
				if(typeof $(item).next().find("#vatIssueDate").html() === "undefined"){
					var nextYearHtml = "0000";
				}else{
					var nextYearHtml = $(item).next().find("#vatIssueDate").html().substring(0, 4);
				}
				
				if($(item).find("#vatIssueDate").html().substring(5, 7) !== nextHtml){
					$(item).after("<tr><th></th><th style='text-align: center;'>" + $(item).find("#vatIssueDate").html().substring(0, 4)+"년 " + $(item).find("#vatIssueDate").html().substring(5, 7).replaceAll(/^0/g, "") + "월 계</th><th id='totalTd' style='text-align: right;'>"+parseInt(calTotal[0]).toLocaleString("en-US")+"</th><th id='receiveTd' style='text-align: right;'>"+parseInt(calTotal[1]).toLocaleString("en-US")+"</th><th style='text-align: right;'>"+parseInt(temp[0]).toLocaleString("en-US")+"</th></tr>");
					$(item).next().attr("style", "background-color: #e9ecef;");
					calYearTotal[0] = calYearTotal[0] + calTotal[0];
					calYearTotal[1] = calYearTotal[1] + calTotal[1];
					calTotal[0] = 0;
					calTotal[1] = 0;
				}
				
				if($(item).find("#vatIssueDate").html().substring(0, 4) !== nextYearHtml){
					$(item).next().after("<tr><th></th><th style='text-align: center;'>" + $(item).find("#vatIssueDate").html().substring(0, 4)+"년 총 계" + "</th><th id='totalTd' style='text-align: right;'>"+parseInt(calYearTotal[0]).toLocaleString("en-US")+"</th><th id='receiveTd' style='text-align: right;'>"+parseInt(calYearTotal[1]).toLocaleString("en-US")+"</th><th style='text-align: right;'>"+parseInt(temp[0]).toLocaleString("en-US")+"</th></tr>");
					$(item).next().next().attr("style", "background-color: #e9ecef;");
					calYearTotal[0] = 0;
					calYearTotal[1] = 0;
				}
			});
		}, 100);
	});
</script>
</html>