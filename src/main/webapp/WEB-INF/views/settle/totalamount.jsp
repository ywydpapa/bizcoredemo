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
<jsp:include page="../body-top3.jsp"/>

<div id="main_content">
	
    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">합계금액 상세 목록 </h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </c:if>

    <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="vatTable" class="table table-striped table-bordered nowrap ">
                            <colgroup>
                                <col width="10%"/>
                                <col width="5%"/>
                                <col width="7%"/>
                                <col width="7%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
                            <tr>
                            	<th class="text-center">번호</th>
                                <th class="text-center">등록자</th>
                                <th class="text-center">항목</th>
                                <th class="text-center">수량</th>
                                <th class="text-center">부가세액</th>
                                <th class="text-center">공급가액</th>
                                <th class="text-center">금액</th>
                                <th class="text-center">거래일자</th>
                                <th class="text-center">비고</th>
                                <th class="text-center">발행번호</th>
                            </tr>
                            </thead>
                            <c:forEach items="${connect_list}" var="vlist" varStatus="c">
                                <tr style="text-align:center;">
                                	<td>${c.count}</td>
                               		<td>${vlist.userName}</td>
                               		<td>${vlist.dataTitle}</td>
                               		<td>${vlist.dataQuanty}</td>
                               		<td>₩<fmt:formatNumber value="${vlist.dataVat}" pattern="#,###" /></td>
                               		<td>₩<fmt:formatNumber value="${vlist.dataAmt}" pattern="#,###" /></td>
                               		<td>₩<fmt:formatNumber value="${vlist.dataTotal}" pattern="#,###" /></td>
                               		<td>${vlist.vatDate}</td>
                               		<td>${vlist.dataRemark}</td>
                               		<td>${vlist.vatSerial}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<jsp:include page="../body-bottom.jsp"/>