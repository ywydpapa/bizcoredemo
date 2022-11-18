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
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>
<style>
    th{
        text-align:center;
    }
    .firstr1,.secondr1,.firstr2,.secondr2,.firstr3,.secondr3{
      text-align:center;
      vertical-align:middle; 
    }
    .chktd{
      text-align:center;
      vertical-align:middle;
    }
    td{
    white-space:normal;
    }
</style>
<style type="text/css" media="print">
  @page { size: landscape; }
</style>
<div id="main_content">
			<div class="page-header2">
				<div class="row align-items-end">
					<div class="col-lg-12">
						<table class="table table-sm bst02">
							<tbody>
								<tr>
									<td><h4>개인업무 일지</h4></td>
									<td align="right">
									<button class="btn btn-md btn-primary" onClick="fn_Create()">업무일지 생성(금주)</button>
									<button class="btn btn-md btn-primary" onClick="fn_Create2()">업무일지 생성(차주)</button>
									<button class="btn btn-md btn-primary" onClick="fn_Print()">업무일지 출력</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	<div class="cnt_wr" id="list-container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<div class="page-header-title">
							<div class="d-inline alert alert-success">
								지난주 업무 목록
							</div>
						</div>
						<table id="schedTable" class="table table-bordered" style="table-layout:fixed;word-break:break-word">
							<colgroup>
								<col width="5%">
								<col width="5%">
								<col width="25%">
								<col width="35%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr style="vertical-align:middle;text-align: center;">
									<th>주차</th>
									<th>요일</th>
									<th>일정제목</th>
									<th>일정내용</th>
									<th>일정시작</th>
									<th>일정종료</th>
									<th>업무일지반영(<a onclick="chkallr1();">V</a>/<a onclick="chkunr1();">X</a>)</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="ritem" items="${rlist}" varStatus="stvar">
							<c:if test="${ritem.weektype eq 'p'}">
							<tr>
								<td class="firstr1" style="vertical-align:middle;">${ritem.weekno}</td>
								<td class="secondr1" style="vertical-align:middle;"><c:if test="${ritem.weekdays eq 2}">월</c:if><c:if test="${ritem.weekdays eq 3}">화</c:if><c:if test="${ritem.weekdays eq 4}">수</c:if><c:if test="${ritem.weekdays eq 5}">목</c:if><c:if test="${ritem.weekdays eq 6}">금</c:if><c:if test="${ritem.weekdays eq 7}">토</c:if></td>
								<td style="vertical-align:middle;">
								<c:choose>
								<c:when test="${ritem.stype eq 'S'}"><a href="javascript:eventclk1(${ritem.id})">${ritem.title}</a></c:when>
								<c:when test="${ritem.stype eq 'T'}"><a href="javascript:eventclk2(${ritem.id})">${ritem.title}</a></c:when>
								<c:when test="${ritem.stype eq 'E'}"><a href="javascript:eventclk3(${ritem.id})">${ritem.title}</a></c:when>
								<c:otherwise>${ritem.title}</c:otherwise>
								</c:choose>
								</td>
								<td style='width:300;overflow:hidden;text-overflow;ellipsis;word-break:break-word'>${fn:replace(ritem.schedDesc, replaceChar, "<br/>") }</td>
								<td style="vertical-align:middle;">${ritem.start}</td>
								<td style="vertical-align:middle;">${ritem.end}</td>
								<c:choose>
									<c:when test="${ritem.schedCheck eq '1' }">
										<td class="chktd" style="vertical-align:middle;"><input type="checkbox" id="chk" data-id="${ritem.id }" data-check="1" data-name="checks" class="r1chk" checked></td>
									</c:when>
									<c:otherwise>
										<td class="chktd" style="vertical-align:middle;"><input type="checkbox" id="chk" data-id="${ritem.id }" data-check="0" data-name="checks" class="r1chk"></td>
									</c:otherwise>
								</c:choose>
							</tr>
							</c:if>
							</c:forEach>
							<tr>
							<td colspan="2" style="text-align:center;">추가기재</td>
							<td colspan=4>
								<textarea id="praddtext" class="form-control" cols="50" rows="5">${myadd2.thComment}</textarea>
							</td>
							<c:choose>
								<c:when test="${myadd2.prCheck eq '1' }">
									<td style="text-align:center;vertical-align:middle;"><input type="checkbox" data-id="${myadd2.sreportNo}" data-check="1" data-name="add" class="praddchk" checked></td>
								</c:when>
								<c:otherwise>
									<td style="text-align:center;vertical-align:middle;"><input type="checkbox" data-id="${myadd2.sreportNo}" data-check="0" data-name="add" class="praddchk"></td>
								</c:otherwise>
							</c:choose>
							</tr>
							</tbody>
						</table>
						<hr>
						<div class="page-header-title">
							<div class="d-inline alert alert-success">
								이번주 업무 목록
							</div>
						</div>
						<table id="schedTable" class="table table-bordered " style="table-layout:fixed;word-break:break-word">
							<colgroup>
								<col width="5%">
								<col width="5%">
								<col width="25%">
								<col width="35%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>주차</th>
									<th>요일</th>
									<th>일정제목</th>
									<th>일정내용</th>
									<th>일정시작</th>
									<th>일정종료</th>
									<th>업무일지반영(<a onclick="chkallr2();">V</a>/<a onclick="chkunr2();">X</a>)</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="ritem" items="${rlist}">
							<c:if test="${ritem.weektype eq 't'}">
							<tr>
								<td class="firstr2" style="vertical-align:middle;">${ritem.weekno}</td>
								<td class="secondr2" style="vertical-align:middle;"><c:if test="${ritem.weekdays eq 1}">일</c:if><c:if test="${ritem.weekdays eq 2}">월</c:if><c:if test="${ritem.weekdays eq 3}">화</c:if><c:if test="${ritem.weekdays eq 4}">수</c:if><c:if test="${ritem.weekdays eq 5}">목</c:if><c:if test="${ritem.weekdays eq 6}">금</c:if><c:if test="${ritem.weekdays eq 7}">토</c:if></td>
								<td style="vertical-align:middle;">
								<c:choose>
								<c:when test="${ritem.stype eq 'S'}"><a href="javascript:eventclk1(${ritem.id})">${ritem.title}</a></c:when>
								<c:when test="${ritem.stype eq 'T'}"><a href="javascript:eventclk2(${ritem.id})">${ritem.title}</a></c:when>
								<c:when test="${ritem.stype eq 'E'}"><a href="javascript:eventclk3(${ritem.id})">${ritem.title}</a></c:when>
								<c:otherwise>${ritem.title}</c:otherwise>
								</c:choose>
								</td>
								<td style='width:300;overflow:hidden;text-overflow;ellipsis;word-break:break-word'>${fn:replace(ritem.schedDesc, replaceChar, "<br/>") }</td>
								<td style="vertical-align:middle;">${ritem.start}</td>
								<td style="vertical-align:middle;">${ritem.end}</td>
								<c:choose>
									<c:when test="${ritem.schedCheck eq '1' }">
										<td class="chktd" style="vertical-align:middle;"><input type="checkbox" id="chk" data-id="${ritem.id }" data-check="1" data-name="checks" class="r2chk" checked></td>
									</c:when>
									<c:otherwise>
										<td class="chktd" style="vertical-align:middle;"><input type="checkbox" id="chk" data-id="${ritem.id }" data-check="0" data-name="checks" class="r2chk"></td>
									</c:otherwise>
								</c:choose>
							</tr>
							</c:if>
							</c:forEach>
							<tr>
							<td colspan="2" style="text-align:center;">추가기재</td>
							<td colspan=4><textarea id="thaddtext" class="form-control" cols="50" rows="5">${myadd.thComment}</textarea></td>
							<c:choose>
								<c:when test="${myadd.thCheck eq '1' }">
									<td style="text-align:center; vertical-align:middle;"><input type="checkbox" data-id="${myadd.sreportNo }" data-check="1" data-name="add" class="thaddchk" checked></td>
								</c:when>
								<c:otherwise>
									<td style="text-align:center; vertical-align:middle;"><input type="checkbox" data-id="${myadd.sreportNo }" data-check="0" data-name="add" class="thaddchk"></td>
								</c:otherwise>
							</c:choose>
							</tr>
							</tbody>
						</table>
						<hr>
						<div class="page-header-title">
							<div class="d-inline alert alert-success">
								다음주 업무 목록
							</div>
						</div>
						<table id="schedTable" class="table table-bordered " style="table-layout:fixed;word-break:break-word">
							<colgroup>
								<col width="5%">
								<col width="5%">
								<col width="25%">
								<col width="35%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>주차</th>
									<th>요일</th>
									<th>일정제목</th>
									<th>일정내용</th>
									<th>일정시작</th>
									<th>일정종료</th>
									<th>업무일지반영(<a onclick="chkallr3();">V</a>/<a onclick="chkunr3();">X</a>)</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="ritem" items="${rlist}">
							<c:if test="${ritem.weektype eq 'n'}">
							<tr>
								<td class="firstr3" style="vertical-align:middle;">${ritem.weekno}</td>
								<td class="secondr3"><c:if test="${ritem.weekdays eq 1}">일</c:if><c:if test="${ritem.weekdays eq 2}">월</c:if><c:if test="${ritem.weekdays eq 3}">화</c:if><c:if test="${ritem.weekdays eq 4}">수</c:if><c:if test="${ritem.weekdays eq 5}">목</c:if><c:if test="${ritem.weekdays eq 6}">금</c:if><c:if test="${ritem.weekdays eq 7}">토</c:if></td>
								<td style="vertical-align:middle;">
								<c:choose>
								<c:when test="${ritem.stype eq 'S'}"><a href="javascript:eventclk1(${ritem.id})">${ritem.title}</a></c:when>
								<c:when test="${ritem.stype eq 'T'}"><a href="javascript:eventclk2(${ritem.id})">${ritem.title}</a></c:when>
								<c:when test="${ritem.stype eq 'E'}"><a href="javascript:eventclk3(${ritem.id})">${ritem.title}</a></c:when>
								<c:otherwise>${ritem.title}</c:otherwise>
								</c:choose>
								</td>
								<td style='width:300;overflow:hidden;text-overflow;ellipsis;word-break:break-word'>${ritem.schedDesc}</td>
								<td style="vertical-align:middle;">${ritem.start}</td>
								<td style="vertical-align:middle;">${ritem.end}</td>
								<c:choose>
									<c:when test="${ritem.schedCheck eq '1'}">
										<td class="chktd" style="vertical-align:middle;"><input type="checkbox" id="chk" data-id="${ritem.id }" data-check="1" data-name="checks" class="r3chk" checked></td>
									</c:when>
									<c:otherwise>
										<td class="chktd" style="vertical-align:middle;"><input type="checkbox" id="chk" data-id="${ritem.id }" data-check="0" data-name="checks" class="r3chk"></td>
									</c:otherwise>
								</c:choose>
							</tr>
							</c:if>
							</c:forEach>
							<tr>
							<td colspan="2" style="text-align:center;">추가기재</td>
							<td colspan=4>
								<textarea id="nxaddtext" class="form-control" cols="50" rows="5"></textarea>
							</td>
							<c:choose>
								<c:when test="${myadd2.thCheck eq '1' }">
									<td style="text-align:center; vertical-align:middle;"><input type="checkbox" data-id="" data-check="1" data-name="add" class="nxaddchk" checked></td>
								</c:when>
								<c:otherwise>
									<td style="text-align:center; vertical-align:middle;"><input type="checkbox" data-id="" data-check="0" data-name="add" class="nxaddchk"></td>
								</c:otherwise>
							</c:choose>
							</tr>
							</tbody>
						</table>
						<div class="table-responsive">
						<div id = "printdiv">
						<table class="table table-bordered printdivTable" style="white-space:normal;table-layout:fixed;word-break:break-word;width:99.8% !important; font-size:0.5em !important;">
						<colgroup>
								<col width="25%">
								<col width="25%">
								<col width="25%">
								<col width="25%">
							</colgroup>
						<tr>
							<h3 style="text-align:center; font-size:16px;">주간 업무 보고</h3>
						</tr>
						<tr>
						<th class="thWeek" colspan="3"  style="text-align:center;"></th>
						<th class="thUname" style="text-align:center;"></th>
						</tr>
						<tr>
						<td class="colorTd" colspan="2" style="text-align:center;background-color:yellow;width:50%">지난주 진행사항</td>
						<td class="colorTd" colspan="2" style="text-align:center;background-color:yellow;width:50%">이번주 예정사항</td>
						</tr>
						<tr>
						<td colspan="2">
							<table class="table table-bordered " style="table-layout:fixed;word-break:break-word;margin:auto;">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<c:forEach var="ritem" items="${rlist}" varStatus="stvar">
							<c:if test="${ritem.weektype eq 't'}">
							<tr>
								<td class="secondsr1 text-center" style="vertical-align:middle;"><c:if test="${ritem.weekdays eq 2}">월</c:if><c:if test="${ritem.weekdays eq 3}">화</c:if><c:if test="${ritem.weekdays eq 4}">수</c:if><c:if test="${ritem.weekdays eq 5}">목</c:if><c:if test="${ritem.weekdays eq 6}">금</c:if><c:if test="${ritem.weekdays eq 7}">토</c:if></td>
								<td class="chktd text-left" style="word-break:break-all;border:0;white-space:normal;"><b>${ritem.title}</b><br/>
								${fn:replace(ritem.schedDesc, replaceChar, "<br/>") }<br/>
								<input type="checkbox" style="display:none" class="sr1chk form-control-sm" checked></td>
							</tr>
							</c:if>
							</c:forEach>
							</table>
							<div class="praddtxt1">
							<hr>
							<h4>추가 기재 사항</h4>
							<hr>
							<%-- <textarea style="border: 0;" id="prprntext" class="form-control txt" cols="50" rows="5">${myadd.prComment}</textarea> --%>
							<div>${fn:replace(myadd.prComment, replaceChar, "<br/>") }</div>
							</div>
						</td>
						<td colspan="2">
							<table class="table table-bordered " style="table-layout:fixed;word-break:break-word;">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<c:forEach var="ritem" items="${rlist}" varStatus="stvar">
							<c:if test="${ritem.weektype eq 'n'}">
							<tr>
								<td class="secondsr2 text-center" style="vertical-align:middle;"><c:if test="${ritem.weekdays eq 2}">월</c:if><c:if test="${ritem.weekdays eq 3}">화</c:if><c:if test="${ritem.weekdays eq 4}">수</c:if><c:if test="${ritem.weekdays eq 5}">목</c:if><c:if test="${ritem.weekdays eq 6}">금</c:if><c:if test="${ritem.weekdays eq 7}">토</c:if></td>
								<td class="chktd text-left" style="white-space:normal;border:0;word-break:break-all"><b>${ritem.title}</b><br/>
								${fn:replace(ritem.schedDesc, replaceChar, "<br/>") }<br/>
								<input type="checkbox" style="display:none" class="sr2chk form-control-sm" checked></td>
							</tr>
							</c:if>
							</c:forEach>
							</table>
							<div class="thaddtxt1">
							<hr>
							<h4>추가 기재 사항</h4>
							<hr>
							<%-- <textarea style="border: 0" id="thprntext" class="form-control txt" cols="50" rows="5">${myadd.thComment}</textarea> --%>
							<div>${fn:replace(myadd.thComment, replaceChar, "<br/>") }</div>
							</div>
						</td>
						</tr>
						</table>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//table-->
