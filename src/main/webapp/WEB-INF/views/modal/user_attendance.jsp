<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2022-02-04
  Time: 오후 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
  <table id="user_attendance_Table" class="table table-striped table-bordered nowrap">
    <thead>
    <tr>
      <th>날짜</th>
      <th>종류</th>
      <th>내용</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="row" items="${list}">
      <tr align="center">
        <td>${row.attStart}&nbsp~&nbsp${row.attEnd}</td>
	    <c:choose>
	    	<c:when test="${row.attType eq 1}">
        		<td>월차</td>
        	</c:when>
        	<c:when test="${row.attType eq 2}">
        		<td>연차</td>
        	</c:when>
        	<c:when test="${row.attType eq 3}">
        		<td>연장 근무</td>
        	</c:when>
        	<c:when test="${row.attType eq 4}">
        		<td>휴일 근무</td>
        	</c:when>
        	<c:when test="${row.attType eq 5}">
        		<td>경조 휴가</td>
        	</c:when>
      	</c:choose>
      	<td>${row.attDesc}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<script>
  $(function(){
    $('#user_attendance_Table').DataTable({
      info:false,
      searching: true
    });
  });
</script>