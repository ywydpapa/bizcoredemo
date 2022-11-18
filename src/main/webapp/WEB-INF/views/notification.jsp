<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<li class="header-notification" id="headerAllim" style="margin-top: 4%;">
	<i class="ti-email" style="font-size: 25px;"></i>
	<span class="badge bg-c-pink" style="position:absolute; top:0; right:0;"></span>
	<ul class="show-notification list-group" id="headerAllimUl" style="list-style:none; max-height:200px; overflow-x: auto; overflow-y: scroll;"></ul>
</li>
