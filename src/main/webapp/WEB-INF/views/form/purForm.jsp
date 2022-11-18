<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${path}/css/pdfForm.css">
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
<script src="${path}/js/html2pdf.bundle.min.js"></script>

<body>
	<div class="mainPdf" id="mainPdf">
		<div id="imgLogo">
			<img src="${path}/images/pdf_logo_left.jpg" id="logoLeft" />
			<img src="${path}/images/pdf_logo_right.png" id="logoRight" />
		</div>
		<div id="pdfTitle">
			<div id="titlePdf">발주서</div>
		</div>
		<table id="headList">
			<tr>
				<th>일&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;자 : ${detailList.docDate}</th>
				<th>상&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;호 : ${comList.comName}</th>
			</tr>
			<tr>
				<th>문&ensp;서&ensp;제&ensp;목 : ${detailList.docTitle}</th>
				<th>대&ensp;표&ensp;이&ensp;사 : ${comList.comBoss} (직인생략)</th>
			</tr>
			<tr>
				<th>사&ensp;&nbsp;&nbsp;업&ensp;&nbsp;&nbsp;명 : ${detailList.soppTitle}</th>
				<th style="max-width:100%;"><div style="margin:0; float:left;">주&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;소 :&nbsp;</div><div style="display: flex;">${comList.comAddress}</div><div style="padding-top: 1.5%;">전 화 / 팩 스 : ${comList.comPhone} / ${comList.comFax}</div></th>
			</tr>
			<tr>
				<th>
					수&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;신 :
					<c:choose>
						<c:when test="${empty detailList.custBossname}">
							${detailList.custName}
						</c:when>
						<c:otherwise>
							${detailList.custName}/${detailList.custBossname}
						</c:otherwise>
					</c:choose> 
				</th>
				<th></th>
			</tr>
			<tr>
				<th>영&ensp;업&ensp;담&ensp;당 : ${detailListApp.userName}/${detailListApp.userTel}/${detailListApp.userEmail}</th>
				<th></th>
			</tr>
		</table>
		<table id="mainTable">
			<colgroup>
		        <col width="5%">
		        <col width="45%">
		        <col width="5%">
		        <col width="6%">
		        <col width="6%">
		        <col width="6%">
		        <col width="6%">
		        <col width="10%">
		    </colgroup>
			<thead>
				<tr>
					<th style="border-left:1px solid #000;">No.</th>
					<th>품 명 / 규 격</th>
					<th>수량</th>
					<th>단가</th>
					<th>공급가액</th>
					<th>부가세</th>
					<th>합계</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${detailListData}" varStatus="status">
			    	<tr id="mainTr">
			    		<td style="text-align: center;">${status.index+1}</td>
			    		<td style='text-align: center;'>${row.productName}</td>
			    		<td style='text-align: center;'>${row.productQty}</td>
			    		<td style='text-align: right;'><fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
			    		<td style='text-align: right;'><fmt:formatNumber value="${row.productAmount}" pattern="#,###" /></td>
			    		<td style="text-align: right;"><fmt:formatNumber value="${row.productVat}" pattern="#,###" /></td>
			    		<td style='text-align: right;'><fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
			    		<td></td>
			    	</tr>
			    </c:forEach>
				<%-- <tr style="border-top:1px solid #000;">
					<th colspan="6" style="border-right:1px solid #000;">공&ensp;급&ensp;가&ensp;합&ensp;계</th>
					<td style="text-align:right;"><fmt:formatNumber value="${amountTotal}" pattern="#,###" /></td>
					<th></th>
				</tr>
				<tr>
					<th colspan="6" style="border-right:1px solid #000; border-top:1px solid #000; border-bottom:1px solid #000;">부&ensp;가&ensp;가&ensp;치&ensp;세</th>
					<td style="text-align:right; border-top:1px solid #000; border-bottom:1px solid #000;"><fmt:formatNumber value="${vatTotal}" pattern="#,###" /></td>
					<th style="border-top:1px solid #000; border-bottom:1px solid #000;"></th>
				</tr>
				<tr>
					<th colspan="6" style="border-right:1px solid #000;">총&ensp;&ensp;&ensp;&ensp;금&ensp;&ensp;&ensp;&ensp;액</th>
					<td style="text-align:right;"><fmt:formatNumber value="${dataTotal}" pattern="#,###" /></td>
					<th></th>
				</tr> --%>
			</tbody>
		</table>
		<div id="pdfRemarks">
			<h3>Remarks
				<span>${detailList.docDesc}</span>
			</h3>
		</div>
		<div id="pdfBottom">
			<img src="${path}/images/pdf_bottom.png" id="bottomImg" />
		</div>
	</div>
</body>
<script>
function solPdf(){  
	var estId = "${detailList.docTitle}";
	var now = new Date();
	var year = now.getFullYear();
	var month = parseInt(now.getMonth())+1;
	
	if(month < 10){
		month = "0" + month;
	}else{
		month = month;
	}
	
	if(now.getDate() < 10){
		var date = "0" + now.getDate();
	}else{
		var date = now.getDate();
	}
	
	var nowDate = year + "-" + month + "-" + date;
	var element = document.getElementById("mainPdf");
	
	html2pdf().from(element).set({
	  margin: 5,
      filename: estId + '(' + nowDate + ')' + '.pdf',
      html2canvas: { scale: 10 },
      jsPDF: {orientation: 'portrait', unit: 'mm', format: 'a4', compressPDF: true}
	}).save();
}

$(document).ready(function(){
	solPdf();
});
</script>
</html>