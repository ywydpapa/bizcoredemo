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
        	<col width="8%" />
        	<col width="15%" />
        	<col width="11%" />
            <col width="19%" />
            <col width="9%" />
            <col width="5%" />
            <col width="9%" />
            <col width="9%" />
            <col width="9%" />
            <col width="5%" />
        </colgroup>
        <thead>
        <tr>
        	<th class="text-center">구분</th>
        	<th class="text-center">타이틀</th>
            <th class="text-center">거래처</th>
            <th class="text-center">항목</th>
            <th class="text-center">단가</th>
            <th class="text-center">수량</th>
            <th class="text-center">공급가액</th>
            <th class="text-center">부가세액</th>
            <th class="text-center">금액</th>
            <th class="text-center">추가</th>
        </tr>
        </thead>
        <tbody>
            <tr class="item1">
            	<td><input class="form-control" type="text" id="itemKinds"></td>
            	<td>
            		<input class="form-control" type="text" id="itemTitle">
            	</td>
                <td>
                    <div class="input-group input-group-sm mb-0">
                        <input type="text" class="form-control" name="product" id="productSalesEstimateCustName" value="" readonly>
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
                	<div class="input-group" style="margin:0;">
					  	<div class="input-group-prepend">
					    	<select class="form-control" id="productSelect" style="width:130px;height:31px;">
                				<option value="selectOn">항목 선택</option>
                				<option value="selectOff">직접 입력</option>
                			</select>
					  	</div>
					  	<div id="select1" style="width:100%;">
		                    <div class="input-group input-group-sm mb-0">
		                        <input type="hidden" id="productNo2" value="" />
		                        <input type="text" class="form-control" name="product" id="data02Title" data-flag="true" value="" readonly>
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
                		</div>
                		<div id="select2" style="width:100%;">
                			<div class="input-group input-group-sm mb-0">
	                			<input type="text" class="form-control" name="product" id="data02Title" data-flag="false">
                			</div>
                		</div>
					</div>
                </td>
                <td><input type="text" class="form-control form-control-sm" id="data02Netprice" style="min-width: 80px;" /></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Quanty" style="min-width: 80px;"  value="1" min="1" /></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Amt" style="min-width: 80px;" readonly /></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Vat" style="min-width: 80px;" /></td>
                <td><input type="text" class="form-control form-control-sm" id="data02Total" style="min-width: 80px;" /></td>
                <td rowspan="2">
                    <button id="data02Addbtn" class="btn btn-success btn-sm" onClick="dataSave();">추가</button>
                    <button id="data02Modbtn" class="btn btn-instagram btn-sm" onClick="javascript:fn_data02Update()">수정</button>
                </td>
            </tr>
            <tr>
            	<td colspan="4">
	            	<textarea rows="5" id="data02Spec" class="form-control form-control-sm" placeholder="spec을 입력해주세요."></textarea>
            	</td>
            	<td colspan="5">
	            	<textarea rows="5" id="data02Remark" class="form-control form-control-sm" placeholder="비고를 입력해주세요."></textarea>
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
	<input type="hidden" id="amountSum" value="0" />
	<input type="hidden" id="vatSum" value="0" />
</form>

