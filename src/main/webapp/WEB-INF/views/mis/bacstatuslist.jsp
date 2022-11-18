<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2022-04-04
  Time: 오전 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top4.jsp"/>
<div class="page-header2">
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
			<div class="row align-items-end">
				<div class="col-lg-12">
					<div class="page-header-title" style="float:left;">
						<div style="margin-top:15px;">
							<h6 style="font-weight:600;">일자별 자금일보 현황</h6>
						</div>
					</div>
					<div class="btn_wr" style="float:right;">
						<!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold_modal" onclick="acordian_action_modal()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2_modal" onclick="acordian_action1_modal()" style="display:none;">접기</button>
						<!-- hide and show -->
						<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon_modal()"><i class="icofont icofont-search"></i>검색</button>
					</div>
				</div>
			</div>
		</div>
		<div class="cnt_wr" id="acordian_modal" style="display:none;">
			<div class="row">
				<form id="searchForm_modal" method="post" onsubmit="return false;" class="col-sm-12">
				<div class="col-sm-12">
					<div class="card_box sch_it">
						<div class="form-group row">
							<div class="col-sm-12 col-xl-6">
								<label class="col-form-label">기간<b><small style="color: red;">&nbsp&nbsp해당 기간의 데이터가 없다면, 해당 일자 기준 이전의 가장 최근 일자별로 검색됩니다.</small></b></label>
								<p class="input_inline">
									<c:if test="${select_regDate eq null}">
										<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" pattern="yyyy-" id="select_regDate" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />">	
									</c:if>
									<c:if test="${select_regDate ne null}">
										<input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" pattern="yyyy-" id="select_regDate" value="${select_regDate}">
									</c:if>
								</p>
							</div>
						</div>	
					</div>
				</div>
				</form>
			</div>
		</div>
<div id="main_content">
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="estTable" class="table table-striped table-bordered nowrap ">
                            <colgroup>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">계좌번호</th>
                                <th class="text-center">최신 날짜</th>
                                <th class="text-center">잔여 금액</th>
                            </tr>
                            </thead>
                            <tbody>
                            
                            	 <c:forEach var="row" items="${statusList}">
                                <tr>
                                   <td class="text-center">${row.bacNo}</td>
                                   <td class="text-center">${row.baclogTime}</td>
                                   <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.balanceAmt}" /></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../body-bottom.jsp"/>
<script>
    $(function(){
        $('#estTable').DataTable({
            info:false,
            searching: true,
            order: [[ 0, "desc" ]],
        });
    });
    
    $(document).ready(function(){
    	
    });
    
    
  //모달 검색 아코디언
		function acordian_action_modal(){
	if($("#acordian_modal").css("display") == "none"){
	    $("#acordian_modal").show();
	    $("#fold_modal").hide();
	    $("#fold2_modal").show();

	} else {
	    $("#acordian_modal").hide();
	    $("#fold_modal").show();
	}
	}
	function acordian_action1_modal(){
		if($("#acordian_modal").css("display") != "none"){
		    $("#acordian_modal").hide();
		    $("#fold_modal").show();
		    $("#fold2_modal").hide();

		} else {
		    $("#acordian_modal").show();
		    $("#fold_modal").hide();
		}
	}
	//모달 검색 아코디언
	
	//검색 시 페이지네이션
	function fnListcon_modal(){
		var date = $('#select_regDate').val();
		location.href="${path}/mis/bacstatuslist.do/" + date
	}
	//검색 시 페이지네이션
</script>