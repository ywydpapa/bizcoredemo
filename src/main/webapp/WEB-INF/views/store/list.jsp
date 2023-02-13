<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top5.jsp"/>
<style>

.storeList:hover {
font-weight : 600;
cursor:pointer;
}

</style>
<div id="main_content">
    <script>
        $(function(){
            $('#productTable').DataTable({
                info:false,
                searching: true
            });
        });

        $(function(){
            $("#btnAdd").click(function(){
                location.href="${path}/store/writeStore.do "
            });
        });
    </script>
    <%
        String userRole = "";
        if ((String) session.getAttribute("userRole") != null) {
            userRole = (String) session.getAttribute("userRole");
        }
    %>
    <!-- Page-header start 페이지 타이틀-->
    <div class="page-header2">
        <div class="row align-items-end">
            <div class="col-lg-12">
                <div class="page-header-title">
                    <div class="d-inline">
                        재고관리
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Page-header end 페이지 타이틀 -->

    <!--재고 리스트  table-->
    <div class="cnt_wr">
        <div class="row">
            <div class="col-sm-12">
                <div class="btn_wr text-right">
                    <button class="btn btn-sm btn-primary f-right" type="button" id="btnAdd"><i class="icofont icofont-plus"></i>재고등록</button>
                </div>
                <div class="card-block table-border-style">
                    <div class="dt-responsive table-responsive">
                        <table id="productTable" class="table table-striped table-bordered nowrap dataTable">
                            <colgroup>
                                <col width="10%"/>
                                <col width="65%"/>
                                <col width="25%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">상품 번호</th>
                              <!--<th class="text-center">구분</th> --> 
                                <th class="text-center">상품명</th>
                              <!-- <th class="text-center">시리얼번호</th> -->
                              <!-- <th class="text-center">상품위치</th>--> 
                                <th class="text-center">상품수량</th>
                              <!-- <th class="text-center">상품설명</th>--> 
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="row" items="${store}">
                                <tr align="center" onclick="location.href='${path}/store/detail/${row.productNo}'" class="storeList">
                                    <td>${row.productNo}</td>
                                 <!--   <c:choose>
                                    <c:when test="${row.storeType == 'IN'}"><td>입고</td></c:when>
                                    <c:when test="${row.storeType == 'OUT'}"><td>출고</td></c:when>
                                    </c:choose> --> 
                                    <td>${row.productName}</td>
                                    <!-- <td>${row.serialNo}</td> --> 
                                    <!-- <td>${row.locationNo}</td>-->  
                                    <td>${row.storeQty}</td>
                                   <!--  <td>${row.comment}</td>--> 
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

