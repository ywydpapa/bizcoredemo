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
.storeList:hover {
	font-weight: 600;
	cursor: pointer;
}
</style>
<div id="main_content">
	<script>
		$(function() {
			$('#productTable').DataTable({
				info : false,
				searching : true
			});
		});

		$(function() {
			$("#btnAdd").click(function() {
				location.href = "${path}/store/writeInout.do "
			});
		});
	</script>
	<%
	String userRole = "";
	if ((String) session.getAttribute("userRole") != null) {
		userRole = (String) session.getAttribute("userRole");
	}
	%>
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">재고 현황</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<!--재고 리스트  table-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">

				<div class="btn_wr text-right">
					<button class="btn btn-sm btn-primary f-right" type="button"
						id="btnAdd">
						<i class="icofont icofont-plus"></i>입출고 등록
					</button>
				</div>
				<div class="col-sm-12" style="padding:20px 0">
		    <div class="card_box sch_it">
			<div class="form-group row">
				<div class="col-sm-12 col-xl-2">
					<label class="col-form-label" for="storeNo">재고번호</label>
					<div class="input-group input-group-sm mb-0">
					<input type="text"  class="form-control" id="storeNo"/>
					</div>
				</div>
					<div class="col-sm-12 col-xl-2">
					<label class="col-form-label" for="productNo">상품번호</label>
					<div class="input-group input-group-sm mb-0">
					<input type="text"  class="form-control" id="productNo"/>
					</div>
				</div>
				<div class="col-sm-12 col-xl-2">
					<label class="col-form-label" for="customer">공급사</label>
					<div class="input-group input-group-sm mb-0">
					<input type="text"  class="form-control" id="customer"/>
					</div>
				</div>
				<div class="col-sm-12 col-xl-2">
					<label class="col-form-label" for="productCategoryName">제품그룹</label>
					<div class="input-group input-group-sm">
						<input type="text" class="form-control" id="productCategoryName">
					</div>
				</div>
				<div class="col-sm-12 col-xl-2">
					<label class="col-form-label" for="productName">상품명</label>
					<div class="input-group input-group-sm mb-0">
						<input type="text" class="form-control" id="productName" >
					</div>
				</div>
				<div class="col-sm-12 col-xl-2">
					<label class="col-form-label" for="serialNo">시리얼번호</label>
					<div class="input-group input-group-sm mb-0">
						<input type="text" class="form-control" id="serialNo">
					</div>
				</div>
			</div>
			<div style="text-align: right; margin:10px 0">
				<button class="btn btn-sm btn-primary" onclick="multiSearch()">
					<i class="icofont icofont-search" id="search"></i>검색
				</button>
				<button class="btn btn-sm btn-inverse" onclick="location.href='${path}/store/listStore.do'"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
			</div>
		</div>
	</div>
				<div class="card-block table-border-style">
					<div class="dt-responsive table-responsive">
						<table id="productTable"
							class="table table-striped table-bordered nowrap dataTable">
							<colgroup>
								<col width="5%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="27.5%" />
								<col width="27.5%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
								    <th class="text-center">재고 번호</th>
									<th class="text-center">상품 번호</th>
									<th class="text-center">공급사</th>
									<th class="text-center">제품그룹</th>
									<th class="text-center">상품명</th>
									<th class="text-center">시리얼 번호</th>
									<th class="text-center">수량</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${store}">
									<tr align="center"
										onclick="location.href='${path}/store/detail/${row.storeNo}'"
										class="storeList">
										<td>${row.storeNo}</td>
										<td>${row.productNo}</td>
										<td>${row.custName}</td>
										<td>${row.productCategoryName}</td>
										<td>${row.productName}</td>
										<td>${row.serialNo}</td>
										<td>${row.storeQty}</td>
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
<script> 

function multiSearch() {
	let storeNo , productNo,  customer, productCategoryName, productName , serialNo; 
	
	storeNo = $("#storeNo").val(); 
	productNo = $("#productNo").val();
	customer = $("#customer").val(); 
	productCategoryName = $("#productCategoryName").val();
	productName = $("#productName").val(); 
	serialNo = $("#serialNo").val(); 
	
	let storeData = {} ; 
	
	storeData.storeNo = storeNo == "" ? null : storeNo; 
	storeData.productNo = productNo  == "" ? null : productNo ; 
	storeData.customer = customer == "" ? null : customer; 
	storeData.productCategoryName = productCategoryName  == "" ? null : productCategoryName;
	storeData.productName = productName == "" ? null : productName;  
    storeData.serialNo = serialNo == "" ? null : serialNo; 
    
     let param = "?"
     let paramFirst = true; 
     let x; 
     for( x in storeData) {
    	 if(storeData[x] != null) {
    		 if(paramFirst) {
    			 param = param + x + "=" + storeData[x]; 
    			 paramFirst = false; 
    		 } else {
    			 param = param + "&" + x + "=" + storeData[x]
    		 }
    	 } 
     }

     if (param == "?") param = ""; 
     
     let url = '${path}/store/listStore.do' + param; 
     location.href = url; 
     
} 


$(document).ready(function() { 
	let storeNo , productNo,  customer, productCategoryName, productName , serialNo; 
	
	storeNo = $("#storeNo").val(); 
	productNo = $("#productNo").val();
	customer = $("#customer").val(); 
	productCategoryName = $("#productCategoryName").val();
	productName = $("#productName").val(); 
	serialNo = $("#serialNo").val(); 
	
	storeNo = '${param.storeNo}'; 
	productNo = '${param.productNo}'; 
	customer = '${param.customer}';
	productCategoryName = '${param.productCategoryName}'; 
	productName = '${param.productName}';
	serialNo = '${param.serialNo}'; 
	
	$("#storeNo").val(storeNo); 
	$("#productNo").val(productNo); 
	$("#customer").val(customer); 
	$("#productCategoryName").val(productCategoryName); 
	$("#productName").val(productName); 
	$("#serialNo").val(serialNo); 
	
	localStorage.clear(); 
	
})

</script>