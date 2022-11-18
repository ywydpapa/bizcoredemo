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
							<!-- <div class="col-sm-12 col-xl-2">
								<label class="col-form-label">거래처</label>
								<input type="text" class="form-control form-control-sm" id="custName_modal" name="" placeholder="" value="">
							</div> -->
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
  <table id="vatlistTable" class="table table-striped table-bordered nowrap" style="width:100%; overflow:hidden;">
    <thead>
	    <tr>
	    	<td style="vertical-align:middle; width:5%;"><input type="checkbox" class="form-control" id="cardAllCheck" name="cardAllCheck" onclick="allCheck(this);"></td>
	    	<th>일자</th>
	      	<th>거래처</th>
	      	<th>금액</th>
	      	<th>품명</th>
	      	<th>비고</th>
	      	<th>승인번호</th>
	    </tr>
    </thead>
    <tbody>
	    <c:forEach var="row" items="${list}">
	      <tr align="center">
	      	<td><input type="checkbox" class="form-control" id="checkSerial" data-number="${row.vatSerial}" style="margin-top:3px;width:30px;"></td>
	      	<td><input type="date" class="form-control" value="${row.vatIssueDate}" max="9999-12-31" id="cardDate_bacB" style="width:auto;"></td>
	        <c:choose>
		        <c:when test="${empty row.custName}">
		           <td>미등록업체</td>
		        </c:when>
		        <c:otherwise>
		          	<td>${row.custName}</td>
		        </c:otherwise>
	        </c:choose>
	        <td>₩<fmt:formatNumber value="${row.vatAmount + row.vatTax}" pattern="#,###" /></td>
	        <td>${row.vatProductName}</td>
	        <td class="text-left">${row.vatRemark}</td>
	        <td>${row.vatSerial}</td>
	        <!-- <a href="javascript:fnvatListB('${row.vatSerial}', '${row.vatSellerCustNo}', '${row.vatAmount}');"></a>  -->
	      </tr>
	    </c:forEach>
    </tbody>
  </table>
</div>

<script>
  $(function(){
    $('#vatlistTable').DataTable({
      info:false,
      searching: true,
      destroy: true,
    });
  });
  
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
		  localStorage.setItem('lastTab', $('#baclist_num').val());
		  localStorage.setItem('lastpageNum', $('#reloadpage_num').val());
		  location.href="${path}/acc/bacdetail.do";
	  }else{
		  return false;
	  }
  }
  
  function checkConnect(){
	  if(confirm("선택하신 번호 연결하시겠습니까??")){
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
				  
				  $.ajax({
					 url: "${path}/acc/bacCheckConnect.do",
					 method: "post",
					 data: insertData,
					 async: false,
					 dataType: "json"
				  });
			  }
		  });
		  
		  alert("연결되었습니다.");
		  localStorage.setItem('lastTab', $('#baclist_num').val());
		  localStorage.setItem('lastpageNum', $('#reloadpage_num').val());
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
  
  function fnListcon_modal(){
		var selectData = {};
		var vatlistTable = $("#vatlistTable tbody");
		var html = "";
		
		
		
		selectData.regSDate_modal = $(document).find("#regSDate_modal").val();
		selectData.regEDate_modal = $(document).find("#regEDate_modal").val();
		
		$.ajax({
			url: "${path}/acc/modalVatListB.do",
			method: "post",
			data: selectData,
			dataType: "json",
			success:function(result){
			    for(var i = 0; i < result.length; i++){
		    	  	html += "<tr align='center'>";
		    	  	html += "<td><input type='checkbox' class='form-control' id='checkSerial' data-number=" + result[i].vatSerial + " style='margin-top:3px;width:30px;'></td>";
		    	  	html += "<td><input type='date' class='form-control' value=" + result[i].vatIssueDate + " max='9999-12-31' id='cardDate_bacB' style='width:auto;'></td>";
		    	  	if(result[i].custName === "" || result[i].custName === null){
			    	  	html += "<td>미등록업체</td>";
		    	  	}else{
		    		  	html += "<td>" + result[i].custName + "</td>";
		    	  	}
		    	  	html += "<td>₩" + parseInt(result[i].vatAmount + result[i].vatTax).toLocaleString("en-Us") + "</td>";
		    	  	html += "<td>" + result[i].vatProductName + "</td>";
		    	  	html += "<td class='text-left'>" + result[i].vatRemark + "</td>" ;
		    	  	html += "<td>" + result[i].vatSerial + "</td>";
			    }
			    
			    $("#vatlistTable").DataTable().destroy()
			    vatlistTable.html(html);
			    
			    $('#vatlistTable').DataTable({
		        	info:false,
		        	searching: true,
		        	destroy: true,
		      	});
			}
		});
		
	}
  
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