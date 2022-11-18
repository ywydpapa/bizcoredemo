<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!-- listusercontribution -->
<form name="form2" method="post" onsubmit="return false;">
	<div>
		<div>
			<span style="font-weight: 600;">계산서 연결현황</span>
			<input type="hidden" id="sessionCustNo" value="${sessionCust.custNo}" />
			<input type="hidden" id="listusercontributionCnt" value="${listusercontributionCnt}" />
			
			<table class="table table-sm bst02" id="billProTable">
				<thead>
					<tr>
						<th class="text-center">일자</th>
						<th class="text-center">발행번호</th>
						<th class="text-center">품목</th>
						<th class="text-center">합계 금액</th>
						<th class="text-center">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${data}">
						<tr>
							<td class="text-center">${row.vatIssueDate}</td>
			    			<td class="text-center">${row.vatSerial}</td>
			    			<td class="text-center">${row.vatProductName}</td>
			    			<td class="text-right moneyTdHtml">${row.vatTax + row.vatAmount}</td>
			    			<c:if test="${row.vatStatus eq 'S1'}">
			    				<td class="text-center">수금 진행중</td>
			    			</c:if>
							<c:if test="${row.vatStatus eq 'S3'}">
			    				<td class="text-center">부분 수금</td>
			    			</c:if>
			    			<c:if test="${row.vatStatus eq 'S5'}">
			    				<td class="text-center">수금 완료</td>
			    			</c:if>
			    			<c:if test="${row.vatStatus eq 'B1'}">
			    				<td class="text-center">지급 진행중</td>
			    			</c:if>
							<c:if test="${row.vatStatus eq 'B3'}">
			    				<td class="text-center">부분 지급</td>
			    			</c:if>
			    			<c:if test="${row.vatStatus eq 'B5'}">
			    				<td class="text-center">지급 완료</td>
			    			</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>
</form>
