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
						상품 정보
					</div>
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
				<ul class="nav nav-tabs  tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#tab01" role="tab">기본정보</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#tab02" role="tab">상세정보</a>
					</li>
					<li class="nav-item">
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabs m-t-20">
					<div class="tab-pane active" id="tab01" role="tabpanel">
						<div class="card-block table-border-style">
							<details>
								<summary><span style="color: red">복제시 주의사항</span></summary>
								<p>
									- 복제 순서<br/>
									1) 복제버튼 클릭<br/>
									2) 기본정보 탭 > <span style="color: red">고객사 / 제품그룹 / 상품명</span>중 1개 이상 변경<br/>
									3) 상세정보 탭 > 하위상품 수정 또는 삭제<br/>
									4) 등록<br/>
									<br/>
									- 복제중 취소<br/>
									1) 취소 버튼 클릭<br/>
									<span style="color: red">* 이전에 입력했던 데이터 초기화</span><br/>
									<br/>
									- 정보 수정중 복제하고 싶다면<br/>
									1) 복제버튼 클릭<br/>
									2) 상세정보 탭 > 삭제했던 하위상품이 있다면 다시 삭제<br/>
									3) 등록
								</p>
							</details>
							<div class="table-responsive">
								<form name="form1" method="post">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="25%" />
											<col width="75%"/>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">상품번호</th>
												<td>
													<input name="product" id ="productNo" value="${dto.productNo}" readonly class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th scope="row" class="requiredTextCss">고객사</th>
												<td>
													<div class="input-group input-group-sm mb-0">
														<input name="product" id ="custName" value="${dto.custName}" class="form-control form-control-sm" readonly>
														<input type="hidden" id ="custNo" value="${dto.custNo}" class="form-control form-control-sm">
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
																	<button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
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
														<input name="product" id ="productCategoryName" value="${dto.productCategoryName}" class="form-control form-control-sm">
														<input type="hidden" name="product" id ="productCategoryNo" value="${dto.productCategoryNo}" class="form-control form-control-sm">
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
													<input name="product" id ="productName" value="${dto.productName}" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th scope="row" class="requiredTextCss">상품 기본가격</th>
												<td>
													<input name="product" id ="productDefaultPrice" value="<fmt:formatNumber value="${dto.productDefaultPrice}" pattern="#,###"/>" class="form-control form-control-sm" style="text-align: right;">
												</td>
											</tr>

											<tr>
												<th scope="row">상품설명</th>
												<td>
													<textarea name="product" id ="productDesc" value="${dto.productDesc}" rows="8" class="form-control">${dto.productDesc}</textarea>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
					<input type="hidden" id="productDataLastNo" value="${dto.productDataLastNo}">
					<div class="tab-pane " id="tab02" role="tabpanel">
						<div class="card-block table-border-style">
							<details>
								<summary><span style="color: red">복제시 주의사항</span></summary>
								<p>
									- 복제 순서<br/>
									1) 복제버튼 클릭<br/>
									2) 기본정보 탭 > <span style="color: red">고객사 / 제품그룹 / 상품명</span>중 1개 이상 변경<br/>
									3) 상세정보 탭 > 하위상품 수정 또는 삭제<br/>
									4) 등록<br/>
									<br/>
									- 복제중 취소<br/>
									1) 취소 버튼 클릭<br/>
									<span style="color: red">* 이전에 입력했던 데이터 초기화</span><br/>
									<br/>
									- 정보 수정중 복제하고 싶다면<br/>
									1) 복제버튼 클릭<br/>
									2) 상세정보 탭 > 삭제했던 하위상품이 있다면 다시 삭제<br/>
									3) 등록
								</p>
							</details>
							<button class="btn btn-sm btn-secondary pull-right" style="margin-bottom: 5px;" onclick="fn_itemListAdd()">추가</button>
							<div class="table-responsive">
								<table class="table table-sm bst01">
									<colgroup>
										<col width="5%" />
										<col width="20%"/>
										<col width="70%"/>
										<col width="5%"/>
									</colgroup>
									<thead>
										<tr>
											<th scope="row">순서</th>
											<th>항목</th>
											<th>값</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${dto.productdataDTOList}" varStatus="varStatus">
											<tr id="${row.productDataNo}">
												<td style="text-align: center;">${varStatus.count}</td>
												<td><input class="productModel" type="text" value="${row.productModel}" onfocusout="fn_focusOutOrChangeEvent(this)" readonly /></td>
												<td><input type="text" value="${row.productPrice}" readonly/></td>
												<td>
													<div class="modify">
														<button class="btn btn-sm btn-warning" onclick="fn_itemListModify(this);">수정</button>
													</div>
													<div class="update">
														<%--<button class="btn btn-sm btn-instagram" onClick="fn_itemListUpdate(this);">등록</button>--%>
														<button class="btn btn-sm btn-dark" onClick="fn_itemListCancel(this);">취소</button>
													</div>
												</td>
												<td>
													<button class="btn btn-sm btn-danger" onclick="fn_itemListRemove(this);">삭제</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="btn_wr text-right mt-3">
						<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/product/list.do'">목록</button>
						<button class="btn btn-md btn-danger" id="btnCopy" onClick= "fn_productCopy()">복제</button>
						<button class="btn btn-md btn-primary" id="btnInsert" onClick= "fn_productInsert()">등록</button>
						<button class="btn btn-md btn-inverse" id="btnCancel" onClick= "fn_productCancel()">취소</button>
						<button class="btn btn-md btn-primary" id="btnUpdate" onClick= "fn_productUpdate()">수정</button>
						<button class="btn btn-md btn-inverse" id="btnDelete" onClick= "fn_productDelete()">삭제</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Row end -->
	</div>
	<style>
	input[type=text] {
		width: 100%;
	}
	input:read-only{
		border: aliceblue;
	}
	.itemRemove{
		display: none;
	}
	</style>
	<script type="text/javascript">
	//이벤트 영역 시작
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

	function fnSetCategoryData(a,b){
		// '${row.productCategoryNo}','${row.productCategoryName}'
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

	// 이벤트 영역 끝
	var colorObject = {
		0 : 'aliceblue',
		1 : 'bisque',
		2 : 'coral',
		3 : 'cornflowerblue',
		4 : 'darkseagreen'
	}

	function fn_focusOutOrChangeEvent(e){
		if($(e).css('backgroundColor') != 'rgb(255, 255, 255)'){
			$(e).css('backgroundColor','rgb(255, 255, 255)');
		}

		var productModel1 = $(".productModel");
		var productModel2 = $(".productModel");

		var result = false;
		for(var i=0; i<productModel1.length; i++){
			productModel1[i].style.backgroundColor = "";
		}

		for(var i=0; i<productModel1.length-1; i++){
			for(var j=1; j<productModel2.length; j++){
				if(productModel1[i].value == productModel2[j].value){
					if($(productModel1[i]).closest('tr').attr('id') != $(productModel2[j]).closest('tr').attr('id')){
						result = true;
						productModel1[i].style.backgroundColor = colorObject[0];
						productModel2[j].style.backgroundColor = colorObject[0];
					}
				}
			}
		}

		if(!result){
			$(e).css('backgroundColor','rgb(255, 255, 255)');
		}
	}
	/*
	function fn_itemListUpdate(e) {
		var parrent = $(e).closest('tr');
		var inputChildren = $(parrent).find('input');
		$(inputChildren[0]).prop('readonly',true);
		$(inputChildren[1]).prop('readonly',true);
		$(e).parent().prev().show();
		$(e).parent().hide();
		$(parrent).removeClass("itemModify");
	}
	*/
	function fn_itemListCancel(e) {
		var parrent = $(e).closest('tr');
		var idx = tableDataId.indexOf(parrent.attr('id'));
		var inputChildren = $(parrent).find('input');
		$(inputChildren[0]).prop('readonly',true);
		$(inputChildren[0]).val(tableDataItem[idx]);
		$(inputChildren[1]).prop('readonly',true);
		$(inputChildren[1]).val(tableDataValue[idx]);
		$(e).parent().prev().show();
		$(e).parent().hide();
		$(parrent).removeClass("itemModify");
	}

	function fn_itemListModify(e) {
		var parrent = $(e).closest('tr');
		var inputChildren = $(parrent).find('input');
		console.dir(inputChildren);
		$(inputChildren[0]).prop('readonly',false);
		$(inputChildren[1]).prop('readonly',false);
		$(e).parent().next().show();
		$(e).parent().hide();
		$(parrent).addClass("itemModify");
	}

	function fn_itemListRemove(e){
		if(confirm("정말 삭제하시겠습니까?")) {
			var button = $(e);
			var tr = $(e).closest('tr');
			if(tr.hasClass('itemAdd')){
				// 신규 데이터인경우 tr 삭제 처리
				tr.remove();
			} else {
				// 기존 데이터인경우 hide 처리
				// tr.css("display", "none");
				tr.addClass('itemRemove');
				if(tr.hasClass('itemModify')){
					tr.removeClass('itemModify');
				}
			}
		} else {
			return false;
		}
	}

	var productNo, custName, custNo, productCategoryName, productCategoryNo, productName, productDefaultPrice, productDesc;
	var tableDataId = new Array();
	var tableDataItem = new Array();
	var tableDataValue = new Array();

	function fn_productCopy(){
		$("#btnInsert, #btnCancel").show();
		$("#btnCopy, #btnUpdate, #btnDelete").hide();
		$("#productNo").val("자동생성 됩니다..");

		var tableData = $("#tab02").find("tbody tr");
		tableData.each(function() {
			var btn = $(this).find("button");
			if(!$(this).hasClass('itemAdd')){
				$(btn[0]).hide();
				$(btn[1]).hide();
			}
			$(this).attr('id','');
			$(this).removeClass('itemRemove');
			$(this).removeClass('itemModify');
			$(this).addClass('itemAdd');
			var in0 = $(this).find("input[type=text]")[0];
			var in1 = $(this).find("input[type=text]")[1];
			in0.readOnly = false;
			in1.readOnly = false;
		});
	}

	function fn_productCancel(){
		$("#productNo").val(productNo);
		$("#custName").val(custName);
		$("#custNo").val(custNo);
		$("#productCategoryName").val(productCategoryName);
		$("#productCategoryNo").val(productCategoryNo);
		$("#productName").val(productName);
		$("#productDefaultPrice").val(productDefaultPrice);
		$("#productDesc").val(productDesc);

		var table = $("#tab02").find("tbody");
		table.empty();
		for(var i=0; i<tableDataId.length; i++){
			var html =
			'<tr id="'+tableDataId[i]+'">'+
				'<td style="text-align: center;">'+(i+1)+'</td>'+
				'<td><input class="productModel" type="text" value="'+tableDataItem[i]+'" onfocusout="fn_focusOutOrChangeEvent(this)" readonly="" style="background-color: rgb(255, 255, 255);"></td>'+
				'<td><input type="text" value="'+tableDataValue[i]+'" readonly=""></td>'+
				'<td>'+
					'<div class="modify">'+
						'<button class="btn btn-sm btn-warning" onclick="fn_itemListModify(this);">수정</button>'+
					'</div>'+
					'<div class="update" style="display: none;">'+
						'<button class="btn btn-sm btn-dark" onclick="fn_itemListCancel(this);">취소</button>'+
					'</div>'+
				'</td>'+
				'<td>'+
					'<button class="btn btn-sm btn-danger" onclick="fn_itemListRemove(this);">삭제</button>'+
				'</td>'+
			'</tr>';
			table.append(html);
		}
		$("#btnInsert, #btnCancel").hide();
		$("#btnCopy, #btnUpdate, #btnDelete").show();
	}

	function fn_itemListAdd(){
		$element = $("#tab02").find("tbody");
		$Trelement = $element.find("tr");
		var i = 0;
		if($Trelement.length == 0){
			i=1;
		}
		else{
			i = Number( $($Trelement.last()).find("td")[0].innerText ) + 1;
		}
		var content = '<tr class="itemAdd">' +
						'<td style="text-align: center;">'+i+'</td>' +
						'<td><input type="text" class="productModel" onfocusout="fn_focusOutOrChangeEvent(this)"/></td>' +
						'<td><input type="text" /></td>' +
						'<td></td>' +
						'<td><button class="btn btn-sm btn-danger" onclick="fn_itemListRemove(this);">삭제</button></td>' +
					   '</tr>';
		$element.append(content);
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

	// 아이템(항목) 중복여부 체크
	function fn_itemDuplicate(){
		var itemDuplicate = false;
		var element = $("#tab02").find("tbody  tr");
		var inputElement = element.find("input:first");
		var item = new Set();
		for(var i=0; i<inputElement.length; i++){
			var addItem = $(inputElement[i]).val();
			item.add(addItem);
		}
		if(item.size == inputElement.length){
			itemDuplicate = false;
		} else {
			itemDuplicate = true;
		}
		return itemDuplicate;
	}

	// 기존 데이터와 복제 데이터 일치 여부
	// 거래처 / 카테고리 / 제품이름 : 3개다 일치한다면 기존 제품과 동일하므로 저장할수 없다고 경고
	function fn_oldDiffNew() {
		if($("#custNo").val() == custNo && $("#productCategoryName").val() == productCategoryName && $("#productName").val() == productName){
			return true;
		}
		return false;
	}

	function fn_productInsert(){
		if(fn_itemDuplicate()){
			alert("항목은 중복으로 저장할수 없습니다.");
			return false;
		}

		if(fn_oldDiffNew()){
			alert("기존 고객사 / 제품그룹 / 상품명과 동일합니다.");
			return false;
		}

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
		productData.productDefaultPrice = Number(productDefaultPrice);			// 상품 기본 가격
		productData.productDesc	 		= $("#productDesc").val();				// 상품 설명
		productData.custNo				= $("#custNo").val();					// 고객사(외래키)

		var productdataDTOList = new Array();
		var tableData = $("#tab02").find("tbody tr");
		tableData.each(function(){
			var data = new Object();
			var productModel = $(this).find("input[type=text]")[0].value;
			var productPrice = $(this).find("input[type=text]")[1].value;
			data['productModel'] = productModel;
			data['productPrice'] = productPrice;
			if($(this).hasClass('itemRemove')) {
				// 기존 데이터 삭제
				data['mode'] = 'delete';
				productdataDTOList.push(data);
			} else if($(this).hasClass('itemAdd')) {
				// 기존 데이터 삭제
				data['mode'] = 'insert';
				productdataDTOList.push(data);
			} else if($(this).hasClass('itemModify')) {
				// 기존 데이터 삭제
				data['mode'] = 'update';
				productdataDTOList.push(data);
			}
		});
		productData['productdataDTOList'] = productdataDTOList;
		console.dir(productData)

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

	function fn_productUpdate() {
		if(fn_itemDuplicate()){
			alert("항목은 중복으로 저장할수 없습니다.");
			return false;
		}

		if(necessaryCheck()){
			alert("기본정보 탭에 있는 필수값을 입력해주십시오. 가격은 양의 숫자만 가능합니다.(콤마가능)");
			return false;
		}

		var productData 				= new Object();
		var productNo 					= Number($("#productNo").val());
		productData.productNo 			= productNo								// 상품 번호
		var productCategoryNo 			= $("#productCategoryNo").val();		// 상품 카테고리 번호
		if(productCategoryNo != ""){
			productData.productCategoryNo	= productCategoryNo;
		}
		productData.productCategoryName	= $("#productCategoryName").val();		// 상품 카테고리 명
		productData.productName 		= $("#productName").val();				// 상품 명
		var productDefaultPrice = $("#productDefaultPrice").val();
		if(productDefaultPrice.indexOf(',') != -1){
			productDefaultPrice = productDefaultPrice.replaceAll(',','');
		}
		productData.productDefaultPrice = Number(productDefaultPrice);			// 상품 기본 가격
		productData.productDesc	 		= $("#productDesc").val();				// 상품 설명
		productData.custNo				= $("#custNo").val();					// 고객사(외래키)

		var productdataDTOList = new Array();
		var tableData = $("#tab02").find("tbody tr");
		tableData.each(function(){
			var data = new Object();
			var productDataNo = $(this).attr("id");
			var productModel = $(this).find("input[type=text]")[0].value;
			var productPrice = $(this).find("input[type=text]")[1].value;
			data['productNo'] = productNo;				// 상품 번호
			data['productDataNo'] = Number(productDataNo);
			data['productModel'] = productModel;
			data['productPrice'] = productPrice;
			if($(this).hasClass('itemRemove')) {
				// 기존 데이터 삭제
				data['mode'] = 'delete';
				productdataDTOList.push(data);
			} else if($(this).hasClass('itemAdd')) {
				// 기존 데이터 삭제
				data['mode'] = 'insert';
				productdataDTOList.push(data);
			} else if($(this).hasClass('itemModify')) {
				// 기존 데이터 삭제
				data['mode'] = 'update';
				productdataDTOList.push(data);
			}
		});
		productData['productdataDTOList'] = productdataDTOList;

		$.ajax({
			url: "${path}/product/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data: JSON.stringify(productData) , // HTTP 요청과 함께 서버로 보낼 데이터
			method: "POST", // HTTP 요청 메소드(GET, POST 등)
			contentType:"application/json",
			dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
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

	function fn_productDelete() {
		if(confirm("정말 삭제하시겠습니까?")){
			var productData = {};
			productData.productNo 			= $("#productNo").val();

			$.ajax({
				url: "${path}/product/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: productData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					var url = '${path}/product/list.do';
					location.href = url;
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}
	}


	$(document).ready(function() {
		//fn_itemListAdd();
		// document.querySelector('.productModel').addEventListener('.focusout', function (e){
		// 	console.dir(e);
		// });
		$(".update").hide();
		$("#btnInsert, #btnCancel").hide();

		productNo = $("#productNo").val();
		custName = $("#custName").val();
		custNo = $("#custNo").val();
		productCategoryName = $("#productCategoryName").val();
		productCategoryNo = $("#productCategoryNo").val();
		productName = $("#productName").val();
		productDefaultPrice = $("#productDefaultPrice").val();
		productDesc = $("#productDesc").val();

		var tableData = $("#tab02").find("tbody tr");
		tableData.each(function() {
			var Id = $(this).attr('id');
			tableDataId.push(Id);
			var in0 = $(this).find("input[type=text]")[0];
			var in1 = $(this).find("input[type=text]")[1];
			tableDataItem.push(in0.value);
			tableDataValue.push(in1.value);
		});

		$("#productCategoryName").on("change",function () {
			$("#productCategoryNo").val("");
		});

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
	});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>