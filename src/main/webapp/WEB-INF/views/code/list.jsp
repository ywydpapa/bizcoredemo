<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<script>
$(function(){
    $('#codeTable').DataTable({
    	info:false
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
					기초코드 조회
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->
	 	 <!--리스트 table-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="btn_wr text-right">
				<c:if test="${userRole == 'ADMIN'}">
					<button class="btn btn-sm btn-primary f-right" onClick="javascript:location='${path}/code/write.do'"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
				</c:if>	
				</div>
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="codeTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="1%"/>
								<col width="5%"/>
								<col width="16%"/>
								<col width="12%"/>
								<col width="12%"/>
								<col width="7%"/>
								<col width="10%"/>
								<col width="10%"/>
								<col width="7%"/>
								<col width="5%"/>
								<col width="10%"/>
							</colgroup>							
							<thead>
								<tr>
									<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<th>코드번호</th>
									<th>Lv1 코드</th>
									<th>Lv1 코드명</th>
									<th>Lv1 코드값</th>
									<th>Lv2 코드</th>
									<th>Lv2 코드명</th>
									<th>Lv2 코드값</th>									
									<th>Lv3 코드</th>
									<th>Lv3 코드명</th>
									<th>Lv3 코드값</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${list}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td><a href="javascript:location.herf='${path}/code/detail/${row.codeNo}'">${row.codeNo}</a></td>
									<td>${row.code01}</td>
									<td>${row.desc01}</td>
									<td>${row.value01}</td>
									<td>${row.code02}</td> 
									<td>${row.desc02}</td>
									<td>${row.value02}</td>
									<td>${row.code03}</td>
									<td>${row.desc03}</td>
									<td>${row.value03}</td>
								</tr>
							</c:forEach>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//리스트 table-->
