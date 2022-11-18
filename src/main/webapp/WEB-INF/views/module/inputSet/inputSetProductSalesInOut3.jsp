<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<form name="form2" method="post" onsubmit="return false;">
    <table class="table table-sm bst02">
        <tbody>
        <tr>
            <th scope="row">매입/매출 목록</th>
        </tr>
        </tbody>
    </table>
    <table class="table table-sm bst02" id="addinout">
        <colgroup>
            <col width="3%" />
            <col width="4%" />
            <col width="10%" />
            <col width="20%" />
            <col width="10%" />
            <col width="3%" />
            <col width="10%" />
            <col width="10%" />
            <col width="10%" />
            <col width="15%" />
            <col width="5%" />
        </colgroup>
        <thead>
        <tr>
            <th class="text-center">구분<br/>(매입/매출)</th>
            <th class="text-center">거래일자</th>
            <th class="text-center">거래처<br/>(매입/매출처)</th>
            <th class="text-center">항목</th>
            <th class="text-center">단가</th>
            <th class="text-center">수량</th>
            <th class="text-center">공급가</th>
            <th class="text-center">부가세</th>
            <th class="text-center">합계금액</th>
            <th class="text-center">적요</th>
            <th class="text-center">기능</th>
        </tr>
        </thead>
        <tbody>
            <tr class="item1">
                <td>
                    <select id="data01Type" name="data01Type">
                        <option value="1101">매입</option>
                        <option value="1102">매출</option>
                    </select>
                </td>
                <td>
                    <input type="date" id="ioDate" max="9999-12-30" name="inDate">
                </td>
                <td>
                    <div class="input-group input-group-sm mb-0">
                        <input type="text" class="form-control" name="product" id="productSalesInOutCustName" value="" readonly>
                        <input type="hidden" id="productSalesInOutCustNo" value="" />
                        <input type="hidden" id="soppdataNo" value="">
                        <input type="hidden" id="soppNo"value="${dto.soppNo}">
                        <span class="input-group-btn">
                            <button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=productdataListSalesInOutCust" type="button" data-toggle="modal" data-target="#productCustModal2">
                                <i class="icofont icofont-search"></i>
                            </button>
                        </span>
                        <!--modal-->
                        <div class="modal fade " id="productCustModal2" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-80size" role="document">
                                <div class="modal-content modal-80size">
                                    <div class="modal-header">
                                        <h4 class="modal-title">매입/매출 거래처 선택</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-success waves-effect" id="custRegSimple1">간편추가</button>
                                    </div>
                                    <div style="display: none; border: solid; width: 80%; margin: auto; margin-bottom: 5px;" id="custRegSimple_div1">
                                        <table>
                                            <colgroup>
                                                <col width="10%">
                                                <col width="75%">
                                                <col width="15%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th>매출처명*</th>
                                                <td><input type="text" value="" id="custRegSimple_custName1" style="width: 100%;"> </td>
                                                <td><button type="button" class="btn-sm btn-dark" id="custRegSimple_custName_check1">중복확인</button></td>
                                            </tr>
                                            <tr>
                                                <th>담당자</th>
                                                <td><input type="text" value="" id="custRegSimple_custMemerName1" style="width: 100%;" placeholder="미입력시 미정으로 세팅됩니다."></td>
                                                <td><button type="button" class="btn-sm btn-success" id="custRegSimple_custName_register1">등록</button></td>
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
                	<div class="input-group" style="margin:0;">
                		<div class="input-group-prepend">
					    	<select class="form-control" id="productSelect" style="width:130px; height: 31px;">
                				<option value="selectOn">항목 선택</option>
                				<option value="selectOff">직접 입력</option>
                			</select>
					  	</div>
					  	<div id="select1" >
		                    <div class="input-group input-group-sm mb-0">
		                        <input type="hidden" id="productNo1" value="" />
		                        <input type="text" class="form-control" name="product" id="data01Title" data-flag="true" value="" readonly>
		                        <span class="input-group-btn">
		                            <button class="btn btn-primary sch-company" onclick="fn_productdataTableReload()" type="button" data-toggle="modal" data-target="#productdataModal1">
		                                <i class="icofont icofont-search"></i>
		                            </button>
		                        </span>
		                    </div>
		                    <!--모달 팝업-->
		                    <div class="modal fade" id="productdataModal1" tabindex="-1" role="dialog">
		                        <div class="modal-dialog modal-80size" role="document">
		                            <div class="modal-content modal-80size">
		                                <div class="modal-header">
		                                    <h4 class="modal-title">상품목록</h4>
		                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                        <span aria-hidden="true">&times;</span>
		                                    </button>
		                                </div>
		                                <div class="modal-body">
		                                    <jsp:include page="/WEB-INF/views/modal/productdataListSalesInOut.jsp" />
		                                </div>
		                                <div class="modal-footer">
		                                    <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
		<%--                                    <button type="button" class="btn btn-success waves-effect" id="productReg">상품추가</button>--%>
		<%--                                    <button type="button" class="btn btn-success waves-effect" id="productRegSimple1">직접기입</button>--%>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
	                    </div>
	                    <div id="select2" style="width:100%;">
                			<div class="input-group input-group-sm mb-0">
	                			<input type="text" class="form-control" name="product" id="data01Title" data-flag="false">
                			</div>
                		</div>
                    </div>
                    <!--//모달 팝업-->
                    <!--모달 팝업-->
