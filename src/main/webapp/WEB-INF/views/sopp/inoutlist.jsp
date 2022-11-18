<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-sm bst02" id="inoutlist">
	<colgroup>
		<col width="10%" />
		<col width="17.5%" />
		<col width="17.5%" />
		<col width="10%" />
		<col width="10%" />
		<col width="5%" />
		<col width="15%" />
		<col width="5%" />
		<col width="5%" />
	</colgroup>
	<thead>
		<tr>
			<th class="text-center">구분(등록/수정일)</th>
			<th class="text-center">거래처(매입/매출처)</th>
			<th class="text-center">항목</th>
			<th class="text-center">단가</th>
			<th class="text-center">수량</th>
			<th class="text-center">금액</th>
			<th class="text-center">비고</th>
			<th class="text-center">수정</th>
			<th class="text-center">삭제</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${dtodata01}">
		<c:if test="${row.dataType eq '1101'}">
			<tr class="item1" id="${row.soppdataNo}">
				<td data-type="${row.dataType}">
					매입
					(
					<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>
					)
				</td>
				<td>${row.salesCustNoN}<input hidden value="${row.salesCustNo}"></td>
				<td>${row.dataTitle}<input hidden value="${row.productNo}"></td>
				<td style="text-align: right">₩<fmt:formatNumber value="${row.dataNetprice}" pattern="#,###" /></td>
				<td style="text-align: right"><fmt:formatNumber value="${row.dataQuanty}" pattern="#,###" /></td>
				<td style="text-align: right">₩<fmt:formatNumber value="${row.dataAmt}" pattern="#,###" /></td>
				<td>${row.dataRemark}</td>
				<td><button class="btn btn-sm btn-dark" onClick="javascript:fn_data01modify(this)">수정</button></td>
				<td><button class="btn btn-sm btn-danger" onClick="javascript:fn_data01delete(${row.soppdataNo})">삭제</button></td>
			</tr>
		</c:if>
	</c:forEach>
	<tr class="item1">
		<td colspan="1" style="text-align: center; background: #80808030;">매입합계</td>
		<td colspan="8" style="text-align: right; background: #80808030;" id="product01InSum_table">-</td>
	</tr>
	<c:forEach var="row" items="${dtodata01}">
		<c:if test="${row.dataType eq '1102'}">
			<tr class="item1" id="${row.soppdataNo}">
				<td data-type="${row.dataType}">
					매출
					(
					<fmt:parseDate value="${row.regDatetime}" var="regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${regDatetime}" pattern="yyyy-MM-dd"/>
					)
				</td>
				<td>${row.salesCustNoN}<input hidden value="${row.salesCustNo}"></td>
				<td>${row.dataTitle}<input hidden value="${row.productNo}"></td>
				<td style="text-align: right">₩<fmt:formatNumber value="${row.dataNetprice}" pattern="#,###" /></td>
				<td style="text-align: right"><fmt:formatNumber value="${row.dataQuanty}" pattern="#,###" /></td>
				<td style="text-align: right">₩<fmt:formatNumber value="${row.dataAmt}" pattern="#,###" /></td>
				<td>${row.dataRemark}</td>
				<td><button class="btn btn-sm btn-dark" onClick="javascript:fn_data01modify(this)">수정</button></td>
				<td><button class="btn btn-sm btn-danger" onClick="javascript:fn_data01delete(${row.soppdataNo})">삭제</button></td>
			</tr>
		</c:if>
	</c:forEach>
	<tr class="item1" style="text-align: right">
		<td colspan="1" style="text-align: center; background: #80808030;">매출합계</td>
		<td colspan="8" style="text-align: right; background: #80808030;" id="product01OutSum_table">-</td>
	</tr>
	</tbody>
</table>
<br/>
<table class="table table-sm bst02" id="inoutlistSum">
	<tbody>
		<colgroup>
			<col width="5%" />
			<col width="20%" />
			<col width="5%" />
			<col width="20%" />
			<col width="5%" />
			<col width="20%" />
			<col width="5%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<td style="text-align: center; background: #80808030;">매입 합계</td>
			<td id="product01InSum" style="text-align: right">-</td>
			<td style="text-align: center; background: #80808030;">매출 합계</td>
			<td id="product01OutSum" style="text-align: right">-</td>
			<td style="text-align: center; background: #80808030;">이익 합계</td>
			<td id="product01DiffSum" style="text-align: right">-</td>
			<td style="text-align: center; background: #80808030;">이익률</td>
			<td id="product01Percent" style="text-align: right">-</td>
		</tr>
	</tbody>
</table>

