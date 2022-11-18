<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<form name="form2" method="post" onsubmit="return false;">
    <table class="table table-sm bst02">
        <tbody>
        <tr>
            <th scope="row">견적목록</th>
        </tr>
        </tbody>
    </table>
    <table class="table table-sm bst02" id="addquty">
        <colgroup>
            <col width="5%" />
            <col width="17.5%" />
            <col width="17.5%" />
            <col width="10%" />
            <col width="10%" />
            <col width="20%" />
            <col width="15%" />
            <col width="5%" />
        </colgroup>
        <thead>
        <tr>
            <th class="text-center">구분<br/>(매입/매출)</th>
            <th class="text-center">거래처<br/>(매입/매출처)</th>
            <th class="text-center">항목</th>
            <th class="text-center">단가</th>
            <th class="text-center">수량</th>
            <th class="text-center">금액</th>
            <th class="text-center">비고</th>
            <th class="text-center">삭제</th>
        </tr>
        </thead>
        <tbody>
            <tr class="item1">
                <td>
                    <select id="data02Type">
                        <option value="2201">매입</option>
                        <option value="2202">매출</option>
                    </select>
                </td>
                <td>
                    <div class="input-group input-group-sm mb-0">
                        <input type="text" class="form-control" name="product" id="productSalesEstimateCustName" value="" />
                        <input type="hidden" id="productSalesEstimateCustNo" value="" />
                        <input type="hidden" id="soppdataNoEstimate" value="">
                        <span class="input-group-btn">
                            <button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=productdataListSalesEstimateCust" type="button" data-toggle="modal" data-target="#productCustModal3">
                                <i class="icofont icofont-search"></i>
                            </button>
                        </span>
                        <!--modal-->
                        <div class="modal fade " id="productCustModal3" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-80size" role="document">
                                <div class="modal-content modal-80size">
                                    <div class="modal-header">
                                        <h4 class="modal-title">매입/매출 거래처 목록</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-success waves-effect" id="custRegSimple2">간편추가</button>
                                    </div>
                                    <div style="display: none; border: solid; width: 80%; margin: auto; margin-bottom: 5px;" id="custRegSimple_div2">
                                        <table>
                                            <colgroup>
                                                <col width="10%">
                                                <col width="75%">
                                                <col width="15%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th>매출처명*</th>
                                                <td><input type="text" value="" id="custRegSimple_custName2" style="width: 100%;"> </td>
                                                <td><button type="button" class="btn-sm btn-dark" id="custRegSimple_custName_check2">중복확인</button></td>
                                            </tr>
                                            <tr>
                                                <th>담당자</th>
                                                <td><input type="text" value="" id="custRegSimple_custMemerName2" style="width: 100%;" placeholder="미입력시 미정으로 세팅됩니다."></td>
                                                <td><button type="button" class="btn-sm btn-success" id="custRegSimple_custName_register2">등록</button></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--//modal-->
                    </div>
                </td>
                <td>
                    <div class="input-group input-group-sm mb-0">
                        <input type="hidden" id="productNo2" value="" />
                        <input type="text" class="form-control" name="product" id="data02Title" value="" />
                        <span class="input-group-btn">
                            <button class="btn btn-primary sch-company" onclick="fn_productdataTableReload2()" type="button" data-toggle="modal" data-target="#productdataModal2">
                                <i class="icofont icofont-search"></i>
                            </button>
                        </span>
                    </div>
                    <!--모달 팝업-->
                    <div class="modal fade" id="productdataModal2" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-80size" role="document">
                            <div class="modal-content modal-80size">
                                <div class="modal-header">
                                    <h4 class="modal-title">상품목록</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <%--<%@ include file="/WEB-INF/views/modal/productdataList.jsp" %>--%>
                                    <jsp:include page="/WEB-INF/views/modal/productdataListSalesEstimate.jsp" />
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--//모달 팝업-->
                </td>
                <td><input type="text" class="form-control form-control-sm" id="data02Netprice" style="min-width: 80px;" /></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Quanty" style="min-width: 80px;" value="1" min="1"/></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Amt" style="min-width: 80px;" readonly /></td>
                <td><input type="text" id="data02Remark" class="form-control form-control-sm" /></td>
                <td>
                    <button id="data02Addbtn" class="btn btn-success btn-sm" onClick="javascript:fn_data02Insert()">추가</button>
                    <button id="data02Modbtn" class="btn btn-instagram btn-sm" onClick="javascript:fn_data02Update()">수정</button>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <details>
                        <summary><span style="color: red">등록시 주의사항</span></summary>
                        <p>매입/매출처(거래처)는 모달창을 통해 추가하셔야 됩니다. 삭제는 직접 지우시면 됩니다.</p>
                    </details>
                </td>
            </tr>
        </tbody>
    </table>
</form>