</div>
<jsp:include page="../body-bottom.jsp"/>
<script>
/* function fn_Print() {
	$("#printdiv").attr("style", "display:block");
	printJS({
	    printable: 'printdiv',
	    type: 'html',
	    css: ['${path}/css/print.media.css'],
	    scanStyles: false,
	});
	$("#printdiv").attr("style", "display:none");
}
 */
function setFirstr1(){
	var i = 1;
	var str = undefined;
	var element = $(".firstr1");
	var firstElement = undefined;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".firstr1")[0].innerText;
			firstElement = $(".firstr1")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', i);
}
function setFirstr2(){
	var i = 1;
	var str = undefined;
	var element = $(".firstr2");
	var firstElement = undefined;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".firstr2")[0].innerText;
			firstElement = $(".firstr2")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', i);
}
function setFirstr3(){
	var i = 1;
	var str = undefined;
	var element = $(".firstr3");
	var firstElement = undefined;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".firstr3")[0].innerText;
			firstElement = $(".firstr3")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', i);
}

function setSecondr1(){
	var i = 1;
	var str = undefined;
	var element = $(".secondr1");
	var firstElement = undefined;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".secondr1")[0].innerText;
			firstElement = $(".secondr1")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', i);
}
function setSecondr2(){
	var i = 1;
	var str = undefined;
	var element = $(".secondr2");
	var firstElement = undefined;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".secondr2")[0].innerText;
			firstElement = $(".secondr2")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', i);
}
function setSecondr3(){
	var i = 1;
	var str = undefined;
	var element = $(".secondr3");
	var firstElement = undefined;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".secondr3")[0].innerText;
			firstElement = $(".secondr3")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', i);
}

