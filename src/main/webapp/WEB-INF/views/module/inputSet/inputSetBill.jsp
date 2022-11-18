<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<form name="form2" method="post" onsubmit="return false;">
	<div style="width:100%;">
		<div style="float:right; margin-bottom:10px;">
			<!-- <button type="button" class="btn btn-primary" id="bodyAddBtn">설정</button> -->
			<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=contVatSetModal" type="button" data-toggle="modal" data-target="#contVatSetModal">설정</button>
		</div>
		<!-- <div style="float:right; margin-right:10px; margin-top:5px;">
			<input type="text" class="form-control" id="addNum" placeholder="만들 갯수 입력(ex:5)" value="1" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		</div> -->
	</div>
	<div style="clear:both;">
		<div style="float:left; width:50%;">
			<span style="font-weight: 600;">※ 공급자</span>
			<input type="hidden" id="sessionCustNo" value="${sessionCust.custNo}" />
			<table class="table table-sm bst02" id="billProTable">
				<thead>
					<tr>
						<th class="text-center">사업자등록번호</th>
						<th class="text-center">상호</th>
						<th class="text-center">대표자명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" id="sessionVatNo" value="${sessionCust.custVatno}" readonly></td>
						<td><input type="text" class="form-control" id="sessionCustName" value="${sessionCust.custName}"></td>
						<td><input type="text" class="form-control" id="sessionCustBossname" value="${sessionCust.custBossname}"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="float:right; width:50%;">
			<span style="font-weight: 600;">※ 공급받는자</span>
			<input type="hidden" id="custNo" value="${contDto.custNo}" />
			<input type="hidden" id="custEmail" value="${contDto.custEmail}" />
			<table class="table table-sm bst02" id="billRecTable">
				<thead>
					<tr>
						<th class="text-center">사업자등록번호</th>
						<th class="text-center">상호</th>
						<th class="text-center">대표자명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" id="custVatNo" value="${contDto.custVatno}" readonly></td>
						<td><input type="text" class="form-control" id="custName" value="${contDto.custName}" readonly></td>
						<td><input type="text" class="form-control" id="custBossname" value="${contDto.custBossname}" readonly></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<table class="table table-sm bst02" id="billMarksTable" style="margin-bottom:1%;">
		<colgroup>
			<col width="10%" />
			<col width="10%" />
            <col width="20%" />
            <col width="60%" />
        </colgroup>
		<thead>
			<tr>
				<th class="text-center">계산서종류</th>
				<th class="text-center">영수/청구</th>
				<th class="text-center">작성일자</th>
				<th class="text-center">비고</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<select class="form-control" id="vatBillType">
						<option value="01">일반</option>
						<option value="02">영세율</option>
					</select>
				</td>
				<td>
					<select class="form-control" id="vatRecType">
						<option value="01">청구</option>
						<option value="02">영수</option>
					</select>
				</td>
				<td><input type="date" max="9999-12-31" class="form-control" id="vatIssueDate"></td>
				<td><input type="text" class="form-control" id="vatRemark"></td>
			</tr>
		</tbody>
	</table>
	<table class="table table-sm bst02" id="billItemTable">
		<colgroup>
            <col width="3%" />
            <col width="17%" />
            <col width="10%" />
            <col width="5%" />
            <col width="10%" />
            <col width="10%" />
            <col width="10%" />
            <col width="30%" />
            <col width="5%" />
        </colgroup>
		<thead>
			<tr>
				<th class="text-center">발행일</th>
				<th class="text-center">품목</th>
				<th class="text-center">규격</th>
				<th class="text-center">수량</th>
				<th class="text-center">단가</th>
				<th class="text-center">공급가액</th>
				<th class="text-center">세액</th>
				<th class="text-center">비고</th>
				<th class="text-center">초기화</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
    <div class="text-right mt-3">
		<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cont/list.do'">계약목록</button>
		<button type="button" class="btn btn-md btn-primary" onclick="fn_billItemInsert();">발행요청하기</button>
	</div>
	<div style="margin-top:1%; max-height: 300px; overflow-y: scroll;">
		<table class="table table-sm bst02" id="billItemSelectTable">
			<colgroup>
	            <col width="3%" />
	            <col width="17%" />
	            <col width="10%" />
	            <col width="5%" />
	            <col width="10%" />
	            <col width="10%" />
	            <col width="10%" />
	            <col width="35%" />
	        </colgroup>
			<thead>
				<tr>
					<th class="text-center">발행일</th>
					<th class="text-center">품목</th>
					<th class="text-center">규격</th>
					<th class="text-center">수량</th>
					<th class="text-center">단가</th>
					<th class="text-center">공급가액</th>
					<th class="text-center">세액</th>
					<th class="text-center">비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${vatData01}">
					<tr>
						<td class="text-center">${row.vatTradeDate}</td>
		    			<td class="text-center">${row.vatProductName}</td>
		    			<td class="text-center">${row.vatStandard}</td>
		    			<td class="text-right">${row.vatQuan}</td>
		    			<td class="text-right"><fmt:formatNumber value="${row.vatNet}" pattern="#,###" /></td>
		    			<td class="text-right"><fmt:formatNumber value="${row.vatAmount}" pattern="#,###" /></td>
		    			<td class="text-right"><fmt:formatNumber value="${row.vatTax}" pattern="#,###" /></td>
		    			<td class="text-left">${row.vatMemo}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
    <div class="modal fade " id="billCustModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title">거래처 목록</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade " id="contVatSetModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-80size" role="document">
			<div class="modal-content modal-80size">
				<div class="modal-header">
					<h4 class="modal-title">입력</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="bodyAddBtn">설정</button>
					<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</form>