<script>
	var dataArray = [];
    var dataIndex = 0;
    
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
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
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
    
	$(document).on("click", "#dataDelBtn", function(){
		var calTotal = parseInt($("#product02InSum_table").html().replace(/[\D\s\._\-]+/g, "")) - parseInt(dataArray[$(this).attr("data-index")].productTotal);
		var calAmount = parseInt($("#amountSum").val()) - parseInt(dataArray[$(this).attr("data-index")].productAmount);
		var calVat = parseInt($("#vatSum").val()) - parseInt(dataArray[$(this).attr("data-index")].productVat); 
			
		$("#product02InSum_table").html("￦"+parseInt(calTotal).toLocaleString("en-US"));
		$("#amountSum").val(calAmount);
		$("#vatSum").val(calVat);
		
		dataArray.splice($(this).attr("data-index"), 1);
		$("#qutylist tbody tr").eq($(this).attr("data-index")).remove();
	
		$("#qutylist tbody tr").find("#dataDelBtn").each(function(index, item){
			$(this).attr("data-index", index);
			dataIndex = index+1;
		});
		
		$("#qutylist tbody tr").find("#dataUpdateBtn").each(function(index, item){
			$(this).attr("data-index", index);
			dataIndex = index+1;
		});
	});

	function dataUpdateBtn(event){
		var addquty = $("#addquty tbody tr td");
		
		if($(event).attr("data-flag") == 1){
			if($("#qutylist tbody tr td").find("#dataUpdateBtn[data-flag='0']").length > 0){
				alert("수정 도중 다른 item을 수정할 수 없습니다.");
				return false;
			}
			
			$(event).removeClass();
			$(event).prop("class", "btn btn-sm btn-warning");
			$(event).attr("data-flag", 0);
			$(event).text("취소");
			$("#data02Addbtn").removeClass();
			$("#data02Addbtn").removeAttr("onClick");
			$("#data02Addbtn").prop("class", "btn btn-sm btn-inverse");
			$("#data02Addbtn").attr("data-id", $(event).attr("data-id"));
			$("#data02Addbtn").attr("onClick", "dataItemUpdate();");
			$("#data02Addbtn").text("수정");
			
			addquty.find("#itemKinds").val($(event).parents("tr").find("#dataItemKinds").html());
			addquty.find("#itemTitle").val($(event).parents("tr").find("#dataItemTitle").html());
			addquty.find("#productSalesEstimateCustName").val($(event).parents("tr").find("#salesCustNoN").html());
			addquty.find("#productSalesEstimateCustNo").val($(event).parents("tr").find("#productCustNo").val());
			
			if($(event).parents("tr").find("#productNo").val() === ""){
        		$("#select1").hide();
        		$("#select1").find("#data02Title").attr("data-flag", false);
        		$("#select1").find("#data02Title").val("");
        		$("#select2").show();
        		$("#select2").find("#data02Title").attr("data-flag", true);
        		
        		addquty.find("#productSelect").val("selectOff").trigger("change");
        		addquty.find("#data02Title[data-flag='true']").val($(event).parents("tr").find("#dataTitle").html());
			}else{
				$("#select1").show();
        		$("#select1").find("#data02Title").attr("data-flag", true);
        		$("#select2").hide();
        		$("#select2").find("#data02Title").attr("data-flag", false);
        		$("#select2").find("#data02Title").val("");
        		
        		addquty.find("#productSelect").val("selectOn").trigger("change");
        		addquty.find("#productNo2").val($(event).parents("tr").find("#productNo").val());
        		addquty.find("#data02Title[data-flag='true']").val($(event).parents("tr").find("#dataTitle").html());
			}
			
			addquty.find("#data02Netprice").val(parseInt($(event).parents("tr").find("#dataNetprice").html().replace(/[\D\s\._\-]+/g, "")).toLocaleString("en-US"));
			addquty.find("#data02Quanty").val($(event).parents("tr").find("#dataQuanty").html());
			addquty.find("#data02Amt").val(parseInt($(event).parents("tr").find("#dataAmt").html().replace(/[\D\s\._\-]+/g, "")).toLocaleString("en-US"));
			addquty.find("#data02Vat").val(parseInt($(event).parents("tr").find("#dataVat").html().replace(/[\D\s\._\-]+/g, "")).toLocaleString("en-US"));
			addquty.find("#data02Total").val(parseInt($(event).parents("tr").find("#dataTotal").html().replace(/[\D\s\._\-]+/g, "")).toLocaleString("en-US"));
			tinyMCE.get("data02Spec").setContent($(event).parents("tr").find("#dataSpec").val());
			tinyMCE.get("data02Remark").setContent($(event).parents("tr").find("#dataRemark").html());
		}else{
			$(event).removeClass();
			$(event).prop("class", "btn btn-sm btn-inverse");
			$(event).attr("data-flag", 1);
			$(event).text("수정");
			$("#data02Addbtn").removeClass();
			$("#data02Addbtn").removeAttr("onClick");
			$("#data02Addbtn").attr("data-id", 0);
			$("#data02Addbtn").attr("onClick", "dataSave();");
			$("#data02Addbtn").prop("class", "btn btn-sm btn-success");
			$("#data02Addbtn").text("추가");
			
			addquty.find("#itemKinds").val("");
			addquty.find("#itemTitle").val("");
			addquty.find("#productSalesEstimateCustName").val("");
			addquty.find("#productSalesEstimateCustNo").val("");
			
			$("#select1").show();
       		$("#select1").find("#data02Title").attr("data-flag", true);
       		$("#select2").hide();
       		$("#select2").find("#data02Title").attr("data-flag", false);
       		$("#select2").find("#data02Title").val("");
       		
       		setTimeout(() => {
        		addquty.find("#productSelect").val("selectOn").trigger("change");
        		addquty.find("#productNo2").val("");
        		addquty.find("#data02Title").val("");
			}, 100);
			
			addquty.find("#data02Netprice").val("");
			addquty.find("#data02Quanty").val("");
			addquty.find("#data02Amt").val("");
			addquty.find("#data02Vat").val("");
			addquty.find("#data02Total").val("");
			tinyMCE.get("data02Spec").setContent("");
			tinyMCE.get("data02Remark").setContent("");
		}
	}	
	
	function dataItemUpdate(){
		var addquty = $("#addquty tbody tr td");
		var dataFlag = $("#qutylist tbody tr td").find("#dataUpdateBtn[data-flag='0']");
		var FlagQutyList = dataFlag.parents("tr");
		var flagIndex = dataFlag.attr("data-index");
		
		var calTotal = parseInt($("#product02InSum_table").html().replace(/[\D\s\._\-]+/g, "")) - parseInt(dataArray[flagIndex].productTotal);
		var calAmount = parseInt($("#amountSum").val()) - parseInt(dataArray[flagIndex].productAmount);
		var calVat = parseInt($("#vatSum").val()) - parseInt(dataArray[flagIndex].productVat);
		
		var itemKinds = $("#itemKinds").val();
    	var itemTitle = $("#itemTitle").val();
    	var productSalesEstimateCustName = $('#productSalesEstimateCustName').val();
    	var productNo = $("#productNo2").val();
    	var productName = $("#data02Title[data-flag='true']").val();
    	var productNetprice = $("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "");
    	var productQty = $("#data02Quanty").val();
    	var productAmount = $("#data02Amt").val().replace(/[\D\s\._\-]+/g, "");
    	var productVat = $("#data02Vat").val().replace(/[\D\s\._\-]+/g, "");
    	var productTotal = $("#data02Total").val().replace(/[\D\s\._\-]+/g, "");
    	var productRemark = tinyMCE.get("data02Remark").getContent();
    	var productSpec = tinyMCE.get("data02Spec").getContent();
		
        dataArray[flagIndex].custNo = $("#productSalesEstimateCustNo").val();
        dataArray[flagIndex].compNo = $("#compNo").val();
        dataArray[flagIndex].itemKinds = itemKinds;
        dataArray[flagIndex].itemTitle = itemTitle;
        dataArray[flagIndex].productNo = productNo;
        dataArray[flagIndex].productName = productName;
        dataArray[flagIndex].productNetprice = productNetprice;
        dataArray[flagIndex].productQty = productQty;
        dataArray[flagIndex].productAmount = productAmount;
        dataArray[flagIndex].productVat = productVat;
        dataArray[flagIndex].productTotal = productTotal;
        dataArray[flagIndex].productRemark = productRemark;
        dataArray[flagIndex].productSpec = productSpec;
			
        var calTotalSum = parseInt(calTotal) + parseInt(productTotal);
        var calAmountSum = parseInt(calAmount) + parseInt(productAmount);
        var calVatSum = parseInt(calVat) + parseInt(productVat);
        
		$("#product02InSum_table").html("￦"+parseInt(calTotalSum).toLocaleString("en-US"));
		$("#amountSum").val(calAmountSum);
		$("#vatSum").val(calVatSum);
		
		FlagQutyList.find("#dataItemKinds").html(itemKinds);
		FlagQutyList.find("#dataItemTitle").html(itemTitle);
		FlagQutyList.find("#salesCustNoN").html(productSalesEstimateCustName);
		FlagQutyList.find("#dataTitle").html(productName);
		FlagQutyList.find("#dataNetprice").html("￦"+parseInt(productNetprice).toLocaleString("en-US"));
		FlagQutyList.find("#dataQuanty").html(productQty);
		FlagQutyList.find("#dataAmt").html("￦"+parseInt(productAmount).toLocaleString("en-US"));
		FlagQutyList.find("#dataVat").html("￦"+parseInt(productVat).toLocaleString("en-US"));
		FlagQutyList.find("#dataTotal").html("￦"+parseInt(productTotal).toLocaleString("en-US"));
		FlagQutyList.find("#dataRemark").html(productRemark);
		FlagQutyList.find("#dataSpec").val(productSpec);

		dataFlag.removeClass();
		dataFlag.prop("class", "btn btn-sm btn-inverse");
		dataFlag.attr("data-flag", 1);
		dataFlag.text("수정");
		$("#data02Addbtn").removeClass();
		$("#data02Addbtn").removeAttr("onClick");
		$("#data02Addbtn").attr("data-id", 0);
		$("#data02Addbtn").attr("onClick", "dataSave();");
		$("#data02Addbtn").prop("class", "btn btn-sm btn-success");
		$("#data02Addbtn").text("추가");
		
		addquty.find("#itemKinds").val("");
		addquty.find("#itemTitle").val("");
		addquty.find("#productSalesEstimateCustName").val("");
		addquty.find("#productSalesEstimateCustNo").val("");
		
		$("#select1").show();
   		$("#select1").find("#data02Title").attr("data-flag", true);
   		$("#select2").hide();
   		$("#select2").find("#data02Title").attr("data-flag", false);
   		$("#select2").find("#data02Title").val("");
   		
   		setTimeout(() => {
    		addquty.find("#productSelect").val("selectOn").trigger("change");
    		addquty.find("#productNo2").val("");
    		addquty.find("#data02Title").val("");
		}, 100);
		
		addquty.find("#data02Netprice").val("");
		addquty.find("#data02Quanty").val("");
		addquty.find("#data02Amt").val("");
		addquty.find("#data02Vat").val("");
		addquty.find("#data02Total").val("");
		tinyMCE.get("data02Spec").setContent("");
		tinyMCE.get("data02Remark").setContent("");
		
		$("#qutylist tbody tr").find("#dataDelBtn").each(function(index, item){
			$(item).attr("data-index", index);
			dataIndex = index+1;
		});
		
		$("#qutylist tbody tr").find("#dataUpdateBtn").each(function(index, item){
			$(item).attr("data-index", index);
			dataIndex = index+1;
		});
		
		console.log(dataArray);
	}
    
    function dataSave(){
    	if($("#itemKinds").val() === ""){
    		alert("구분을 입력해주십시오.");
    		$("#itemKinds").focus();
    		return false;
    	}else if($("#itemTitle").val() === ""){
    		alert("제목을 입력해주십시오.");
    		$("#itemTitle").focus();
    		return false;
    	/* }else if($("#productSalesEstimateCustName").val() === ""){
    		alert("거래처를 입력해주세요.");
    		return false; */
    	}else{
    		var temp = {};
        	var itemKinds = $("#itemKinds").val();
        	var itemTitle = $("#itemTitle").val();
        	var productSalesEstimateCustName = $('#productSalesEstimateCustName').val();
        	var productNo = $("#productNo2").val();
        	var productName = $("#data02Title[data-flag='true']").val();
        	var productNetprice = $("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "");
        	var productQty = $("#data02Quanty").val();
        	var productAmount = $("#data02Amt").val().replace(/[\D\s\._\-]+/g, "");
        	var productVat = $("#data02Vat").val().replace(/[\D\s\._\-]+/g, "");
        	var productTotal = $("#data02Total").val().replace(/[\D\s\._\-]+/g, "");
        	var productRemark = tinyMCE.get("data02Remark").getContent();
        	var productSpec = tinyMCE.get("data02Spec").getContent();
        	var qutylist = $("#qutylist tbody");
    		
            temp.estId = "";
    		temp.custNo = $("#productSalesEstimateCustNo").val();
    		temp.compNo = $("#compNo").val();
    		temp.itemKinds = itemKinds;
    		temp.itemTitle = itemTitle;
        	temp.productNo = productNo;
        	temp.productName = productName;
        	temp.productNetprice = productNetprice;
        	temp.productQty = productQty;
        	temp.productAmount = productAmount;
        	temp.productVat = productVat;
        	temp.productTotal = productTotal;
        	temp.productRemark = productRemark;
        	temp.productSpec = productSpec;
        	
            var productSum = parseInt($("#product02InSum_table").html().replace(/[\D\s\._\-]+/g, "")) + parseInt($("#data02Total").val().replace(/[\D\s\._\-]+/g, ""));
            var amountSum = parseInt(productAmount) + parseInt($("#amountSum").val());
            var vatSum = parseInt(productVat) + parseInt($("#vatSum").val());
            
            $("#product02InSum_table").html("￦"+parseInt(productSum).toLocaleString("en-US"));
            $("#amountSum").val(amountSum);
            $("#vatSum").val(vatSum);
        	
        	dataArray.push(temp);
        	
        	$("#data02Type option:eq(0)").attr("selected","selected");
        	$("#itemTitle").val("");
        	$("#itemKinds").val("");
            $("#soppdataNoEstimate").val("");
            $("#productSalesEstimateCustName").val("");
            $("#productSalesEstimateCustNo").val("");
            $("#productNo2").val("");
            $("#data02Title[data-flag='true']").val("");
            $("#data02Netprice").val("");
            $("#data02Quanty").val("");
            $("#data02Amt").val("");
            $("#data02Vat").val("");
            $("#data02Total").val("");
            tinyMCE.get("data02Remark").setContent("");
            tinyMCE.get("data02Spec").setContent("");
        	
            qutylist.append("<tr><td id='dataItemKinds' style='text-align:center;'>"+itemKinds+"</td><td id='dataItemTitle' style='text-align:center;'>"+itemTitle+"</td><td id='salesCustNoN' style='text-align:center;'>"+productSalesEstimateCustName+"</td><td id='dataTitle' style='text-align:center;'>"+productName+"</td><td id='dataNetprice' style='text-align: right'>"+"￦"+parseInt(productNetprice).toLocaleString("en-US")+"</td><td id='dataQuanty' style='text-align: right'>"+productQty+"</td><td id='dataAmt' style='text-align: right'>"+"￦"+parseInt(productAmount).toLocaleString("en-US")+"</td><td id='dataVat' style='text-align: right'>"+"￦"+parseInt(productVat).toLocaleString("en-US")+"</td><td id='dataTotal' style='text-align: right'>"+"￦"+parseInt(productTotal).toLocaleString("en-US")+"</td><td id='dataRemark'>"+productRemark+"</td><td style='text-align:center;'><button class='btn btn-sm btn-inverse' id='dataUpdateBtn' data-flag='1' data-index="+dataIndex+" onClick='dataUpdateBtn(this);'>수정</button></td><td style='text-align:center;'><button class='btn btn-sm btn-danger' data-index="+dataIndex+" id='dataDelBtn'>삭제</button></td></tr>");    	
            
        	console.log(dataArray);
        	
            dataIndex++;
    	}
    }

    function fn_data02Insert() {
    	var getDate = new Date();
    	
    	var year = getDate.getFullYear();
    	var month = getDate.getMonth()+1;
    	
    	if(month < 10){
    		month = "0" + month;
    	}
    	
    	var estFirstName = "VTEK" + year + month + "_";
    	var data02Data = {};
    	var updateData = {};
    	var dataInfo = {};
		
    	if($("#estTitle").val() === ""){
    		alert("견적제목을 입력해주세요.");
    		$("#estTitle").focus();
    	}else if($("#estDate").val() === ""){
    		alert("견적서 작성일자를 선택해주세요.");
    		$("#estDate").focus();
    	}else if($("#estComBoss").val() === ""){
			alert("대표이사명을 입력해주십시오.");
			$("#estComBoss").focus();
			return false;
		}else if($("#estComAdd").val() === ""){
			alert("주소를 입력해주십시오.");
			$("#estComAdd").focus();
			return false;
		}else if($("#estComPhone").val() === ""){
			alert("전화번호를 입력해주십시오.");
			$("#estComPhone").focus();
			return false;
		}else if($("#estComFax").val() === ""){
			alert("팩스번호를 입력해주십시오.");
			$("#estComFax").focus();
			return false;
		}else if($("#estComTerm").val() === ""){
			alert("견적서 유효기간을 입력해주십시오.");
			$("#estComTerm").focus();
			return false;
		}else if(tinyMCE.get("estComSpec").getContent() === ""){
			alert("Spec을 입력해주십시오.");
			$("#estComSpec").focus();
			return false;
		}else{
    		data02Data.estTitle = $("#estTitle").val();
    		data02Data.estType = $("input[name='contractType']:checked").val();
    		data02Data.custNo = $("#custNo").val();
    		data02Data.soppNo = $("#soppNo").val();
    		data02Data.compNo = $("#compNo").val();
    		data02Data.userNo = $("#userNo").val();
            data02Data.estAmount = $("#amountSum").val();
            data02Data.estVat = $("#vatSum").val();
            data02Data.estTotal = $("#product02InSum_table").html().replace(/[\D\s\._\-]+/g, "");
    		data02Data.estDate = $("#estDate").val();
    		
    		$.ajax({
    			url: "${path}/gw/insertEst.do",
    			method: "post",
    			data: data02Data,
    			dataType: "json",
    			success: function(result){
    				updateData.estId = estFirstName + result.getId;
    				updateData.estNo = result.getId;
    				
    				dataInfo.estId = updateData.estId;
    				dataInfo.estVer = 1;
    				dataInfo.userNo = $("#userNo").val();
    				dataInfo.compNo = $("#compNo").val();
    				dataInfo.estComName = $("#estComName").val();
    				dataInfo.estComBoss = $("#estComBoss").val();
    				dataInfo.estComAdd = $("#estComAdd").val();
    				dataInfo.estComPhone = $("#estComPhone").val();
    				dataInfo.estComFax = $("#estComFax").val();
    				dataInfo.estComTerm = $("#estComTerm").val();
    				dataInfo.estComSpec = tinyMCE.get("estComSpec").getContent();
    				
    				$.ajax({
    					url: "${path}/gw/estInfoInsert.do",
    					method: "post",
    					data: dataInfo,
    					dataType: "json"
    				});
    				
    				
    				$.ajax({
    					url: "${path}/gw/inserEstUpdate.do",
    					method: "post",
    					data: updateData,
    					dataType: "json",
    					success:function(){
		    				$.ajax({
		    					url: "${path}/gw/selectVersion.do",
		    					method: "post",
		    					data: {
		    						estId: updateData.estId,
		    					},
		    					async: false,
		    					dataType: "json",
		    					success:function(data){
									for(var i = 0; i < dataArray.length; i++){
										dataArray[i].estId = updateData.estId;
										dataArray[i].estVer = data.getVersion;
										var JsonArray = JSON.stringify(dataArray[i]);
						  				$.ajax({
						  					url: "${path}/gw/insertEstitems.do",
						  					method: "post",
						  					data: JSON.parse(JsonArray),
						  					async: false,
						  					dataType: "json",
						  				});
						 			}
		    					}
		    					
		    				});
				 			alert("등록되었습니다.");
				 			location.href = "${path}/gw/estwrite.do";
    					}
    				});
    			}
    		});
    		
    	}
    }
    
    function fn_data02ReInsert() {
    	if(confirm("견적번호는 새로 생성됩니다.")){
	    	var getDate = new Date();
	    	
	    	var year = getDate.getFullYear();
	    	var month = getDate.getMonth()+1;

	    	if(month < 10){
	    		month = "0" + month;
	    	}
	    	
	    	var estFirstName = "VTEK" + year + month + "_";
	    	
	    	var data02Data = {};
	    	var updateData = {};
	    	var dataInfo = {};
			
	    	if($("#estTitle").val() === ""){
	    		alert("견적제목을 입력해주세요.");
	    		$("#estTitle").focus();
	    	}else if($("#estDate").val() === ""){
	    		alert("견적서 작성일자를 선택해주세요.");
	    		$("#estDate").focus();
	    	}else if($("#estComBoss").val() === ""){
				alert("대표이사명을 입력해주십시오.");
				$("#estComBoss").focus();
				return false;
			}else if($("#estComAdd").val() === ""){
				alert("주소를 입력해주십시오.");
				$("#estComAdd").focus();
				return false;
			}else if($("#estComPhone").val() === ""){
				alert("전화번호를 입력해주십시오.");
				$("#estComPhone").focus();
				return false;
			}else if($("#estComFax").val() === ""){
				alert("팩스번호를 입력해주십시오.");
				$("#estComFax").focus();
				return false;
			}else if($("#estComTerm").val() === ""){
				alert("견적서 유효기간을 입력해주십시오.");
				$("#estComTerm").focus();
				return false;
			}else if(tinyMCE.get("estComSpec").getContent() === ""){
				alert("Spec을 입력해주십시오.");
				$("#estComSpec").focus();
				return false;
			}else{
	    		data02Data.estTitle = $("#estTitle").val();
	    		data02Data.estType = $("input[name='contractType']:checked").val();
	    		data02Data.custNo = $("#custNo").val();
	    		data02Data.soppNo = $("#soppNo").val();
	    		data02Data.compNo = $("#compNo").val();
	    		data02Data.userNo = $("#userNo").val();
	            data02Data.estAmount = $("#amountSum").val();
	            data02Data.estVat = $("#vatSum").val();
	            data02Data.estTotal = $("#product02InSum_table").html().replace(/[\D\s\._\-]+/g, "");
	    		data02Data.estDate = $("#estDate").val();
	    		
	    		$.ajax({
	    			url: "${path}/gw/insertEst.do",
	    			method: "post",
	    			data: data02Data,
	    			dataType: "json",
	    			success: function(result){
	    				updateData.estId = estFirstName + result.getId;
	    				updateData.estNo = result.getId;
	    				
	    				dataInfo.estId = updateData.estId;
	    				dataInfo.estVer = 1;
	    				dataInfo.userNo = $("#userNo").val();
	    				dataInfo.compNo = $("#compNo").val();
	    				dataInfo.estComName = $("#estComName").val();
	    				dataInfo.estComBoss = $("#estComBoss").val();
	    				dataInfo.estComAdd = $("#estComAdd").val();
	    				dataInfo.estComPhone = $("#estComPhone").val();
	    				dataInfo.estComFax = $("#estComFax").val();
	    				dataInfo.estComTerm = $("#estComTerm").val();
	    				dataInfo.estComSpec = tinyMCE.get("estComSpec").getContent();
	    				
	    				$.ajax({
	    					url: "${path}/gw/estInfoInsert.do",
	    					method: "post",
	    					data: dataInfo,
	    					dataType: "json"
	    				});
	    				
	    				$.ajax({
	    					url: "${path}/gw/inserEstUpdate.do",
	    					method: "post",
	    					data: updateData,
	    					dataType: "json",
	    					success:function(){
			    				$.ajax({
			    					url: "${path}/gw/selectVersion.do",
			    					method: "post",
			    					data: {
			    						estId: updateData.estId,
			    					},
			    					async: false,
			    					dataType: "json",
			    					success:function(data){
										for(var i = 0; i < dataArray.length; i++){
											dataArray[i].estId = updateData.estId;
											dataArray[i].estVer = data.getVersion;
											var JsonArray = JSON.stringify(dataArray[i]);
							  				$.ajax({
							  					url: "${path}/gw/insertEstitems.do",
							  					method: "post",
							  					data: JSON.parse(JsonArray),
							  					async: false,
							  					dataType: "json",
							  				});
							 			}
			    					}
			    					
			    				});
					 			alert("등록되었습니다.");
					 			location.href = "${path}/gw/estwrite.do";
	    					}
	    				});
	    			}
	    		});
	    	}
    	}
    }

    function fn_data02Update() {
    	var getDate = new Date();
    	
    	var year = getDate.getFullYear();
    	var month = getDate.getMonth()+1;
    	
    	if(month < 10){
    		month = "0" + month;
    	}
    	
    	var data02Data = {};
    	var updateData = {};
    	var dataInfoUpdate = {};
    	var dataInfoInsert = {};
    	var dataestitems = {};
    	
    	if($("#estTitle").val() === ""){
    		alert("견적제목을 입력해주세요.");
    		$("#estTitle").focus();
    	}else if($("#estDate").val() === ""){
    		alert("견적서 작성일자를 선택해주세요.");
    		$("#estDate").focus();
    	}else if($("#estComBoss").val() === ""){
			alert("대표이사명을 입력해주십시오.");
			$("#estComBoss").focus();
			return false;
		}else if($("#estComAdd").val() === ""){
			alert("주소를 입력해주십시오.");
			$("#estComAdd").focus();
			return false;
		}else if($("#estComPhone").val() === ""){
			alert("전화번호를 입력해주십시오.");
			$("#estComPhone").focus();
			return false;
		}else if($("#estComFax").val() === ""){
			alert("팩스번호를 입력해주십시오.");
			$("#estComFax").focus();
			return false;
		}else if($("#estComTerm").val() === ""){
			alert("견적서 유효기간을 입력해주십시오.");
			$("#estComTerm").focus();
			return false;
		}else if(tinyMCE.get("estComSpec").getContent() === ""){
			alert("Spec을 입력해주십시오.");
			$("#estComSpec").focus();
			return false;
		}else{
    		data02Data.estTitle = $("#estTitle").val();
    		data02Data.estType = $("input[name='contractType']:checked").val();
    		data02Data.custNo = $("#custNo").val();
    		data02Data.soppNo = $("#soppNo").val();
    		data02Data.compNo = $("#compNo").val();
    		data02Data.userNo = $("#userNo").val();
            data02Data.estAmount = $("#amountSum").val();
            data02Data.estVat = $("#vatSum").val();
            data02Data.estTotal = $("#product02InSum_table").html().replace(/[\D\s\._\-]+/g, "");
    		data02Data.estDate = $("#estDate").val();
    		
    		$.ajax({
    			url: "${path}/gw/insertEst.do",
    			method: "post",
    			data: data02Data,
    			dataType: "json",
    			success: function(result){
    				updateData.estId = $("#estId").val();
    				updateData.estNo = result.getId;
    				
    				$.ajax({
    					url: "${path}/gw/inserEstUpdate.do",
    					method: "post",
    					data: updateData,
    					dataType: "json",
    					success:function(){
   		    				$.ajax({
   		    					url: "${path}/gw/selectVersion.do",
   		    					method: "post",
   		    					data: {
   		    						estId: updateData.estId,
   		    					},
   		    					async: false,
   		    					dataType: "json",
   		    					success:function(data){
   									for(var i = 0; i < dataArray.length; i++){
   										dataArray[i].estId = updateData.estId;
   										dataArray[i].estVer = data.getVersion;
   										var JsonArray = JSON.stringify(dataArray[i]);
   						  				$.ajax({
   						  					url: "${path}/gw/insertEstitems.do",
   						  					method: "post",
   						  					data: JSON.parse(JsonArray),
   						  					async: false,
   						  					dataType: "json",
   						  				});
   						 			}
   									dataestitems.estId = updateData.estId;
   		    						dataestitems.estVer = data.getVersion-1;
   		    						
   			    					$.ajax({
   	   		    		    			url: "${path}/gw/update_estitems_Data_x.do",
   	   		    		    			method: "post",
   	   		    		    			data: dataestitems,
   	   		    		    			async: false,
   	   		    		    			dataType: "json"
   	   		    		    		});		
	    							
   		    					}
  		    				});
   		    				
   							$.ajax({
       							url: "${path}/gw/selectVersionEst.do",
       							method: "post",
       							data: {
       								estId: updateData.estId,
       							},
       							async: false,
       							dataType: "json",
       							success:function(data){
       								dataInfoUpdate.estId = updateData.estId;
       								dataInfoUpdate.estVer = $("#estVer").val();
       								dataInfoUpdate.userNo = $("#userNo").val();
       								dataInfoUpdate.compNo = $("#compNo").val();
       								dataInfoUpdate.estComName = $("#estComName").val();
       								dataInfoUpdate.estComBoss = $("#estComBoss").val();
       								dataInfoUpdate.estComAdd = $("#estComAdd").val();
       								dataInfoUpdate.estComPhone = $("#estComPhone").val();
       								dataInfoUpdate.estComFax = $("#estComFax").val();
       								dataInfoUpdate.estComTerm = $("#estComTerm").val();
       								dataInfoUpdate.estComSpec = tinyMCE.get("estComSpec").getContent();
   		    	    				
   		    	    				$.ajax({
   		    							url: "${path}/gw/estInfoUpdate.do",
   		    							method: "post",
   		    							data: dataInfoUpdate,
   		    							dataType: "json",
   		    							success:function(){
   		    								dataInfoInsert.estId = updateData.estId;
   		    								dataInfoInsert.estVer = data.getVersion;
   		    								dataInfoInsert.userNo = $("#userNo").val();
   		    								dataInfoInsert.compNo = $("#compNo").val();
   		    								dataInfoInsert.estComName = $("#estComName").val();
   		    								dataInfoInsert.estComBoss = $("#estComBoss").val();
   		    								dataInfoInsert.estComAdd = $("#estComAdd").val();
   		    								dataInfoInsert.estComPhone = $("#estComPhone").val();
   		    								dataInfoInsert.estComFax = $("#estComFax").val();
   		    								dataInfoInsert.estComTerm = $("#estComTerm").val();
   		    								dataInfoInsert.estComSpec = tinyMCE.get("estComSpec").getContent();
   		    								
   		    								$.ajax({
   				    	    					url: "${path}/gw/estInfoInsert.do",
   				    	    					method: "post",
   				    	    					data: dataInfoInsert,
   				    	    					async: false,
   				    	    					dataType: "json"
   				    	    				});
   		    								
   		    								$.ajax({
   				    	    					url: "${path}/gw/update_estitems_Data.do",
   				    	    					method: "post",
   				    	    					data: dataInfoInsert,
   				    	    					async: false,
   				    	    					dataType: "json",
   				    	    					success:function(){
   				    	    						alert("수정되었습니다.");
   				    						 		location.href = "${path}/gw/estwrite.do";
   				    	    					}
   				    	    				});
   		    								
   		    							}
   		    						});
       							}
       						});
    					}
    				});
    			}
    		});
    	}
    }
    
    function fn_data02Delete() {
    	var estId = $("#estId").val();
    	
    	if(confirm("정말 삭제하시겠습니까??")){
			$.ajax({
				url: "${path}/gw/deleteEst/" + estId,
				method: "post",
				success: function(){
					alert("삭제되었습니다.");
		 			location.href = "${path}/gw/estlist.do";
				}
			});
    	}else{
    		return false;
    	}
    }

    function recall02(){
        var sum12 = parseInt($("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum22 = parseInt($("#data02Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0);
        var sum32 = Math.round(sum12 * sum22);
        var vat2 = Math.round(sum32 * 0.1);
        var Total2 = Math.round(sum32 + vat2);
        $("#data02Netprice").val(sum12.toLocaleString("en-US"));
        $("#data02Quanty").val(sum22.toLocaleString("en-US"));
        $("#data02Amt").val(sum32.toLocaleString("en-US"));
        $("#data02Vat").val(vat2.toLocaleString("en-US"));
        $("#data02Total").val(Total2.toLocaleString("en-US"));
    }

    function recall03(){
        var Total = parseInt($("#data02Total").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum22 = parseInt($("#data02Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0);
        var sum32 = Math.round(Total/11*10);
        var vat2 = Math.round(Total / 11);
        var sum12 = Math.round((Total - vat2)/sum22);
        $("#data02Netprice").val(sum12.toLocaleString("en-US"));
        $("#data02Quanty").val(sum22.toLocaleString("en-US"));
        $("#data02Amt").val(sum32.toLocaleString("en-US"));
        $("#data02Vat").val(vat2.toLocaleString("en-US"));
        $("#data02Total").val(Total.toLocaleString("en-US"));
    }


    $(document).ready(function(){
    	var qutylist = $("#qutylist tbody tr");
    	var productSum = parseInt($("#product02InSum_table").html().replace(/[\D\s\._\-]+/g, ""));
    	var amountSum = parseInt($("#amountSum").val());
    	var vatSum = parseInt($("#vatSum").val());
    	var nowDate = new Date();    
    	var comName = "${detail.comName}";
		
        $("#estDate").val(nowDate.getFullYear() + "-" + nowDate.getMonth()+1 + "-" + nowDate.getDate());
    	
    	$("#select2").hide();
        
        $("#productSelect").change(function(){
        	if($(this).val() === "selectOn"){
        		$("#select1").show();
        		$("#select1").find("#data02Title").attr("data-flag", true);
        		$("#select1").find("#productNo2").val("");
        		$("#select2").hide();
        		$("#select2").find("#data02Title").attr("data-flag", false);
        		$("#select2").find("#data02Title").val("");
        	}else{
        		$("#select1").hide();
        		$("#select1").find("#data02Title").attr("data-flag", false);
        		$("#select1").find("#data02Title").val("");
        		$("#select1").find("#productNo2").val("");
        		$("#select2").show();
        		$("#select2").find("#data02Title").attr("data-flag", true);
        	}
        });
        
        $("#estComName").change(function(){
        	$.ajax({
        		url: "${path}/gw/selectComInfo/" + $(this).find("option:selected").attr("data-value"),
        		method: "post",
        		dataType: "json",
        		success:function(data){
        			$("#estComName").val(data.comName);
        			$("#estComBoss").val(data.comBoss);
        			$("#estComAdd").val(data.comAddress);
        			$("#estComPhone").val(data.comPhone);
        			$("#estComFax").val(data.comFax);
        		}
        	});
        });
    	
    	qutylist.each(function(index, item){
	    	var temp = {};
	    	var itemKinds = $(item).find("#dataItemKinds").html();
	    	var itemTitle = $(item).find("#dataItemTitle").html();
    		var productSalesEstimateCustName = $(item).find('#salesCustNoN').html();
        	var productNo = $(item).find("#productNo").val();
        	var productName = $(item).find("#dataTitle").html();
        	var productNetprice = $(item).find("#dataNetprice").html().replace(/[\D\s\._\-]+/g, "");
        	var productQty = $(item).find("#dataQuanty").html();
        	var productAmount = $(item).find("#dataAmt").html().replace(/[\D\s\._\-]+/g, "");
        	var productVat = $(item).find("#dataVat").html().replace(/[\D\s\._\-]+/g, "");
        	var productTotal = $(item).find("#dataTotal").html().replace(/[\D\s\._\-]+/g, "");
        	var productRemark = $(item).find("#dataRemark").html();
        	var dataSpec = $(item).find("#dataSpec").val();
        		
        	productSum = productSum + parseInt(productTotal);
        	amountSum = amountSum + parseInt(productAmount);
        	vatSum = vatSum + parseInt(productVat);
        	
        	$(item).find("#dataUpdateBtn").attr("data-index", index);
        	$(item).find("#dataDelBtn").attr("data-index", index);
        	
        	temp.custNo = $("#productCustNo").val();
    		temp.compNo = $("#compNo").val();
    		temp.itemKinds = itemKinds;
    		temp.itemTitle = itemTitle;
        	temp.productNo = productNo;
        	temp.custName = productSalesEstimateCustName;
        	temp.productName = productName;
        	temp.productNetprice = productNetprice;
        	temp.productQty = productQty;
        	temp.productAmount = productAmount;
        	temp.productVat = productVat;
        	temp.productTotal = productTotal;
        	temp.productRemark = productRemark;
        	temp.productSpec = dataSpec;
        	
        	dataArray.push(temp);
        	
        	dataIndex = index + 1;
        	console.log(dataArray);
    	});
    	
    	setTimeout(() => {
	    	$("#product02InSum_table").html("￦"+parseInt(productSum).toLocaleString("en-US"));
	    	$("#amountSum").val(amountSum);
	    	$("#vatSum").val(vatSum);
		}, 100);
    	
        $('#data02Netprice,#data02Quanty,#data02Discount').on('keyup',function(){
            recall02();
        });
        $('#data02Total').on('keyup',function(){
            recall03();
        });
        $("#data02Modbtn").hide();
    });
</script>