<script>
    $('#productCustModal3').on('show.bs.modal', function(e) {
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    $("#custRegSimple2").on("click",function (event) {
        if($("#custRegSimple_div2").is(':visible') == false){
            $("#custRegSimple_div2").show();
            $("#custRegSimple2").html("간편등록 취소");
        } else {
            $("#custRegSimple_div2").hide();
            $("#custRegSimple2").html("간편등록");
        }
    });

    $("#custRegSimple_custName_check2").on("click", function (event) {
        var custRegSimple_custName = $("#custRegSimple_custName2").val();
        var obj = new Object();
        obj.custName = custRegSimple_custName;
        $.ajax({
            url: "${path}/cust/custNameCheck", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
        .done(function(data) {
            console.dir(data);
            if(data.code == 10001){
                console.log("응답 성공");
                var html= "";
                if(data.result1.length > 0){
                    var tempArr = data.result1;
                    html += "같은 결과) \n";
                    for(var i=0; i<tempArr.length; i++){
                        html += "번호 : " + tempArr[i].custNo + " / 매출처 : " + tempArr[i].custName + "\n";
                    }
                }

                if(data.result2.length > 0){
                    var tempArr = data.result2;
                    html += "\n유사 결과) \n";
                    for(var i=0; i<tempArr.length; i++){
                        html += "번호 : " + tempArr[i].custNo + " / 매출처 : " + tempArr[i].custName + "\n";
                    }
                }

                if(data.result1.length == 0 && data.result2.length == 0){
                    html += "일치검색, 유사검색결과가 존재하지 않습니다.\n";
                }

                html += "\n등록하시겠습니까?";
                var result = confirm(html);

                if(result){
                    console.log("등록진행");
                } else {
                    console.log("등록거부");
                }
            }else{
                alert("응답 실패");
            }
        }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
        .fail(function(xhr, status, errorThrown) {
            alert("통신 실패");
        });
    });

    $("#custRegSimple_custName_register2").on("click", function (event) {
        var custRegSimple_custName = $("#custRegSimple_custName2").val();
        var custRegSimple_custMemerName = $("#custRegSimple_custMemerName2").val();

        var obj = new Object();
        obj.custName = custRegSimple_custName;
        obj.custMemberName = custRegSimple_custMemerName;

        $.ajax({
            url: "${path}/cust/simpleRegister", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
            .done(function(result) {
                console.dir(result);
                if(result.code == 10001){
                    alert("저장 성공");
                    $('#productCustModal3').modal('hide');
                    $("#productSalesEstimateCustName").val(result.data.custName);
                    $("#productSalesEstimateCustNo").val(result.data.custNo);
                }else{
                    alert("저장 실패");
                }
            }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                alert("통신 실패");
            });
    });

    function fn_data02Insert() {
        var data02Data = {};
        data02Data.soppNo 		= $("#soppNo").val();
        data02Data.catNo	 	= '100004';
        if($("#productSalesEstimateCustName").val() != "") data02Data.salesCustNo = Number($("#productSalesEstimateCustNo").val());
        if($("#data02Title").val() != "") {
            if($("#productNo2").val() != "") data02Data.productNo	= $("#productNo2").val();
            data02Data.dataTitle 	= $("#data02Title").val();
        }
        data02Data.dataType		= $("#data02Type").val();
        data02Data.dataNetprice	= $("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataQuanty	= $("#data02Quanty").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataAmt 		= $("#data02Amt").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataRemark 	= $("#data02Remark").val();

        if(!data02Data.dataQuanty){
            alert("단가를 입력해주십시오.");
            return;
        } else if(!data02Data.dataAmt){
            alert("수량을 입력해주십시오.");
            return;
        } else if (!data02Data.dataTitle){
            alert("상품명을 입력해주십시오.");
            return;
        }

        $.ajax({
            url: "${path}/sopp/insertdata02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: data02Data , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
        .done(function(data) {
            if(data.code == 10001){
                alert("저장 성공");

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

                var url="${path}/sopp/qutylist/"+$("#soppNo").val();
                fn_Reloaddata02(url);
            }else{
                alert("저장 실패");
            }
        }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
        .fail(function(xhr, status, errorThrown) {
            alert("통신 실패");
        });
    }

    function fn_data02Update() {
        var data02Data = {};
        data02Data.soppNo 		= $("#soppNo").val();
        data02Data.catNo	 	= '100004';
        data02Data.soppdataNo   = $("#soppdataNoEstimate").val();
        if($("#productSalesEstimateCustName").val() != "") data02Data.salesCustNo = Number($("#productSalesEstimateCustNo").val());
        if($("#data02Title").val() != "") {
            if($("#productNo2").val() != "") data02Data.productNo	= $("#productNo2").val();
            data02Data.dataTitle 	= $("#data02Title").val();
        }
        data02Data.dataType		= $("#data02Type").val();
        data02Data.dataNetprice	= $("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataQuanty	= $("#data02Quanty").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataAmt 		= $("#data02Amt").val().replace(/[\D\s\._\-]+/g, "");
        data02Data.dataRemark 	= $("#data02Remark").val();

        if(!data02Data.dataQuanty){
            alert("단가를 입력해주십시오.");
            return;
        } else if(!data02Data.dataAmt){
            alert("수량을 입력해주십시오.");
            return;
        } else if (!data02Data.dataTitle){
            alert("상품명을 입력해주십시오.");
            return;
        }

        $.ajax({ url: "${path}/sopp/updatedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: data02Data , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
            .done(function(data) {
                if(data.code == 10001){
                    alert("저장 성공");
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

                    $("#data02Addbtn").show();
                    $("#data02Modbtn").hide();

                    var url="${path}/sopp/qutylist/"+$("#soppNo").val();
                    fn_Reloaddata02(url);
                }else{
                    alert("저장 실패");
                }
            }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                $(e).addClass("btn-dark");
                $(e).removeClass("btn-warning");
                $(e).html('수정');
                $("#data02Addbtn").show();
                $("#data02Modbtn").hide();
                alert("통신 실패");
            });
    }

    $(document).ready(function(){
        $('#data02Netprice,#data02Quanty').on('keyup',function(){

            var sum1 = parseInt($("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
            var sum2 = parseInt($("#data02Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0);

            var sum = sum1 * sum2;
            $("#data02Netprice").val(sum1.toLocaleString("en-US"));
            $("#data02Quanty").val(sum2.toLocaleString("en-US"));
            $("#data02Amt").val(sum.toLocaleString("en-US"));
        });

        $("#data02Modbtn").hide();
    });
</script>
