<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2022-02-04
  Time: 오후 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>
	#vatlistTable tbody tr td{
		vertical-align: middle;
		work-break: break-all;
	}
	
</style>
		<div class="page-header2">
			<div class="row align-items-end">
				<div class="col-lg-12">
					<div class="page-header-title" style="float:left;">
						<div style="margin-top:15px;">
							<h6 style="font-weight:600;">매입/매출 검색</h6>
						</div>
					</div>
					<div class="btn_wr" style="float:right;">
						<!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold_modal" onclick="acordian_action_modal()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2_modal" onclick="acordian_action1_modal()" style="display:none;">접기</button>
						<!-- hide and show -->
						<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon_modal()"><i class="icofont icofont-search"></i>검색</button>
					</div>
				</div>
			</div>
		</div>
		<div class="cnt_wr" id="acordian_modal" style="display:none;">
			<div class="row">
				<form id="searchForm_modal" method="post" onsubmit="return false;" class="col-sm-12">
				<div class="col-sm-12">
					<div class="card_box sch_it">
						<div class="form-group row">
							<div class="col-sm-12 col-xl-2">
								<label class="col-form-label">거래처</label>
								<input type="text" class="form-control form-control-sm" id="custName_modal" name="" placeholder="" value="">
							</div>
							<div class="col-sm-12 col-xl-3">
								<label class="col-form-label">기간</label>
								<p class="input_inline">
									<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" pattern="yyyy-" id="regSDate_modal"> ~ <input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="regEDate_modal">
								</p>
							</div>
						</div>	
					</div>
				</div>
				</form>
			</div>
		</div>
<div class="dt-responsive table-responsive">
<input type="hidden" id="baclogId_NUM" value="${baclogId}">
  <table id="vatlistTable" class="table table-striped table-bordered nowrap">
    <colgroup>
        	<col width="3%"/>
        	<col width="5%"/>
        	<col width="10%"/>
        	<col width="5%"/>
        	<col width="5%"/>
        	<col width="7%"/>
        	<col width="5%"/>
        	<col width="5%"/>
        </colgroup>
    <thead>
	    <tr>
	    	<th>선택</th>
	    	<th>작성일자</th>
	      	<th>거래처</th>
	      	<th>금액</th>
	      	<th>품명</th>
	      	<th>비고</th>
	      	<th>지급금액</th>
	      	<th>지급 할 금액</th>
	      	<th>남은금액</th>
	      	<th>승인번호</th>
	    </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
  <div id="pageDiv_modal" style="float: right;"></div>
  
  <div>
  	<button class="btn btn-sm btn-primary waves-effect" onclick="select_total_price()">선택계산</button>
  </div>
  
  <table id="table_test" class="table table-striped table-bordered nowrap">
  	<thead>
		<tr>
			<th>출금금액</th>
			<th>지급 할 금액</th>
			<th>차액</th>
			<th id="received_price_col"style="display: none;">비고</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
  </table>
</div>

<script>
function select_total_price() {
	var tableHtml = "";
	var tableHtml2 = "";
	var sum_modal = 0;
	var listTable = $("#vatlistTable tbody tr td");
	var select_total_price_Data = {};
	var original_price = $('#original_price').val();
	var origin_received_price = parseInt($('#received_price').val().replace(/,/g, ""));
	
	listTable.find("#checkSerial").each(function(index, item){
		  if($(item).is(":checked") === true){
			sum_modal += parseInt($(item).parent().next().next().next().next().next().next().next().children().first().val().replace(/,/g, ""));
		  }
	})
	
	
	$('#test').empty();
	$('#test2').empty();
	var cal_price = original_price.replace(/,/g, "") - sum_modal;
	var difference_price_sub = parseInt($('#difference_price_sub').val().replace(/,/g, "")) - sum_modal;
	tableHtml += "<input id='received_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='"+sum_modal.toLocaleString("en-US")+"'/>"
	tableHtml2 += "<input id='difference_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='"+difference_price_sub.toLocaleString("en-US")+"'/>"
	$('#test').html(tableHtml);
	$('#test2').html(tableHtml2);
	
	if(cal_price == 0){
		$('#received_price_detail').hide();
		$('#received_price_col').hide();
	}else if(cal_price != 0) {
		$('#received_price_detail').show();
		$('#received_price_col').show();
	}
}


