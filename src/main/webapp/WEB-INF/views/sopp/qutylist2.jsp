<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-sm bst02" id="qutylist">
	<colgroup>
		<col width="5%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="30%"/>
		<col width="10%"/>
		<col width="5%"/>
		<col width="5%"/>
		<col width="5%"/>
		<col width="20%"/>
	</colgroup>							
	<thead>
		<tr>
			<th class="text-center">견적일자</th>
			<th class="text-center">작성자</th>
			<th class="text-center">견적번호</th>
			<th class="text-center">견적명</th>
			<th class="text-center">거래처</th>
			<th class="text-center">공급가합계</th>
			<th class="text-center">부가세합계</th>
			<th class="text-center">금액</th>
			<th class="text-center">적요</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${estList}">
		<tr>
			<td class="text-center">${row.estDate}</td>
			<td class="text-center">${row.userName}</td>
			<td class="text-center">
				<a href="${path}/gw/estdetail/${row.estId}/${row.estVer}">${row.estId}</a>
			</td>
			<td class="text-center">${row.estTitle}</td>
			<td class="text-center">${row.custName}</td>
			<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.estAmount}" /></td>
			<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.estVat}" /></td>
			<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.estTotal}" /></td>
			<td>${row.estDesc}</td>
		</tr>
	</c:forEach>								
	</tbody>
</table>

<script>
	$(document).ready(function(){
		for (var i = 0; i < product02In.length; i++) {
			product02InSum += (product02In[i] * product02InQuanty[i]);
		}
		for (var i = 0; i < product02Out.length; i++) {
			product02OutSum += (product02Out[i] * product02OutQuanty[i]);
		}
		product02DiffSum = product02OutSum - product02InSum;
		$("#product02InSum").html('₩'+product02InSum.toLocaleString("en-US"));
		$("#product02InSum_table").html('₩'+product02InSum.toLocaleString("en-US"));
		$("#product02OutSum").html('₩'+product02OutSum.toLocaleString("en-US"));
		$("#product02OutSum_table").html('₩'+product02OutSum.toLocaleString("en-US"));
		$("#product02DiffSum").html('₩'+product02DiffSum.toLocaleString("en-US"));

		product02Percent = Math.floor(product02DiffSum / product02OutSum * 100).toFixed(2);
		if(product02Percent == 'NaN'){
			$("#product02Percent").html('0'+'%');
		} else if (product02Percent == '-Infinity'){
			$("#product02Percent").html('0'+'%');
		} else if (product02Percent == 'Infinity'){
			$("#product02Percent").html('0'+'%');
		} else if(product02Percent >= 0){
			$("#product02Percent").html('+'+product02Percent+'%');
		} else if(product02Percent < 0){
			$("#product02Percent").html(product02Percent+'%');
		}
	});
</script>