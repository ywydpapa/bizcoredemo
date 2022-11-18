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
                        근태등록
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Page-header end 페이지 타이틀 -->

    <!--계약등록-->
    <div class="cnt_wr">
        <h5 class="cont_title"><i class="icofont icofont-square-right"></i>근태정보</h5>
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <input type="hidden" id="compNo" value="${sessionScope.compNo}" />
                        <input type="hidden" id="userNo" value="${sessionScope.userNo}" />
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <jsp:include page="/WEB-INF/views/module/inputSet/inputSetHR.jsp"/>
                            <jsp:include page="/WEB-INF/views/hr/attdetaillist.jsp"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="btn_wr text-right mt-3">
        <button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/gw/attlist.do'">근태목록</button>
        <button class="btn btn-md btn-primary" onClick="fn_AttInsert()">근태등록</button>
        <button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/gw/attlist.do'">취소</button>
    </div>
    <!--//계약등록-->

    <script>
        $(document).ready(function() {
        });
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>

