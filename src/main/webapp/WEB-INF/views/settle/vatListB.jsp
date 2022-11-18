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
<style>
	#vatTableB tbody tr td{
		vertical-align: middle;
	}
</style>
<div id="main_content">
	<script>
		$(function(){
			$('#vatTableB').DataTable({
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
                            <h6 style="font-weight:600;">매입 계산서 조회</h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                        <!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold" onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2"  onclick="acordian_action1()" style="display:none;">접기</button>
                        <button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()">
                        	<i class="icofont icofont-spinner-alt-3"></i>초기화
                        </button>
                        <button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()">
                        	<i class="icofont icofont-search"></i>검색
                        </button>
                        <button class="btn btn-sm btn-inverse" onClick="javascript:fnChgStatus3()">
                        	부분지급
                        </button>
                        <button class="btn btn-sm btn-danger" onClick="javascript:fnChgStatus5()">
                        	지급완료
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
                                <div class="col-sm-12 col-xl-5">
                                	<c:set var="today" value="<%=new java.util.Date() %>"/>
                                	<fmt:formatDate value="${today}" pattern="yyyy" var="start"/>
                                    <label class="col-form-label">발행일</label>
                                    <p class="input-group">
                                    	<select class="form-control form-control-sm" id="searchYear">
                                    		<option value="">년도 선택</option>
                                    		<c:forEach var="i" begin="0" end="100" step="1">
                                    			<option value="${start - i}">${start - i}</option>
                                    		</c:forEach>
                                    	</select>
                                    	<select class="form-control form-control-sm" id="searchChoice" disabled="disabled">
                                    		<option value="">분기별 선택</option>
                                    		<option value="3">1/4분기</option>
                                    		<option value="6">2/4분기</option>
                                    		<option value="9">3/4분기</option>
                                    		<option value="12">4/4분기</option>
                                    	</select>
                                    	<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="vatIssueDateFrom" value="${param.vatIssueDateFrom}"/>
                                    		&nbsp;~&nbsp;
                                    	<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="vatIssueDateTo" value="${param.vatIssueDateTo}"/>
                                    </p>
                                </div>
                                <div class="col-sm-12 col-xl-5">
                                	<label class="col-form-label">금액</label>
                                    <p class="input-group">
                                    	<input style="text-align:right;" class="form-control form-control-sm" type="text" id="vatTotalFrom" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${param.vatTotalFrom}" />"  onkeyup="moneyFormatInput(this);"/>
                                    		&nbsp;~&nbsp; 
                                    	<input style="text-align:right;" class="form-control form-control-sm" type="text" id="vatTotalTo" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${param.vatTotalTo}" />"  onkeyup="moneyFormatInput(this);"/>
                                    </p>
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
                    <div class="table-responsive" style="overflow:hidden;">
                    	<span style="font-weight:600;">※총합계</span>
                    	<table class="table table-striped table-bordered nowrap" style="margin-bottom: 1%;">
                    		<c:forEach items="${vatList}" var="vlist">
                    			<c:set var="totalSum" value="${totalSum + (vlist.vatAmount + vlist.vatTax)}" />
                    		</c:forEach>
                   			<tr>
                   				<th class="text-center">매입합계</th>
                   				<c:choose>
                    				<c:when test="${empty vatList}">
		                            	<th class="text-right">0</th>
                    				</c:when>
                    				<c:otherwise>
	                    				<th class="text-center moneyTdHtml">${totalSum}</th>
                    				</c:otherwise>
                   				</c:choose>
                   			</tr>
                    	</table>
                        <table id="vatTableB" class="table table-striped table-bordered nowrap ">
                            <colgroup>
                                <col width="10%"/>
                                <col width="12%"/>
                                <col width="7%"/>
                                <col width="10%"/>
                                <col width="5%"/>
                                <col width="5%"/>
                                <col width="5%"/>
                                <%-- <col width="15%"/> --%>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">등록일</th>
                                <th class="text-center">거래처</th>
                                <th class="text-center">발행번호</th>
                                <th class="text-center">상태</th>
                                <th class="text-center">공급가</th>
                                <th class="text-center">세액</th>
                                <th class="text-center">합계금액</th>
                                
                                <!-- 연결문서 지워라해서 일단 주석처리(2022.04.05) --> 
                                <!-- <th class="text-center">연결문서(합계금액)</th> -->
                                
                                <th class="text-center">품목</th>
                                <th class="text-center">규격</th>
                                <th class="text-center">비고</th>
                            </tr>
                            </thead>
                            <c:forEach items="${vatList}" var="vlist">
                                <tr>
                                	<td class="text-center">${vlist.vatIssueDate}</td>
                                    <td class="text-center">
                                    	${vlist.vatSellerName}
                                   	</td>
                                    <td class="text-center vatSno"><a href="${path}/acc/vatHtml/${vlist.vatSerial}/${vlist.vatType}" onClick="javascript:popupVat(this); return false;">${vlist.vatSerial}</a></td>
                                    <td class="text-center">
                                    	<c:if test = "${vlist.vatStatus eq 'B1'}">매입발행</c:if>
                                    	<c:if test = "${vlist.vatStatus eq 'B3'}">지급처리중</c:if>
                                    	<c:if test = "${vlist.vatStatus eq 'B5'}">지급완료</c:if>
                                        <input type="checkbox" class="vatStchg" data-id="${vlist.vatSerial}">
                                    </td>	
                                    <td class="text-right moneyTdHtml">
                                    	${vlist.vatAmount}
                                    </td>
                                    <td class="text-right moneyTdHtml">
                                    	${vlist.vatTax}
                                    </td>
                                    <td class="text-right moneyTdHtml">
                                    	${vlist.vatTotal}
                                    </td>
                                    <%-- <td class="text-right">
                                    	<a data-remote="${path}/modal/popup1.do?popId=${vlist.vatSerial}" type="button" data-toggle="modal" data-target="#userModal1" style="cursor: pointer; text-decoration: underline;">
                                    		<fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.vatSum}" />
                                    	</a>
                                    </td> --%>
                                    <c:choose>
                                    	<c:when test="${empty vlist.vatMemo}">
		                                    <td style="white-space:normal;">${vlist.vatProductName}</td>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<td style="white-space:normal;">${vlist.vatProductName}(${vlist.vatMemo})</td>
                                    	</c:otherwise>
                                    </c:choose>
                                    <td style="white-space:normal;">${vlist.vatStandard}</td>
                               		<td style="white-space:normal;">${vlist.vatRemark}</td>
                                </tr>
                            </c:forEach>
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
    <script>
    	$(document).ready(function(){
	    	var vatType = "${param.vatType}";
			
	    	if(vatType !== ""){
	    		$("#vatType").val(vatType);
	    	}
			
	    	$("#searchYear").change(function(){
	    		var dateFrom = $("#vatIssueDateFrom");
	    		var dateTo = $("#vatIssueDateTo");
	    		var choice = $("#searchChoice");
	    		
	    		if($(this).val() === ""){
	    			dateFrom.val("");
	    			dateTo.val("");
	    			choice.attr("disabled", true);
					choice.val("");	    			
	    		}else{
	    			choice.attr("disabled", false);
	    			choice.val("");
	    			dateFrom.val($(this).val() + "-01-01");
	    			dateTo.val($(this).val() + "-12-31");
	    		}
	    	});
	    	
	    	$("#searchChoice").change(function(){
	    		var year = $("#searchYear");
	    		var dateFrom = $("#vatIssueDateFrom");
	    		var dateTo = $("#vatIssueDateTo");
	    		
	    		if($(this).val() == 3){
	    			dateFrom.val(year.val() + "-01-01");
	    			dateTo.val(year.val() + "-03-31");
	    		}else if($(this).val() == 6){
	    			dateFrom.val(year.val() + "-04-01");
	    			dateTo.val(year.val() + "-06-30");
	    		}else if($(this).val() == 9){
	    			dateFrom.val(year.val() + "-07-01");
	    			dateTo.val(year.val() + "-09-30");
	    		}else if($(this).val() == 12){
	    			dateFrom.val(year.val() + "-10-01");
	    			dateTo.val(year.val() + "-12-31");
	    		}else{
	    			dateFrom.val(year.val() + "-01-01");
	    			dateTo.val(year.val() + "-12-31");
	    		}
	    	});
	    	
	    	$("#vatIssueDateFrom").change(function(){
				var dateValue = $(this).val();
				var dateValueArr = dateValue.split("-");
				var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
				var EdateValue = $("#vatIssueDateTo").val();
				var EdateDateArr = EdateValue.split("-");
				var EdateDateCom = new Date(EdateDateArr[0], parseInt(EdateDateArr[1])-1, EdateDateArr[2]);
				
				if(EdateValue == ""){
					dateValueCom.setDate(dateValueCom.getDate()+1);
				}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
					alert("시작일이 종료일보다 클 수 없습니다.");
					dateValueCom.setDate(dateValueCom.getDate()+1);
				}else{
					return null;
				}
				
				var year = dateValueCom.getFullYear();
				var month = dateValueCom.getMonth()+1;
				var day = dateValueCom.getDate();
				
				if(month < 10){
					month = "0" + month;
				}
				
				if(day < 10){
					day = "0" + day;
				}
				
				$("#vatIssueDateTo").val(year + "-" + month + "-" + day);
			});
			
			$("#vatIssueDateTo").change(function(){
				var SdateValue = $("#vatIssueDateFrom").val();
				var SdateValueArr = SdateValue.split("-");
				var SdateValueCom = new Date(SdateValueArr[0], parseInt(SdateValueArr[1])-1, SdateValueArr[2]);
				var thisDateValue = $(this).val();
				var thisDateArr = thisDateValue.split("-");
				var thisDateCom = new Date(thisDateArr[0], parseInt(thisDateArr[1])-1, thisDateArr[2]);
				
				if(SdateValue == ""){
					thisDateCom.setDate(thisDateCom.getDate()-1);
				}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
					alert("종료일이 시작일보다 작을 수 없습니다.");
					thisDateCom.setDate(thisDateCom.getDate()-1);
				}else{
					return null;
				}
				
				var year = thisDateCom.getFullYear();
				var month = thisDateCom.getMonth()+1;
				var day = thisDateCom.getDate();
				
				if(month < 10){
					month = "0" + month;
				}
				
				if(day < 10){
					day = "0" + day;
				}
				
				$("#vatIssueDateFrom").val(year + "-" + month + "-" + day);
			});
			
	        var lastAco1 = localStorage.getItem('lastAco1');
	        var lastAco2 = localStorage.getItem('lastAco2');
	        if(lastAco1 == null && lastAco2 != null) {
	             $("#acordian").css("display", "block");
		        localStorage.clear();
	        }
    	});
    
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
        
        function popupVat(e){
            var nWidth = "800";
            var nHeight = "800";

            var curX = window.screenLeft;
            var curY = window.screenTop;
            var curWidth = document.body.clientWidth;
            var curHeight = document.body.clientHeight;

            var nLeft = curX + (curWidth / 2) - (nWidth / 2);
            var nTop = curY + (curHeight / 2) - (nHeight / 2);

            var strOption = "";
            strOption += "left=" + nLeft + "px,";
            strOption += "top=" + nTop + "px,";
            strOption += "width=" + nWidth + "px,";
            strOption += "height=" + nHeight + "px,";
            strOption += "toolbar=no,menubar=no,location=no,";
            strOption += "resizable=yes,status=yes";

            var winObj = window.open($(e).attr("href"), '', strOption);

            if (winObj == null) {
                alert("팝업 차단을 해제해주세요.");
                return false;
            }
        }
        
        function fnListcon() {
    		var vatData = {};
    		vatData.vatSellerCustNo = $("#vatSellerCustNo").val() ? Number($("#vatSellerCustNo").val()) : 0;
    		vatData.vatSellerName = $("#vatSellerName").val();
    		vatData.vatIssueDateFrom = $("#vatIssueDateFrom").val() ? $("#vatIssueDateFrom").val() : null;
    		vatData.vatIssueDateTo = $("#vatIssueDateTo").val() ? $("#vatIssueDateTo").val() : null;
    		vatData.vatTotalFrom = $("#vatTotalFrom").val() ? $("#vatTotalFrom").val().replace(/[\D\s\._\-]+/g, "") : null;
    		vatData.vatTotalTo = $("#vatTotalTo").val() ? $("#vatTotalTo").val().replace(/[\D\s\._\-]+/g, "") : null;
    		
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

    		var url = '${path}/acc/vatlistB.do'+param;
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
        
        function fnChgStatus3(){
        	var tableBody = $("#vatTableB tbody tr td .vatStchg");
        	var compNo = "${sessionScope.compNo}";
        	
        	tableBody.each(function(index, item){
        		if($(item).is(":checked") === true){
		        	var vatSerial = $(this).attr("data-id");
	        		var vatData = {};
	        		vatData.compNo = compNo;
	        		vatData.vatSerial = vatSerial;
	        		vatData.vatStatus = 'B3';
	        		
	        		$.ajax({
	                    url : "${path}/acc/vatStatuschg.do",
	                    data : vatData,
	                    async: false,
	                    method : "POST",
	                    dataType: "json"
	                });
        		}
        	});
        	
            alert("변경 처리 완료");
            location.href = location.href;
        }

        function fnChgStatus5(){
        	var tableBody = $("#vatTableB tbody tr td .vatStchg");
        	var compNo = "${sessionScope.compNo}";
        	
        	tableBody.each(function(index, item){
        		if($(item).is(":checked") === true){
		        	var vatSerial = $(this).attr("data-id");
	        		var vatData = {};
	        		vatData.compNo = compNo;
	        		vatData.vatSerial = vatSerial;
	        		vatData.vatStatus = 'B5';
	        		
	        		$.ajax({
	                    url : "${path}/acc/vatStatuschg.do",
	                    data : vatData,
	                    async: false,
	                    method : "POST",
	                    dataType: "json"
	                });
        		}
        	});
        	
            alert("변경 처리 완료");
            location.href = location.href;
        }
        
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>