<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
	<div id="reloadBackDiv">
		<button type="button" class="btn btn-primary" id="reloadBackBtn" onclick="reloadBack();">뒤로가기</button>
	</div><br />
	<input type="hidden" id="hiddenVatType" value="${param.vatType}" >
    <table id="custVatList_DataTable" class="table table-striped table-bordered nowrap">
        <colgroup>
            <col width="10%"/>
            <col width="22%"/>
            <col width="10%"/>
            <col width="7%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
        <tr>
            <th class="text-center">등록일</th>
            <th class="text-center">거래처</th>
            <th class="text-center">수금확인</th>
            <th class="text-center">품명</th>
            <th class="text-center">상태</th>
            <th class="text-center">공급가</th>
            <th class="text-center">세액</th>
            <th class="text-center">합계금액</th>
            <th class="text-center">입/출금 일시</th>
            <th class="text-center">남은 금액(계산서)</th>
        </tr>
        </thead>
        <tbody>
	        <c:forEach items="${list}" var="list">
	            <tr>
	            	<td class="text-center">${list.vatIssueDate}</td>
	                <td class="text-center">
	                	<c:if test = "${list.vatType eq 'S'}">${list.vatBuyerName}</c:if> 
	                	<c:if test = "${list.vatType eq 'B'}">${list.vatSellerName}</c:if>
	               	</td>
	               	<td class="text-center"><a href="#" class="btn btn-sm btn-primary" data-id="${list.contNo}" onclick="reloadVatListB(this);">수금확인</a></td>
	               	<c:choose>
	               		<c:when test="${empty list.vatMemo}">
			                <td class="text-center">${list.vatProductName}</td>
	               		</c:when>
	               		<c:otherwise>
	               			<td class="text-center">${list.vatProductName}(${list.vatMemo})</td>
	               		</c:otherwise>
	               	</c:choose>
	                <td class="text-center">
	                	<c:if test = "${list.vatStatus eq 'B1'}">매입발행</c:if>
	                	<c:if test = "${list.vatStatus eq 'B3'}">지급처리중</c:if>
	                	<c:if test = "${list.vatStatus eq 'B5'}">지급완료</c:if>
	                    <c:if test = "${list.vatStatus eq 'S1'}">매출발행</c:if>
	                    <c:if test = "${list.vatStatus eq 'S3'}">수금처리중</c:if>
	                    <c:if test = "${list.vatStatus eq 'S5'}">수금완료</c:if>
	                </td>
	                <td class="text-right">
	                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.vatAmount}" />
	                </td>
	                <td class="text-right">
	                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.vatTax}" />
	                </td>
	                <td class="text-right">
	                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.vatAmount + list.vatTax}" />
	                </td>
	                <td class="text-center">${list.baclogTime}</td>
	                <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.remain_data}" /></td>
	            </tr>
	        </c:forEach>
        </tbody>
    </table>
    <table id="reloalCustVatList" class="table table-striped table-bordered nowrap">
        <colgroup>
            <col width="10%"/>
            <col width="22%"/>
            <col width="10%"/>
            <col width="7%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
        <tr>
            <th class="text-center">등록일</th>
            <th class="text-center">거래처</th>
            <th class="text-center">계산서번호</th>
            <th class="text-center">품명</th>
            <th class="text-center">상태</th>
            <th class="text-center">공급가</th>
            <th class="text-center">세액</th>
            <th class="text-center">합계금액</th>
            <th class="text-center">입/출금 일시</th>
            <th class="text-center">남은 금액(계산서)</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

<script>
	$(document).ready(function(){
        $('#custVatList_DataTable').DataTable({
            info:false,
            searching: true
        });
        
        console.log($("#hiddenVatType").val());
        
        $("#reloalCustVatList").hide();
        $("#reloadBackDiv").hide();
	});
	
    function reloadVatListB(e){
    	var selectData = {};
    	var compNo = "${sessionScope.compNo}";
    	var contNo = $(e).attr("data-id");
    	var vatType = $("#hiddenVatType").val();
		var setHtml = "";
		
    	$('#custVatList_DataTable').hide();
    	$("#reloalCustVatList").DataTable().destroy();
    	$("#custVatList_DataTable").DataTable().destroy();
    	
    	console.log($("#hiddenVatType").val());
    	
    	selectData.compNo = compNo;
    	selectData.contNo = contNo;
    	selectData.vatType = vatType;
    	
    	$.ajax({
    		url: "${path}/acc/reloadVatListB.do",
    		method: "post",
    		data: selectData,
    		dataType: "json",
    		success:function(data){
    			for(var i = 0; i < data.length; i++){
    				setHtml += "<tr>";
    				setHtml += "<td class='text-center'>" + data[i].vatIssueDate + "</td>";
    				setHtml += "<td class='text-center'>" + data[i].custName + "</td>";
    				setHtml += "<td class='text-center'>" + data[i].vatSerial + "</td>";
    				
    				if(data[i].vatMemo !== "" && data[i].vatMemo !== null){
	    				setHtml += "<td class='text-center'>" + data[i].vatProductName + "(" + data[i].vatMemo + ")" + "</td>";
    				}else{
    					setHtml += "<td class='text-center'>" + data[i].vatProductName + "</td>";
    				}
    				
    				if(data[i].vatStatus === "B1"){
    					setHtml += "<td class='text-center'>매입발행</td>";	
    				}else if(data[i].vatStatus === "B3"){
    					setHtml += "<td class='text-center'>지급처리중</td>";
    				}else{
    					setHtml += "<td class='text-center'>지급완료</td>";
    				}
    				
    				setHtml += "<td class='text-right'>" + parseInt(data[i].vatAmount).toLocaleString("en-US") + "</td>";
    				setHtml += "<td class='text-right'>" + parseInt(data[i].vatTax).toLocaleString("en-US") + "</td>";
    				setHtml += "<td class='text-right'>" + parseInt(data[i].vatAmount + data[i].vatTax).toLocaleString("en-US") + "</td>";
    				
    				if(data[i].baclogTime !== null && data[i].baclogTime !== ""){
    					setHtml += "<td class='text-center'>" + data[i].baclogTime + "</td>";
    				}else{
	    				setHtml += "<td class='text-center'></td>";
    				}
    				
    				if(parseInt(data[i].remain_data) > 0){
	    				setHtml += "<td class='text-right'>" + parseInt(data[i].remain_data).toLocaleString("en-US") + "</td>";
    				}else{
    					setHtml += "<td class='text-right'></td>";
    				}
    				
    				setHtml += "</tr>";
    			}
    			
    			$("#reloalCustVatList tbody").html(setHtml);
    			$("#reloalCustVatList").show();

    			$('#reloalCustVatList').DataTable({
    	            info:false,
    	            destroy: true,
    	            searching: true
    	        });
    			
    			$("#reloadBackDiv").show();
    		},
    		error:function(){
    			
    		}
    	});
    }
    
    function reloadBack(){
    	$("#reloalCustVatList").DataTable().destroy();
    	$("#reloalCustVatList").hide();
    	$("#reloadBackDiv").hide();
    	
    	$('#custVatList_DataTable').DataTable({
            info:false,
            destroy: true,
            searching: true
        });
    	
    	$('#custVatList_DataTable').show();
    }
</script>