<script>
	var product01In = [
		<c:forEach var="row" items="${dtodata01}" varStatus="i">
			<c:if test="${row.dataType eq '1101'}">
				<c:if test="${!i.last}">${row.dataNetprice},</c:if>
				<c:if test="${i.last}">${row.dataNetprice}</c:if>
			</c:if>
		</c:forEach>
	];
	var product01InQuanty = [
		<c:forEach var="row" items="${dtodata01}" varStatus="i">
		<c:if test="${row.dataType eq '1101'}">
			<c:if test="${!i.last}">${row.dataQuanty},</c:if>
			<c:if test="${i.last}">${row.dataQuanty}</c:if>
		</c:if>
		</c:forEach>
	];
	var product01InSum = 0;
	var product01Out = [
		<c:forEach var="row" items="${dtodata01}" varStatus="i">
		<c:if test="${row.dataType eq '1102'}">
			<c:if test="${!i.last}">${row.dataNetprice},</c:if>
			<c:if test="${i.last}">${row.dataNetprice}</c:if>
		</c:if>
		</c:forEach>
	];
	var product01OutQuanty = [
		<c:forEach var="row" items="${dtodata01}" varStatus="i">
		<c:if test="${row.dataType eq '1102'}">
			<c:if test="${!i.last}">${row.dataQuanty},</c:if>
			<c:if test="${i.last}">${row.dataQuanty}</c:if>
		</c:if>
		</c:forEach>
	];
	var product01OutSum = 0;
	var product01DiffSum = 0;
	var product01Percent = 0;

	function fn_data01modify(e) {
		if($(e).html() == "수정"){
			if($("#data01Modbtn").is(':visible') == true){
				alert("수정은 1개만 가능합니다. 먼저 수정하고 있는것을 마무리하시거나 취소버튼을 클릭해주세요.")
				return;
			}
			var tr = $(e).closest("tr");
			var dataType = $(tr).children().eq(0).data('type');
			if(dataType == 1101){
				$("#data01Type").val("1101");
			} else if(dataType == 1102){
				$("#data01Type").val("1102");
			}

			var soppdataNo = Number(tr.attr("id"));
			$("#soppdataNo").val(soppdataNo);

			var salesCustNoN = $(tr).children().eq(1)[0].innerText;
			var salesCustNo = Number($(tr).children().eq(1)[0].children[0].value);
			$("#productSalesInOutCustName").val(salesCustNoN);
			$("#productSalesInOutCustNo").val(salesCustNo);

			var data01Title = $(tr).children().eq(2)[0].innerText;
			var productNo1 = Number($(tr).children().eq(2)[0].children[0].value);
			$("#data01Title").val(data01Title);
			$("#productNo1").val(productNo1);


			var data01Netprice = $(tr).children().eq(3)[0].innerText.replace('₩','');
			// var data01NetpriceNum = Number(data01Netprice.replace(',',''));
			$("#data01Netprice").val(data01Netprice);

			var data01Quanty = $(tr).children().eq(4)[0].innerText;
			// var data01QuantyNum = Number(data01Quanty.replace(',',''));
			$("#data01Quanty").val(data01Quanty);

			var data01Amt = $(tr).children().eq(5)[0].innerText.replace('₩','');
			$("#data01Amt").val(data01Amt);

			var data01Remark = $(tr).children().eq(6)[0].innerText;
			$("#data01Remark").val(data01Remark);

			$(e).removeClass("btn-dark");
			$(e).addClass("btn-warning");
			$(e).html('취소');

			$("#data01Addbtn").hide();
			$("#data01Modbtn").show();
		} else if($(e).html() == "취소"){
			$("#data01Type option:eq(0)").attr("selected","selected");
			$("#soppdataNo").val("");
			$("#productSalesInOutCustName").val("");
			$("#productSalesInOutCustNo").val("");
			$("#productNo1").val("");
			$("#data01Title").val("");
			$("#data01Netprice").val("");
			$("#data01Quanty").val("");
			$("#data01Amt").val("");
			$("#data01Remark").val("");

			$(e).addClass("btn-dark");
			$(e).removeClass("btn-warning");
			$(e).html('수정');

			$("#data01Addbtn").show();
			$("#data01Modbtn").hide();
		}
	}
	function fn_data01delete(soppdataNo) {
		var msg = "선택한 건을 삭제하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url: "${path}/sopp/deletedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: {soppdataNo : soppdataNo}, // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					var url="${path}/sopp/inoutlist/"+$("#soppNo").val();
					fn_Reloaddata01(url);
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}
	}

	$(document).ready(function(){
		for (var i = 0; i < product01In.length; i++) {
			product01InSum += (product01In[i] * product01InQuanty[i]);
		}
		for (var i = 0; i < product01Out.length; i++) {
			product01OutSum += (product01Out[i] * product01OutQuanty[i]);
		}
		product01DiffSum = product01OutSum - product01InSum;
		$("#product01InSum").html('₩'+product01InSum.toLocaleString("en-US"));
		$("#product01InSum_table").html('₩'+product01InSum.toLocaleString("en-US"));
		$("#product01OutSum").html('₩'+product01OutSum.toLocaleString("en-US"));
		$("#product01OutSum_table").html('₩'+product01OutSum.toLocaleString("en-US"));
		$("#product01DiffSum").html('₩'+product01DiffSum.toLocaleString("en-US"));

		product01Percent = Math.floor(product01DiffSum / product01OutSum * 100).toFixed(2);
		if(product01Percent == 'NaN'){
			$("#product01Percent").html('0'+'%');
		} else if (product01Percent == '-Infinity'){
			$("#product01Percent").html('0'+'%');
		} else if (product01Percent == 'Infinity'){
			$("#product01Percent").html('0'+'%');
		} else if(product01Percent >= 0){
			$("#product01Percent").html('+'+product01Percent+'%');
		} else if(product01Percent < 0){
			$("#product01Percent").html(product01Percent+'%');
		}

		var prduct01Cnt = product01In.length + product01Out.length;
		$("#dataType01_tab02").html("매입매출 내역("+prduct01Cnt+")");
	});
</script>