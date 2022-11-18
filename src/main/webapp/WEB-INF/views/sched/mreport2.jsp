<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<style>
.table {

}
.table1 td{
	border:0;
}

.table1 tr > td:not(:first-child){
	border-top:1px solid #e9ecef;
}

.table2 td{
	border:0;
}

.table2 tr > td:not(:first-child){
	border-top:1px solid #e9ecef;
}
</style>
<table class="table table-bordered printdivTable" style="page-break-after: always;margin:0 auto;white-space:normal;table-layout:fixed;word-break:break-word;width:90% !important; font-size:0.8em !important;">
	<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
		</colgroup>
	<tr>
	<h3 style="text-align:center; font-size:16px;">주간 업무 보고(차주)</h3>
	</tr>
	<c:forEach var="ritem" items="${rlist}" varStatus="stvar">
		<c:set var="itemUser" value="${ritem.userName}" />
	</c:forEach>
	<tr>
	<th class="thWeek" colspan="3"  style="text-align:center;"></th>
	<th class="thUname" style="text-align:center;">담당 : ${itemUser}</th>
	</tr>
	<tr>
	<td class="colorTd" colspan="2" style="text-align:center;background-color:yellow;width:50%">이번주 진행사항</td>
	<td class="colorTd" colspan="2" style="text-align:center;background-color:yellow;width:50%">다음주 예정사항</td>
	</tr>
	<tr>
	<td colspan="2">
		<table class="table table-bordered table1" style="table-layout:fixed;word-break:break-word;margin:auto;">
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		<c:forEach var="ritem" items="${rlist}" varStatus="stvar">
		<c:if test="${ritem.weektype eq 't' && ritem.schedCheck eq '1'}">
		<tr>
			<td class="first1 text-center" style="vertical-align:middle;"><c:if test="${ritem.weekdays eq 1}">일</c:if><c:if test="${ritem.weekdays eq 2}">월</c:if><c:if test="${ritem.weekdays eq 3}">화</c:if><c:if test="${ritem.weekdays eq 4}">수</c:if><c:if test="${ritem.weekdays eq 5}">목</c:if><c:if test="${ritem.weekdays eq 6}">금</c:if><c:if test="${ritem.weekdays eq 7}">토</c:if></td>
			<td class="chktd1 text-left" style="white-space:normal;word-break:break-all;"><b>${ritem.title}</b><br/>
			${fn:replace(ritem.schedDesc, replaceChar, "<br/>") }
			<input type="checkbox" style="display:none" class="sr1chk form-control-sm" checked></td>
		</tr>
		</c:if>
		</c:forEach>
		</table>
		<c:if test="${addtxt.prCheck eq '1' }">
			<div class="praddtxt1">
			<hr>
			<h6>추가 기재 사항</h6>
			<hr>
			<div style="white-space:normal;word-break:break-all">${fn:replace(addtxt.prComment, replaceChar, "<br/>") }</div>
			</div>
		</c:if>
	</td>
	<td colspan="2">
		<table class="table table-bordered table2" style="table-layout:fixed;word-break:break-all;">
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		<c:forEach var="ritem" items="${rlist}" varStatus="stvar">
		<c:if test="${ritem.weektype eq 'n' && ritem.schedCheck eq '1'}">
		<tr>
			<td class="first2 text-center" style="vertical-align:middle;"><c:if test="${ritem.weekdays eq 1}">일</c:if><c:if test="${ritem.weekdays eq 2}">월</c:if><c:if test="${ritem.weekdays eq 3}">화</c:if><c:if test="${ritem.weekdays eq 4}">수</c:if><c:if test="${ritem.weekdays eq 5}">목</c:if><c:if test="${ritem.weekdays eq 6}">금</c:if><c:if test="${ritem.weekdays eq 7}">토</c:if></td>
			<td class="chktd2 text-left" style="white-space:normal;word-break:break-all"><b>${ritem.title}</b><br/>
			${fn:replace(ritem.schedDesc, replaceChar, "<br/>") }
			<input type="checkbox" style="display:none" class="sr2chk form-control-sm" checked></td>
		</tr>
		</c:if>
		</c:forEach>
		</table>
		<c:if test="${addtxt.thCheck eq '1' }">
			<div class="thaddtxt1">
			<hr>
			<h6>추가 기재 사항</h6>
			<hr>
			<div style="white-space:normal;word-break:break-all">${fn:replace(addtxt.thComment, replaceChar, "<br/>") }</div>
			</div>							
		</c:if>
	</td>
	</tr>
</table>
<script>
function formatDate(date) {
    var mymonth = date.getMonth()+1;
    var myweekday = date.getDate();
    return (mymonth + "/" + myweekday);
}

function printWeek() {
    var now = new Date();
    var nowDayOfWeek = now.getDay();
    var nowDay = now.getDate()+7;
    var nowMonth = now.getMonth();
    var nowYear = now.getYear();
    nowYear += (nowYear < 2000) ? 1900 : 0;
    var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + 1);
    var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek - 1));
    var thisweek = formatDate(weekStartDate) + " ~ " + formatDate(weekEndDate);
    $(".thWeek").html("일자 :" + thisweek);
    var unam = "${userName}";
    console.log(unam);
    /* $(".thUname").html("담당:" + unam); */
    $("#printdiv").attr("style", "display:none");
}

$(".praddchk").change(function(){
	if($(".praddchk").is(":checked")==true){
		$(".praddtxt1").show();
	} else{
		$(".praddtxt1").hide();
	}
});

$(".thaddchk").change(function(){
	if($(".thaddchk").is(":checked")==true){
		$(".thaddtxt1").show();
	} else{
		$(".thaddtxt1").hide();
	}
});

function linecopy(){
	var aa = $("#praddtext").val(); 
	$("#prprntext").html(aa);
	var bb = $("#thaddtext").val();
	$("#thprntext").html(bb);
}

$("#praddtext,#thaddtext").change(function(){
	linecopy();
});

$(document).ready(function() {
	printWeek();
});
</script>