<%--                    <div class="modal fade" id="productRegModal1" tabindex="-1" role="dialog">--%>
<%--                        <div class="modal-dialog modal-80size" role="document">--%>
<%--                            <div class="modal-content modal-80size">--%>
<%--                                <div class="modal-header">--%>
<%--                                    <h4 class="modal-title">상품등록</h4>--%>
<%--                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                        <span aria-hidden="true">&times;</span>--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                                <div class="modal-body">--%>

<%--                                </div>--%>
<%--                                <div class="modal-footer">--%>
<%--                                    <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <!--//모달 팝업-->
                </td>
                <td><input type="text" id="data01Netprice" required class="form-control form-control-sm" style="min-width: 80px;" /></td>
                <td><input type="text" id="data01Quanty" required class="form-control form-control-sm" style="min-width: 80px;" value="1" min="1" /></td>
                <td><input type="text" id="data01Amt" class="form-control form-control-sm" readonly placeholder="자동계산됩니다." style="min-width: 80px;" /></td>
				<td><input type="text" id="data01Vat" required class="form-control form-control-sm" style="min-width: 80px;" /></td>
				<td><input type="text" id="data01Total" class="form-control form-control-sm" placeholder="부가세 포함 금액 자동계산." style="min-width: 80px;" /></td>
                <td><input type="text" id="data01Remark" class="form-control form-control-sm" /></td>
                <td>
                    <button id="data01Addbtn" class="btn btn-success btn-sm" onClick="javascript:fn_data01Insert()">추가</button>
                    <button id="data01Modbtn" class="btn btn-instagram btn-sm" onClick="javascript:fn_data01Update()">수정</button>
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
	$("#select2").hide();

	$("#productSelect").change(function(){
    	if($(this).val() === "selectOn"){
    		$("#select1").show();
    		$("#select1").find("#data01Title").attr("data-flag", true);
    		$("#select2").hide();
    		$("#select2").find("#data01Title").attr("data-flag", false);
    		$("#select2").find("#data01Title").val("");
    	}else{
    		$("#select1").hide();
    		$("#select1").find("#data01Title").attr("data-flag", false);
    		$("#select1").find("#data01Title").val("");
    		$("#select2").show();
    		$("#select2").find("#data01Title").attr("data-flag", true);
    	}
    });
	
    $('#productCustModal2').on('show.bs.modal', function(e) {
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    $("#custRegSimple1").on("click",function (event) {
        if($("#custRegSimple_div1").is(':visible') == false){
            $("#custRegSimple_div1").show();
            $("#custRegSimple1").html("간편등록 취소");
        } else {
            $("#custRegSimple_div1").hide();
            $("#custRegSimple1").html("간편등록");
        }
    });

    $("#custRegSimple_custName_check1").on("click", function (event) {
        var custRegSimple_custName = $("#custRegSimple_custName1").val();
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

    $("#custRegSimple_custName_register1").on("click", function (event) {
        var custRegSimple_custName = $("#custRegSimple_custName1").val();
        var custRegSimple_custMemerName = $("#custRegSimple_custMemerName1").val();

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
                    $('#productCustModal2').modal('hide');
                    $("#productSalesInOutCustName").val(result.data.custName);
                    $("#productSalesInOutCustNo").val(result.data.custNo);
                }else{
                    alert("저장 실패");
                }
            }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                alert("통신 실패");
            });
    });

    function fn_Reloaddata01(url, data){
		$("#inoutlist").empty();
		$("#inoutlistSum").remove();
		$("#inoutlist").load(url, data, function(){
			setTimeout(function(){
			}, 500);
		});
	}
    
    function fn_data01Insert() {
    	var path = $(location).attr("pathname");
    	 
    	if($("[name='contractType']:checked").val() === "NEW"){
			localStorage.setItem("reloadSet", "1t");
    	}else{
    		localStorage.setItem("oldContNo", $("#oldContNo").val());
			localStorage.setItem("oldContTitle", $("#oldContTitle").val());
			localStorage.setItem("reloadSet", "2t");
    	}
    	
        var data01Data = {};
        data01Data.soppNo 		= $("#soppNo").val();
        data01Data.catNo	 	= '100001';
        if($("#productSalesInOutCustName").val() != "") data01Data.salesCustNo = Number($("#productSalesInOutCustNo").val());
        if($("#data01Title[data-flag='true']").val() != "") {
            if($("#productNo1").val() != "") data01Data.productNo	= $("#productNo1").val();
            data01Data.dataTitle 	= $("#data01Title[data-flag='true']").val();
        }
        data01Data.dataType		= $("#data01Type").val();
        data01Data.dataNetprice	= $("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataQuanty	= $("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataAmt 		= $("#data01Amt").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataVat 		= $("#data01Vat").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataTotal 		= $("#data01Total").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataRemark 	= $("#data01Remark").val();
        data01Data.vatDate = $("#ioDate").val();

        if(!data01Data.dataQuanty){
            alert("단가를 입력해주십시오.");
            return;
        } else if(!data01Data.dataAmt){
            alert("수량을 입력해주십시오.");
            return;
        } else if (!data01Data.dataTitle){
            alert("상품명을 입력해주십시오.");
            return;
        }

        $.ajax({
            url: "${path}/sopp/insertdata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: data01Data , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
        .done(function(data) {
            if(data.code == 10001){
                alert("저장 성공");

                $("#data01Type option:eq(0)").attr("selected","selected");
                $("#soppdataNo").val("");
                $("#productSalesInOutCustName").val("");
                $("#productSalesInOutCustNo").val("");
                $("#productNo1").val("");
                $("#data01Title[data-flag='true']").val("");
                $("#data01Netprice").val("");
                $("#data01Quanty").val("");
                $("#data01Amt").val("");
                $("#data01Remark").val("");
				
              /*   localStorage.setItem('lastTab', "#tab02");
                
               	location.href="${path}/sopp/detail/"+$("#soppNo").val(); */
               	
               	
               	
               	location.href = "${path}/cont/iowrite.do/" + $("#soppNo").val() + "/" + $("#oldContNo").val();
                
            }else{
                alert("저장 실패");
            }
        }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
        .fail(function(xhr, status, errorThrown) {
            alert("통신 실패");
        });
    }

    function fn_data01Update() {
   	 	var path = $(location).attr("pathname");	
   	 	
    	if($("[name='contractType']:checked").val() === "NEW"){
			localStorage.setItem("reloadSet", "1t");
    	}else{
    		localStorage.setItem("oldContNo", $("#oldContNo").val());
			localStorage.setItem("oldContTitle", $("#oldContTitle").val());
			localStorage.setItem("reloadSet", "2t");
    	}
    	
        var data01Data = {};
        data01Data.soppNo 		= $("#soppNo").val();
        data01Data.catNo	 	= '100001';
        data01Data.soppdataNo   = $("#soppdataNo").val();
        if($("#productSalesInOutCustName").val() != "") data01Data.salesCustNo = Number($("#productSalesInOutCustNo").val());
        if($("#data01Title[data-flag='true']").val() != "") {
            if($("#productNo1").val() != "") data01Data.productNo	= $("#productNo1").val();
            data01Data.dataTitle 	= $("#data01Title[data-flag='true']").val();
        }
        data01Data.dataType		= $("#data01Type").val();
        data01Data.dataNetprice	= $("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataQuanty	= $("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataAmt 		= $("#data01Amt").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataVat 		= $("#data01Vat").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataTotal 	= $("#data01Total").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataRemark 	= $("#data01Remark").val();
        data01Data.vatDate = $("#ioDate").val();

        if(!data01Data.dataQuanty){
            alert("단가를 입력해주십시오.");
            return;
        } else if(!data01Data.dataAmt){
            alert("수량을 입력해주십시오.");
            return;
        } else if (!data01Data.dataTitle){
            alert("상품명을 입력해주십시오.");
            return;
        }

        $.ajax({ url: "${path}/sopp/updatedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: data01Data , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
        .done(function(data) {
            if(data.code == 10001){
                alert("저장 성공");
                $("#data01Type option:eq(0)").attr("selected","selected");
                $("#soppdataNo").val("");
                $("#productSalesInOutCustName").val("");
                $("#productSalesInOutCustNo").val("");
                $("#productNo1").val("");
                $("#data01Title[data-flag='true']").val("");
                $("#data01Netprice").val("");
                $("#data01Quanty").val("");
                $("#data01Amt").val("");
                $("#data01Remark").val("");

                $("#data01Addbtn").show();
                $("#data01Modbtn").hide();
                
                localStorage.setItem('lastTab', "#tab02");
                //var url="${path}/sopp/detail/"+$("#soppNo").val() + "/#tab02";
				//fn_Reloaddata01(url);
                location.href = "${path}/"+path.replace("${path}/", "");
            }else{
                alert("저장 실패");
            }
        }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
        .fail(function(xhr, status, errorThrown) {
            $(e).addClass("btn-dark");
            $(e).removeClass("btn-warning");
            $(e).html('수정');
            $("#data01Addbtn").show();
            $("#data01Modbtn").hide();
            alert("통신 실패");
        });
    }

    function fn_data01delete(soppdataNo) {
    	var path = $(location).attr("pathname");
		var msg = "선택한 건을 삭제하시겠습니까?";
		
		if($("[name='contractType']:checked").val() === "NEW"){
			localStorage.setItem("reloadSet", "1t");
    	}else{
    		localStorage.setItem("oldContNo", $("#oldContNo").val());
			localStorage.setItem("oldContTitle", $("#oldContTitle").val());
			localStorage.setItem("reloadSet", "2t");
    	}
		
		if( confirm(msg) ){
			$.ajax({
				url: "${path}/sopp/deletedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: {soppdataNo : soppdataNo}, // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					
					location.href = "${path}/"+path.replace("${path}/", "");
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}
	}

    $('#vatYn, #data01Vat').change(function(){
       recall();
    });

    function recall(){
        var sum1 = parseInt($("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum2 = parseInt($("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum3 = parseInt($("#data01Vat").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum = Math.round(sum1 * sum2);
        var sumv = Math.round(sum * 0.1);
        var sumt = Math.round(sum + sumv);
        $("#data01Netprice").val(sum1.toLocaleString("en-US"));
        $("#data01Quanty").val(sum2.toLocaleString("en-US"));
        $("#data01Amt").val(sum.toLocaleString("en-US"));
        $("#data01Vat").val(sumv.toLocaleString("en-US"));
        $("#data01Total").val(sumt.toLocaleString("en-US"));
    }

    function recall2(){
        var sum1 = parseInt($("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum2 = parseInt($("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum3 = parseInt($("#data01Vat").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var Total = parseInt($("#data01Total").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sumv = Math.round(Total / 11);
        var suma = Math.round(Total / 11 * 10);
        var sumn = Math.round(Total/11*10/sum2);
        $("#data01Netprice").val(sumn.toLocaleString("en-US"));
        $("#data01Quanty").val(sum2.toLocaleString("en-US"));
        $("#data01Amt").val(suma.toLocaleString("en-US"));
        $("#data01Vat").val(sumv.toLocaleString("en-US"));
        $("#data01Total").val(Total.toLocaleString("en-US"));
    }

    function recall3(){
        var sum1 = parseInt($("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum2 = parseInt($("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum3 = parseInt($("#data01Vat").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        if (sum3 == 0){
            var sumt = sum1 * sum2;
            $("#data01Netprice").val(sum1.toLocaleString("en-US"));
            $("#data01Quanty").val(sum2.toLocaleString("en-US"));
            $("#data01Amt").val(sumt.toLocaleString("en-US"));
            $("#data01Vat").val(sum3.toLocaleString("en-US"));
            $("#data01Total").val(sumt.toLocaleString("en-US"));
        }else{
            var sumt = (sum1 * sum2) + sum3;
            var suma = (sum1 * sum2);
            $("#data01Netprice").val(sum1.toLocaleString("en-US"));
            $("#data01Quanty").val(sum2.toLocaleString("en-US"));
            $("#data01Amt").val(suma.toLocaleString("en-US"));
            $("#data01Vat").val(sum3.toLocaleString("en-US"));
            $("#data01Total").val(sumt.toLocaleString("en-US"));
        }
    }

    $(document).ready(function(){
        $('#data01Netprice,#data01Quanty').on('keyup',function(){
            recall();
        });

        $('#data01Total').on('keyup',function(){
            recall2();
        });

        $('#data01Vat').on('keyup',function(){
            recall3();
        });


        $("#data01Modbtn").hide();
        var nowDate = new Date();      
        //$("#ioDate").val(nowDate.getFullYear() + "-" + parseInt(nowDate.getMonth()+1) + "-" + nowDate.getDate());
        
        
        nowDate = nowDate.toISOString().slice(0, 10);
		bir = document.getElementById("ioDate");
		bir.value = nowDate;
        
    });
</script>
<style>

    #ioDate{
    	border:1px solid #ccc;
    }
    #data01Type {
    	border:1px solid #ccc;
    }
</style>
