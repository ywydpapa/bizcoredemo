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
	<script>
	$(function(){
		$('#custTable').DataTable({
			info:false,
			searching: true
		});
	});

	$(function(){
		$("#btnAdd").click(function(){
			location.href="${path}/cust/write.do "
		});
	});
	</script>

	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						고객/거래처 설정
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->
	<%
	String userRole = "";
		if ((String) session.getAttribute("userRole") != null) {
			userRole = (String) session.getAttribute("userRole");
		}
	%>
	<!--회원리스트 table-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="btn_wr text-right">
					<button class="btn btn-sm btn-primary f-right" type="button" id="btnAdd" onClick="javascript:location='${path}/cust/write.do'">거래처등록</button>
				</div>
					<div class="card-block table-border-style">
						<div class="dt-responsive table-responsive">
							<table id="custTable" class="table table-striped table-bordered nowrap">
								<colgroup>
								<col width="12%" />
								<col width="22%" />
								<col width="11%" />
								<col width="15%" />
								<col width="15%" />
								<col width="15%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">거래처 번호</th>
									<th class="text-center">거래처명</th>
									<th class="text-center">대표자명</th>
									<th class="text-center">사업자번호</th>
									<th class="text-center">거래처이메일</th>
									<th class="text-center">계산서이메일</th>
									<th class="text-center">상세정보</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${list}">
									<tr align="center">
										<td>${row.custNo}</td>
										<td><a
											href="javascript:location='${path}/cust/detail/${row.custNo}'">${row.custName}</a></td>
										<td>${row.custBossname}</td>
										<td>${row.custVatno}</td>
										<td>${row.custEmail}</td>
										<td>${row.custVatemail}</td>
										<td><a
											href="javascript:location='${path}/cust/detail/${row.custNo}'">상세정보</a></td>
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
<jsp:include page="../body-bottom.jsp"/>