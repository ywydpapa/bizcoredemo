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

<style>
	table{
		border-collapse: collapse;
		text-align: center;
		font-size:13px;
		margin:0 auto;
	}
	
	th{
		border: 1px solid #000;
	}
	
	td{
		border: 1px solid #000;
	}
	
	#vatTitle{
		text-align: center;
	}
	
	#vatProInfo{
		border-color: #DF7D7A;
		border-right: none;
	}
	
	#vatProInfo tr th{
		background-color:#FFF7F5; 
		color:#B76C70;
		border-color: #D7A3A7;
		width: 20%;
	}
	
	#vatProInfo tr td{
		border-color: #D7A3A7;
		border-right: none;
		height: 40px;
		width: 25%;
	}
	
	#vatRecInfo{
		margin-bottom: 4%;
		border-color: #C5CBDB;
		border-left: none;
	}
	
	#vatRecInfo tr th{
		background-color: #F7F7FF; 
		color:#6785A7;
		border-color: #6D9CD4;
		width: 20%;
	}
	
	#vatRecInfo tr td{
		border-color: #6D9CD4;
		height: 40px;
		width: 25%;
	}
	
	#vatDateInfo tr th{
		border-color: #ECECEC;
		background-color: #F8F8F8;
	}
	
	#vatDateInfo tr td{
		border-color: #ECECEC;
		width: 40%;
	}
	
	#vatAmountInfo{
		margin-bottom: 2%;
	}
	
	#vatAmountInfo tr th{
		border-color: #ECECEC;
		background-color: #F8F8F8;
	}
	
	#vatAmountInfo tr td{
		border-color: #ECECEC;
	}
	
	#vatItemInfo thead tr th{
		border-left-color: #EBEBEB;
		border-right-color: #EBEBEB;
		border-bottom-color: #999999;
		background-color: #F5F4F2;
	}
	
	#vatItemInfo tbody tr td{
		border-color: #EBEBEB;
	}
	
	#vatItemInfo tbody tr:last-child td{
		border-bottom-color: #000;
	}
</style>

<body>
	<div>
		<div id="vatTitle">
			<h3>계 산 서</h3>
		</div>
		<div>
			<div style="float:left; width:50%;">
				<table class="table table-striped table-bordered nowrap " id="vatProInfo">
					<tr>
						<th rowspan="5" style="background-color:#FFC8CD !important; color:#BE5552 !important; width:6% !important;">공<br>급<br>자</th>
						<th>등록번호</th>
						<td>${vatList[0].proCustVatNo}</td>
						<th>종사업장번호</th>
						<td></td>	
					</tr>
					<tr>
						<th>상호</th>
						<td>${vatList[0].proCustName}</td>
						<th>성명</th>
						<td>${vatList[0].proBossName}</td>
					</tr>
					<tr>
						<th>사업장</th>
						<td colspan="3">${vatList[0].proCustAddrFirst}, ${vatList[0].proCustAddrLast}</td>
					</tr>
					<tr>
						<th>업태</th>
						<td>${vatList[0].proCustVatBiz}</td>
						<th>종목</th>
						<td>${vatList[0].proCustVatType}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="3">${vatList[0].proCustEmail}</td>
					</tr>
				</table>
			</div>
			<div style="float:right; width:50%;">
				<table class="table table-striped table-bordered nowrap " id="vatRecInfo">
					<tr>
						<th rowspan="5" style="background-color: #C6DBF8 !important; color: #3C6BB9 !important; width:6% !important;">공<br>급<br>받<br>는<br>자</th>
						<th>등록번호</th>
						<td>${vatList[0].vatNo}</td>
						<th>종사업장번호</th>
						<td></td>	
					</tr>
					<tr>
						<th>상호</th>
						<td>${vatList[0].recCustName}</td>
						<th>성명</th>
						<td>${vatList[0].recBossName}</td>
					</tr>
					<tr>
						<th>사업장</th>
						<td colspan="3">${vatList[0].recCustAddrFirst}, ${vatList[0].recCustAddrLast}</td>
					</tr>
					<tr>
						<th>업태</th>
						<td>${vatList[0].recCustVatBiz}</td>
						<th>종목</th>
						<td>${vatList[0].recCustVatType}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="3">${vatList[0].vatEmail}</td>
					</tr>
				</table>
			</div>
		</div>
		<div>
			<table class="table table-striped table-bordered nowrap " id="vatDateInfo">
				<tr>
					<th>작성일자</th>
					<td>${vatList[0].vatIssueDate}</td>
					<th>비고</th>
					<td>${vatList[0].vatRemark}</td>
				</tr>
			</table>
			<table class="table table-striped table-bordered nowrap " id="vatAmountInfo">
				<c:forEach var="row" items="${vatList}">
					<c:set var="vatTotal" value="${vatTotal + (row.vatTax + row.vatAmount)}"/>
					<c:set var="vatAmount" value="${vatAmount + row.vatAmount}"/>
					<c:set var="vatTax" value="${vatTax + row.vatTax}"/>
				</c:forEach>
				<tr>
					<th>합계금액</th>
					<c:choose>
						<c:when test="${vatTotal > 0}">
							<td><fmt:formatNumber value="${vatTotal}" pattern="#,###" /></td>
						</c:when>
						<c:otherwise>
							<td>0</td>
						</c:otherwise>
					</c:choose>
					<th>공급가액</th>
					<c:choose>
						<c:when test="${vatAmount > 0}">
							<td><fmt:formatNumber value="${vatAmount}" pattern="#,###" /></td>
						</c:when>
						<c:otherwise>
							<td>0</td>
						</c:otherwise>
					</c:choose>
					<th>세액</th>
					<c:choose>
						<c:when test="${vatTax > 0}">
							<td><fmt:formatNumber value="${vatTax}" pattern="#,###" /></td>
						</c:when>
						<c:otherwise>
							<td>0</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</div>
		<div>
			<table class="table table-striped table-bordered nowrap " id="vatItemInfo">
				<thead>
					<tr>
						<th>일자</th>
						<th>품목</th>
						<th>규격</th>
						<th>수량</th>
						<th>단가</th>
						<th>공급가액</th>
						<th>세액</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${vatList}">
						<tr>
							<td>${row.vatTradeDate}</td>
							<td>${row.vatProductName}</td>
							<td>${row.vatStandard}</td>
							<td>${row.vatQuan}</td>
							<c:choose>
								<c:when test="${row.vatNet > 0}">
									<td><fmt:formatNumber value="${row.vatNet}" pattern="#,###" /></td>
								</c:when>
								<c:otherwise>
									<td>0</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${row.vatAmount > 0}">
									<td><fmt:formatNumber value="${row.vatAmount}" pattern="#,###" /></td>
								</c:when>
								<c:otherwise>
									<td>0</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${row.vatTax > 0}">
									<td><fmt:formatNumber value="${row.vatTax}" pattern="#,###" /></td>
								</c:when>
								<c:otherwise>
									<td>0</td>
								</c:otherwise>
							</c:choose>
							<td>${row.vatMemo}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>