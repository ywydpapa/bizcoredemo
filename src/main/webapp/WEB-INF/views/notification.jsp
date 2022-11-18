<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<li class="header-notification">
	<a href="#!">
		<i class="ti-bell"></i>
		<span class="badge bg-c-pink"></span>
	</a>
	<ul class="show-notification">
		<li>
			<h6>새알림 있음</h6>
			<label class="label label-danger">New</label>
		</li>
	</ul>
</li>