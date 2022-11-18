<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
	<table id="productDataTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>상품설명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.productNo}</td>
					<td><a
						href="javascript:fnSetProductData('${row.productName}','${row.productNo}');">${row.productName}</a></td>
					<td>${row.productDesc}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
$(function(){
    $('#productDataTable').DataTable({
    	info:false,
		searching: true
    });
});
</script>

