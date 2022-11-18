<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
	
			<div class="page-header2">
				<div class="row align-items-end">
					<div class="col-lg-12">
						<div class="page-header-title">
							<div class="d-inline">
								업무일지 조회
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Page-header end 페이지 타이틀 -->
			<!--일정조회-->
		<div class="cnt_wr" id="list-container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="soppTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="25%">
								<col width="25%">
								<col width="25%">
								<col width="25%">
							</colgroup>
							<thead>
							<tr>
								<th class="text-center">부서</th>
								<th class="text-center">성명</th>
								<th class="text-center">생성주차</th>
								<th class="text-center">해당주차 생성여부</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${mlist}">
							<tr>
								<td class="text-center">${row.org_title}</td>
								<td class="text-center">${row.userName}</td>
								<td class="text-center">${row.weekNum}</td>
								<td class="text-center">
								<c:if test="${not empty row.sreportNo}"><a href="javascript:fnSetDetailReport(${row.userNo}, ${row.sreportNo})">O</a></c:if>
								<c:if test="${empty row.sreportNo}">X</c:if></td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<script>
function fnSetDetailReport(userNo, sreportNo) {
	var url = '${path}/sched/detailMreport/'+sreportNo+'?userNo='+userNo;
	console.log(url);
	history.pushState(null, null, url);
	location.replace(url);
}
</script>
<jsp:include page="../body-bottom.jsp"/>