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
						상품 등록
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst02">
							<colgroup>
								<col width="25%" />
								<col width="75%"/>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="requiredTextCss">공급사</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="product" id="custName" value="" readonly/>
											<input type="hidden" name="product" id="custNo" value="" />
											<span class="input-group-btn">
												<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=cust" type="button" data-toggle="modal" data-target="#custModal"><i class="icofont icofont-search"></i></button>
											</span>
										</div>
										<!--모달 팝업-->
										<div class="modal fade" id="custModal" tabindex="-1" role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title">거래처검색</h4>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>거래처목록</h5>
														<p>거래처 목록이 불러오는 중이거나 없습니다.</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default waves-effect" onclick="$('#custModal').modal('hide');">Close</button>
														<button type="button" class="btn btn-success waves-effect" id="custRegSimple">간편추가</button>
													</div>
													<div style="display: none; border: solid; width: 80%; margin: auto; margin-bottom: 5px;" id="custRegSimple_div">
														<table>
															<colgroup>
																<col width="10%">
																<col width="75%">
																<col width="15%">
															</colgroup>
															<tbody>
															<tr>
																<th>매출처명*</th>
																<td><input type="text" value="" id="custRegSimple_custName" style="width: 100%;"> </td>
																<td><button type="button" class="btn-sm btn-dark" id="custRegSimple_custName_check">중복확인</button></td>
															</tr>
															<tr>
																<th>담당자</th>
																<td><input type="text" value="" id="custRegSimple_custMemerName" style="width: 100%;" placeholder="미입력시 미정으로 세팅됩니다."></td>
																<td><button type="button" class="btn-sm btn-success" id="custRegSimple_custName_register">등록</button></td>
															</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!--//모달 팝업-->
									</td>
								</tr>
								<tr>
									<th scope="row" class="requiredTextCss">제품그룹</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="product" id="productCategoryName" value="" />
											<input type="hidden" class="form-control" name="product" id="productCategoryNo" value="" />
											<span class="input-group-btn">
												<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=productGoodsCategory" type="button" data-toggle="modal" data-target="#productCategoryModal"><i class="icofont icofont-search"></i></button>
											</span>
										</div>
										<!--모달 팝업-->
										<div class="modal fade" id="productCategoryModal" tabindex="-1" role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title">카테고리 검색</h4>
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>카테고리 목록</h5>
														<p>등록된 카테고리가 없거나 로딩중입니다.</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
										<!--//모달 팝업-->
									</td>
								</tr>
								<tr>
									<th scope="row" class="requiredTextCss">상품명</th>
									<td>
										<input type="text" name="product" id ="productName" class="form-control form-control-sm" >
									</td>
								</tr>
								<tr>
									<th scope="row" class="requiredTextCss">상품 기본가격</th>
									<td>
										<input type="text" name="product" id ="productDefaultPrice" class="form-control form-control-sm" value="0" style="text-align: right;">
									</td>
								</tr>
								<tr>
									<th scope="row">상품설명</th>
									<td>
										<textarea  name="product" id="productDesc" rows="8" class="form-control"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_wr text-right mt-3">
						<!--<button class="btn btn-md btn-success f-left">목록</button>-->
						<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/product/list.do'">목록</button>
						<button class="btn btn-md btn-primary" onClick="fn_productInsert()" value="등록">등록</button>
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
	function fnSetCategoryData(a,b){
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

	function necessaryCheck(){
		var rtn = false;
		if($("#custNo").val() == ""){
			rtn = true;
		} else if($("#productCategoryName").val() == ""){
			rtn = true;
		} else if($("#productName").val() == ""){
			rtn = true;
		}
		var defaultPrice = $("#productDefaultPrice").val();
		if(defaultPrice == ""){
			rtn = true;
		} else {
			defaultPrice = defaultPrice.replaceAll(',','');
			var regex = /[0-9]/g;							// 숫자가 아닌 문자열을 선택하는 정규식
			defaultPrice = defaultPrice.replace(regex, "");	// 원래 문자열에서 숫자가 아닌 모든 문자열을 빈 문자로 변경
			if(defaultPrice != ''){
				rtn = true;
			}
		}

		return rtn;
	}

		function fn_productInsert() {
			if(necessaryCheck()){
				alert("기본정보 탭에 있는 필수값을 입력해주십시오. \n가격은 양의 숫자만 가능합니다.(콤마가능)");
				return false;
			}

			var productData = {};
			var productCategoryNo = $("#productCategoryNo").val();		// 상품 카테고리 번호
			if(productCategoryNo != ""){
				productData.productCategoryNo	= productCategoryNo;
			}
			productData.productCategoryName	= $("#productCategoryName").val();		// 상품 카테고리 명
			productData.productName 		= $("#productName").val();				// 상품 명
			var productDefaultPrice = $("#productDefaultPrice").val();
			if(productDefaultPrice.indexOf(',') != -1){
				productDefaultPrice = productDefaultPrice.replaceAll(',','');
			}
			productData.productDefaultPrice = Number(productDefaultPrice);		// 상품 기본 가격
			productData.productDesc	 		= $("#productDesc").val();				// 상품 설명
			productData.custNo				= $("#custNo").val();					// 공급사(외래키)

			if(!productData.custNo){
				var b = confirm("미등록된 거래처 또는 거래처가 입력되지 않았습니다. \n 간편등록을 진행하시겠습니까?");
				if(b){
					$("#custSimpleModal").modal('show');
					return false;
				} else {
					return false;
				}
			}

			$.ajax({
				url: "${path}/product/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: JSON.stringify(productData) , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				contentType:"application/json",
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					var url = '${path}/product/list.do';
					location.href = url;
				}else{
					if(data.msg != ''){
						alert("저장 실패 \n 사유 : "+data.msg);
					} else {
						alert("저장 실패");
					}
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		$("#custRegSimple").on("click",function (event) {
			if($("#custRegSimple_div").is(':visible') == false){
				$("#custRegSimple_div").show();
				$("#custRegSimple").html("간편등록 취소");
			} else {
				$("#custRegSimple_div").hide();
				$("#custRegSimple").html("간편등록");
			}
		});

		$("#custRegSimple_custName_check").on("click", function (event) {
			var custRegSimple_custName = $("#custRegSimple_custName").val();
			var obj = new Object();
			obj.custName = custRegSimple_custName;
			$.ajax({
				url: "${path}/cust/custNameCheck", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				console.dir(data);
				if(data.code == 10001){
					console.log("응답 성공");
					var html= "";
					if(data.result1.length > 0){
						var tempArr = data.result1;
						html += "같은 결과) \n";
						for(var i=0; i<tempArr.length; i++){
							html += "번호 : " + tempArr[i].custNo + " / 매출처 : " + tempArr[i].custName + "\n";
						}
					}

					if(data.result2.length > 0){
						var tempArr = data.result2;
						html += "\n유사 결과) \n";
						for(var i=0; i<tempArr.length; i++){
							html += "번호 : " + tempArr[i].custNo + " / 매출처 : " + tempArr[i].custName + "\n";
						}
					}

					if(data.result1.length == 0 && data.result2.length == 0){
						html += "일치검색, 유사검색결과가 존재하지 않습니다.\n";
					}

					html += "\n등록하시겠습니까?";
					var result = confirm(html);

					if(result){
						console.log("등록진행");
					} else {
						console.log("등록거부");
					}
				}else{
					alert("응답 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		});

		$("#custRegSimple_custName_register").on("click", function (event) {
			var custRegSimple_custName = $("#custRegSimple_custName").val();
			var custRegSimple_custMemerName = $("#custRegSimple_custMemerName").val();

			var obj = new Object();
			obj.custName = custRegSimple_custName;
			obj.custMemberName = custRegSimple_custMemerName;

			$.ajax({
				url: "${path}/cust/simpleRegister", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(result) {
				console.dir(result);
				if(result.code == 10001){
					alert("저장 성공");
					$('#custModal').modal('hide');
					$("#custName").val(result.data.custName);
					$("#custNo").val(result.data.custNo);
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		});
	// 페이지 특화 함수 끝
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>