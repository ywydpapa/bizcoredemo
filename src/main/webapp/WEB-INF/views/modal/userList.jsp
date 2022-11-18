<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
	<table id="userDataTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>사용자번호</th>
				<th>사용자명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.userNo}</td>
					<td><a
						href="javascript:fnSetUserData('${row.userNo}','${row.userName}');">${row.userName}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
$(function(){
    $('#userDataTable').DataTable({
    	info:false,
		searching: true
    });
});
</script>