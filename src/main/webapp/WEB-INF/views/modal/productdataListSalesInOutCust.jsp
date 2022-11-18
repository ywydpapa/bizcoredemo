<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
    <table id="productdataList_SalesInOutCust_DataTable" class="table table-striped table-bordered nowrap">
        <thead>
        <tr>
            <th>거래처번호</th>
            <th>거래처명</th>
            <th>대표자명</th>
            <th>사업자번호</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="row" items="${list}">
            <tr align="center">
                <td>${row.custNo}</td>
                <td><a href="javascript:fnSetSalesInOutCustData('${row.custName}','${row.custNo}');">${row.custName}</a></td>
                <td>${row.custBossname}</td>
                <td>${row.custVatno}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    $(function(){
        $('#productdataList_SalesInOutCust_DataTable').DataTable({
            info:false,
            searching: true
        });
    });

    function fnSetSalesInOutCustData(a, b) {
        $("#productSalesInOutCustNo").val(b);
        $("#productSalesInOutCustName").val(a);
        $(".modal-backdrop").remove();
        $("#productCustModal2").modal("hide");
    }
</script>
