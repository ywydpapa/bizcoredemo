<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-sm bst02" id="qutylist">
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
	<c:forEach var="row" items="${dtodata02}">
		<c:if test="${row.dataType eq '2201'}">
			<tr class="item2" id="${row.soppdataNo}">
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
				<td><button class="btn btn-sm btn-dark" onClick="javascript:fn_data02modify(this)">수정</button></td>
				<td><button class="btn btn-sm btn-danger" onClick="javascript:fn_data02delete(${row.soppdataNo})">삭제</button></td>
			</tr>
		</c:if>
	</c:forEach>
	<tr class="item2">
		<td colspan="1" style="text-align: center; background: #80808030;">매입합계</td>
		<td colspan="8" style="text-align: right; background: #80808030;" id="product02InSum_table">-</td>
	</tr>
	<c:forEach var="row" items="${dtodata02}">
		<c:if test="${row.dataType eq '2202'}">
			<tr class="item2" id="${row.soppdataNo}">
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
				<td><button class="btn btn-sm btn-dark" onClick="javascript:fn_data02modify(this)">수정</button></td>
				<td><button class="btn btn-sm btn-danger" onClick="javascript:fn_data02delete(${row.soppdataNo})">삭제</button></td>
			</tr>
		</c:if>
	</c:forEach>
	<tr class="item2" style="text-align: right">
		<td colspan="1" style="text-align: center; background: #80808030;">매출합계</td>
		<td colspan="8" style="text-align: right; background: #80808030;" id="product02OutSum_table">-</td>
	</tr>
	</tbody>
</table>
<br/>
<table class="table table-sm bst02" id="qutylistSum">
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
			<td id="product02InSum" style="text-align: right">-</td>
			<td style="text-align: center; background: #80808030;">매출 합계</td>
			<td id="product02OutSum" style="text-align: right">-</td>
			<td style="text-align: center; background: #80808030;">이익 합계</td>
			<td id="product02DiffSum" style="text-align: right">-</td>
			<td style="text-align: center; background: #80808030;">이익률</td>
			<td id="product02Percent" style="text-align: right">-</td>
		</tr>
	</tbody>
</table>