function setSecondsr1(){
	var i = 1;
	var str = undefined;
	var element = $(".secondsr1");
	var firstElement = undefined;
	element.each(function() {
		console.dir(i + $(this).text());
		if (str == undefined && firstElement == undefined) {
			str = $(".secondsr1")[0].innerText;
			firstElement = $(".secondsr1")[0];
			return;
		}
		if (str == $(this).text()) {
			i++;
			console.dir('--> ' + i + $(this).text());
			$(this).remove();
		} else {
			$(firstElement).attr('rowspan', i);
			i = 1;
			str = $(this).text();
			firstElement = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement).attr('rowspan', i);
}
function setSecondsr2(){
	var i2 = 1;
	var str2 = undefined;
	var element2 = $(".secondsr2");
	var firstElement2 = undefined;
	element2.each(function() {
		console.dir(i2 + $(this).text());
		if (str2 == undefined && firstElement2 == undefined) {
			str2 = $(".secondsr2")[0].innerText;
			firstElement2 = $(".secondsr2")[0];
			return;
		}
		if (str2 == $(this).text()) {
			i2++;
			console.dir('--> ' + i2 + $(this).text());
			$(this).remove();
		} else {
			$(firstElement2).attr('rowspan', i2);
			i2 = 1;
			str2 = $(this).text();
			firstElement2 = $(this);
		}
	});
	// 마지막꺼까지 반영
	$(firstElement2).attr('rowspan', i2);
}

function chkallr1() {
	var $Marr = $(".r1chk");
	for (var i = 0; i < $Marr.length; i++) {
		$($Marr[i]).prop("checked",true);			
	}
	chkPrchange();
}

function chkunr1() {
	var $Marr = $(".r1chk");
	for (var i = 0; i < $Marr.length; i++) {
		$($Marr[i]).prop("checked",false);
	}
	chkPrchange();
}
function chkallr2() {
	var $Marr = $(".r2chk");
	for (var i = 0; i < $Marr.length; i++) {
		$($Marr[i]).prop("checked",true);			
	}
	chkThchange();
}

function chkunr2() {
	var $Marr = $(".r2chk");
	for (var i = 0; i < $Marr.length; i++) {
		$($Marr[i]).prop("checked",false);
	}
	chkThchange();
}
function chkallr3() {
	var $Marr = $(".r3chk");
	for (var i = 0; i < $Marr.length; i++) {
		$($Marr[i]).prop("checked",true);			
	}
	chkNxchange();
}

function chkunr3() {
	var $Marr = $(".r3chk");
	for (var i = 0; i < $Marr.length; i++) {
		$($Marr[i]).prop("checked",false);
	}
	chkNxchange();
}

function formatDate(date) {
    var mymonth = date.getMonth()+1;
    var myweekday = date.getDate();
    return (mymonth + "/" + myweekday);
}

function printWeek() {
    var now = new Date();
    var nowDayOfWeek = now.getDay();
    var nowDay = now.getDate();
    var nowMonth = now.getMonth();
    var nowYear = now.getYear();
    nowYear += (nowYear < 2000) ? 1900 : 0;
    var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + 1);
    var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek - 1));
    var thisweek = formatDate(weekStartDate) + " ~ " + formatDate(weekEndDate);
    $(".thWeek").html("일자 :" + thisweek);
    var unam = "${userName}";
    console.log(unam);
    $(".thUname").html("담당:" + unam);
    $("#printdiv").attr("style", "display:none");
    $("#praddtext").val().replace("\t", "");
    
    if($(".praddchk").attr("data-check") == 1){
		$(".praddtxt1").show();
	} else{
		$(".praddtxt1").hide();
	}
    
    if($(".thaddchk").attr("data-check") == 1){
		$(".thaddtxt1").show();
	} else{
		$(".thaddtxt1").hide();
	}
}