function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
  
  function fnvatListB(a, b, c) {
	  if(confirm("승인번호 : " + a + "\n연결하시겠습니까??")){
		  var updateData = {};
		  var bacId = localStorage.getItem("thisId");
		  var vatSerial = a;
		  var baclisthideNum = $('#baclisthideNum').val();
		  
		  updateData.baclogId = bacId;
		  updateData.linkDoc = vatSerial;
		  
		  $.ajax({
			 url: "${path}/acc/bacSerialUpdate.do",
			 method: "post",
			 data: updateData,
			 dataType: "json",
			 success:function(){
				 alert("연결되었습니다.");
			 }
		  });
		  openModalLocalStorage();
		  location.href="${path}/acc/bacdetail.do";
	  }else{
		  return false;
	  }
  }
  
  function checkConnect(){
	  select_total_price();
	  if(confirm("차액은 "+$('#difference_price').val()+"원 입니다. 연결하시겠습니까??")){
		  var listTable = $("#vatlistTable tbody tr td");
		  var bacId = localStorage.getItem("thisId");
		  var compNo = "${sessionScope.compNo}";
		  
		  listTable.find("#checkSerial").each(function(index, item){
			  if($(item).is(":checked") === true){
				  var insertData = {};
				  
				  insertData.compNo = compNo;
				  insertData.baclogId = bacId;
				  insertData.linkType = "VAT";
				  insertData.linkDocno = $(item).attr("data-number");
				  //swc_vat의 modal_vatmemo modal_vatmemo - modal_receive_data
				  //-> 받은 금액
				  
				  insertData.modal_receive_data_sole = parseInt($(item).parent().next().next().next().next().next().next().next().children().first().val().replace(/,/g, ""))
				  //-> 남은 금액
				  insertData.modal_vatmemo = (parseInt($(item).parent().next().next().next().next().next().next().next().next().children().first().val().replace(/,/g, "")) - parseInt($(item).parent().next().next().next().next().next().next().next().children().first().val().replace(/,/g, ""))).toLocaleString("en-US");
				  insertData.modal_vatmemo_secound = (parseInt($(item).parent().next().next().next().next().next().next().next().next().children().first().val().replace(/,/g, "")) - parseInt($(item).parent().next().next().next().next().next().next().next().children().first().val().replace(/,/g, "")));

				  //-> 받을 금액과 받은 금액 합
				  insertData.modal_receive_data = parseInt($(item).parent().next().next().next().next().next().next().children().first().val().replace(/,/g, "")) + parseInt($(item).parent().next().next().next().next().next().next().next().children().first().val().replace(/,/g, ""));  

				  //swc_bacledger의 차액, 차액에 대한 메모
				  insertData.difference_price = parseInt($('#difference_price').val().replace(/,/g, ""))
				  insertData.difference_memo = $('#received_price_detail').val()
				  
				  $.ajax({
					 url: "${path}/acc/bacCheckConnect.do",
					 method: "post",
					 data: insertData,
					 async: false,
					 dataType: "json"
				  });
				  $.ajax({
		  				url: "${path}/acc/bacCheckConnect_modal_update.do",
		  				method: "post",
		  				data: insertData,
		  				async: false,
		  				dataType: "json"
		  			}); 
				  $.ajax({
		  				url: "${path}/acc/bacCheckConnect_modal_baclogId_memo.do",
		  				method: "post",
		  				data: insertData,
		  				async: false,
		  				dataType: "json"
		  			}); 
			  }
		  });
		  
		  alert("연결되었습니다.");
		  openModalLocalStorage();
		  location.href="${path}/acc/bacdetail.do";
	  }
  }
  function allCheck(e){
	  if($(e).is(":checked") === true){
		  $("#vatlistTable tbody tr td").find("#checkSerial").each(function(index, item){
			  $(item).prop("checked", true);
		  });
	  }else{
		  $("#vatlistTable tbody tr td").find("#checkSerial").each(function(index, item){
			  $(item).prop("checked", false);
		  });
	  }
  }
	    <!--//리스트 table-->
		$(document).ready(function(){
			const VAT_TABLE = $("#vatlistTable tbody");
			const DEFAULT_NUM = 15;
			
			VAT_TABLE.empty();
			$("#pageDiv_modal").empty();
			
			if(localStorage.getItem("activePageModal") !== null){
				var page = localStorage.getItem("activePageModal");
				
				pageNationModal(page, DEFAULT_NUM, $('#baclogId_NUM').val());
			}else{
				pageNationModal(1, DEFAULT_NUM, $('#baclogId_NUM').val());
			}
		});
		
		function pageNationModal(page, DEFAULT_NUM, reData){
			var vatlistTable = $("#vatlistTable tbody");
			var compNo = "${sessionScope.compNo}";
			var countData = {};
			var selectData = {};
			var tableHtml = "";
			var pageHtml = "";
            var table_test = $("#table_test tbody");
            var table_sub_Html = "";
			
			vatlistTable.empty();
			
			if(reData.bacSerial != null){
				selectData.bacSerial = reData.bacSerial;
				selectData.baclogId = reData.bacSerial;
			}else{
				selectData.bacSerial = reData;
				selectData.baclogId = reData;
			}
			
			selectData.custName_modal = $('#custName_modal').val() ? $('#custName_modal').val() : "";
			selectData.regSDate_modal = $('#regSDate_modal').val() ? $('#regSDate_modal').val() : "";
			selectData.regEDate_modal = $('#regEDate_modal').val() ? $('#regEDate_modal').val() : "";
			
			$.ajax({
				url: "${path}/acc/modalVatBCnt.do",
				method: "post",
				data: selectData,
				dataType: "json",
				success:function(countResult){
					var count = countResult.resultCount;
					var start = (page - 1) * DEFAULT_NUM;
					var last = DEFAULT_NUM;
					var lastPage = count % DEFAULT_NUM;
					var pageNum = Math.floor(count / DEFAULT_NUM);
					var lastPageNum = (lastPage > 0) ? pageNum + 1 : pageNum;
					var activePage = localStorage.getItem("activePageModal");
					
					if(localStorage.getItem("setFirstPageModal") != null){
						var setFirstPage = localStorage.getItem("setFirstPageModal");
						localStorage.removeItem("setFirstPageModal");
					}else{
						var setFirstPage = 1;
					}
					
					var setLastPage = parseInt(setFirstPage) + 9;
					
					if(setLastPage > lastPageNum){
						setLastPage = lastPageNum;
					}
					
					selectData.betFirstNum = isNaN(start) ? 0 : start;
					selectData.betLastNum = last;
					
					pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePreviousModal(this);'>Previous</a></li>";
					
					for(var i = setFirstPage; i <= setLastPage; i++){
						if(i == activePage){
							pageHtml += "<li class='page-item active' id='page_"+ i +"'><a class='page-link' href='#' data-number='"+ i +"' onClick='pageClickModal(this);'>" + i + "</a></li>"
						}else{
							pageHtml += "<li class='page-item' id='page_"+ i +"'><a class='page-link' href='#' data-number='"+ i +"' onClick='pageClickModal(this);'>" + i + "</a></li>"
						}
					}
					
					pageHtml += "<li class='page-item'><a class='page-link' id='pageNextBtn' href='#' onClick='pageNextModal(this);'>Next</a></li></ul>";
					
					$("#pageDiv_modal").html(pageHtml);
					
					localStorage.setItem("lastPageNumModal", lastPageNum);
					localStorage.removeItem("activePageModal");
					
					$.ajax({
						url:"${path}/acc/modalVatB.do",
						method: "get",
						data: selectData,
						dataType: "json",
						success:function(result){
							if(result.data.length > 0){
								for(var i = 0; i < result.data.length; i++){
									
									tableHtml += "<tr><td style='text-align:center;vertical-align:middle;'><input type='checkbox' class='form-control' id='checkSerial' data-number='" + result.data[i].vatSerial + "' data-code='" + result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'>" 
									+ result.data[i].vatIssueDate + "</td>";
									
									if(result.data[i].custName == '' || result.data[i].custName == null || result.data[i].custName == 'null'){
										tableHtml += "<td style='text-align:right;vertical-align:middle;'>미등록업체</td>"
									}else {
										tableHtml += "<td style='text-align:right;vertical-align:middle;'>" + result.data[i].custName + "</td>"
									}
									tableHtml += "<td style='text-align:right;vertical-align:middle;'>"
								 	+ result.data[i].test.toLocaleString("en-US") + "</td><td style='text-align:right;vertical-align:middle;'>"
								 	+ result.data[i].vatProductName + "</td><td style='text-align:center;vertical-align:middle;'>"
								 	+ result.data[i].vatRemark + "</td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
								 	+ result.data[i].modal_receive_data.toLocaleString("en-US") + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
								 	+ result.data[i].modal_vatmemo + "'></td><td style='text-align:center;vertical-align:middle;'><input type='text' class='form-control-sm' id='modal_vatmemo' style='border: 1px solid #ccc;' onkeyup='inputNumberFormat(this)' value='"
								 	+ result.data[i].modal_vatmemo + "' disabled></td><td style='text-align:right;vertical-align:middle;'>"
								 	+ result.data[i].vatSerial + "</td></tr>";
									
								}
								vatlistTable.html(tableHtml);
							}else{
								vatlistTable.html("");
							}
							if(result.data_secound.length > 0){
								for(var i = 0; i < result.data_secound.length; i++){
									table_sub_Html += "<input id='difference_price_sub' class='form-control-sm' style='border: 1px solid #ccc;' type='hidden' value='" + result.data_secound[i].difference_price.toLocaleString("en-US") + "'>"
									+ "<tr><td><input id='original_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='" + result.data_secound[i].outAmt.toLocaleString("en-US") + "'></td>";
									if(result.data_secound[i].received_price == '' || result.data_secound[i].received_price == null || result.data_secound[i].received_price == 'null'){
										table_sub_Html += "<td id='test'><input id='received_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='0'></td>"
									}else {
										table_sub_Html += "<td id='test'><input id='received_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='" + result.data_secound[i].received_price + "'></td>"
									}
									table_sub_Html += "<td id='test2'><input id='difference_price' class='form-control' style='border: 1px solid #ccc;' type='text' value='" + result.data_secound[i].difference_price.toLocaleString("en-US") + "'></td>"
									if(result.data_secound[i].difference_memo == '' || result.data_secound[i].difference_memo == null || result.data_secound[i].difference_memo == 'null'){
										table_sub_Html += "<td><input id='received_price_detail' class='form-control' style='border: 1px solid #ccc; display: none;' type='text' value=''></td></tr>";
									}else {
										table_sub_Html += "<td><input id='received_price_detail' class='form-control' style='border: 1px solid #ccc; display: none;' type='text' value='" + result.data_secound[i].difference_memo + "'></td></tr>";
									}
								}
								table_test.html(table_sub_Html);
							}else{
								table_test.html("");
							}
						},
						error:function(){
							alert("데이터가 없습니다.");
							return false;
						}
					});
				},
				error:function(){
					alert("카운트에 실패했습니다.");
					return false;
				}
			}); 
		}
		
		function pageClickModal(e){
			var page = $(e).attr("data-number");
			var setFirstPage = $(e).parents("ul").find("li:first").next().children().attr("data-number");
			
			localStorage.setItem("activePageModal", page);
			localStorage.setItem("setFirstPageModal", setFirstPage);
			
			pageNationModal(page, DEFAULT_NUM, $('#baclogId_NUM').val());
		}
		
		//검색 시 페이지네이션
		function fnListcon_modal(){
			var selectData = {};
			var vatlistTable = $("#vatlistTable tbody");
			var table_test = $("#table_test tbody");
			vatlistTable.empty();
			table_test.empty();
			$("#pageDiv_modal").empty();

			selectData.bacSerial = $('#baclogId_NUM').val();
			selectData.betFirstNum = 0;
			selectData.betLastNum = DEFAULT_NUM;
			
			pageNationModal(1, DEFAULT_NUM, selectData);
		}
		//검색 시 페이지네이션
		
		//모달 검색 아코디언
  		function acordian_action_modal(){
			if($("#acordian_modal").css("display") == "none"){
			    $("#acordian_modal").show();
			    $("#fold_modal").hide();
			    $("#fold2_modal").show();
	
			} else {
			    $("#acordian_modal").hide();
			    $("#fold_modal").show();
			}
		}
		function acordian_action1_modal(){
			if($("#acordian_modal").css("display") != "none"){
			    $("#acordian_modal").hide();
			    $("#fold_modal").show();
			    $("#fold2_modal").hide();
	
			} else {
			    $("#acordian_modal").show();
			    $("#fold_modal").hide();
			}
		}
		//모달 검색 아코디언
		
		//모달 date 세팅
		$("#regSDate_modal").change(function(){
			var dateValue = $(this).val();
			var dateValueArr = dateValue.split("-");
			var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
			var EdateValue = $("#regEDate_modal").val();
			var EdateDateArr = EdateValue.split("-");
			var EdateDateCom = new Date(EdateDateArr[0], parseInt(EdateDateArr[1])-1, EdateDateArr[2]);
			
			
			if(EdateValue == ""){
				dateValueCom.setDate(dateValueCom.getDate()+1);
			}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
				alert("시작일이 종료일보다 클 수 없습니다.");
				dateValueCom.setDate(dateValueCom.getDate()+1);
			}else{
				return null;
			}
			
			var year = dateValueCom.getFullYear();
			var month = dateValueCom.getMonth()+1;
			var day = dateValueCom.getDate();
			
			if(month < 10){
				month = "0" + month;
			}
			
			console.log(month);
			if(day < 10){
				day = "0" + day;
			}
			
			$("#regEDate_modal").val(year + "-" + month + "-" + day);
		});
		$("#regEDate_modal_modal").change(function(){
			var SdateValue = $("#regSDate_modal").val();
			var SdateValueArr = SdateValue.split("-");
			var SdateValueCom = new Date(SdateValueArr[0], parseInt(SdateValueArr[1])-1, SdateValueArr[2]);
			var thisDateValue = $(this).val();
			var thisDateArr = thisDateValue.split("-");
			var thisDateCom = new Date(thisDateArr[0], parseInt(thisDateArr[1])-1, thisDateArr[2]);
			
			if(SdateValue == ""){
				thisDateCom.setDate(thisDateCom.getDate()-1);
			}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
				alert("종료일이 시작일보다 작을 수 없습니다.");
				thisDateCom.setDate(thisDateCom.getDate()-1);
			}else{
				return null;
			}
			
			var year = thisDateCom.getFullYear();
			var month = thisDateCom.getMonth()+1;
			var day = thisDateCom.getDate();
			
			if(month < 10){
				month = "0" + month;
			}
			
			if(day < 10){
				day = "0" + day;
			}
			
			$("#regSDate_modal").val(year + "-" + month + "-" + day);
		});
</script>
<style>
	.modal-content {
    width: 100%;
}
</style>