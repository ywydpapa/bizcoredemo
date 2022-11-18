<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
	<table id="productGoodsDataTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>상품 카테고리번호</th>
				<th>상품 카테고리명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.productCategoryNo}</td>
					<td><a
						href="javascript:fnSetCategoryData('${row.productCategoryNo}','${row.productCategoryName}');">${row.productCategoryName}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
$(function(){
    $('#productGoodsDataTable').DataTable({
    	info:false,
		searching: true
    });
});
</script>