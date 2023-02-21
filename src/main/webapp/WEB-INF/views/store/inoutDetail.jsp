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
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">입출고 내역 상세 조회</div>
				</div>
			</div>

		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->


	<div class="cnt_wr">
		<!-- Row start -->
		<div class="row">
			<div class="col-lg-12 col-xl-12">
				<!-- Nav tabs -->



				<table class="table table-sm bst02">
					<colgroup>
						<col width="25%" />
						<col width="75%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="requiredTextCss">입출고번호</th>
							<td>
								<div class="input-group input-group-sm mb-0"> 
									<input type="text" class="form-control"  id="inoutNo" value="${detail.inoutNo}" disabled>
								</div>
							</td>
						</tr>
							<tr>
							<th scope="row" class="requiredTextCss">구분</th>
							<td>
								<div class="input-group input-group-sm mb-0"> 
									<input type="text" class="form-control" id="inoutType" 
									<c:choose>
									<c:when test="${detail.inoutType eq 'IN'}">value="입고"</c:when>
									<c:otherwise>value="출고"</c:otherwise>
									</c:choose>
									disabled>
								</div>
							</td>
						</tr>
							<tr>
							<th scope="row" class="requiredTextCss">상품명</th>
							<td>
								<div class="input-group input-group-sm mb-0"> 
									<input type="text" class="form-control" id="productName" value="${detail.productName}" data-no="${detail.productNo}" disabled>
									</div>
							</td>
						</tr>
							<tr>
							<th scope="row" class="requiredTextCss">재고번호</th>
							<td>
								<div class="input-group input-group-sm mb-0"> 
									<input type="text" class="form-control" id="storeNo" value="${detail.storeNo}" disabled>
									</div>
							</td>
						</tr>
							<tr>
							<th scope="row" class="requiredTextCss">시리얼번호</th>
							<td>
								<div class="input-group input-group-sm mb-0"> 
									<input type="text" class="form-control" id="serialNo" value="${detail.serialNo}" disabled>
									</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="requiredTextCss">위치</th>
							<td><c:choose>
							<c:when test="${detail.inoutType eq 'IN'}">
								<div class="inLocationSelect"> 
									<select onchange="setlist3Options(this)" id="storeLoc1">
											<c:forEach var="list2" items="${list2}">
												<c:if test="${list2.code01 eq 'LOCT01'}">
													<option value="${list2.code02}"   
													
													<c:if test="${list2.code02 eq fn:split(detail.locationNo,'-')[1] }">selected</c:if>
													
													
			
													>${list2.desc02}</option>
												</c:if>
											</c:forEach>
									</select> 
									<!-- loct03 셀렉트 --> 
									<select id="storeLoc2">
											<c:forEach var="list3" items="${list3}">
												<c:forEach var="list2" items="${list2}">
													<c:if
														test="${list3.code02 eq list2.code02 && list2.code01 eq 'LOCT01'}">
														<option class="list3Options" 
														<c:if test="${list2.code02 != fn:split(detail.locationNo,'-')[1]}" >style="display: none;"</c:if>
														<c:if test="${list3.code03 eq fn:split(detail.locationNo,'-')[2] }">selected</c:if>
														
														
															value="${list2.code01}-${list3.code02}-${list3.code03}^${list3.desc03}">${list3.desc03}</option>
													</c:if>
												</c:forEach>
											</c:forEach>
									</select></div></c:when>
									<c:otherwise>
									
									
									<div class="input-group input-group-sm mb-0 outLocationSelect">
											<input type="text" class="form-control" name="custName"
												id="custName" 
												<c:forEach var="custList" items="${custDataList}">
												<c:if test="${detail.locationNo eq custList.custNo}">
												value="${custList.custName}" readonly </c:if>
												</c:forEach>
												>
												
												<input type="hidden" name="custNo" id="custNo" <c:forEach var="custList" items="${custDataList}">
												<c:if test="${detail.locationNo eq custList.custNo}">
												value="${custList.custNo}" readonly </c:if>
												</c:forEach>><span
												class="input-group-btn">
												<button class="btn btn-primary sch-company"
													data-remote="${path}/modal/popup.do?popId=cust"
													type="button" data-toggle="modal" data-target="#custModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="custModal" tabindex="-1"
												role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">출고 위치</h4>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
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
									
									</c:otherwise>
									</c:choose>
							</td>
						</tr>
							<tr>
							<th scope="row" class="requiredTextCss">수량</th>
							<td>
								<div class="input-group input-group-sm mb-0"> 
									<input type="text" class="form-control" id="inoutQty" placeholder="${detail.inoutQty}" value="<fmt:formatNumber value="${detail.inoutQty}" pattern="#,###"/>">
									</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="requiredTextCss">금액</th>
							<td>
								<div class="input-group input-group-sm mb-0"> 
									<input type="text" class="form-control" id="inoutAmount" value="<fmt:formatNumber value="${detail.inoutAmount}" pattern="#,###"/>">
									</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="requiredTextCss">비고</th>
							<td>
								<div class="input-group input-group-sm mb-0"> 
									<input type="text" class="form-control" id="comment" value="${detail.comment}">
									</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn_wr text-right mt-3">
					<button class="btn btn-md btn-success f-left"
						onclick="javascript:location='${path}/store/inOutList.do'">목록</button>
						<button class="btn btn-md btn-primary f-right" onclick="doChange2()"
						>수정</button>
				</div>
			</div>
		</div>
		<!-- Row end -->
	</div>

