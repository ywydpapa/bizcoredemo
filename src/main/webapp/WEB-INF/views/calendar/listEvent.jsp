<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
 [
 <c:forEach var="row" items="${list}" varStatus="status">
    {
      "title": "${row.title}" ,
      "start": "${row.start}",
      "end": "${row.end}",
      "id": "${row.id}",
      "schedType": "${row.schedType}",
      "color": "${row.color}"
     } <c:if test="${!status.last}">,</c:if>     
</c:forEach>
  ]