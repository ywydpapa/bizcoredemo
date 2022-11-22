<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top2.jsp"/>

<div id="main_content">
    <!-- Page-header start 페이지 타이틀-->
    <div class="page-header2">
        <div class="row align-items-end">
            <div class="col-lg-12">
                <div class="page-header-title">
                    <div class="d-inline">
                        결제서류 상세보기
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Page-header end 페이지 타이틀 -->

    <!--계약등록-->
    <div class="cnt_wr">
        <h5 class="cont_title"><i class="icofont icofont-square-right"></i>결제정보</h5>
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <input type="hidden" id="compNo" value="${sessionScope.compNo}" />
                        <input type="hidden" id="docUserNo" value="${sessionScope.userNo}" />
                        <input type="hidden" id="docNo" value="${detailList.docNo}" />
                        <input type="hidden" id="userNoCR" value="${detailListApp.userNoCR}" />
                        <input type="hidden" id="appStatus" value="${detailListApp.appStatus}" />
                        <input type="hidden" id="docUserName" value="${sessionScope.userName}" />
                        <table class="table table-sm bst02">
                            <colgroup>
								<col width="5%" />
								<col width="15%" />
								<col width="5%" />
								<col width="15%" />
								<col width="5%" />
								<col width="15%" />
								<col width="5%" />
								<col width="15%" />
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="text-center">결제 문서 종류</th>
                                <td colspan="2">
                                    <div class="form-radio">
                                        <form>
                                            <div class="radio radio-inline">
                                                <label style="margin-top: 10px;"> <input type="radio" name="contractType" value="BREQ" checked="checked"> <i class="helper"></i>지출품의서</label>
                                            </div>
                                            <div class="radio radio-inline">
                                                <label> <input type="radio" name="contractType" value="TREQ"> <i class="helper"></i>지출결의서</label>
                                            </div>
                                            <div class="radio radio-inline">
                                                <label> <input type="radio" name="contractType" value="OTHER"> <i class="helper"></i>외부문서</label>
                                            </div>
                                        </form>
                                    </div>
                                </td>
                                <td colspan="5" class="text-right" style="border-left: 0;">
                                    <c:if test="${detailListApp.appStatus eq '5'}">
                                        <c:if test="${detailList.docType eq 'PUR'}">
                                        	<a href="${path}/gw/ordForm/${detailList.docNo}" class="btn btn-success" id="btnPdf" onClick="javascript:popupPdf(this); return false;">발주서 출력</a>
                                        </c:if>
                                        <c:if test="${detailList.docType eq 'DIP'}">
                                            <button class="btn btn-success" onclick="javascript:popupPdf();">공문서 출력</button>
                                        </c:if>
                                        <c:if test="${detailList.docType eq 'BUY'}">
                                            <a href="${path}/gw/purForm/${detailList.docNo}" class="btn btn-success" id="btnPdf" onClick="javascript:popupPdf(this); return false;">구매요청서 출력</a>
                                        </c:if>
                                    </c:if>
	                               	<c:if test="${detailList.docFormNo eq 'TREQ'}">
	                                    <a href="${path}/gw/treqForm/${detailList.docNo}" class="btn btn-success" id="btnPdf" onClick="javascript:popupPdf(this); return false;">지출결의서 출력</a>
	                                </c:if>
                                </td>
                            </tr>
                            <tr>
                                <th class="contDetailSopp text-center">연결프로젝트(영업기회)</th>
                                <td class="contDetailSopp">
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="soppDTO" id="soppTitle" value="${detailList.soppTitle}" readonly/>
                                        <input type="hidden" class="form-control" name="soppDTO" id="soppNo" value="${detailList.linkSoppNo}" />
                                        <span class="input-group-btn">
												<button class="btn btn-primary sch-opportunity2"
                                                        data-remote="${path}/modal/popup.do?popId=sopp"
                                                        type="button" data-toggle="modal" data-target="#soppModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
                                        <div class="modal fade " id="soppModal" tabindex="-1"
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
                                                        <h5>영업기회목록</h5>
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
                                </td>
                                <th class="text-center">거래처</th>
                                <td>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="custName"
                                               id="custName" value="${detailList.custName}" readonly> <input
                                            type="hidden" name="custNo" id="custNo" value="${detailList.linkCustNo}" /> <span class="input-group-btn">
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
                                                        <h4 class="modal-title">거래처검색</h4>
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
                                </td>
                                 <th class="text-center">문서번호(자동 생성)</th>
                                <td>
                                    <input type="text" class="form-control" id="estId" value="VTEK_2022${detailList.docNo}" readonly>
                                </td>
                                <th class="text-center requiredTextCss">문서제목(*)</th>
                                <td>
                                    <input type="text" class="form-control" id="docTitle" value="${detailList.docTitle }">
                                </td>
                            </tr>
                            <tr>
                                <th class="text-center requiredTextCss">문서종류(*)</th>
                                <td>
                                    <div id="docSelect1">
	                                    <select class="form-control" id="docType">
	                                        <option value="">선택</option>
	                                        <option value="BUY">구매요청서</option>
	                                        <option value="TRS">지출품의서</option>
	                                        <option value="ODS">수주서</option>
	                                        <option value="CKD">검토요청서</option>
	                                        <option value="FMF">공문서 확인 요청서</option>
	                                    </select>
                                	</div>
                                	<div id="docSelect2">
	                                    <select class="form-control" id="docType" >
	                                        <option value="">선택</option>
	                                        <option value="COST">비용청구</option>
	                                        <option value="TAX">세금공과금</option>
	                                        <option value="CREDIT">외상매입금</option>
	                                        <option value="PAY">급여</option>
	                                    </select>
                                	</div>
                                	<div id="docSelect3">
	                                    <select class="form-control" id="docType" >
	                                        <option value="">선택</option>
	                                        <option value="PUR">발주서</option>
	                                        <option value="DIP">공문서</option>
	                                    </select>
                                	</div>
                                </td>
                                <th class="text-center requiredTextCss">작성일자(*)</th>
                                <td>
                                    <input type="date" max="9999-12-30" id="docDate" name="docDate" class="form-control" style="text-align: right;" value="${detailList.docDate}">
                                </td>
                                <c:choose>
	                           		<c:when test="${detailListApp.appStatus == 1 || detailListApp.appStatus == 3}">
                                		<th class="text-center">첨부파일</th>
		                                <td>
		                                	<form id="uploadForm">
												<input type="file" name="file" id="addFile" />
											</form>
		                               	</td>
		                                <th class="text-center">파일다운로드</th>
		                                <td>
		                                    <a href="javascript:downloadFile('${detailFile.fileId}', '${detailFile.fileName}');">${detailFile.fileName}</a>
		                                    <input type="hidden" id="filename1" name="filename1" value="${detailFile.fileName}">
		                                </td>
		                        	</c:when>
		                       	 	<c:otherwise>
		                        		<th class="text-center">파일다운로드</th>
		                                <td>
		                                	<a href="javascript:downloadFile('${detailFile.fileId}', '${detailFile.fileName}');">${detailFile.fileName}</a>
		                                	 <input type="hidden" id="filename1" name="filename1" value="${detailFile.fileName}">
		                                </td>
		                                <th class="text-center requiredTextCss">결제자(*)</th>
		                                <td>
											<div class="input-group input-group-sm mb-0">
												<input type="text" class="form-control" name="userName"
													id="userName" readonly> <input type="hidden"
													name="userNo" id="userNo"> <span
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
		                                </td>
		                    		</c:otherwise>
                            	</c:choose>
                            </tr>
	                        <c:if test="${detailListApp.appStatus == 1 || detailListApp.appStatus == 3}">
		                    	<tr>
		                       		<th class="text-center requiredTextCss">결제자(*)</th>
		                        	<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="userName"
												id="userName" readonly> <input type="hidden"
												name="userNo" id="userNo"> <span
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
	                                </td>
		                       		<!-- 빈공간 -->
		                       		<th></th>
		                       		<td></td>
		                       		<th></th>
		                       		<td></td>
		                       		<th></th>
		                       		<td></td>
		                       		<!-- 빈공간 -->
		                        </tr>
	                        </c:if>
                            <tr>
                                <th class="text-center">상세 내용</th>
                                <td colspan="7"><textarea class="form-control" id="docDesc">${detailList.docDesc}</textarea></td>
                            </tr>
                            </tbody>
                        </table>
                        <c:if test="${sessionScope.userNo eq detailListApp.userNoCR && detailListApp.appStatus == 3 || detailListApp.appStatus == 1}">
	                        <div id="cardAddBtn" style="float:right; margin-top:20px; margin-bottom:20px;">
	                       		<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=cardAddModal" type="button" data-toggle="modal" data-target="#cardAddModal">
	                                <i class="icofont icofont-search"></i>카드내역추가
	                            </button>
	                            <c:if test="${sessionScope.docRole eq 'A'}">
	                       		<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=bacVatB_spending_resolution" type="button" data-toggle="modal" data-target="#list_Purchase">
                           			<i class="icofont icofont-search"></i>매입계산서추가
                           		</button>
                           		</c:if>
	                       	</div>
                       	</c:if>
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <jsp:include page="/WEB-INF/views/module/inputSet/inputSetDoc.jsp"/>
                            <jsp:include page="/WEB-INF/views/gware/docdtaillist.jsp"/>
                        </div>
                        <c:if test="${detailList.docStatus ne 1 }">
	                        <c:if test="${sessionScope.docRole eq 'S' || sessionScope.docRole eq 'A' || sessionScope.userNo eq detailListApp.userNoCR}">
	                        	<c:set var="now" value="<%=new java.util.Date()%>" />
	                        	<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set>
	                        	<input type="hidden" id="appDate" value="${sysDate}" />
		                        <div>
		                        	<table class="table table-sm">
			                        	<tr>
											<th scope="row">완료/반려 의견(${detailListApp.userName})<br />
												<c:choose>
													<c:when test="${detailListApp.appDate != null && detailListApp.appDate != ''}">
														(시간 : ${detailListApp.appDate})
													</c:when>
													<c:otherwise>
														(시간 : 없음)
													</c:otherwise>
												</c:choose>
											</th>
											<td colspan="3"><textarea name="appComment" id="appComment" rows="8" class="form-control">${detailListApp.appComment}</textarea></td>
										</tr>
		                        	</table>
		                        </div>
	                        </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade " id="cardAddModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title">카드 내역</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success waves-effect" data-dismiss="modal" onclick="cardDataSave();">선택추가</button>
                </div>
            </div>
        </div>
    </div>
     <div class="modal fade " id="list_Purchase" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-80size" role="document">
            <div class="modal-content modal-80size">
                <div class="modal-header">
                    <h4 class="modal-title">매입 계산서 목록</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success waves-effect" data-dismiss="modal" onclick="cardDataSave_purchase();">선택추가</button>
                </div>
            </div>
        </div>
    </div>
    <div class="btn_wr text-right mt-3">
        <button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/gw/mylist.do'">결재목록</button>
        <c:if test="${sessionScope.docRole eq 'S' && detailListApp.appStatus == 4}">
	        <button class="btn btn-md btn-success" onClick="fn_data02App()">승인완료</button>
	        <button class="btn btn-md btn-danger" onClick="fn_data02Com()">반려</button>
        </c:if>
        <c:if test="${sessionScope.docRole eq 'A' && detailListApp.appStatus == 2 || sessionScope.userNo eq detailListApp.userNoCR && detailListApp.appStatus == 4}">
        	 <button class="btn btn-md btn-danger" onClick="fn_data02Com()">반려</button>
        </c:if>
        <c:if test="${sessionScope.docRole eq 'A' && detailListApp.appStatus == 2}">
	        <button class="btn btn-md btn-success" onClick="fn_data02App()">승인요청</button>
        </c:if>
        <c:if test="${sessionScope.userNo eq detailListApp.userNoCR && detailListApp.appStatus == 1}">
            <!-- <button class="btn btn-md btn-primary" onClick="fn_tempUpdate()">임시저장</button> -->
            <button class="btn btn-md btn-primary" onClick="fn_data02Insert1()">결재등록</button>
	        <button class="btn btn-md btn-success" onClick="fn_data02Update()">수정</button>
        	<button class="btn btn-md btn-danger" onClick="fn_data02delete()">삭제</button>
        </c:if>
        <c:if test="${sessionScope.userNo eq detailListApp.userNoCR && detailListApp.appStatus == 3}">
        	<button class="btn btn-md btn-primary" onClick="fn_data02Update()">수정</button>
        	<button class="btn btn-md btn-danger" onClick="fn_data02delete()">삭제</button>
        </c:if>
        <c:if test="${sessionScope.userNo eq detailListApp.userNoCR && detailListApp.appStatus == 2}">
        	<button class="btn btn-md btn-danger" onClick="fn_data02Com()">검토취소</button>
        	<input type="hidden" value="${detailListApp.appStatus}" id="user_cancel">
        </c:if>
        <button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/gw/mylist.do'">취소</button>
    </div><!-- list.do -->
    <!--//계약등록-->

    <script>
        $('#custModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });

        $(".radioLabel").hide();

        $("[name='contractType']").change(function(){
            if($(this).val() === "NFORM"){
                $(".contDetailSopp").hide();
                $(".radioLabel").show();
            }else{
                $(".radioLabel").hide();
                $(".contDetailSopp").show();
            }
        });

        $('#soppModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });

        $('#contModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });

        $('#cardAddModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        
        $('#list_Purchase').on('show.bs.modal', function(e) {
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

        function fnSetproductdata(a,b){
            $("#productNo1").val(a);
            $("#data01Title").val(b);
            //$(".modal-backdrop").remove();
            //$("#productdataModal").modal("hide");
            // 모달이 정상적으로 제거되지않아 close 버튼 트리거로 구성함
            $("#productdataModal1").find(".modal-footer button").trigger('click');
        }

        function fnSetSoppData(a, b) {
            $("#soppNo").val(b);
            $("#soppTitle").val(a);
            $("#soppModal").modal("hide");
        }

        function fnSetproductdata2(a,b){
            $("#productNo2").val(a);
            $("#data02Title").val(b);
            $("#productdataModal2").find(".modal-footer button").trigger('click');
        }

        function popupPdf(e){
            var nWidth = "800";
            var nHeight = "1000";

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

        $(document).ready(function() {
        	var contractType = "${detailList.docFormNo}";
        	var docType = "${detailList.docType}";
        	
        	$("[name='contractType'][value='"+contractType+"']").attr("checked", true);

        	setTimeout(() => {
    	    	if($("[name='contractType']:checked").val() === 'BREQ'){
    	    		$("#docSelect1").show();
    	    		$("#docSelect1").find("#docType").val(docType);
    	    		$("#docSelect2").hide();
    	    		$("#docSelect3").hide();
    	    		$("#cardAddBtn").hide();
    	    	}else if($("[name='contractType']:checked").val() === 'TREQ'){
    	    		$("#docSelect1").hide();
    	    		$("#docSelect2").show();
    	    		$("#docSelect2").find("#docType").val(docType);
    	    		$("#docSelect3").hide();
    	    		$("#cardAddBtn").show();
    	    	}else{
    	    		$("#docSelect1").hide();
    	    		$("#docSelect2").hide();
    	    		$("#docSelect3").show();
    	    		$("#docSelect3").find("#docType").val(docType);
    	    		$("#cardAddBtn").hide();
    	    	}
    		}, 100);
        });
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>

