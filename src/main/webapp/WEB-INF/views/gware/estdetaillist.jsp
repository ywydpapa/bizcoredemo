<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2021-12-29
  Time: 오전 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-sm bst02" id="qutylist">
    <colgroup>
    	<col width="8%" />
    	<col width="8%" />
    	<col width="8%" />
        <col width="8%" />
        <col width="8%" />
        <col width="8%" />
        <col width="8%" />
        <col width="8%" />
        <col width="8%" />
        <col width="14%" />
        <col width="5%" />
        <col width="5%" />
    </colgroup>
    <thead>
    <tr>
    	<th class="text-center">구분</th>
    	<th class="text-center">타이틀</th>
        <th class="text-center">거래처</th>
        <th class="text-center">항목</th>
        <th class="text-center">단가</th>
        <th class="text-center">수량</th>
        <th class="text-center">공급가액</th>
        <th class="text-center">부가세액</th>
        <th class="text-center">금액</th>
        <th class="text-center">비고</th>
        <th class="text-center">수정</th>
        <th class="text-center">삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="row" items="${list}">
    	<tr>
	    	<input type="hidden" id="productCustNo" value="${row.custNo}" />
			<input type="hidden" id="productNo" value="${row.productNo}" />
			<input type="hidden" id="dataSpec" value="${row.productSpec}" />
    		<td id="dataItemKinds" style='text-align:center;'>${row.itemKinds}</td>
    		<td id="dataItemTitle" style='text-align:center;'>${row.itemTitle}</td>
    		<td id='salesCustNoN' style='text-align:center;'>${row.custName}</td>
    		<td id='dataTitle' style='text-align:center;'>${row.productName}</td>
    		<td id='dataNetprice' style='text-align: right'>₩<fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
    		<td id='dataQuanty' style='text-align: right'>${row.productQty}</td>
    		<td id='dataAmt' style='text-align: right'>₩<fmt:formatNumber value="${row.productAmount}" pattern="#,###" /></td>
    		<td id='dataVat' style='text-align: right'>₩<fmt:formatNumber value="${row.productVat}" pattern="#,###" /></td>
    		<td id='dataTotal' style='text-align: right'>₩<fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
    		<%-- <td id='dataDiscount' style='text-align: right'>${row.productDis}%</td> --%>
    		<td id='dataRemark'>${row.productRemark}</td>
    		<td style='text-align:center;'><button class='btn btn-sm btn-inverse' id="dataUpdateBtn" data-flag="1" data-id="${row.estItemNo}" onClick="dataUpdateBtn(this);">수정</button></td>
    		<td style='text-align:center;'><button class='btn btn-sm btn-danger' id="dataDelBtn">삭제</button></td>
    	</tr>
    </c:forEach>
    </tbody>
</table>
<br/>
<table class="table table-sm">
    <tr class="item2">
        <td colspan="1" style="text-align: center; background: #80808030;">합계</td>
        <td colspan="11" style="text-align: right; background: #80808030;" id="product02InSum_table">0</td>
    </tr>
    </tbody>
</table>