$(document).on("click", "[type='checkbox']", function(){
	if($(this).is(":checked") == true){
		$(this).attr("data-check", 1);
	}else{
		$(this).attr("data-check", 0);
	}
});

function fn_Create(){
	var sreportData = {};
	var checkData = [];
	sreportData.userNo 		= Number("${userNo}");
	sreportData.compNo 		= Number("${compNo}");
	sreportData.prComment	= tinyMCE.get("praddtext").getContent();
	sreportData.prCheck 	= $(".praddchk").attr("data-check");
	sreportData.thComment	= tinyMCE.get("thaddtext").getContent();
	sreportData.thCheck 	= $(".thaddchk").attr("data-check");
	
	
	$("input[type='checkbox']").each(function(){
		if(typeof $(this).attr("data-id") != "undefined" && typeof $(this).attr("data-check") != "undefined" && $(this).attr("data-name") == "checks"){
			var tempArray = [];
			tempArray = {
				schedNo: $(this).attr("data-id"),
				schedCheck: $(this).attr("data-check")
			}
			checkData.push(tempArray);
		}
	});
	
	sreportData.checks = checkData;
	
	console.log(sreportData);
	
	$.ajax({
		url: "${path}/sched/insSreport.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		data: JSON.stringify({
			sreportData: sreportData, // HTTP 요청과 함께 서버로 보낼 데이터
			checkData: checkData
		}),
		contentType: 'application/json',
		method: "POST", // HTTP 요청 메소드(GET, POST 등)
		dataType: "json" // 서버에서 보내줄 데이터의 타입
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
	.done(function(data) {
		if(data.code == 10001){
			alert("저장 성공");
		}else{
			alert("저장 실패");
		}
	}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
	.fail(function(xhr, status, errorThrown) {
		alert("통신 실패");
	});
}

function fn_Create2(){
	var sreportData = {};
	var checkData = [];
	sreportData.userNo 		= Number("${userNo}");
	sreportData.compNo 		= Number("${compNo}");
	sreportData.prComment	= tinyMCE.get("thaddtext").getContent();
	sreportData.prCheck 	= $(".thaddchk").attr("data-check");
	sreportData.thComment	= tinyMCE.get("nxaddtext").getContent();
	sreportData.thCheck 	= $(".nxaddchk").attr("data-check");
	$("input[type='checkbox']").each(function(){
		if(typeof $(this).attr("data-id") != "undefined" && typeof $(this).attr("data-check") != "undefined" && $(this).attr("data-name") == "checks"){
			var tempArray = [];
			tempArray = {
				schedNo: $(this).attr("data-id"),
				schedCheck: $(this).attr("data-check")
			}
			checkData.push(tempArray);
		}
	});
	sreportData.checks = checkData;
	console.log(sreportData);
	$.ajax({
		url: "${path}/sched/insSreport2.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		data: JSON.stringify({
			sreportData: sreportData, // HTTP 요청과 함께 서버로 보낼 데이터
			checkData: checkData
		}),
		contentType: 'application/json',
		method: "POST", // HTTP 요청 메소드(GET, POST 등)
		dataType: "json" // 서버에서 보내줄 데이터의 타입
	}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
	.done(function(data) {
		if(data.code == 10001){
			alert("저장 성공");
		}else{
			alert("저장 실패");
		}
	}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
	.fail(function(xhr, status, errorThrown) {
		alert("통신 실패");
	});
}

function fn_Print() {
	PrSet();
	ThSet();
	NxSet();
	linecopy();
	setSecondsr1();
	setSecondsr2();
	var initBody = document.body.innerHTML;
	window.onbeforeprint = function(){
		//setSecondsr1();
		document.body.innerHTML = document.getElementById("printdiv").innerHTML;
	}
	window.onafterprint = function(){
		location.replace("${path}/sched/schedreport.do");		
	}
	window.print();
}

$(".r1chk,.r2chk,.r3chk").change(function(){
	chkPrchange();
	chkThchange();
	chkNxchange();
});

$(".praddchk").change(function(){
	if($(".praddchk").is(":checked")==true){
		console.log("실행");
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

function chkPrchange(){
	var $infoarr = $(".r1chk");
	var $sinfoarr = $(".sr1chk");
	for (var i = 0; i < $infoarr.length; i++) {
		if($($infoarr[i]).is(":checked")==true){
		$($sinfoarr[i]).attr("checked",true);
		$($sinfoarr[i]).parent().parent().show();
		}
		else{
			$($sinfoarr[i]).attr("checked",false);
			$($sinfoarr[i]).parent().parent().hide();
		}
	}
}

function chkThchange(){
	var $infoarr = $(".r2chk");
	var $sinfoarr = $(".sr2chk");
	for (var i = 0; i < $infoarr.length; i++) {
		if($($infoarr[i]).is(":checked")==true){
		$($sinfoarr[i]).attr("checked",true);
		$($sinfoarr[i]).parent().parent().show();
		}
		else{
			$($sinfoarr[i]).attr("checked",false);
			$($sinfoarr[i]).parent().parent().hide();
		}
	}
}

function chkNxchange(){
	var $infoarr = $(".r3chk");
	var $sinfoarr = $(".sr3chk");
	for (var i = 0; i < $infoarr.length; i++) {
		if($($infoarr[i]).is(":checked")==true){
		$($sinfoarr[i]).attr("checked",true);
		$($sinfoarr[i]).parent().parent().show();
		}
		else{
			$($sinfoarr[i]).attr("checked",false);
			$($sinfoarr[i]).parent().parent().hide();
		}
	}
}

function PrSet(){
	var $infoarr = $(".r1chk");
	var $sinfoarr = $(".sr1chk");
	for (var i = 0; i < $infoarr.length; i++) {
		if($($infoarr[i]).is(":checked")==true){
		$($sinfoarr[i]).attr("checked",true);
		$($sinfoarr[i]).parent().parent().show();
		}
		else{
			$($sinfoarr[i]).attr("checked",false);
			$($sinfoarr[i]).parent().parent().remove();
		}
	}
}

function ThSet(){
	var $infoarr = $(".r2chk");
	var $sinfoarr = $(".sr2chk");
	for (var i = 0; i < $infoarr.length; i++) {
		if($($infoarr[i]).is(":checked")==true){
		$($sinfoarr[i]).attr("checked",true);
		$($sinfoarr[i]).parent().parent().show();
		}
		else{
			$($sinfoarr[i]).attr("checked",false);
			$($sinfoarr[i]).parent().parent().remove();
		}
	}
}

function NxSet(){
	var $infoarr = $(".r3chk");
	var $sinfoarr = $(".sr3chk");
	for (var i = 0; i < $infoarr.length; i++) {
		if($($infoarr[i]).is(":checked")==true){
		$($sinfoarr[i]).attr("checked",true);
		$($sinfoarr[i]).parent().parent().show();
		}
		else{
			$($sinfoarr[i]).attr("checked",false);
			$($sinfoarr[i]).parent().parent().remove();
		}
	}
}

function tblTest(){
	setSecondsr1();
}

function linecopy(){
	var aa = tinyMCE.get("praddtext").getContent();
	$("#prprntext").html(aa);
	var bb = tinyMCE.get("thaddtext").getContent();
	$("#thprntext").html(bb);
}

$("#praddtext,#thaddtext").change(function(){
	linecopy();
});

$(document).ready(function() {
	setFirstr1();
	setFirstr2();
	setFirstr3();
	setSecondr1();	
	setSecondr2();
	setSecondr3();
	chkNxchange();
	printWeek();
});
	
function eventclk3(id) {
     var url="${path}/sched/detail2/"+id;
         console.log(url);
         history.pushState(null, null, url);
     	 location.replace(url);
}
function eventclk1(id) {
    var url="${path}/sales/detail2/"+id;
        console.log(url);
        history.pushState(null, null, url);
    	 location.replace(url);
}
function eventclk2(id) {
    var url="${path}/techd/detail2/"+id;
        console.log(url);
        history.pushState(null, null, url);
    	 location.replace(url);
}
</script>