<script>
	$(document).keypress(function(e) { 
		if (e.keyCode == 13) e.preventDefault(); 
	});

    $(document).ready(function(){
    	var nowDate = new Date();
    	var tableBody = $("#billItemTable tbody");
		
    	nowDate = nowDate.toISOString().slice(0, 10);
    	
    	$("#vatIssueDate").val(nowDate);
    	
    	$("#bodyAddBtn").click(function(){
    		var contAmt = parseInt($("#contAmt").val().replace(/[\D\s\._\-]+/g, ""));
    		var number = parseInt($("#addNum").val());
    		var contVatProduct = $("#contVatProduct").val();
    		var contVatStandard = $("#contVatStandard").val();
    		var avgTotal = Math.round(contAmt/number);
			var totalAmt = Math.round(avgTotal/11*10);
			var totalTax = Math.round(avgTotal/11);
			var totalNet = Math.round((avgTotal - totalTax)/1);
    		var bodyHtml = "";

    		if(number < 1){
    			alert("갯수가 1보다 작을 수 없습니다.");
    			return false;
    		}else{
    			tableBody.empty();
	    		
	    		for(var i = 1; i <= number; i++) {
	    			bodyHtml += "<tr><td><input type='date' class='form-control' max='9999-12-30' id='vatTradeDate_" + i + "' name='vatTradeDate_" + i + "' value='" + nowDate + "'></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm' id='vatProductName_" + i + "' style='min-width: 80px;' value='"+contVatProduct+"'/></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm' id='vatStandard_" + i + "' style='min-width: 80px;' value='"+contVatStandard+"'/></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm vatQuan' id='vatQuan_" + i + "' style='min-width: 80px;' value='1' /></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm vatNet' id='vatNet_" + i + "' data-index='" + i + "' onchange='calReplace(this)' style='min-width: 80px;' value='"+parseInt(totalNet).toLocaleString("en-US")+"' /></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm vatAmount' id='vatAmount_" + i + "' style='min-width: 80px;' value='"+parseInt(totalAmt).toLocaleString("en-US")+"' readonly/></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm vatTax' id='vatTax_" + i + "' style='min-width: 80px;' value='"+parseInt(totalTax).toLocaleString("en-US")+"' readonly/></td>"
	    			+ "<td><input type='text' class='form-control form-control-sm' id='vatMemo_" + i + "' style='min-width: 80px;' /></td>"
	    			+ "<td><button type='button' class='btn btn-sm btn-danger' data-index='" + i + "' onClick='billItemDelBtn(this);'>삭제</button></td></tr>";
	    		}
	    		
	    		tableBody.html(bodyHtml);
	    		$(".modal-backdrop").remove();
	            $("#contVatSetModal").modal("hide");
    		}
    	});
    });
    
    $('#billCustModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		localStorage.setItem("getItemIndex", button.attr("data-index"));
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
    
    $('#contVatSetModal').on('show.bs.modal', function(e) {
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });
    
    function billItemDelBtn(event){
    	var tableBody = $("#billItemTable tbody tr");
    	var indexNum = $(event).attr("data-index");
    	var nowDate = new Date();
    	
    	nowDate = nowDate.toISOString().slice(0, 10);
    	
    	tableBody.find("td #vatTradeDate_" + indexNum).val(nowDate);
    	tableBody.find("td #vatProductName_" + indexNum).val("");
    	tableBody.find("td #vatStandard_" + indexNum).val("");
    	tableBody.find("td #vatQuan_" + indexNum).val(1);
    	tableBody.find("td #vatNet_" + indexNum).val(0);
    	tableBody.find("td #vatAmount_" + indexNum).val(0);
    	tableBody.find("td #vatTax_" + indexNum).val(0);
    	tableBody.find("td #vatMemo_" + indexNum).val("");
    }
    
    function calReplace(event){
    	var indexNum = $(event).attr("data-index");
    	var netNumber = parseInt($(event).val().replace(/,/g, "") || 0);
    	var quanNumber = parseInt($("#vatQuan_" + indexNum).val());
    	var calNumber = Math.round(netNumber * quanNumber);
    	var calTax = Math.round(calNumber * 0.1);
    	
    	$(event).val(netNumber.toLocaleString("en-US"));
    	$("#vatAmount_" + indexNum).val(calNumber.toLocaleString("en-US"));
    	$("#vatTax_" + indexNum).val(calTax.toLocaleString("en-US"));
    }
    
    function fn_billItemInsert() {
    	if(confirm("발행 요청하시겠습니까??")){
	    	var pathname = $(location).attr('pathname');
	    	var compNo = "${sessionScope.compNo}";
	    	var tableBody = $("#billItemTable tbody tr");
	    	
	    	if(tableBody.length == 0){
	    		alert("계산서 데이터를 추가해주십시오.");
	    		return false;
	    	}
	    	
	    	for(var i = 1; i <= tableBody.length; i++){
		    	var insertData = {};
				
		    	insertData.compNo = compNo;
		    	insertData.contNo = $("#contNo").val();
		    	insertData.vatBuyerCustNo = $("#custNo").val();
		    	insertData.vatSellerCustNo = $("#sessionCustNo").val();
		    	insertData.vatEmail = $("#custEmail").val();
		    	insertData.vatStatus = "T1";
		    	insertData.vatNo = $("#custVatNo").val();
		    	insertData.vatProductName = tableBody.find("td #vatProductName_" + i).val();
		    	insertData.vatIssueDate = $("#vatIssueDate").val();
		    	insertData.vatTradeDate = tableBody.find("td #vatTradeDate_" + i).val();
		    	insertData.vatBillType = $("#vatBillType").val();
		    	insertData.vatRecType = $("#vatRecType").val();
		    	insertData.vatStandard = tableBody.find("td #vatStandard_" + i).val();
		    	insertData.vatQuan = tableBody.find("td #vatQuan_" + i).val();
		    	insertData.vatNet = parseInt(tableBody.find("td #vatNet_" + i).val().replace(/,/g, ""));
		    	insertData.vatAmount = parseInt(tableBody.find("td #vatAmount_" + i).val().replace(/,/g, ""));
		    	insertData.vatTax = parseInt(tableBody.find("td #vatTax_" + i).val().replace(/,/g, ""));
		    	insertData.vatRemark = $("#vatRemark").val();
		    	insertData.vatMemo = tableBody.find("td #vatMemo_" + i).val();
		    	insertData.vatType = "T";
		    	
		    	$.ajax({
	    			url: "${path}/acc/billInsert.do",
	    			method: "post",
	    			data: insertData,
	    			async: false,
	    			dataType: "json",
	    		});
	    	}
	    	
	    	localStorage.setItem('lastTab', "#tab07");
	    	alert("완료되었습니다.");
	    	location.href = pathname;
    	}else{
    		return false;
    	}
    }
    
    
</script>