</div>
<jsp:include page="../body-bottom.jsp" />

<script>
$('#custModal').on('show.bs.modal', function(e) {
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


$("#custRegSimple").on("click", function(event) {
	if ($("#custRegSimple_div").is(':visible') == false) {
		$("#custRegSimple_div").show();
		$("#custRegSimple").html("간편등록 취소");
	} else {
		$("#custRegSimple_div").hide();
		$("#custRegSimple").html("간편등록");
	}
});

$("#custRegSimple_custName_check")
		.on(
				"click",
				function(event) {
					var custRegSimple_custName = $(
							"#custRegSimple_custName").val();
					var obj = new Object();
					obj.custName = custRegSimple_custName;
					$
							.ajax({
								url : "${path}/cust/custNameCheck", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
								data : obj, // HTTP 요청과 함께 서버로 보낼 데이터
								method : "POST", // HTTP 요청 메소드(GET, POST 등)
								dataType : "json" // 서버에서 보내줄 데이터의 타입
							})
							// HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
							.done(
									function(data) {
										console.dir(data);
										if (data.code == 10001) {
											console.log("응답 성공");
											var html = "";
											if (data.result1.length > 0) {
												var tempArr = data.result1;
												html += "같은 결과) \n";
												for (var i = 0; i < tempArr.length; i++) {
													html += "번호 : "
															+ tempArr[i].custNo
															+ " / 매출처 : "
															+ tempArr[i].custName
															+ "\n";
												}
											}

											if (data.result2.length > 0) {
												var tempArr = data.result2;
												html += "\n유사 결과) \n";
												for (var i = 0; i < tempArr.length; i++) {
													html += "번호 : "
															+ tempArr[i].custNo
															+ " / 매출처 : "
															+ tempArr[i].custName
															+ "\n";
												}
											}

											if (data.result1.length == 0
													&& data.result2.length == 0) {
												html += "일치검색, 유사검색결과가 존재하지 않습니다.\n";
											}

											html += "\n등록하시겠습니까?";
											var result = confirm(html);

											if (result) {
												console.log("등록진행");
											} else {
												console.log("등록거부");
											}
										} else {
											alert("응답 실패");
										}
									}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
							.fail(function(xhr, status, errorThrown) {
								alert("통신 실패");
							});
				});

$("#custRegSimple_custName_register").on(
		"click",
		function(event) {
			var custRegSimple_custName = $("#custRegSimple_custName")
					.val();
			var custRegSimple_custMemerName = $(
					"#custRegSimple_custMemerName").val();

			var obj = new Object();
			obj.custName = custRegSimple_custName;
			obj.custMemberName = custRegSimple_custMemerName;

			$.ajax({
				url : "${path}/cust/simpleRegister", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data : obj, // HTTP 요청과 함께 서버로 보낼 데이터
				method : "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType : "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(result) {
				console.dir(result);
				if (result.code == 10001) {
					alert("저장 성공");
					$('#custModal').modal('hide');
					$("#custName").val(result.data.custName);
					$("#custNo").val(result.data.custNo);
				} else {
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		});


function setlist3Options(obj) {
	// list 2 코드 
	let list2_code = obj.value;
	let list3List = $(".list3Options");
	$(".list3Options").hide();
	if (list2_code != "") {
		for (let i = 0; i < list3List.length; i++) {
			if (list3List[i].value.includes(list2_code)) {
				obj.nextElementSibling.value = "-";
				$(list3List[i]).show();
			}
		}
	} else {
		obj.nextElementSibling.value = "";
	}
} 


function doChange2() {

	let inoutType, storeNo, inoutNo, inoutQty, placeholder ,comment, inoutAmount;
	// 입출고 구분 
     inoutType = $("#inoutType").val();
	 storeNo = $("#storeNo").val();
	 inoutNo = $("#inoutNo").val(); 
     inoutQty = $("#inoutQty").val();
     placeholder = $("#inoutQty").attr("placeholder");
     inoutAmount = $("#inoutAmount").val(); 
     comment = $("#comment").val();

   
		let inoutData = {}; 	
		
		if(inoutType == "입고") {
			inoutData.inoutType = "IN";
			inoutData.inoutQty = ((placeholder * -1) + (inoutQty * 1));
			inoutData.locationNo = $("#storeLoc2").val().split("^")[0];
		} else {
			inoutData.inoutType = "OUT";
			inoutData.inoutQty = ((placeholder * 1) + (inoutQty * -1)) * -1;
			inoutData.locationNo = $("#cusNo").val();
		}
		
		inoutData.inoutNo = inoutNo*1;
		inoutData.storeNo = storeNo*1;
		inoutData.inoutAmount = inoutAmount.replaceAll(",","");
		inoutData.comment = comment; 
	
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




</script>