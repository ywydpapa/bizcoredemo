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
</style>


<div id="main_content">
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">입출고 상세 조회</div>
				</div>
			</div>
		</div>
	</div>                 
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst02"
							data-select2-id="select2-data-11-urce">
							<colgroup>
								<col width="5%">
								<col width="15%">
								<col width="5%">
								<col width="15%">
								<col width="5%">
								<col width="15%">
								<col width="5%">
								<col width="15%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">일자</th>
									<td colspan="1"><input type="text" id="regDate"
										style="background-color: white; border: none;"
										class="form-control form-control-sm" value="${detail.regDate}"
										readonly=""></td>
									<th colspan="1" scope="row">입출고 번호</th>
									<td colspan="5"><input type="text" id="inoutNo"
										style="background-color: white; border: none;"
										class="form-control form-control-sm" value="${detail.inoutNo}"
										readonly=""></td>
								</tr>
								<tr>
									<th scope="row">구분</th>
									<td><input type="text" id="inoutType" class="form-control form-control-sm" readonly=""
										<c:choose>
			                              <c:when test="${detail.inoutType eq 'IN'}">style="background-color: white; border: none; color:blue; font-weight:bold;" value="입고"</c:when>
			                              <c:otherwise> style="background-color: white; border: none; color:red;font-weight:bold;" value="출고"</c:otherwise>
			                              </c:choose>>
                             		</td>
									<th>상품명</th>
									<td><input style="background-color: white; border: none;"
										type="text" id="productName" readonly=""
										class="form-control form-control-sm"
										value="${detail.productName}"></td>
									<th>재고번호</th>
									<td><input style="background-color: white; border: none;"
										type="text" id="storeNo" readonly=""
										class="form-control form-control-sm" value="${detail.storeNo}">
									</td>
									<th>시리얼번호</th>
									<td><input style="background-color: white; border: none;"
										type="text" id="serialNo" readonly=""
										class="form-control form-control-sm"
										value="${detail.serialNo}"></td>
								</tr>
								<tr data-select2-id="select2-data-10-xi2s">
									<th scope="row">영업기회</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="soppTitle"
												id="soppTitle" value="${detail.soppTitle}" readonly /> <input
												type="hidden" name="soppNo" id="soppNo"
												value="${detail.soppNo}" /> <span class="input-group-btn">
												<button class="btn btn-primary sch-opportunity2"
													data-remote="${path}/modal/popup.do?popId=sopp"
													type="button" data-toggle="modal" data-target="#soppModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="soppModal" tabindex="-1"
												role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title"></h4>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>영업기회목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button"
																class="btn btn-default waves-effect "
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<th scope="row">위치</th>
									<c:choose>
										<c:when test="${detail.inoutType eq 'IN'}">
											<td><select onchange="setlist3Options(this)"
												id="storeLoc1">
													<c:forEach var="list2" items="${list2}">
														<c:if test="${list2.code01 eq 'LOCT01'}">
															<option value="${list2.code02}"
																<c:if test="${fn:split(detail.locationNo,'-')[1] eq list2.code02}"> 
																 selected
                                       </c:if>>${list2.desc02}</option>
														</c:if>
													</c:forEach>
											</select> <select id="storeLoc2">
													<c:forEach var="list3" items="${list3}">
														<c:forEach var="list2" items="${list2}">
															<c:if
																test="${list3.code02 eq list2.code02 && list2.code01 eq 'LOCT01'}">
												 	<option class="list3Options"
																	<c:if test="${list3.code03 eq fn:split(detail.locationNo,'-')[2]}">
                                           selected
                                           </c:if>
																	<c:if test="${list3.code02 != fn:split(detail.locationNo,'-')[1]}">
                                           style="display: none;"
                                           </c:if>
																	value="${list2.code01}-${list3.code02}-${list3.code03}">${list3.desc03}</option>
															</c:if>
														</c:forEach>
													</c:forEach>
											</select></td>
										</c:when>
										<c:otherwise>
											<td>
												<div
													class="input-group input-group-sm mb-0 outLocationSelect">
													<input type="text" class="form-control" name="custName"
														id="custName"
														<c:forEach var="item" items="${custDataList}">
                                    <c:if test="${detail.locationNo eq item.custNo}">
                                    value="${item.custName}" 
                                    </c:if>
                                    </c:forEach>
														readonly> <input type="hidden" name="custNo"
														id="custNo"
														<c:forEach var="item" items="${custDataList}">
                                    <c:if test="${detail.locationNo eq item.custNo}">
                               		value="${item.custNo}" 
                                    </c:if>
                                    </c:forEach> />
													<span class="input-group-btn">
														<button class="btn btn-primary sch-company"
															data-remote="${path}/modal/popup.do?popId=cust"
															type="button" data-toggle="modal"
															data-target="#custModal">
															<i class="icofont icofont-search"></i>
														</button>
													</span>
													<div class="modal fade " id="custModal" tabindex="-1"
														role="dialog">
														<div class="modal-dialog modal-80size" role="document">
															<div class="modal-content modal-80size">
																<div class="modal-header">
																	<h4 class="modal-title">출고 위치</h4>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<h5>위치목록</h5>
																	<p>Loading!!!</p>
																</div>
																<div class="modal-footer">
																	<button type="button"
																		class="btn btn-default waves-effect "
																		data-dismiss="modal">Close</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
										</c:otherwise>
									</c:choose>
									<th scope="row">수량</th>
									<td><input type="text" id="inoutQty"
										onkeyup="setNum(this)" class="form-control form-control-sm"
										placeholder="${detail.inoutQty}" value="${detail.inoutQty}"></td>
									<th scope="row">금액</th>
									<td><input type="text" id="inoutAmount"
										onkeyup="setNum(this)" class="form-control form-control-sm"
										value="<fmt:formatNumber value="${detail.inoutAmount}" pattern="#,###"/>"></td>
								</tr>
								<tr>
									<th scope="row">비고</th>
									<td colspan="7"><textarea name="comment" id="comment"
											rows="8" class="form-control">${detail.comment}</textarea>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wr text-right mt-3">
						<button class="btn btn-md btn-success f-left"
							onClick="javascript:location='${path}/store/inOutList.do'">목록</button>
						<button class="btn btn-md btn-primary" onclick="doChange()">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$('#custModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		$('#soppModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));

		});

		function fnSetCustData(a, b) {
			$("#custName").val(a);
			$("#custNo").val(b);
			$(".modal-backdrop").remove();
			$("#custModal").modal("hide");
		}
		
		function fnSetSoppData(a, b) {
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		} 
		
		function setNum(obj) {
			obj.value = obj.value.replace(/[^0-9.]/g, "");
			obj.value = Number(obj.value).toLocaleString();
		}

		
		// 입고시 위치 관련 코드 
		function setlist3Options(obj) {
			// list 2 코드 
			let list2_code = obj.value;
			let list3List = $(".list3Options");
			$(".list3Options").hide();
			if (list2_code != "-") {
				for (let i = 0; i < list3List.length; i++) {
					if (list3List[i].value.includes(list2_code)) {
						obj.nextElementSibling.value = "-";
						$(list3List[i]).show();
					}
				}
			}
		}

		function fn_storeInsert() {
			if ($("#productNo").val() == "") {
				alert("상품을 선택하세요");
			} else if ($("#storeQty").val() == 0) {
				alert("상품 수량을 1 이상으로 입력하세요");
			} else if ($("#storeUnit").val() == 0) {
				alert("재고 단위를 1 이상으로 입력하세요");
			} else {
				var storeData = {};
				storeData.productNo = $("#productNo").val() * 1;
				storeData.serialNo = $("#serialNo").val();
				storeData.storeType = $("#storeType").val();
				storeData.storeQty = $("#storeQty").val() * 1;
				storeData.storeAmount = $("#storeAmount").val().replaceAll(",",
						"") * 1;
				storeData.locationNo = $("#storeLoc2").val();
				storeData.comment = tinymce.get("comment").getContent();
				storeData.storeUnit = $("#storeUnit").val() * 1;

				$.ajax({
					url : "${path}/store/insert.do", 
					data : storeData, 
					method : "POST", 
					dataType : "json" 
				}) 
				.done(function(data) {
					if (data.code == 10001) {
						alert("저장 성공");
						var url = '${path}/store/listStore.do';
						location.href = url;
					} else {
						if (data.msg != '') {
							alert("등록 실패 \n 사유 : " + data.msg);
						} else {
							alert("등록 실패");
						}
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
			}
		}

	
		// 수량 변경 함수 
		function doChange() {
			let storeNo, inoutNo, inoutType, serialNo, locationNo, placeholder, inoutQty, inoutAmount, comment;

			let inoutData = {};
			inoutType = $("#inoutType").val() == "입고" ? "IN" : "OUT";
			inoutData.inoutType = inoutType;
			placeholder = $("#inoutQty").attr("placeholder");
			inoutQty = $("#inoutQty").val();
			storeNo = $("#storeNo").val();
			inoutNo = $("#inoutNo").val();
			comment = tinymce.get("comment").getContent();

			if (inoutType == "IN") {
				inoutData.inoutQty = ((placeholder * -1) + (inoutQty * 1));
				inoutData.locationNo = $("#storeLoc2").val();
			} else {
				inoutData.inoutQty = ((placeholder * 1) + (inoutQty * -1)) * -1;
				inoutData.locationNo = $("#custNo").val();
			}
			inoutData.soppNo = $("#soppNo").val();
			inoutData.serialNo = $("#serialNo").val();
			inoutData.inoutAmount = $("#inoutAmount").val().replaceAll(",", "");
			inoutData.storeNo = storeNo;
			inoutData.inoutNo = inoutNo;
			inoutData.comment = comment;

			if (inoutType == "IN" && $("#storeLoc2").val() == null) {
				alert("상세 위치를 선택하세요");
			} else {
				$.ajax({
					url : "${path}/store/inOutUpate.do",
					data : inoutData,
					method : "POST",
					dataType : "json"
				}).done(function(data) {
					if (data.code == 10001) {
						alert("수정 성공");
						var url = '${path}/store/inOutList.do';
						location.href = url;
					} else {
						alert("수정 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
			}
		}

		
	</script>
</div>
<jsp:include page="../body-bottom.jsp" />