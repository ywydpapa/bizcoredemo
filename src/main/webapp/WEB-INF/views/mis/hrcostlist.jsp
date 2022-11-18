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
<div id="main_content">
    <h6 style="font-weight:600;">개인별 원가 현황</h6>
    <hr>
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="estTable" class="table table-striped table-bordered nowrap ">
                            <colgroup>
                                <col width="25%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">이름</th>
                                <th class="text-center">영업기회</th>
                                <th class="text-center">계약</th>
                                <th class="text-center">매출</th>
                                <th class="text-center">원가</th>
                                <th class="text-center">이익율</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="row" items="${costList}">
                                <tr>
                                    <td class="text-center">${row.userName}</td>
                                    <td class="text-right">0 건</td>
                                    <td class="text-right">0 건</td>
                                    <td class="text-right">0</td>
                                    <td class="text-right">0</td>
                                    <td class="text-right">0.00 %</td>
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