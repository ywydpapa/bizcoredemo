<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2021-12-29
  Time: 오전 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
<table class="table table-sm bst02 tablesorter" id="qutylist">
    <colgroup>
        <col width="3%" />
        <col width="15%" />
        <col width="15%" />
        <col width="7%" />
        <col width="7%" />
        <col width="7%" />
        <col width="7%" />
        <col width="7%" />
        <col width="25%" />
        <col width="10%" />
    </colgroup>
    <thead>
    <tr>
    	<th class="text-center">거래일자</th>
        <th class="text-center">거래처</th>
        <th class="text-center">항목</th>
        <th class="text-center">단가</th>
        <th class="text-center">수량</th>
        <th class="text-center">공급가액</th>
        <th class="text-center">부가세액</th>
        <th class="text-center">금액</th>
        <th class="text-center">비고</th>
        <th class="text-center">삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="row" items="${detailListData}">
    	<input type="hidden" value="${row.appStatus}" />
    	<input type="hidden" id="docAppSerial" value="${row.docAppSerial}" />
    	<tr>
    		<c:choose>
    			<c:when test="${empty row.productDate}">
    				<td id='dataDate' style='text-align:center'>${row.regDate}</td>
    			</c:when>
    			<c:otherwise>
    				<td id='dataDate' style='text-align:center'>${row.productDate}</td>
    			</c:otherwise>
    		</c:choose>
    		<td id='salesCustNoN' style='text-align:center;'>${row.custName}</td>
    		<td id='dataTitle' style='text-align:center;'>${row.productName}</td>
    		<td id='dataNetprice' style='text-align: right;'>₩<fmt:formatNumber value="${row.productNetprice}" pattern="#,###" /></td>
    		<td id='dataQuanty' style='text-align: right;'>${row.productQty}</td>
    		<td id='dataAmt' style='text-align: right;'>₩<fmt:formatNumber value="${row.productAmount}" pattern="#,###" /></td>
    		<td id='dataVat' style='text-align: right;'>₩<fmt:formatNumber value="${row.productVat}" pattern="#,###" /></td>
    		<td id='dataTotal' style='text-align: right;'>₩<fmt:formatNumber value="${row.productTotal}" pattern="#,###" /></td>
    		<td id='dataRemark'>${row.productRemark}</td>
    		<c:if test="${(row.appStatus == 1 || row.appStatus == 2 || row.appStatus == 3) && sessionScope.userNo == row.userNoCR}">
	    		<td style="text-align:center;">
	    			<button class='btn btn-sm btn-inverse' id="dataUpBtn" data-number="0" style='margin-right:1%;'>수정</button>
	    			<button class='btn btn-sm btn-danger' id="dataDelBtn">삭제</button>
	    		</td>
	    	</c:if>
	    	<c:if test="${(row.appStatus == 4 || row.appStatus == 5) && sessionScope.userNo != row.userNoCR}">
	    		<td style="text-align:center;">
	    		</td>
	    	</c:if>
    	</tr>
    </c:forEach>
    </tbody>
</table>
<br/>
<table class="table table-sm">
    <tr class="item2">
        <td colspan="1" style="text-align: center; background: #80808030;">합계</td>
        <td colspan="11" style="text-align: right; background: #80808030;" id="product02InSum_table">0</td>
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
    
    $('#userModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
    
    function fnSetUserData(a, b) {
		$("#userName").val(b);
		$("#userNo").val(a);
		$(".modal-backdrop").remove();
		$("#userModal").modal("hide");
	}
    
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
    /* function fn_data02delete(soppdataNo) {
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
    } */

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