<script>
	var product02In = [
		<c:forEach var="row" items="${dtodata02}" varStatus="i">
			<c:if test="${row.dataType eq '2201'}">
				<c:if test="${!i.last}">${row.dataNetprice},</c:if>
				<c:if test="${i.last}">${row.dataNetprice}</c:if>
			</c:if>
		</c:forEach>
	];
	var product02InQuanty = [
		<c:forEach var="row" items="${dtodata02}" varStatus="i">
			<c:if test="${row.dataType eq '2201'}">
				<c:if test="${!i.last}">${row.dataQuanty},</c:if>
				<c:if test="${i.last}">${row.dataQuanty}</c:if>
			</c:if>
		</c:forEach>
	];
	var product02InSum = 0;
	var product02Out = [
		<c:forEach var="row" items="${dtodata02}" varStatus="i">
			<c:if test="${row.dataType eq '2202'}">
				<c:if test="${!i.last}">${row.dataNetprice},</c:if>
				<c:if test="${i.last}">${row.dataNetprice}</c:if>
			</c:if>
		</c:forEach>
	];
	var product02OutQuanty = [
		<c:forEach var="row" items="${dtodata02}" varStatus="i">
			<c:if test="${row.dataType eq '2202'}">
				<c:if test="${!i.last}">${row.dataQuanty},</c:if>
				<c:if test="${i.last}">${row.dataQuanty}</c:if>
			</c:if>
		</c:forEach>
	];
	var product02OutSum = 0;
	var product02DiffSum = 0;
	var product02Percent = 0;

	function fn_data02modify(e) {
		if($(e).html() == "수정"){
			if($("#data02Modbtn").is(':visible') == true){
				alert("수정은 1개만 가능합니다. 먼저 수정하고 있는것을 마무리하시거나 취소버튼을 클릭해주세요.")
				return;
			}
			var tr = $(e).closest("tr");
			var dataType = $(tr).children().eq(0).data('type');
			if(dataType == 2201){
				$("#data02Type").val("2201");
			} else if(dataType == 2202){
				$("#data02Type").val("2202");
			}

			var soppdataNo = Number(tr.attr("id"));
			$("#soppdataNoEstimate").val(soppdataNo);

			var salesCustNoN = $(tr).children().eq(1)[0].innerText;
			var salesCustNo = Number($(tr).children().eq(1)[0].children[0].value);
			$("#productSalesEstimateCustName").val(salesCustNoN);
			$("#productSalesEstimateCustNo").val(salesCustNo);

			var data02Title = $(tr).children().eq(2)[0].innerText;
			var productNo2 = Number($(tr).children().eq(2)[0].children[0].value);
			$("#data02Title").val(data02Title);
			$("#productNo2").val(productNo2);


			var data02Netprice = $(tr).children().eq(3)[0].innerText.replace('₩','');
			// var data02NetpriceNum = Number(data02Netprice.replace(',',''));
			$("#data02Netprice").val(data02Netprice);

			var data02Quanty = $(tr).children().eq(4)[0].innerText;
			// var data02QuantyNum = Number(data02Quanty.replace(',',''));
			$("#data02Quanty").val(data02Quanty);

			var data02Amt = $(tr).children().eq(5)[0].innerText.replace('₩','');
			$("#data02Amt").val(data02Amt);

			var data02Remark = $(tr).children().eq(6)[0].innerText;
			$("#data02Remark").val(data02Remark);

			$(e).removeClass("btn-dark");
			$(e).addClass("btn-warning");
			$(e).html('취소');

			$("#data02Addbtn").hide();
			$("#data02Modbtn").show();
		} else if($(e).html() == "취소"){
			$("#data02Type option:eq(0)").attr("selected","selected");
			$("#soppdataNoEstimate").val("");
			$("#productSalesEstimateCustName").val("");
			$("#productSalesEstimateCustNo").val("");
			$("#productNo2").val("");
			$("#data02Title").val("");
			$("#data02Netprice").val("");
			$("#data02Quanty").val("");
			$("#data02Amt").val("");
			$("#data02Remark").val("");

			$(e).addClass("btn-dark");
			$(e).removeClass("btn-warning");
			$(e).html('수정');

			$("#data02Addbtn").show();
			$("#data02Modbtn").hide();
		}
	}
	function fn_data02delete(soppdataNo) {
		var msg = "선택한 건을 삭제하시겠습니까?";
		if( confirm(msg) ){
			$.ajax({
				url: "${path}/sopp/deletedata02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: {soppdataNo : soppdataNo}, // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					var url="${path}/sopp/inoutlist/"+$("#soppNo").val();
					fn_Reloaddata02(url);
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
		for (var i = 0; i < product02In.length; i++) {
			product02InSum += (product02In[i] * product02InQuanty[i]);
		}
		for (var i = 0; i < product02Out.length; i++) {
			product02OutSum += (product02Out[i] * product02OutQuanty[i]);
		}
		product02DiffSum = product02OutSum - product02InSum;
		$("#product02InSum").html('₩'+product02InSum.toLocaleString("en-US"));
		$("#product02InSum_table").html('₩'+product02InSum.toLocaleString("en-US"));
		$("#product02OutSum").html('₩'+product02OutSum.toLocaleString("en-US"));
		$("#product02OutSum_table").html('₩'+product02OutSum.toLocaleString("en-US"));
		$("#product02DiffSum").html('₩'+product02DiffSum.toLocaleString("en-US"));

		product02Percent = Math.floor(product02DiffSum / product02OutSum * 100).toFixed(2);
		if(product02Percent == 'NaN'){
			$("#product02Percent").html('0'+'%');
		} else if (product02Percent == '-Infinity'){
			$("#product02Percent").html('0'+'%');
		} else if (product02Percent == 'Infinity'){
			$("#product02Percent").html('0'+'%');
		} else if(product02Percent >= 0){
			$("#product02Percent").html('+'+product02Percent+'%');
		} else if(product02Percent < 0){
			$("#product02Percent").html(product02Percent+'%');
		}

		var prduct02Cnt = product02In.length + product02Out.length;
		$("#dataType01_tab03").html("견적 내역("+prduct02Cnt+")");
	});
</script>