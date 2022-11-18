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
                            <h6 style="font-weight:600;">계산서 목록 </h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
						<button class="btn btn-sm btn-success" id="fold" onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2" onclick="acordian_action1()" style="display:none;">접기</button>
                        <button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()">
                        	<i class="icofont icofont-spinner-alt-3"></i>초기화
                        </button>
                        <button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()">
                        	<i class="icofont icofont-search"></i>검색
                        </button>
                        <button class="btn btn-sm btn-danger" onClick="javascript:fnChgStatus()">
                        	상태변경
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
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="vatType">매입/매출</label>
                                    <select name="select" class="form-control form-control-sm" id="vatType">
                                        <option value="">선택</option>
                                        <option value="B">매입</option>
                                        <option value="S">매출</option>
                                    </select>
                                </div>
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
                                <col width="30%"/>
                                <col width="10%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">거래처</th>
                                <th class="text-center">기초잔액</th>
                                <th class="text-center">매입합계</th>
                                <th class="text-center">지불완료합계</th>
                                <th class="text-center">매출합계</th>
                                <th class="text-center">수금완료합계</th>
                            </tr>
                            </thead>
                            <c:forEach items="${vatList}" var="vlist">
                                <tr>
                                    <td class="text-center">
                                    	<c:if test = "${vlist.vatType eq 'S'}">
                                    		<a data-remote="${path}/modal/popup.do?popId=custVatListModal&custNo=${vlist.vatBuyerCustNo}&compNo=${sessionScope.compNo}" type="button" data-toggle="modal" data-target="#custVatList" style="cursor: pointer; text-decoration: underline;">
                                    			${vlist.vatBuyerName}
                                    		</a>
                                    		</c:if> 
                                    	<c:if test = "${vlist.vatType eq 'B'}">
                                    		<a data-remote="${path}/modal/popup.do?popId=custVatListModal&custNo=${vlist.vatSellerCustNo}&compNo=${sessionScope.compNo}" type="button" data-toggle="modal" data-target="#custVatList" style="cursor: pointer; text-decoration: underline;">
                                    			${vlist.vatSellerName}
                                    		</a>
                                    	</c:if>
                                   	</td>
                                   	<td class="text-right">
                                   		<c:choose>
                                    		<c:when test="${vlist.custBalance > 0}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.custBalance}" /></c:when>
                                    		<c:otherwise>0</c:otherwise>
                                    	</c:choose>
                                   	</td>
                                    <td class="text-right">
                                    	<c:choose>
                                    		<c:when test="${vlist.vatAmountB > 0}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.vatAmountB}" /></c:when>
                                    		<c:otherwise>0</c:otherwise>
                                    	</c:choose>
                                    </td>
                                    <td class="text-right">
                                    	<c:choose>
                                    		<c:when test="${vlist.serialTotalB > 0}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.serialTotalB}" /></c:when>
                                    		<c:otherwise>0</c:otherwise>
                                    	</c:choose>
                                    </td>
                                    <td class="text-right">
										<c:choose>
                                    		<c:when test="${vlist.vatAmountS > 0}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.vatAmountS}" /></c:when>
                                    		<c:otherwise>0</c:otherwise>
                                    	</c:choose>
									</td>
                                    <td class="text-right">
                                    	<c:choose>
                                    		<c:when test="${vlist.serialTotalS > 0}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.serialTotalS}" /></c:when>
                                    		<c:otherwise>0</c:otherwise>
                                    	</c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <!-- model -->
                <div class="modal fade " id="custVatList" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-80size" role="document">
						<div class="modal-content modal-80size">
							<div class="modal-header">
								<h4 class="modal-title">목록</h4>
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
        $('#custVatList').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        
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

    		var url = '${path}/acc/vatlist.do'+param;
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

    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>