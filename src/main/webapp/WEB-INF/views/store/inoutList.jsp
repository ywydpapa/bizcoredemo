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

	<div class="col-sm-12">
		<div class="card_box sch_it">
			<!--row-->
			<div class="form-group row">
				<!--구분-->
				<div class="col-sm-12 col-xl-2">
					<label class="col-form-label" for="inOutType_Sch">구분</label>
					<div class="input-group input-group-sm mb-0">
						<select id="inOutType_Sch" class="form-control">
							<option></option>
							<option value="IN">입고</option>
							<option value="OUT">출고</option>
						</select>
					</div>
				</div>
				<!--//구분-->
				<!--상품명-->
				<div class="col-sm-12 col-xl-2">
					<label class="col-form-label" for="productName_Sch">상품명</label>
					<div class="input-group input-group-sm">
						<input type="text" class="form-control" id="productName_Sch">
						<input type="hidden" id="productNo" value="">

					</div>
				</div>
				<!--//상품명-->
				<div class="col-sm-12 col-xl-2">
					<label class="col-form-label" for="storeNo_Sch">재고번호</label>
					<div class="input-group input-group-sm mb-0">
						<input type="text" class="form-control" id="storeNo_Sch" onkeyup="setNum2(this)">
					</div>
				</div>
				<div class="col-sm-12 col-xl-2">
					<label class="col-form-label" for="serialNo_Sch">시리얼번호</label>
					<div class="input-group input-group-sm mb-0">
						<input type="text" class="form-control" id="serialNo_Sch">
					</div>
				</div>
			</div>
			<!--//row-->
			<div class="form-group row">
				<div class="col-sm-12 col-xl-3">
					<label class="col-form-label">위치</label>
					<p class="input_inline mb-0">
						<input class="form-control form-control-sm col-xl-12" type="text"
							id="locationNo_Sch" style="width: 100%;">
					</p>
				</div>
				<div class="col-sm-12 col-xl-3">
					<label class="col-form-label">입출고 일자</label>
					<p class="input_inline mb-0">
						<input class="form-control form-control-sm col-xl-6" type="date"
							max="9999-12-30" id="targetDatefrom_Sch"
							onchange="dateChange(this)"> ~ <input
							class="form-control form-control-sm col-xl-6" type="date"
							max="9999-12-31" id="targetDateto_Sch"
							onchange="dateChange(this)">
					</p>
				</div>

			</div>
			<div style="text-align: right;">
				<button class="btn btn-sm btn-primary" onclick="multiSearch()">
					<i class="icofont icofont-search" id="search"></i>검색
				</button>
				<button class="btn btn-sm btn-inverse" onclick="location.href='${path}/store/inOutList.do'"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
			</div>



		</div>
	</div>
	</br>
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="dt-responsive table-responsive">
						<table id="inoutListTable"
							class="table table-striped table-bordered nowrap dataTable">
							<colgroup>
								<col width="5%" />
								<col width="10%" />
								<col width="5%" />
								<col width="20%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="5%" />
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="5%" />


							</colgroup>
							<thead>
								<tr>
									<th class="text-center">입출고번호</th>
									<th class="text-center">일자</th>
									<th class="text-center">구분</th>
									<th class="text-center">상품명</th>
									<th class="text-center">재고번호</th>
									<th class="text-center">시리얼 번호</th>
									<th class="text-center">위치</th>
									<th class="text-center">입고</th>
									<th class="text-center">출고</th>
									<th class="text-center">금액</th>
									<th class="text-center">비고</th>
									<th class="text-center">-</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${inOutAllList}">
									<tr  <c:choose>
										<c:when test="${item.inoutType eq 'OUT'}"> style="background-color:#f6d3cb38;"</c:when>
										<c:when test="${item.inoutType eq 'IN'}"> style="background-color:#f0f8ff2e;"</c:when>
										</c:choose>
										>
										<td style="text-align: center">${item.inoutNo}</td>
										<td style="text-align: center">${item.regDate}</td>
										<c:choose>
											<c:when test="${item.inoutType eq 'IN'}">
												<td
													style="text-align: center; color: blue; font-weight: 600;">입고</td>
											</c:when>
											<c:otherwise>
												<td
													style="text-align: center; color: red; font-weight: 600;">출고</td>
											</c:otherwise>
										</c:choose>
										<td onclick="location.href='${path}/store/inOutDetail/${item.inoutNo}'" >${item.productName}</td>
										<td style="text-align: center">${item.storeNo}</td>
										<td style="text-align: center">${item.serialNo}</td>
										<c:choose>
											<c:when
												test="${(item.locationNo eq '' || item.locationNo eq '-') && item.inoutType eq 'IN'}">
												<td></td>
											</c:when>
											<c:when test="${item.inoutType eq 'OUT'}">
												<td><c:forEach var="custList" items="${custDataList}">
														<c:if test="${item.locationNo eq custList.custNo}">
												${custList.custName}	
											</c:if>
													</c:forEach></td>
											</c:when>

											<c:otherwise>
												<c:forEach var="list2" items="${list2}">
													<c:if
														test="${fn:split(item.locationNo,'-')[1] eq list2.code02}">
														<td>${list2.desc02}-<c:forEach var="list3"
																items="${list3}">
																<c:if
																	test="${fn:split(item.locationNo,'-')[2] eq list3.code03}"> ${list3.desc03}</c:if>
															</c:forEach>
														</td>
													</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${item.inoutType eq 'IN'}">
												<td><input placeholder="${item.inoutQty}"
													style="text-align: right; width: 50px;"
													onkeyup="setNum(this)" type="text" value="${item.inoutQty}"
													class="inoutQty"></input></td>
												<td><input style="text-align: right; width: 50px;"
													type="text" value="0" disabled></input></td>
											</c:when>
											<c:otherwise>
												<td><input style="text-align: right; width: 50px;"
													type="text" value="0" disabled></input></td>
												<td><input placeholder="${item.inoutQty}"
													style="text-align: right; width: 50px;" type="text"
													onkeyup="setNum(this)" value="${item.inoutQty}"
													class="inoutQty"></input></td>
											</c:otherwise>
										</c:choose>
										<td style="text-align: right;"><fmt:formatNumber
												value="${item.inoutAmount}" pattern="#,###" /></td>
										<td>${item.comment}</td>
										<td style="display: flex; justify-content: center;"><button
												data-inoutno="${item.inoutNo}" onclick="doChange(this)">수정</button></td>
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
	function doChange(obj) {

		let inoutType, placeholder, inoutQty, storeNo, inoutNo;
		// 입출고 구분 
		inoutType = $(obj).parent().prev().prev().prev().prev().prev().prev().prev()
				.prev().prev().html();
	
		if (inoutType == "입고") {
			// 입고수량
			inoutQty = $(obj).parent().prev().prev().prev().prev().children()[0].value;
			placeholder = $(obj).parent().prev().prev().prev().prev().children()[0].placeholder
		} else {
			//출고수량
			inoutQty = $(obj).parent().prev().prev().prev().children()[0].value;
			placeholder = $(obj).parent().prev().prev().prev().children()[0]
					.getAttribute("placeholder");
		}

		// 입출고 번호 
		inoutNo = obj.getAttribute("data-inoutNo");

		// 재고 번호 
		storeNo = $(obj).parent().prev().prev().prev().prev().prev().prev().prev()
				.html();

		if (placeholder == inoutQty) {
			alert("수정할 사항이 없습니다")
		} else {

			let inoutData = {};
			inoutData.inoutType = "IN";
			// 입출고 번호 
			inoutData.inoutNo = inoutNo;
			// 재고 번호 
			inoutData.storeNo = storeNo;
			// 수정할 수량 
			if (inoutType == "입고") {
				inoutData.inoutType = "IN";
				inoutData.inoutQty = ((placeholder * -1) + (inoutQty * 1));
			} else {
				inoutData.inoutType = "OUT";
				inoutData.inoutQty = ((placeholder * 1) + (inoutQty * -1)) * -1;
			}
			
			console.log(inoutData); 

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

	function setNum(obj) {
		obj.value = obj.value.replace(/[^0-9.]/g, "");
		$(obj).prop('style', 'color:red;text-align:right;width:50px;');

	}

	function multiSearch() {
		let inOutType, productName, storeNo, serialNo, locationNo, from, to;

		inOutType = $("#inOutType_Sch").val();
		productName = $("#productName_Sch").val();
		storeNo = $("#storeNo_Sch").val();
		serialNo = $("#serialNo_Sch").val();
		locationNo = $("#locationNo_Sch").val();
		from = $("#targetDatefrom_Sch").val();
		to = $("#targetDateto_Sch").val();

		let inOutData = {};

		inOutData.inoutType = inOutType == "" ? null : inOutType;
		inOutData.productName = productName == "" ? null : productName;
		inOutData.storeNo = storeNo == "" ? null : storeNo;
		inOutData.serialNo = serialNo == "" ? null : serialNo;
		inOutData.locationNo = locationNo == "" ? null : locationNo;
		inOutData.from = from == "" ? null : from;
		inOutData.to = to == "" ? null : to;

		let param = "?";
		let paramFirst = true;
		for (variable in inOutData) {
			if (inOutData[variable] != null && inOutData[variable] != 0) {
				if (paramFirst) {
					param = param + variable + "=" + inOutData[variable];
					paramFirst = false;
				} else {
					param = param + "&" + variable + "=" + inOutData[variable];
				}
			}
		}

		if (param == "?") {
			param = "";
		}

		let url = '${path}/store/inOutList.do' + param;
		location.href = url;
	

	}
	
	
	$(document).ready(function() {
		let inOutType, productName, storeNo, serialNo, locationNo, from, to;
		
		inOutType = '${param.inoutType}';
		productName = '${param.productName}';
		storeNo = '${param.storeNo}';
		serialNo = '${param.serialNo}';
		locationNo ='${param.locationNo}';
		from = '${param.from}';
		to = '${param.to}';
		
		if(inOutType != '') $("#inOutType_Sch").val(inOutType);
		if(productName != '')$("#productName_Sch").val(productName);
		if(storeNo != '') $("#storeNo_Sch").val(storeNo);
		if(serialNo != '') 	$("#serialNo_Sch").val(serialNo);
		if(locationNo != '')$("#locationNo_Sch").val(locationNo);
		if(from != '') $("#targetDatefrom_Sch").val(from);
		if(to != '') $("#targetDateto_Sch").val(to);
		
		localStorage.clear();
	});
	


	function dateChange(obj) {
		let from, to;
		if (obj.id == "targetDatefrom_Sch") {
			from = obj;
			to = $(obj).next();
			
			if($(to).val() == "" || $(to).val() < from.value ) {
				$(to).val(from.value); 
			} 
			
		} else {
			to = obj;
			from = $(obj).prev();
			if($(from).val() == "" || $(from).val() > to.value ) {
				$(from).val(to.value); 
			}
		}

	}
	
	
	function setNum2(obj) {
		obj.value = obj.value.replace(/[^0-9.]/g, "");
		
	}

</script>
<jsp:include page="../body-bottom.jsp" />