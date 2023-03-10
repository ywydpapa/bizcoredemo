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
.miniTable {
	border: 2px solid;
}

.miniTable>tbody>tr>td {
	text-align: center;
}

td.details-control {
	background: url('/assets/images/details_open.png') no-repeat center
		center;
	cursor: pointer;
}

tr.shown td.details-control {
	background: url('/assets/images/details_close.png') no-repeat center
		center;
}

#productdataTable2>tbody>tr>td>a {
	text-decoration: underline;
}

th {
	text-align: center;
}
</style>

<div id="main_content">
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">재고 상세 조회</div>
				</div>
			</div>

		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<div class="cnt_wr">
		<!-- Row start -->
		<div class="row">
			<div class="col-lg-12 col-xl-12">
				<div class="tab-content tabs m-t-20">
					<div class="tab-pane active" id="tab01" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<table class="table table-sm bst02">
									<colgroup>
										<col width="10%" />
										<col width="20%" />
										<col width="10%" />
										<col width="30%" />
										<col width="10%" />
										<col width="20%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="requiredTextCss">재고 번호</th>
											<td colspan=5><input type="text" name="netprice" id="storeAmount" 
												class="form-control form-control-sm" 
												value="<fmt:formatNumber value="${inoutList[0].storeNo}" pattern="#,###"/>"
												style="text-align: left;" onkeyup="setNum(this)"></td>
										</tr>
										<tr>
											<th scope="row" class="requiredTextCss">상품명</th>
											<td>
												<div id="select1" style="width: 100%;">
													<div class="input-group input-group-sm mb-0">
														<input type="hidden" id="productNo" value=""> <input
															type="text" class="form-control" name="product"
															id="data02Title" data-flag="true"
															value="${inoutList[0].productName}" readonly="">
													</div>
												</div>
											</td>
											<th scope="row" class="requiredTextCss">시리얼 번호</th>
											<td><input type="text" name="netprice" id="storeAmount"
												class="form-control form-control-sm"
												value="${inoutList[0].serialNo}" style="text-align: left;"
												onkeyup="setNum(this)"></td>
											<th scope="row" class="requiredTextCss">재고 수량</th>
											<td><input type="text" name="storeqty" id="storeQty"
												class="form-control form-control-sm"
												<c:forEach var="row" items="${inoutList}">
												<c:choose>
												   <c:when test="${row.inoutType eq 'IN' }"><c:set var="total" value ="${total + row.inoutQty}"/></c:when> 
												   <c:otherwise ><c:set var="total" value ="${total - row.inoutQty}"/></c:otherwise> 
												   </c:choose> 
                                                   </c:forEach>
												value="<fmt:formatNumber value="${total}" pattern="#,###"/>"
												style="text-align: right;" onkeyup="setNum(this)"></td>
										</tr>
										<tr>
											<th scope="row">비고</th>
											<td colspan=5><textarea name="comment" id="comment"
													rows="8" class="form-control">${dtoList[0].comment}</textarea></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				
					<div style="margin: 10px 0; display: flex">
						<h6 class="cont_title"
							style="line-height: 2.5; margin-right: 5px;">
							<i class="icofont icofont-square-right"></i> 입/출고 내역
						</h6>
					</div>
					<div class="tab-pane active" id="tab03" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<table id="inoutDataTable" class="table table-sm bst02">
									<colgroup>
									   <col width="15%" />
										<col width="5%" />
										<col width="10%" />
										<col width="10%" />
										<col width="5%" />
										<col width="10%" />
										<col width="15%" />
										<col width="5%" />
										<col width="5%" />
										<col width="10%" />
										<col width="10%" />
									</colgroup>
									<thead>
										<tr>
											<th class="text-center">영업기회명</th>
											<th class="text-center">구분</th>
											<th class="text-center">일자</th>
											<th class="text-center">상품명</th>
											<th class="text-center">재고 번호</th>
											<th class="text-center">시리얼번호</th>
											<th class="text-center">위치</th>
											<th class="text-center">입고수량</th>
											<th class="text-center">출고 수량</th>
											<th class="text-center">금액</th>
											<th class="text-center">비고</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${inoutList}">
											<tr align="center" class="storeList"
												<c:if test="${row.inoutType eq 'OUT'}"> style="background-color:#f6d3cb38;"</c:if>>
												<td>${row.soppTitle}</td>
												<c:choose>
													<c:when test="${row.inoutType eq 'IN'}">
														<td style="color: blue; font-weight: 600;">입고</td>
													</c:when>
													<c:when test="${row.inoutType eq 'OUT'}">
														<td style="color: red; font-weight: 600;">출고</td>
													</c:when>
												</c:choose>
												<td>${row.regDate}</td>
												<td>${row.productName}</td>
												<td>${row.storeNo}</td>
												<td>${row.serialNo}</td>
												<c:choose>
													<c:when
														test="${(row.locationNo eq '' || row.locationNo eq '-') && row.inoutType eq 'IN'}">
														<td></td>
													</c:when>
													<c:when test="${row.inoutType eq 'OUT'}">
														<td><c:forEach var="custList" items="${custDataList}">
																<c:if test="${row.locationNo eq custList.custNo}">
												${custList.custName}	
											</c:if>
															</c:forEach></td>
													</c:when>
													<c:otherwise>
														<c:forEach var="list2" items="${list2}">
															<c:if
																test="${fn:split(row.locationNo,'-')[1] eq list2.code02}">
																<td>${list2.desc02}-<c:forEach var="list3"
																		items="${list3}">
																		<c:if
																			test="${fn:split(row.locationNo,'-')[2] eq list3.code03}">
												${list3.desc03} 
												</c:if>
																	</c:forEach>
																</td>
															</c:if>
														</c:forEach>
													</c:otherwise>
												</c:choose>

												<c:choose>
													<c:when test="${row.inoutType eq 'IN'}">
														<td>${row.inoutQty}</td>
														<td></td>
													</c:when>
													<c:otherwise>
														<td></td>
														<td>${row.inoutQty}</td>
													</c:otherwise>
												</c:choose>
												<td style="text-align: right;"><fmt:formatNumber
														value="${row.inoutAmount}" pattern="#,###" /></td>
												<td>${row.comment}</td>
											</tr>
										</c:forEach>
										<tr align="center" class="storeList"
											style="background-color: cornsilk; font-weight: 600;">
											<td colspan="7">재고 수량</td>
											<td colspan="2">${total}</td>
											<td colspan="2"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="btn_wr text-right mt-3">
					<button class="btn btn-md btn-success f-left"
						onclick="javascript:location='${path}/store/listStore.do'">목록</button>
				</div>
			</div>
		</div>
	

<jsp:include page="../body-bottom.jsp" />