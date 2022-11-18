<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top3.jsp"/>
<script src="${path}/js/jquery.table2excel.js"></script>

<div id="main_content">
	
	<script>
	$(function(){
		$('#vatTable').DataTable({
			info:false,
			searching: true,
			order: [[ 0, "desc" ]],
		});
	});
	</script>
	
    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">계산서 발행</h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                        <!-- hide and show -->
						<button class="btn btn-sm btn-success" style="display:none;" id="fold" onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" style="display:none;" id="fold2" onclick="acordian_action1()" style="display:none;">접기</button>
						<!-- hide and show -->
                        <button class="btn btn-sm btn-inverse" style="display:none;" onClick="javascript:fnClearall()">
                        	<i class="icofont icofont-spinner-alt-3"></i>초기화
                        </button>
                        <button class="btn btn-sm btn-primary" style="display:none;" onClick="javascript:fnListcon()">
                        	<i class="icofont icofont-search"></i>검색
                        </button>
                        <button class="btn btn-sm btn-danger"  onClick="javascript:fnVatExl()">
                        	계산서 파일 생성
                        </button>
                        <button class="btn btn-sm btn-outline"onClick="javascript:location='${path}/acc/vatupload.do'">
                        	<i class="icofont icofont-pencil-alt-2"></i>계산서 등록
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!--Page-header end 페이지 타이틀 -->
        <!--영업활동조회-->
        <div class="cnt_wr" id="acordian" style="display:none;">
            <div class="row">
                <form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
                    <div class="col-sm-12">
                        <div class="card_box sch_it">
                            <div class="form-group row">
                            	<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">거래처</label>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="vatSellerName" id="vatSellerName" value="${param.vatSellerName}" readonly />
										<input type="hidden" name="vatSellerCustNo" id="vatSellerCustNo" value="${param.vatSellerCustNo}" />
										<span class="input-group-btn">
											<button class="btn btn-primary sch-company"
												data-remote="${path}/modal/popup.do?popId=cust"
												type="button" data-toggle="modal"
												data-target="#custModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="custModal" tabindex="-1"
											role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title">매출처검색</h4>
														<button type="button" class="close"
															data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>매출처목록</h5>
														<p>Loading!!!</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="salesType">처리 상태</label>
                                    <select name="select" class="form-control form-control-sm" id="salesType">
                                        <option>선택</option>
                                        <c:forEach var = "acttype" items="${acttype}">
                                            <option value="${acttype.codeNo}">${acttype.desc03}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <!-- <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="vatType">매입/매출</label>
                                    <select name="select" class="form-control form-control-sm" id="vatType">
                                        <option value="">선택</option>
                                        <option value="B">매입</option>
                                        <option value="S">매출</option>
                                    </select>
                                </div> -->
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-4">
                                    <label class="col-form-label">등록일</label>
                                    <p class="input_inline">
                                    	<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="vatIssueDateFrom" value="${param.vatIssueDateFrom}"/>
                                    		~ 
                                    	<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="vatIssueDateTo" value="${param.vatIssueDateTo}"/>
                                    </p>
                                </div>
                                <div class="col-sm-12 col-xl-3">
									<label class="col-form-label">발행번호</label>
									<input type="text" class="form-control form-control-md" id="vatSerial" name="" placeholder="" value="${param.vatSerial}">
								</div>
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label">메모</label>
									<input type="text" class="form-control form-control-md" id="vatRemark" name="" placeholder="" value="${param.vatRemark}">
								</div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--//영업활동조회-->
    </c:if>

    <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="vatTable" class="table table-striped table-bordered nowrap ">
                            <colgroup>
                                <col width="5%"/>
                                <col width="10%"/>
                                <col width="15%"/>
                                <col width="5%"/>
                                <col width="5%"/>
                                <col width="5%"/>
                                <col width="10%"/>
                                <col width="20%"/>
                                <col width="10%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
	                            <tr>
	                                <th class="text-center">선택</th>
	                                <th class="text-center">발행요청일</th>
	                                <th class="text-center">거래처</th>
	                                <th class="text-center">공급가</th>
	                                <th class="text-center">세액</th>
	                                <th class="text-center">합계금액</th>
	                                <th class="text-center">내역</th>
	                                <th class="text-center">메모</th>
	                                <th class="text-center">계약번호</th>
	                                <th class="text-center">계약명</th>
	                            </tr>
                            </thead>
                            <tbody>
	                            <c:forEach items="${vatList}" var="vlist">
	                                <tr>
	                                <td class="text-center"><input type="checkbox" class="vatTcheck" id="vatTcheck" data-id="${vlist.vatId}"></td>
	                                <td class="text-center">${vlist.vatIssueDate}</td>
	                                    <td class="text-center">
	                                    	<%-- <c:if test = "${vlist.vatType eq 'S'}">${vlist.vatBuyerName}</c:if> 
	                                    	<c:if test = "${vlist.vatType eq 'B'}">${vlist.vatSellerName}</c:if> --%>
	                                    	${vlist.vatBuyerName}
	                                   	</td>
	                                    <td class="text-right">
	                                    	<fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.vatAmount}" />
	                                    </td>
	                                    <td class="text-right">
	                                    	<fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.vatTax}" />
	                                    </td>
	                                    <td class="text-right">
	                                    	<fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.vatAmount + vlist.vatTax}" />
	                                    </td>
	                                    <td>${vlist.vatRemark}</td>
	                                    <td>${vlist.vatMemo}</td>
	                                    <td class="text-center">${vlist.contNo}</td>
	                                    <td class="text-center">${vlist.contTitle}</td>
	                                </tr>
	                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- model -->
                <div class="modal fade " id="userModal1" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-80size" role="document">
						<div class="modal-content modal-80size">
							<div class="modal-header">
								<h4 class="modal-title">연결문서(합계금액)</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						<div class="modal-body">
							<h5>연결문서(합계금액)</h5>
							<p>Loading!!!</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
						</div>
						</div>
					</div>
				</div>
				<!-- model -->
            </div>
        </div>
    </div>
    
    <table id="vatExTable" class="table table-striped table-bordered nowrap table2excel_with_colors">
    	<thead>
    		<tr style="text-align:center;">
    			<th style="background-color:#FFCC99;">전자(세금)계산서 종류<br><span style="color:#FF0000;">(01:일반, 02:영세율)</span></th>
    			<th style="background-color:#FFCC99;">작성일자</th>
    			<th style="background-color:#FFCC99;">공급자 등록번호<br><span style="color:#FF0000;">("-" 없이 입력)</span></th>
    			<th>공급자<br>종사업장번호</th>
    			<th style="background-color:#FFCC99;">공급자 상호</th>
    			<th style="background-color:#FFCC99;">공급자 성명</th>
    			<th>공급자 사업장주소</th>
    			<th>공급자 업태</th>
    			<th>공급자 종목</th>
    			<th>공급자 이메일</th>
    			<th style="background-color:#FFCC99;">공급받는자 등록번호<br><span style="color:#FF0000;">("-" 없이 입력)</span></th>
    			<th>공급받는자<br>종사업장번호</th>
    			<th style="background-color:#FFCC99;">공급받는자 상호</th>
    			<th style="background-color:#FFCC99;">공급받는자 성명</th>
    			<th>공급받는자 상업장주소</th>
    			<th>공급받는자 업태</th>
    			<th>공급받는자 종목</th>
    			<th>공급받는자 이메일1</th>
    			<th>공급받는자 이메일2</th>
    			<th style="background-color:#FFCC99;">공급가액</th>
    			<th style="background-color:#FFCC99;">세액</th>
    			<th>비고</th>
    			<th style="background-color:#FFCC99;">일자1<br><span style="color:#FF0000;">(2자리, 작성년월 제외)</span></th>
    			<th>품목1</th>
    			<th>규격1</th>
    			<th>수량1</th>
    			<th>단가1</th>
    			<th style="background-color:#FFCC99;">공급가액1</th>
    			<th style="background-color:#FFCC99;">세액1</th>
    			<th>품목비고1</th>
    			<th>일자2<br><span style="color:#FFCC99;">(2자리, 작성년월 제외)</span></th>
    			<th>품목2</th>
    			<th>규격2</th>
    			<th>수량2</th>
    			<th>단가2</th>
    			<th>공급가액2</th>
    			<th>세액2</th>
    			<th>품목비고2</th>
    			<th>일자3<br><span style="color:#FFCC99;">(2자리, 작성년월 제외)</span></th>
    			<th>품목3</th>
    			<th>규격3</th>
    			<th>수량3</th>
    			<th>단가3</th>
    			<th>공급가액3</th>
    			<th>세액3</th>
    			<th>품목비고3</th>
    			<th>일자4<br><span style="color:#FFCC99;">(2자리, 작성년월 제외)</span></th>
    			<th>품목4</th>
    			<th>규격4</th>
    			<th>수량4</th>
    			<th>단가4</th>
    			<th>공급가액4</th>
    			<th>세액4</th>
    			<th>품목비고4</th>
    			<th>현금</th>
    			<th>수표</th>
    			<th>어음</th>
    			<th>외상미수금</th>
    			<th style="background-color:#FFCC99;">영수(01), 청구(02)</th>
    		</tr>
    	</thead>
    	<tbody></tbody>
    </table>
    <script>
    	var vatType = "${param.vatType}";
		
    	if(vatType !== ""){
    		$("#vatType").val(vatType);
    	}
    
        $('#custModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        $('#userModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        $('#soppModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        $('#userModal1').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        
        function fnVatExl(){
        	if(confirm("생성하시겠습니까??")){
	        	var pathName = $(location).attr("pathname");
	        	var listChecks = $("#vatTable tbody tr td #vatTcheck");
	        	var compNo = "${sessionScope.compNo}";
	        	var vatExTableThead = $("#vatExTable thead");
	        	var vatExTableTbody = $("#vatExTable tbody");
	        	var checkLength = listChecks.length;
	        	var htmlCodeThead = "";
	        	var htmlCodeTbody = "";
	        	
 				/* htmlCodeThead = "<tr><th style='text-align:center;' colspan='7'>엑셀 업로드 양식(전자세금계산서-일반(영세율))</th></tr>"
 				+ "<tr><td colspan='12' style='color:#FF0000;'>★주황색으로 표시된 부분은 필수입력항목으로 반드시 입력하셔야 합니다.<br>★아래 '항목설명' 시트를 참고하여 작성하시기 바랍니다.</td></tr>"
 				+ "<tr><td colspan='12' style='color:#FF0000;'>★실제 업로드할 DATA는 7행부터 입력하여야 합니다. 최대 100건까지 입력이 가능하나, 발급은 최대 10건씩 처리가 됩니다.(100건 초과 자료는 처리 안됨)<br>★임의로 행을 추가하거나 삭제하는 경우 파일을 제대로 읽지 못하는 경우가 있으므로, 주어진 양식안에 반드시 작성을 하시기 바랍니다.</td></tr>"
 				+ "<tr><td colspan='12' style='color:#FF0000;'>★전자(세금)계산서 종류는 엑셀 업로드 양식에 따라 해당 전자(세금)계산서 종류코드를 반드시 입력하셔야 합니다.<br>★품목은 1건이상 입력해야 합니다.<br>★공급받는자 등록번호는 사업자등록번호, 주민등록번호를 입력할 수 있습니다. 외국인인 경우 '9999999999999'를 입력하시고, 비고란에 외국인등록번호 또는 여권번호를 입력하시기 바랍니다.</td></tr><tr><td></td></tr>";
 					
 				vatExTableThead.prepend(htmlCodeThead); */
 				
	        	listChecks.each(function(index, item){
	        		if($(item).is(":checked") === true){
	        			var updateData = {};
	        			updateData.vatId = $(item).attr("data-id");
	        			updateData.compNo = compNo;
	        			updateData.vatStatus = "S1";
	        			updateData.vatType = "S";
	        			
	        			var selectData = {};
	        			selectData.vatId = $(item).attr("data-id");
	        			selectData.compNo = compNo;
	        			
	        			$.LoadingOverlay("show", true);
	        			
			        	$.ajax({
			        		url: "${path}/acc/selectExcelData.do",
			        		method: "post",
			        		async: false,
			        		data: selectData,
			        		dataType: "json",
			        		success:function(data){
			        			var vatBillType = "";
			        			var vatRecType = "";
			        			var dateSlice = "";
			        			
			        			if(data.vatBillType === "01"){
			        				vatBillType = "일반";	
			        			}else{
			        				vatBillType = "영세율";
			        			}
			        			
			        			if(data.vatRecType === "01"){
			        				vatRecType = "청구";	
			        			}else{
			        				vatRecType = "영수";
			        			}
			        			
			        			dateSlice = data.vatTradeDate.slice(8,10);
			        			
			        			htmlCodeTbody += "<tr style='text-align:center;'>"
			        			+ "<td style='background-color:#FFCC99;'>" + vatBillType + "</td><td style='background-color:#FFCC99;'>" + data.vatIssueDate + "</td><td style='background-color:#FFCC99;'>" + data.proCustVatNo + "</td><td></td>" 
			        			+ "<td style='background-color:#FFCC99;'>" + data.vatSellerName + "</td><td style='background-color:#FFCC99;'>" + data.proBossName + "</td>" + "<td></td>" + "<td></td>" + "<td></td>" + "<td></td>"
			        			+ "<td style='background-color:#FFCC99;'>" + data.recCustVatNo + "</td>" + "<td></td>" + "<td style='background-color:#FFCC99;'>" + data.vatBuyerName + "</td>" + "<td style='background-color:#FFCC99;'>" + data.recBossName + "</td>"
			        			+ "<td></td>" + "<td></td>" + "<td></td>" + "<td></td>" + "<td></td>" + "<td style='background-color:#FFCC99;'>" + parseInt(data.vatAmount).toLocaleString("en-US") + "</td>"
			        			+ "<td style='background-color:#FFCC99;'>" + parseInt(data.vatTax).toLocaleString("en-US") + "</td>" + "<td>" + data.vatRemark + "</td>" + "<td style='background-color:#FFCC99;'>" + dateSlice + "</td>"
			        			+ "<td>" + data.vatProductName + "</td>" + "<td>" + data.vatStandard + "</td>" + "<td>" + data.vatQuan + "</td>" + "<td>" + parseInt(data.vatNet).toLocaleString("en-US") + "</td>"
			        			+ "<td style='background-color:#FFCC99;'>" + parseInt(data.vatAmount).toLocaleString("en-US") + "</td>" + "<td style='background-color:#FFCC99;'>" + parseInt(data.vatTax).toLocaleString("en-US") + "</td>" + "<td></td>" + "<td></td>" + "<td></td>"
			        			+ "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>"
			        			+ "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>" +  "<td></td>"
			        			+ "<td></td>" +  "<td></td>" + "<td style='background-color:#FFCC99;'>" + vatRecType + "</td></tr>";
								
			        			$.ajax({
			        				url: "${path}/acc/sVatToChange.do",
			        				method: "post",
			        				data: updateData,
			        				async: false,
			        				dataType: "json",
			        				error:function(){
			        					alert("상태를 변경하지 못했습니다.");
			        					return false;
			        				}
			        			});
			        		},
			        		error:function(){
			        			alert("데이터를 찾지 못했습니다.");
			        			return false;
			        		}
			        	});
			        	
			        	if(index == checkLength){
			        		setTimeout(function(){
							    $.LoadingOverlay("hide", true);
							}, 5000);
			        	}
	        		}
	        	});
 				
	        	vatExTableTbody.html(htmlCodeTbody);
	        	
	        	setTimeout(() => {
		        	$("#vatExTable").table2excel({ 
			        	exclude: ".vatExTable",
			        	name: "Excel Document Name", 
			        	filename: "세금계산서등록양식(일반).xls",
			        	fileext: ".xls",
						exclude_img: true,
						exclude_links: true,
						exclude_inputs: true,
						preserveColors: true
			        });
		        	
		        	alert("생성되었습니다.");
		        	location.href = pathName;
				}, 300);
	        	
        	}else{
        		return false;
        	}
        }
        
        function fnListcon() {
    		var vatData = {};
    		vatData.vatSellerCustNo = $("#vatSellerCustNo").val() ? Number($("#vatSellerCustNo").val()) : 0;
    		vatData.vatSellerName = $("#vatSellerName").val() ? $("#vatSellerName").val() : null;
    		vatData.vatType = $("#vatType").val() ? $("#vatType").val() : null;
    		vatData.vatIssueDateFrom = $("#vatIssueDateFrom").val() ? $("#vatIssueDateFrom").val() : null;
    		vatData.vatIssueDateTo = $("#vatIssueDateTo").val() ? $("#vatIssueDateTo").val() : null;
    		vatData.vatSerial = $("#vatSerial").val() ? $("#vatSerial").val() : null;						// 판매방식
    		vatData.vatRemark = $("#vatRemark").val() ? $("#vatRemark").val() : null;
    		
    		var param = "?";
    		var paramFirst = true;
    		for (variable in vatData) {
    			console.log("key: " + variable + ", value: " + vatData[variable]);
    			if(vatData[variable] != null && vatData[variable] != 0) {
    				if(paramFirst){
    					param = param + variable + "=" + vatData[variable];
    					paramFirst = false;
    				} else {
    					param = param + "&" + variable + "=" + vatData[variable];
    				}
    			}
    		}

    		if(param == "?"){
    			param = "";
    		}
			
    		if(document.querySelector('#acordian').style.cssText == "display: none;"){
    			var testAco1 = document.querySelector('#acordian').style.cssText;
    			localStorage.setItem('lastAco1', testAco1);	
    		}else {
    			var testAco2 = document.querySelector('#acordian').style.cssText;
    			localStorage.setItem('lastAco2', testAco2);
    		}
    		
    		var url = '${path}/acc/vatlistS.do'+param;
    		location.href = url;
    	}
    	
    	function acordian_action(){
    		if($("#acordian").css("display") == "none"){
    		    $("#acordian").show();
    		    $("#fold").hide();
    		    $("#fold2").show();

    		} else {
    		    $("#acordian").hide();
    		    $("#fold").show();
    		}
    	}
    	function acordian_action1(){
    		if($("#acordian").css("display") != "none"){
    		    $("#acordian").hide();
    		    $("#fold").show();
    		    $("#fold2").hide();

    		} else {
    		    $("#acordian").show();
    		    $("#fold").hide();
    		}
    	}

        function fnSetCustData(a, b) {
            $("#vatSellerCustNo").val(b);
            $("#vatSellerName").val(a);
            $(".modal-backdrop").remove();
            $("#custModal").modal("hide");
        }

        function fnSetUserData(a, b) {
            $("#userName").val(b);
            $("#userNo").val(a);
            $(".modal-backdrop").remove();
            $("#userModal").modal("hide");
        }

        function fnSetSoppData(a, b) {
            $("#soppNo").val(b);
            $("#soppTitle").val(a);
            $(".modal-backdrop").remove();
            $("#soppModal").modal("hide");
        }

        function fnChgStatus(){
            $Aarr=$(".vatSno");
            $Barr=$(".vatStchg");
            $Carr=$(".vatTyp");
            for (var i=0; i<$Barr.length; i++) {
                if ($($Barr[i]).is(":checked") == true) {
                    var vatData = {};
                    vatData.vatSerial = $Aarr[i].innerText;
                    if ($Carr[i].innerText == '매입'){
                        vatData.vatStatus = 'B5';
                    }else{
                        vatData.vatStatus = 'S5';
                    }
                    $.ajax({
                        url : "${path}/acc/vatStatuschg.do",
                        data : vatData,
                        method : "POST",
                        dataType: "json"
                    })
                        .done(function(){
                        });
                }
            }
            alert("변경 처리 완료");
            location.href = location.href;
        }
        
    	$(document).ready(function() {
    		var lastAco1 = localStorage.getItem('lastAco1');
    		var lastAco2 = localStorage.getItem('lastAco2');
    		if(lastAco1 == null && lastAco2 != null) {
    			 $("#acordian").css("display", "block");
    		}
    		localStorage.clear();	
    		
    		$("#vatExTable").hide();
    	});

    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>