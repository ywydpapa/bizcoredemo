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

<div class="dt-responsive table-responsive">
	<div>
		<span>계좌번호선택</span>
		<select id="bacNo" class="form-control">
			<c:forEach var="row" items="${list}">
				<option value="${row.bacNo}">${row.bacNo}</option>
			</c:forEach>
		</select><br>
		
		<span>거래점(ex:기업)</span>
		<input type="text" class="form-control" id="branchCode"><br>
		
		<span>거래종류(ex:타행입금)</span>
		<input type="text" class="form-control" id="logType">
	</div>
</div>

<script>
    function fnvatListS(a, b, c) {
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
</script>