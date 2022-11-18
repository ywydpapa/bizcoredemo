<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
	<table id="soppDataTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>영업기회번호</th>
				<th>영업기회명</th>
				<th>거래처명</th>
				<th>담당자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.soppNo}</td>
					<td><a
						href="javascript:fnSetSoppData('${row.soppTitle}','${row.soppNo}','${row.userNo}','${row.custNo}');" title="${row.soppTitle}">${row.soppTitle}</a></td>
					<td title="${row.custName}">${row.custName}</td>
					<td>${row.userName}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<style>
	#soppTable > tbody > tr > td:nth-child(1){
		max-width: 75px;
	}
	#soppTable > tbody > tr > td:nth-child(2){
		text-overflow: ellipsis;
		max-width: 250px;
		overflow: hidden;
	}
	#soppTable > tbody > tr > td:nth-child(3){
		text-overflow: ellipsis;
		max-width: 150px;
		overflow: hidden;
	}
	#soppTable > tbody > tr > td:nth-child(4){
		text-overflow: ellipsis;
		max-width: 70px;
		overflow: hidden;
	}
</style>
<script>
$(function(){
    $('#soppDataTable').DataTable({
    	info:false,
		searching: true
    });
});
</script>

