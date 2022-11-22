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
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						사용자 조회
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--회원리스트 table-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="userTable" class="table table-striped table-bordered nowrap">
							<colgroup>
								<col width="25%"/>
								<col width="25%"/>
								<col width="25%"/>
								<col width="25%"/>
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">아이디</th>
									<th class="text-center">이름</th>
									<th class="text-center">권한</th>
									<th class="text-center">비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${list}">
									<tr align="center">
										<td>${row.userId}</td>
										<td>${row.userName}</td>
										<td><c:if test="${row.userRole eq 'CUSER'}">일반사용자</c:if><c:if test="${row.userRole eq 'ADMIN'}">시스템관리자</c:if><c:if test="${row.userRole eq 'PUSER'}">업무관리자</c:if><c:if test="${row.userRole eq 'DUSER'}">데모사용자</c:if></td>
										<td><a href="javascript:location='${path}/user/view.do?userNo=${row.userNo}'">상세보기</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//table-->
	<script>
	$(function(){
		$('#userTable').DataTable({
			info:false,
			searching: true,
			pageLength: 10 // 한 페이지에 기본으로 보열줄 항목 수
		});
	});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>