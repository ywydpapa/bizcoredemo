<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2022-01-20
  Time: 오전 10:04
  To change this template use File | Settings | File Templates.
--%>
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
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
	
    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">조달 구매요청 목록 </h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                        <!-- hide and show -->
						<button class="btn btn-sm btn-success" style="display:none;" id="fold" onclick="acordian_action()" disabled>펼치기</button>
						<button class="btn btn-sm btn-success" style="display:none;" id="fold2" onclick="acordian_action1()" style="display:none;">접기</button>
						<!-- hide and show -->
                        <button class="btn btn-sm btn-inverse" style="display:none;" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
                        <button class="btn btn-sm btn-primary" style="display:none;" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>
                        <a href="${path}/pps/ppspy.do" class="btn btn-sm btn-primary">조달데이터</a>
                        <button class="btn btn-sm btn-danger"onClick="javascript:location='${path}/pps/ppsupload.do'"><i class="icofont icofont-pencil-alt-2"></i>조달자료 등록</button>
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
                                    <label class="col-form-label" for="userName">담당사원</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="userName"
                                               id="userName" value="" readonly /> <input type="hidden"
                                                                                         name="userNo" id="userNo" value="" /> <span
                                            class="input-group-btn">
										<button class="btn btn-primary sch-company"
                                                data-remote="${path}/modal/popup.do?popId=user" type="button"
                                                data-toggle="modal" data-target="#userModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
                                        <div class="modal fade " id="userModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title"></h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>사용자목록</h5>
                                                        <p>Loading!!!</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default waves-effect "
                                                                data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="soppTitle">영업기회</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="soppTitle"
                                               id="soppTitle" value="" readonly /> <input
                                            type="hidden" name="soppNo" id="soppNo"
                                            value="" /> <span class="input-group-btn">
											<button class="btn btn-primary sch-company"
                                                    data-remote="${path}/modal/popup.do?popId=sopp"
                                                    type="button" data-toggle="modal"
                                                    data-target="#soppModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
                                        <div class="modal fade " id="soppModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">영업기회 검색</h4>
                                                        <button type="button" class="close"
                                                                data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>영업기회 목록</h5>
                                                        <p>Loading!!!</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button"
                                                                class="btn btn-default waves-effect "
                                                                data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="custName">매출처</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="custName"
                                               id="custName" value="" readonly /> <input
                                            type="hidden" name="custNo" id="custNo"
                                            value="" /> <span class="input-group-btn">
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
                                                        <button type="button"
                                                                class="btn btn-default waves-effect "
                                                                data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="salesType">처리 상태</label>
                                    <select name="select" class="form-control form-control-sm" id="salesType">
                                        <option value>선택</option>
                                        <c:forEach var = "acttype" items="${acttype}">
                                            <option value="${acttype.codeNo}">${acttype.desc03}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">발행일</label>
                                    <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="salesFrdatetime"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="salesTodatetime">
                                    </p>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">거래일</label>
                                    <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="regSDate"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="regEDate">
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
                    <div class="table-responsive">
                        <div style="float: left; margin-right:5px;">
                            <select id="assignUser" class="UserSelect form-control">
                                <c:forEach var="row" items="${userList}">
                                    <option value="${row.userNo}" <c:if test="${sessionScope.userNo eq row.userNo}">selected</c:if>>${row.userName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div style="float: left">
                            <button class="btn btn-sm btn-primary" onClick="javascript:fnAssignPps()">개별 할당(1:1)</button>
                        </div>
                        <table id="vatTable" class="table table-striped table-bordered nowrap " style="margin-top: 40px;">
                            <colgroup>
                                <col width="2%">
                                <col width="10%"/>
                                <col width="15%"/>
                                <col width="10%"/>
                                <col width="7%"/>
                                <col width="7%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th></th>
                                <th class="text-center">계약일자</th>
                                <th class="text-center">할당자명</th>
                                <th class="text-center">수요기관(코드)</th>
                                <th class="text-center">지역</th>
                                <th class="text-center">계약번호</th>
                                <th class="text-center">계약건명</th>
                                <th class="text-center">단가</th>
                                <th class="text-center">수량</th>
                                <th class="text-center">단위</th>
                                <th class="text-center">금액</th>
                                <th class="text-center">납품기한</th>
                                <th class="text-center">영업기회번호</th>
                            </tr>
                            </thead>
                            <c:forEach items="${ppsList}" var="vlist">
                                <tr>
                                    <td><input type="checkbox" class="Chkpps" data-id="${vlist.ppsId}" <c:if test="${vlist.soppNo > 0}">disabled</c:if>></td>
                                    <td class="text-center PpsItem01">${vlist.contractDate}</td>
                                    <td class="text-center PpsItem14">${vlist.userName}</td>
                                    <td class="text-center PpsItem02">${vlist.buyerName}(${vlist.buyerCode})</td>
                                    <td class="text-center PpsItem03">${vlist.buyerArea}(${vlist.buyerAreacode})</td>
                                    <td class="text-center PpsItem04">${vlist.reqNo}</td>
                                    <td class="text-center PpsItem05">${vlist.contractTitle}</td>
                                    <td class="text-right PpsItem07"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.itemNetprice}" /></td>
                                    <td class="text-right PpsItem08"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.itemQty}" /></td>
                                    <td class="text-center PpsItem09">${vlist.itemUnit}</td>
                                    <td class="text-right PpsItem10"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.itemAmount}" /></td>
                                    <td class="text-center PpsItem11">${vlist.deliveryDate}</td>
                                    <c:choose>
	                                    <c:when test="${vlist.soppNo > 0}">
		                                    <td class="text-center PpsItem13"><a href="${path}/sopp/detail/${vlist.soppNo}">${vlist.soppNo}</a></td>
	                                    </c:when>
	                                    <c:otherwise>
	                                    	<td class="text-center PpsItem13">${vlist.soppNo}</td>
	                                    </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//리스트 table-->

	<!-- hide and show -->
	<script>
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
	</script>
	<!-- hide and show -->

    <script>
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

        function fnSetCustData(a, b) {
            $("#custNo").val(b);
            $("#custName").val(a);
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

        function fnAssignPps(){
            $Chkarr = $(".Chkpps");
            $A01arr = $(".PpsItem01");
            $A02arr = $(".PpsItem02");
            $A03arr = $(".PpsItem03");
            $A04arr = $(".PpsItem04");
            $A05arr = $(".PpsItem05");
            $A06arr = $(".PpsItem06");
            $A07arr = $(".PpsItem07");
            $A08arr = $(".PpsItem08");
            $A09arr = $(".PpsItem09");
            $A10arr = $(".PpsItem10");
            $A11arr = $(".PpsItem11");
            $A12arr = $(".PpsItem12");

            for (var i=0; i<$A01arr.length; i++) {
                if ($($Chkarr[i]).is(":checked") == true) {
                	var ppsId = $($Chkarr[i]).attr("data-id");
                    var soppData = {};
                    soppData.compNo = ${sessionScope.compNo};
                    soppData.userNo = $("#assignUser").val();
                    soppData.buyrNo = '103700';
                    soppData.soppTitle = "(조달할당) "+ $A05arr[i].innerText;
                    soppData.soppDesc = "(조달 계약 번호) : "+ $A04arr[i].innerText;
                    soppData.soppTargetAmt = Number($A10arr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
                    soppData.soppTargetDate = $A11arr[i].innerText;
                    soppData.soppType = '10173';
                    soppData.soppStatus = '10178';
                    soppData.soppSrate = '100';
                    soppData.businessType = '조달발주';
                    soppData.cntrctMth = '10247';
                    soppData.custNo = '103700';
                    console.log(soppData);
                    
                    $.ajax({
                        url : "${path}/sopp/assignPps.do",
                        data : soppData,
                        method : "POST",
                        async: false,
                        dataType: "json",
                        success:function(data){
                       		var getNo = data.getNo;
		                    var updateData = {};
                       		updateData.ppsId = ppsId;
                       		updateData.soppNo = getNo;
                       		
                       		$.ajax({
                       			url: "${path}/pps/assignUpdate.do",
                       			method: "post",
                       			data: updateData,
                       			async: false,
                       			dataType: "json",
                       		});
                        }
                    });
                }
            }
            
            setTimeout(() => {
	            alert("할당 완료");
	            location.reload();
			}, 500);
        }
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>