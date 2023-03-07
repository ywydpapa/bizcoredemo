<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
					<div class="d-inline">입출고 등록</div>
				</div>
			</div>
		</div>

	</div>
	<div style="margin: 10px 0; display: flex">
		<h6 class="cont_title" style="line-height: 2.5; margin-right: 5px;">
			<i class="icofont icofont-square-right"></i> 입/출고 선택 :
		</h6>
		<select id="storeType" class="form-control form-control-sm"
			style="width: 80px;" onchange="inoutChange(this)">
			<option value="IN">입고</option>
			<option value="OUT">출고</option>
		</select>
	</div>
	<!--Page-header end 페이지 타이틀 -->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst02">
							<colgroup>
							    <col width="20%" />
								<col width="20%" />
								<col width="15%" />
								<col width="5%" />
								<col width="10%" />
								<col width="15%" />
								<col width="15%" />
								<col width="10%" />
							</colgroup>
							<tbody>
								<tr>
								    <th class="text-center">영업기회명</th>
									<th class="text-center">상품명</th>
									<th class="text-center inOutInput">시리얼 번호</th>
									<th class="text-center minQty">수량</th>
									<th class="text-center">금액</th>
									<th class="text-center">위치</th>
									<th class="text-center">비고</th>
									<td class="text-center" rowspan="2" colspan="1">
										<button id="data01Addbtn" class="btn btn-success btn-sm"
											onclick="inoutTablePlus()">추가</button>
									</td>
								</tr>
								<tr>
								<td>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="soppTitle"
										id="soppTitle" value="" readonly /> <input type="hidden"
										name="soppNo" id="soppNo" value="" /> <span
										class="input-group-btn">
										<button class="btn btn-primary sch-opportunity2"
											data-remote="${path}/modal/popup.do?popId=sopp" type="button"
											data-toggle="modal" data-target="#soppModal">
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
													<button type="button" class="btn btn-default waves-effect "
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</td>
									<td><div id="select1" style="width: 100%;">
											<div class="input-group input-group-sm mb-0">
												<input type="hidden" id="productNo" value=""> <input
													type="text" class="form-control" name="product"
													id="data02Title" data-flag="true" value="" readonly="">
												<span class="input-group-btn">
													<button class="btn btn-primary sch-company"
														onclick="fn_productdataTableReload2()" type="button"
														data-toggle="modal" data-target="#productdataModal2">
														<i class="icofont icofont-search"></i>
													</button>
												</span>
											</div>
											<!--모달 팝업-->
											<div class="modal fade" id="productdataModal2" tabindex="-1"
												role="dialog" aria-hidden="true" style="display: none;">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">상품목록</h4>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">×</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="dt-responsive table-responsive">
																<div id="productdataTable2_wrapper"
																	class="dataTables_wrapper dt-bootstrap4 no-footer">
																	<div class="row">
																		<div class="col-xs-12 col-sm-12">
																			<table id="productdataTable2"
																				class="table table-striped table-bordered nowrap dataTable no-footer"
																				role="grid">
																				<thead>
																					<tr role="row">
																						<th class="details-control sorting_asc"
																							rowspan="1" colspan="1" aria-label="-"
																							style="width: 0px;">-</th>
																						<th class="sorting" tabindex="0"
																							aria-controls="productdataTable2" rowspan="1"
																							colspan="1"
																							aria-label="제품코드명: activate to sort column ascending"
																							style="width: 0px;">제품코드명</th>
																						<th class="sorting" tabindex="0"
																							aria-controls="productdataTable2" rowspan="1"
																							colspan="1"
																							aria-label="상품명: activate to sort column ascending"
																							style="width: 0px;">상품명</th>
																						<th class="sorting" tabindex="0"
																							aria-controls="productdataTable2" rowspan="1"
																							colspan="1"
																							aria-label="상품설명(상세): activate to sort column ascending"
																							style="width: 0px;">상품설명(상세)</th>
																						<th class="sorting" tabindex="0"
																							aria-controls="productdataTable2" rowspan="1"
																							colspan="1"
																							aria-label="거래처: activate to sort column ascending"
																							style="width: 0px;">거래처</th>
																						<th class="sorting" tabindex="0"
																							aria-controls="productdataTable2" rowspan="1"
																							colspan="1"
																							aria-label="기본 가격: activate to sort column ascending"
																							style="width: 0px;">기본 가격</th>
																					</tr>
																				</thead>
																			</table>
																		</div>
																	</div>
																	<div class="row">
																		<div class="col-xs-12 col-sm-12 col-md-5"></div>
																	</div>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button"
																class="btn btn-default waves-effect"
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div></td>
									<td><input type="text"
										class="form-control form-control-sm" id="inSerialNo" onkeyup="serialChange(this)" ></input>
										<select id="outStoreNo" class="form-control form-control-sm"
										style="min-width: 80px; display: none"
										onchange="changeMinQty(this);">
											<option></option>
											<c:forEach var='row' items='${storeList}'>
												<c:if test="${row.storeQty > 0}">
													<option class="storeOptions"
														value='${row.productNo}-${row.storeNo}-${row.serialNo}-${row.storeQty}'
														style="display: none;">재고번호 :${row.storeNo},
														시리얼번호:${row.serialNo}(${row.storeQty}개)</option>
												</c:if>
											</c:forEach>
									</select></td>
									<td>
										<div style="display: flex">
											<input type="text" readonly="" id="maxQty"
												class="form-control form-control-sm"
												style="min-width: 80px; display: none; text-align: right;"/>
											<input type="text" id="storeQty"
												class="form-control form-control-sm" value="1"
												style="min-width: 80px; text-align: right;"
												onkeyup="setNum(this)">
										</div>
									</td>
									<td><input type="text" id="storeAmount"
										class="form-control form-control-sm" value="0"
										style="min-width: 80px; text-align: right;"
										onkeyup="setNum(this)"></td>
									<td>
										<!-- loct02 셀렉트 -->
										<div class="inLocationSelect">
											<select onchange="setlist3Options(this)" id="storeLoc1">
												<c:forEach var="list2" items="${list2}">
													<c:if test="${list2.code01 eq 'LOCT01'}">
														<option value="${list2.code02}">${list2.desc02}</option>
													</c:if>
												</c:forEach>
											</select>
											<!-- loct03 셀렉트 -->
											<select id="storeLoc2">
												<c:forEach var="list3" items="${list3}">
													<c:forEach var="list2" items="${list2}">
														<c:if test="${list3.code02 eq list2.code02 && list2.code01 eq 'LOCT01'}">
															<option class="list3Options"
																<c:if test="${list2.code02 != 'LOC201'}" >style="display: none;"</c:if>
																value="${list2.code01}-${list3.code02}-${list3.code03}^${list3.desc03}">${list3.desc03}</option>
														</c:if>
													</c:forEach>
												</c:forEach>
											</select>
										</div>

										<div class="input-group input-group-sm mb-0 outLocationSelect"
											style="display: none;">
											<input type="text" class="form-control" name="custName"
												id="custName" value="" readonly> <input
												type="hidden" name="custNo" id="custNo" value="" /> <span
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
									</td>
									<td><input type="text" id="comment"
										class="form-control form-control-sm" style="min-width: 80px;"></input></td>
								</tr>
							</tbody>
						</table>
						<br />
						<table class="table table-sm bst02" id="inoutlist">
							<colgroup>
								<col width="20%">
								<col width="5%">
								<col width="10%">
								<col width="15%">
								<col width="5%">
								<col width="10%">
								<col width="20%">
								<col width="10%">
								<col width="5%">
							</colgroup>
							<thead>
								<tr>
								    <th class="text-center">영업기회명</th>
									<th class="text-center">구분</th>
									<th class="text-center">상품명</th>
									<th class="text-center inOutInput">시리얼번호</th>
									<th class="text-center">수량</th>
									<th class="text-center">금액</th>
									<th class="text-center">위치</th>
									<th class="text-center">비고</th>
									<th class="text-center">삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr class="itemIn" style="display: none">
								</tr>
								<tr class="itemOut" style="display: none; text-align: right">
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wr text-right mt-3">
						<button class="btn btn-md btn-success f-left"
							onClick="javascript:location='${path}/store/listStore.do'">목록</button>
						<button class="btn btn-md btn-primary"
							onClick="storeInOutInsert()" value="등록">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		// 이벤트 영역 시작
		$('#custModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});

		$('#productCategoryModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		// 이벤트 영역 끝

		// 페이지 특화 함수 시작
		function fnSetCategoryData(a, b) {
			$("#productCategoryNo").val(a);
			$("#productCategoryName").val(b);
			$(".modal-backdrop").remove();
			$("#productCategoryModal").modal("hide");
		}

		function fnSetCustData(a, b) {
			$("#custName").val(a);
			$("#custNo").val(b);
			$(".modal-backdrop").remove();
			$("#custModal").modal("hide");
		}

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

		function necessaryCheck() {
			var rtn = false;
			if ($("#custNo").val() == "") {
				rtn = true;
			} else if ($("#productCategoryName").val() == "") {
				rtn = true;
			} else if ($("#productName").val() == "") {
				rtn = true;
			}
			var defaultPrice = $("#productDefaultPrice").val();
			if (defaultPrice == "") {
				rtn = true;
			} else {
				defaultPrice = defaultPrice.replaceAll(',', '');
				var regex = /[0-9]/g; // 숫자가 아닌 문자열을 선택하는 정규식
				defaultPrice = defaultPrice.replace(regex, ""); // 원래 문자열에서 숫자가 아닌 모든 문자열을 빈 문자로 변경
				if (defaultPrice != '') {
					rtn = true;
				}
			}

			return rtn;
		}

		function fn_productInsert() {
			if (necessaryCheck()) {
				alert("기본정보 탭에 있는 필수값을 입력해주십시오.");
				return false;
			}

			var productData = {};
			//var productCategoryNo = $("#productCategoryNo").val(); // 상품 카테고리 번호
			//if (productCategoryNo != "") {
			//	productData.productCategoryNo = productCategoryNo;
			//}
			//productData.productCategoryName = $("#productCategoryName").val(); // 상품 카테고리 명
			productData.productName = $("#productName").val(); // 상품 명
			var productDefaultPrice = $("#productDefaultPrice").val();
			if (productDefaultPrice.indexOf(',') != -1) {
				productDefaultPrice = productDefaultPrice.replaceAll(',', '');
			}
			productData.productDefaultPrice = Number(productDefaultPrice); // 상품 기본 가격
			productData.productDesc = $("#productDesc").val(); // 상품 설명
			productData.custNo = $("#custNo").val(); // 고객사(외래키)

			if (!productData.custNo) {
				var b = confirm("미등록된 거래처 또는 거래처가 입력되지 않았습니다. \n 간편등록을 진행하시겠습니까?");
				if (b) {
					$("#custSimpleModal").modal('show');
					return false;
				} else {
					return false;
				}
			}

			$.ajax({
				url : "${path}/product/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data : JSON.stringify(productData), // HTTP 요청과 함께 서버로 보낼 데이터
				method : "POST", // HTTP 요청 메소드(GET, POST 등)
				contentType : "application/json",
				dataType : "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
			.done(function(data) {
				if (data.code == 10001) {
					alert("저장 성공");
					var url = '${path}/product/list.do';
					location.href = url;
				} else {
					if (data.msg != '') {
						alert("저장 실패 \n 사유 : " + data.msg);
					} else {
						alert("저장 실패");
					}
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		////////////// store insert 함수 

		function fn_storeInsert() {
			if ($("#productNo").val() == "") {
				alert("상품을 선택하세요");
			} else if ($("#storeQty").val() == 0) {
				alert("상품 수량을 1 이상으로 입력하세요");
			} else if ($("#storeUnit").val() == 0) {
				alert("재고 단위를 1 이상으로 입력하세요");
			} else if ($("#storeType").val() == "IN"
					&& $("#storeLoc2").val() == "") {
				alert("상세 위치를 선택하세요")

			} else {
				var storeData = {};
				storeData.productNo = $("#productNo").val() * 1;
				storeData.serialNo = $("#serialNo").val();
				storeData.storeType = $("#storeType").val();
				storeData.storeQty = $("#storeQty").val() * 1;
				storeData.storeAmount = $("#storeAmount").val().replaceAll(",","") * 1;
				storeData.locationNo = $("#storeLoc2").val();
				storeData.comment = tinymce.get("comment").getContent();
				storeData.storeUnit = $("#storeUnit").val() * 1;

				$.ajax({
					url : "${path}/store/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data : storeData, // HTTP 요청과 함께 서버로 보낼 데이터
					method : "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType : "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
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

		$("#custRegSimple").on("click", function(event) {
			if ($("#custRegSimple_div").is(':visible') == false) {
				$("#custRegSimple_div").show();
				$("#custRegSimple").html("간편등록 취소");
			} else {
				$("#custRegSimple_div").hide();
				$("#custRegSimple").html("간편등록");
			}
		});

		$("#custRegSimple_custName_check").on(
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

		var productdataTable2 = $('#productdataTable2')
				.DataTable(
						{
							info : false,
							searching : true,
							oLanguage : {
								sZeroRecords : "일치하는 데이터가 존재하지 않습니다.",
								sInfo : "현재 _START_ - _END_ / _TOTAL_건",
								slengthMenu : "페이지당 _MENU_ 개씩 보기",
								sInfoEmpty : "데이터 없음",
								sInfoFiltered : "( _MAX_건의 데이터에서 필터링됨 )",
								sSearch : "내부검색 : ",
								sProcessing : '데이터 불러오는중...',
								oPaginate : {
									sFirst : '처음으로',
									sLast : '마지막으로',
									sPrevious : "이전",
									sNext : "다음"
								}
							},
							columns : [ {
								"className" : 'details-control',
								"orderable" : false,
								"data" : null,
								"defaultContent" : ''
							}, {
								data : 'productCategoryName'
							}, {
								data : 'productName'
							}, {
								data : 'productDesc'
							}, {
								data : 'custName'
							}, {
								data : 'productDefaultPrice'
							} ],
							columnDefs : [ {
								"render" : function(data, type, row) {
									// 마우스 올리면 또는 클릭하면 툴팁으로 데이터 상세 표시 ** AJAX로 구현이 필요
									return '<a href="javascript:void(0);" onclick="fnSetproductdata2('
											+ row.productNo
											+ ',\''
											+ data
											+ '\''
											+ ',\''
											+ row.productDefaultPrice
											+ '\')">'
											+ data + '</a>';
								},
								"targets" : 2
							} ]
						});

		var productdataJson;
		function fn_productdataTableReload2() {
			$.ajax({
								type : "get",
								contentType : "application/x-www-form-urlencoded; charset=UTF-8",
								url : '${path}/product/listAjax'
							}).done(function(result) {
						var newData = JSON.parse(result);
						console.dir(newData);
						if (newData.data != "") {
							var arr = JSON.parse(newData.data);
							// 글로벌 변수에 저장한다. 상세보기때 참고할 변수!!
							productdataJson = arr;
							productdataTable2.clear();
							for (var i = 0; i < arr.length; i++) {
								productdataTable2.row.add(arr[i]).draw();
							}
						} else {
							productdataTable2.row.add("데이터 없음").draw();
						}
					})
		}

		function fnSetproductdata2(a, b, c) {
			$("#productNo").val(a);
			$("#data02Title").val(b);
			$("#storeAmount").val((c * 1).toLocaleString());
			$("#productdataModal2").find(".modal-footer button").trigger(
					'click');
			let option = $(".storeOptions");
			$("#storeNo").val("")
			$("#outStoreNo").val("");
			$("#maxQty").val("");
			$(".storeOptions").hide();
			for (let i = 0; i < option.length; i++) {
				if (option[i].value.split("-")[0] == a)
					option[i].setAttribute("style", "display:inline");
			}

		}

		function setNum(obj) {
			obj.value = obj.value.replace(/[^0-9.]/g, "");
			obj.value = Number(obj.value).toLocaleString();
		}

		function inoutTablePlus() {
			let soppNo, soppTitle, productName, storeNo, storeType, storeQty, location, locationNo, comment, locationName, storeAmount, productNo;
			soppNo = $("#soppNo").val();
			soppTitle = $("#soppTitle").val();
			productName = $("#data02Title").val();
			productNo = $("#productNo").val();
			storeQty = $("#storeQty").val();
			storeAmount = $("#storeAmount").val();
			storeType = $("#storeType").val() == "IN" ? "입고" : "출고";
			// 입고인 경우 재고 번호(시리얼 번호)와 위치번호 
			if (storeType == "입고") {
				storeNo = $("#inSerialNo").val();
				location = $("#storeLoc2").val();
				if (location == "" || location == null) {
					locationNo = "";
					locationName = "";
				} else {
					locationNo = location.split("^")[0];
					locationName = location.split("^")[1];
				}
				// 출고인 경우 재고 번호와 거래처 번호 
			} else {
				storeNo = $("#outStoreNo").val();
				locationNo = $("#custNo").val();
				locationName = $("#custName").val();
			}

			comment = $("#comment").val();
   			if(soppNo == "") {
	 		alert("영업기회를 선택하세요");
   			}
			else if (productName == "") {
				alert("상품명을 선택하세요");
			} else if (storeType == "출고" && storeNo == "") {
				alert("재고 종류를 선택하세요");
			} else if (storeQty <= 0) {
				alert("입/출고 수량을 1개 이상으로 설정하세요");
			} else if (storeType == "입고"
					&& ($("#storeLoc2").val() == "" || $("#storeLoc2").val() == null)) {
				alert("입고 상세 위치를 선택하세요");
			} else if (storeType == "출고"
					&& ($("#custName").val() == "" || $("#custName").val() == null)) {
				alert("출고 위치를 선택하세요");
			} else if (storeType =="입고" && $("#inSerialNo").val() != "") { 
					   let serialNo = $("#inSerialNo").val();
					   let productNo = $("#productNo").val(); 
					   
					   let StoreDTO = {}; 
					   
					   StoreDTO.productNo = productNo ;
					   StoreDTO.serialNo = serialNo; 
					   
					   StoreDTO = JSON.stringify(StoreDTO);
					   
					   $.ajax({
						   url :  "${path}/store/checkSerial",
						   method : "post",
						   data : StoreDTO, 
						   contentType : "application/json",
						   dataType : "json",
						   success : (result) => {
							    if(result.result == "failure") {
							        alert("이미 등록된 시리얼번호입니다"); 
							    }  else {
							    	
							    	let html = "";
									html += "<td data-no='"+soppNo+"'>" + soppTitle + "</td>";
									html += "<td>" + storeType + "</td>";
									html += "<td data-no='"+productNo+"''>" + productName + "</td>";
									if (storeType == "출고") {
										html += "<td data-no='"+storeNo+"''>재고번호:"
												+ storeNo.split("-")[1] + " / 시리얼번호:"
												+ storeNo.split("-")[2] + "</td>";
									} else {
										html += "<td>" + storeNo + "</td>";
									}
									html += "<td>" + storeQty + "</td>";
									html += "<td>" + storeAmount + "</td>";
									html += "<td data-no='"+locationNo+"'>" + locationName
											+ "</td>";
									html += "<td>" + comment + "</td>";
									html += "<td><button onclick='deltedData(this)'>삭제</button></td>";
									let target;
									let tr = document.createElement("tr");
									if (storeType == "입고") {
										target = $(".itemIn")[$(".itemIn").length - 1];
										tr.className = "itemIn";
									} else {
										target = $(".itemOut")[$(".itemOut").length - 1];
										tr.className = "itemOut";
									}
									tr.innerHTML = html;
									target.after(tr);
									
									// 초기화 
									$("#soppNo").val("");
									$("#soppTitle").val("");
									$("#productNo").val("");
									$("#data02Title").val("");
									$(".storeOptions").hide();
									$("#custName").val("");
									$("#custNo").val("");
									$("#storeQty").val(1);
									$("#storeAmount").val(0);
									$("#comment").val("");
									$("#inSerialNo").val("");
									$("#outStoreNo").val("");
									if(storeType == "입고") {
											$(".minQty").html("수량");
									} else {
										$(".minQty").html("재고수량/출고수량");
									}
									$("#storeQty").prop("disabled",false);
									$("#storeQty").val(1);
									$("#maxQty").val("");
							    	
							    }
						   }
					   })
					
			} else {
				let html = "";
				html += "<td data-no='"+soppNo+"'>" + soppTitle + "</td>";
				html += "<td>" + storeType + "</td>";
				html += "<td data-no='"+productNo+"''>" + productName + "</td>";
				if (storeType == "출고") {
					html += "<td data-no='"+storeNo+"''>재고번호:"
							+ storeNo.split("-")[1] + " / 시리얼번호:"
							+ storeNo.split("-")[2] + "</td>";
				} else {
					html += "<td>" + storeNo + "</td>";
				}
				html += "<td>" + storeQty + "</td>";
				html += "<td>" + storeAmount + "</td>";
				html += "<td data-no='"+locationNo+"'>" + locationName + "</td>";
				html += "<td>" + comment + "</td>";
				html += "<td><button onclick='deltedData(this)'>삭제</button></td>";
				
				let target;
				let tr = document.createElement("tr");
				if (storeType == "입고") {
					target = $(".itemIn")[$(".itemIn").length - 1];
					tr.className = "itemIn";
				} else {
					target = $(".itemOut")[$(".itemOut").length - 1];
					tr.className = "itemOut";
				}
				tr.innerHTML = html;
				target.after(tr);

				// 초기화 
				$("#soppNo").val("");
				$("#soppTitle").val("");
				$("#productNo").val("");
				$("#data02Title").val("");
				$(".storeOptions").hide();
				$("#custName").val("");
				$("#custNo").val("");
				$("#storeQty").val(1);
				$("#storeAmount").val(0);
				$("#comment").val("");
				$("#inSerialNo").val("");
				$("#outStoreNo").val("");
				if(storeType == "입고") {
						$(".minQty").html("수량");
				} else {
					$(".minQty").html("재고수량 / 출고수량");
				}
				$("#maxQty").val("");
			}

		}

		function deltedData(obj) {
			obj.parentElement.parentElement.remove();
		}

		function storeInOutInsert() {
			let pass = 0;
			let storeDatas = [];
			let eachData;
			for (let i = 1; i < $(".itemIn").length; i++) {
				eachData = {};
				eachData.inoutType = "IN";
				eachData.soppNo = $(".itemIn")[i].children[0].dataset.no;
				eachData.productNo = $(".itemIn")[i].children[2].dataset.no;
				eachData.serialNo = $(".itemIn")[i].children[3].innerHTML;
				eachData.inoutQty = $(".itemIn")[i].children[4].innerHTML;
				eachData.inoutAmount = $(".itemIn")[i].children[5].innerHTML.replaceAll(",", "") * 1;
				eachData.locationNo = $(".itemIn")[i].children[6].dataset.no;
				eachData.comment = $(".itemIn")[i].children[7].innerHTML;
				storeDatas.push(eachData);
			}

			for (let i = 1; i < $(".itemOut").length; i++) {
				eachData = {};
				eachData.inoutType = "OUT"
				eachData.soppNo = $(".itemOut")[i].children[0].dataset.no;
				eachData.productNo = $(".itemOut")[i].children[2].dataset.no;
				eachData.storeNo = $(".itemOut")[i].children[3].dataset.no.split("-")[1];
				eachData.inoutQty = $(".itemOut")[i].children[4].innerHTML;
				eachData.inoutAmount = $(".itemOut")[i].children[5].innerHTML.replaceAll(",", "") * 1;
				eachData.locationNo = $(".itemOut")[i].children[6].dataset.no;
				eachData.comment = $(".itemOut")[i].children[7].innerHTML;
				storeDatas.push(eachData);
			}

			let itemOut = $(".itemOut");

			if (itemOut.length > 0) {
				let array = [];
				
				for (let j = 1; j < itemOut.length; j++) {
					let no, max, sum;

					no = itemOut[j].children[3].dataset.no.split("-")[1];
					max = itemOut[j].children[3].dataset.no.split("-")[3];
					sum = itemOut[j].children[4].innerHTML;

					if (j == 1) {
						array.push({
							"no" : no,
							"max" : max,
							"sum" : sum,
						})
					} else {
						for (let i = 0; i <= array.length - 1; i++) {
							let check = 0;
							let idx = -1;
							let plus = 0;
							let temp = {};
							if (array[i].no == no) {
								check = 1
								idx = i;
							}
							if (check != 1) {
								array.push({
									"no" : no,
									"max" : max,
									"sum" : sum
								})
							} else {
								plus = array[idx].sum;
								plus = plus * 1 + sum * 1;
								array[idx].sum = plus;
							}
						}
					}
				}

				/*for (let i = 0; i < array.length; i++) {
					let msg = "";
					if (array[i].max < array[i].sum) {
						msg += "재고번호 " + array[i].no + " 현수량 " + array[i].max
								+ "개 이상 출고할 수 없습니다";
						pass = -1;
						
						alert(msg);
						
						console.log(array[i].max + "// " + array[i].sum);
					} else {
						storeDatas = JSON.stringify(storeDatas);
						
						$.ajax({
							url : "${path}/store/inOutInsert.do",
							method : "POST",
							data : storeDatas,
							dataType : "json",
							traditional : true,
							contentType : "text/plain",
						}).done(function(result) {
							if (result.code == 10001) {
								alert("등록 성공");
								location.href = "${path}/store/writeInout.do";
							} else {
								alert("등록 실패");
							}
						}) 
						.fail(function(xhr, status, errorThrown) {
							alert("통신 실패");
						});
						
					}
					
				}*/

			}
			

			if (pass != -1) {
				storeDatas = JSON.stringify(storeDatas);
				$.ajax({
					url : "${path}/store/inOutInsert.do",
					method : "POST",
					data : storeDatas,
					dataType : "json",
					traditional : true,
					contentType : "text/plain",
				}).done(function(result) {
					if (result.code == 10001) {
						alert("등록 성공");
						location.href = "${path}/store/writeInout.do";
					} else {
						alert("등록 실패");
					}
				}) 
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
			}
		}

		// 입고 출고 셀렉트 온체인지 이벤트 

		function inoutChange(obj) {
			let inItem = $(".itemIn");
			let outItem = $(".itemOut");
			// 초기화 
			$("#soppNo").val("");
			$("#soppTitle").val("");
			$("#productNo").val("");
			$("#data02Title").val("");
			$(".storeOptions").hide();
			$("#custName").val("");
			$("#custNo").val("");
			$("#storeQty").val(1);
			$("#storeAmount").val(0);
			$("#comment").val("");
			$("#inSerialNo").val("");
			$("#outStoreNo").val("");

			if (obj.value == "IN") {
				$("#inSerialNo").show();
				$("#outStoreNo").hide();
				$(".inLocationSelect").show();
				$(".outLocationSelect").hide();
				$("#maxQty").val("");
				$("#maxQty").hide();
				$(".inOutInput").html("시리얼 번호");
				$(".minQty").html("수량");
			} else {
				$(".inLocationSelect").hide();
				$(".outLocationSelect").show();
				$("#inSerialNo").hide();
				$("#outStoreNo").show();
				$(".inOutInput").html("출고 재고");
				$(".minQty").html("재고수량 / 출고수량");
				$("#maxQty").show();
			}
			for (let i = 1; i < inItem.length; i++) {
				$(inItem[i]).remove();
			}
			for (let i = 1; i < outItem.length; i++) {
				$(outItem[i]).remove();
			}

		}

		function changeMinQty(obj) {
			let min = obj.value;
			let arr = min.split("-").length; 
	 
			min = min.split("-")[arr-1];
			$("#maxQty").val(min);

		}

		function checkMaxQty() {
			let itemOut = $(".itemOut");
			let array = [];

			for (let j = 1; j < itemOut.length; j++) {
				let no, max, sum;

				no = itemOut[j].children[2].dataset.no.split("-")[1];
				max = itemOut[j].children[2].dataset.no.split("-")[3];
				sum = itemOut[j].children[3].innerHTML;

				if (j == 1) {
					array.push({
						"no" : no,
						"max" : max,
						"sum" : sum,
					})
				} else {
					for (let i = 0; i <= array.length - 1; i++) {
						let check = 0;
						let idx = -1;
						let plus = 0;
						let temp = {};
						if (array[i].no == no) {
							check = 1
							idx = i;
						}
						if (check != 1) {
							array.push({
								"max" : max,
								"sum" : sum
							})
						} else {
							plus = array[idx].sum;
							plus = plus * 1 + sum * 1;
							array[idx].sum = plus;
						}
					}
				}
			}

			for (let i = 0; i < array.length; i++) {
				let msg = "";
				if (array[i].max < array[i].sum) {
					msg += "재고번호 " + array[i].no + " 현수량 " + array[i].max
							+ "개 이상 출고할 수 없습니다";
				}
				if (msg != "") {
					alert(msg);
				}
			}
		} 

		$('#soppModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
			
		});
		
		function fnSetSoppData(a, b) {
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		}
		
		// 시리얼 번호 온 체인지 이벤트 
		function serialChange(obj) {
		 let serialNo = obj.value; 
		 if(serialNo != "") {
			 $("#storeQty").val("1"); 
			 $("#storeQty").prop("disabled",true);
			 
		 } else {
			 $("#storeQty").prop("disabled",false);
		 }
		}
	
		
	    
	</script>
</div>
<jsp:include page="../body-bottom.jsp" />