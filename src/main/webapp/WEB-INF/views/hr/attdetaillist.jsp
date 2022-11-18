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
<table class="table table-sm bst02" id="qutylist">
    <colgroup>
        <col width="20%" />
        <col width="20%" />
        <col width="20%" />
        <col width="20%" />
        <col width="20%" />
    </colgroup>
    <thead>
    <tr>
        <th class="text-center">구분</th>
        <th class="text-center">시작일자</th>
        <th class="text-center">종료일자</th>
        <th class="text-center">비고</th>
        <th class="text-center">삭제</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>
<br/>
<script>
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
    });
</script>