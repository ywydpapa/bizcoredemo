<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp" />
<jsp:include page="../body-top5.jsp" />
<style>
.storeList:hover {
	font-weight: 600;
	cursor: pointer;
}
</style>
<div id="main_content">
	<script>
		$(function() {
			$('#inoutListTable').DataTable({
				info : false,
				searching : true
			});
		});
	</script>

	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">입출고 내역</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->
	<!--재고 리스트  table-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="dt-responsive table-responsive">
						<table id="inoutListTable"
							class="table table-striped table-bordered nowrap dataTable">
							<colgroup>
								<col width="10%" />
								<col width="5%" />
								<col width="5%" />
								<col width="20%" />
								<col width="5%" />
								<col width="20%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />

							</colgroup>
							<thead>
								<tr>
									<th class="text-center">입출고번호</th>
									<th class="text-center">일자</th>
									<th class="text-center">구분</th>
									<th class="text-center">상품명</th>
									<th class="text-center">재고번호</th>
									<th class="text-center">위치</th>
									<th class="text-center">입고</th>
									<th class="text-center">출고</th>
									<th class="text-center">비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${inOutAllList}">
									<tr>
										<td style="text-align: center">${item.inoutNo}</td>
										<td style="text-align: center">${item.regDate}</td>
										<td style="text-align: center"><c:choose>
												<c:when test="${item.inoutType eq 'IN'}">입고</c:when>
												<c:otherwise>출고</c:otherwise>
											</c:choose></td>
										<td>${item.productName}</td>
										<td style="text-align: center">${item.storeNo}</td>
										<c:choose>
											<c:when
												test="${item.locationNo eq '' || item.locationNo eq '-'}">
												<td></td>
											</c:when>
											<c:otherwise>
												<c:forEach var="list2" items="${list2}">
												<c:if test="${fn:split(item.locationNo,'-')[1] eq list2.code02}">
												<td>${list2.desc02}-<c:forEach var="list3" items="${list3}">
												<c:if test="${fn:split(item.locationNo,'-')[2] eq list3.code03}">
												${list3.desc03} 
												</c:if>
											    </c:forEach>
												</td>
													</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${item.inoutType eq 'IN'}">
												<td style="text-align: right">${item.inoutQty}</td>
												<td></td>
											</c:when>
											<c:otherwise>
												<td></td>
												<td style="text-align: right">${item.inoutQty}</td>
											</c:otherwise>
										</c:choose>

										<td>${item.comment}</td>
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


<jsp:include page="../body-bottom.jsp" />