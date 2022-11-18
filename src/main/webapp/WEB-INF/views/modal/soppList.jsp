<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
	<table id="soppDataTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th>영업기회번호</th>
				<th>영업기회명</th>
				<th>거래처명</th>
				<th>담당자</th>
				<th>리스트</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr align="center">
					<td>${row.soppNo}</td>
					<td><a href="javascript:fnSetSoppData('${row.soppTitle}','${row.soppNo}','${row.userNo}','${row.custNo}');" title="${row.soppTitle}">${row.soppTitle}</a></td>
					<td title="${row.custName}">${row.custName}</td>
					<td>${row.userName}</td>
					<td><button type="button" class="btn btn-sm btn-primary" onclick="javascript:mouseClick('${row.soppNo}');">보기</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table>
		<colgroup>
			<col width="25%" />
			<col width="45%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th class="text-center">영업기회명</th>
				<th class="text-center">예상매출</th>
				<th class="text-center">매출예정일</th>
			</tr>
		</thead>
	<tbody id="ItemFilelist">
		
	</tbody>
	</table>
	
	<table>
		<colgroup>
			<col width="25%" />
			<col width="45%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th class="text-center">매입항목</th>
				<th class="text-center">매입금액</th>
				<th class="text-center">매입처</th>
			</tr>
		</thead>
	<tbody id="ItemFilelist2">
		
	</tbody>
	</table>
	
</div>
<style>
	#soppTable > tbody > tr > td:nth-child(1){
		max-width: 75px;
	}
	#soppTable > tbody > tr > td:nth-child(2){
		text-overflow: ellipsis;
		max-width: 250px;
		overflow: hidden;
	}
	#soppTable > tbody > tr > td:nth-child(3){
		text-overflow: ellipsis;
		max-width: 150px;
		overflow: hidden;
	}
	#soppTable > tbody > tr > td:nth-child(4){
		text-overflow: ellipsis;
		max-width: 70px;
		overflow: hidden;
	}
</style>
<script>
$(function(){
    $('#soppDataTable').DataTable({
    	info:false,
		searching: true
    });
});

function mouseClick(soppNo){
	$("#ItemFilelist").empty();
	$("#ItemFilelist2").empty();
	
	$.ajax({
		url: "${path}/sopp/hovermodaldetail/" + soppNo,
		method: "post",
		dataType: "json",
		success:function(result){
			if(result.data.soppTargetDate != null){
				$("#ItemFilelist").append('<tr class="item1">' + '<td class="text-center">' + result.data.soppTitle + '</td>' + '<td class="text-center">' + parseInt(result.data.soppTargetAmt).toLocaleString("en-US") + '</td>' + '<td class="text-center">' + result.data.soppTargetDate + '</td>' + '</tr>');
			}else{
				$("#ItemFilelist").append('<tr class="item1">' + '<td class="text-center">' + result.data.soppTitle + '</td>' + '<td class="text-center">' + parseInt(result.data.soppTargetAmt).toLocaleString("en-US") + '</td>' + '<td class="text-center">미정</td>' + '</tr>');
			}
			
			if(result.data2.length > 0 ){
				for(var i=0; i<result.data2.length; i++){
					$("#ItemFilelist2").html('<tr class="item2">' + '<td class="text-center">' + result.data2[i].dataTitle + '</td>' + '<td class="text-center">' + parseInt(result.data2[i].dataTotal).toLocaleString("en-US") + '</td>' + '<td class="text-center">' + result.data2[i].salesCustNoN + '</td>' + '</tr>');
				}
			}
		}
	});
}
</script>