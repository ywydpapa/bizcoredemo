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
			<div id="titlePdf">지출결의서</div>
		</div>
		<table style="border-collapse: collapse;">
			<thead>
				<tr style="border:1px solid #000;">
					<th>부 서</th>
					<th style="border-left:1px solid #000;">담 당</th>
					<th style="border-left:1px solid #000;">과 장</th>
					<th style="border-left:1px solid #000;">부 서 장</th>
					<th style="border-left:1px solid #000;">임 원</th>
					<th style="border-left:1px solid #000;">대 표 이 사</th>
				</tr>
			</thead>
			<tbody>
				<tr style="border:1px solid #000;">
					<td style="width:16%; height:80px;"></td>
					<td style="width:16%; height:80px; border-left:1px solid #000;"></td>
					<td style="width:16%; height:80px; border-left:1px solid #000;"></td>
					<td style="width:16%; height:80px; border-left:1px solid #000;"></td>
					<td style="width:16%; height:80px; border-left:1px solid #000;"></td>
					<td style="width:16%; height:80px; border-left:1px solid #000;"></td>
				</tr>
			</tbody>
		</table>
		
		<table id="headList">
			<tr>
				<th>상&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;호 : ${detailList.custName}</th>
				<th>담&ensp;&nbsp;&nbsp;당&ensp;&nbsp;&nbsp;자 : </th>
			</tr>
			<tr>
				<th>대&ensp;&nbsp;&nbsp;표&ensp;&nbsp;&nbsp;자 : ${detailList.custBossname}</th>
				<th>계&ensp;좌&ensp;번&ensp;호 : </th>
			</tr>
			<tr>
				<th>사업자등록번호 : ${detailList.custVatNo}</th>
				<th>은&ensp;&nbsp;&nbsp;행&ensp;&nbsp;&nbsp;명 : </th>
			</tr>
			<tr>
				<th>전&ensp;화&ensp;번&ensp;호</th>
				<th>예&ensp;&nbsp;&nbsp;금&ensp;&nbsp;&nbsp;주 : </th>
			</tr>
		</table>
		
		<table id="mainTable" style="margin-bottom: 0;">
			<colgroup>
		        <col width="10%">
		        <col width="39%">
		        <col width="5%">
		        <col width="5%">
		        <col width="25%">
		    </colgroup>
			<thead>
				<tr>
					<th style="border-left:1px solid #000;">사용일자</th>
					<th>품 명 / 규 격</th>
					<th>수량</th>
					<th>합계</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${detailListData}" varStatus="status">
			    	<tr id="mainTr">
			    		<c:choose>
			    			<c:when test="${empty row.productDate}">
					    		<td style="text-align: center;">${row.regDate}</td>
			    			</c:when>
			    			<c:otherwise>
			    				<td style="text-align: center;">${row.productDate}</td>
			    			</c:otherwise>
			    		</c:choose>
			    		<td style='text-align: center;'>${row.productName}</td>
			    		<td style='text-align: center;'>${row.productQty}</td>
			    		<td style='text-align: right;'><fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
			    		<td style='text-align: center;'>${row.productRemark}</td>
			    	</tr>
			    	<c:set var="totalSum" value="${totalSum + row.productTotal}" />
			    </c:forEach>
			    <tr style="border-top:1px solid #000;">
			    	<th colspan="3" style="border-right:1px solid #000;">합 계</th>
			    	<td style="text-align: right;"><fmt:formatNumber value="${totalSum}" pattern="#,###" /></td>
			    	<td></td>
			    </tr>
			</tbody>
		</table>
		<table style="border-left:2px solid #000; border-right:2px solid #000; border-bottom:2px solid #000; border-collapse: collapse;">
			<tr>
		    	<td style="text-align: center; width: 50%;">
		    		<p>상기와 같이 지급하여 주시기 바랍니다.</p>
		    		<p>${fn:substring(detailList.docDate, 0, 4)}년 ${fn:substring(detailList.docDate, 5, 7)}월 ${fn:substring(detailList.docDate, 8, 10)}일</p>
		    		<p>성 명 : &ensp;&ensp;${detailList.userName}</p>
		    	</td>
		    	<td style="text-align: center; border-left:1px solid #000; width: 50%;">
		    		<p>상기의 금액을 지급완료하였음.</p>
		    		<br/>
		    		<p>출납담당 &ensp;&ensp;구민주&ensp;&ensp;&ensp;&ensp;(인)</p>
		    	</td>
		    </tr>
		</table>
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