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
											<td colspan=5><input type="text" name="netprice"
												id="storeAmount" class="form-control form-control-sm"
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
		<!-- Row end -->
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
			if (list2_code != "-") {
				for (let i = 0; i < list3List.length; i++) {
					if (list3List[i].value.includes(list2_code)) {
						obj.nextElementSibling.value = "-";
						$(list3List[i]).show();
					}
				}
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

			var storeData = {};
			storeData.productNo = $("#productNo").val() * 1;
			storeData.serialNo = $("#serialNo").val();
			storeData.storeType = $("#storeType").val();
			storeData.storeQty = $("#storeQty").val().replaceAll(",", "") * 1;
			storeData.storeUnit = $("#storeUnit").val().replaceAll(",", "") * 1;
			storeData.storeAmount = $("#storeAmount").val().replaceAll(",", "") * 1;
			storeData.locationNo = $("#storeLoc2").val();
			storeData.comment = tinymce.get("comment").getContent();

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
		// 페이지 특화 함수 끝

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
			$
					.ajax(
							{
								type : "get",
								contentType : "application/x-www-form-urlencoded; charset=UTF-8",
								url : '/sderp/product/listAjax'
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
		}

		function setNum(obj) {
			obj.value = obj.value.replace(/[^0-9.]/g, "");
			obj.value = Number(obj.value).toLocaleString();
		}

		function fn_storeUpdate() {
			if ($("#storeQty").val() == 0) {
				alert("상품 수량을 1 이상으로 입력하세요");
			} else if ($("#storeUnit").val() == 0) {
				alert("재고 단위를 1 이상으로 입력하세요");
			} else {
				let storeData = {};
				storeData.storeNo = location.href.split("detail/")[1];
				storeData.serialNo = $("#serialNo").val();
				storeData.storeType = $("#storeType").val();
				storeData.storeAmount = $("#storeAmount").val().replaceAll(",",
						"") * 1;
				storeData.storeQty = $("#storeQty").val().replaceAll(",", "") * 1;
				storeData.storeUnit = $("#storeUnit").val().replaceAll(",", "") * 1;
				storeData.locationNo = $("#storeLoc2").val();
				storeData.comment = tinymce.get("comment").getContent();

				$.ajax({
					url : "${path}/store/update.do",
					data : storeData,
					method : "POST",
					dataType : "json"
				}).done(function(data) {
					if (data.code == 10001) {
						alert("수정 성공");
						var url = '${path}/store/listStore.do';
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

		function fn_storeDelete() {
			let answer = confirm("삭제하시겠습니까?");
			let storeData = {};
			storeData.storeNo = location.href.split("detail/")[1];
			if (answer == true) {
				$.ajax({
					url : "${path}/store/delete.do/",
					data : storeData,
					method : "POST",
					dataType : "json"
				}).done(function(data) {
					if (data.code == 10001) {
						alert("삭제 성공");
						var url = '${path}/store/listStore.do';
						location.href = url;
					} else {
						alert("삭제 실패");
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