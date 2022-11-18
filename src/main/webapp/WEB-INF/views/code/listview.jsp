<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>
.h-container:after{ clear: both; display: block; content: '' }
.h-container .item {
	float: left;
	width: 15%;
	height: 100%;
	text-align: center;
	border-right: 1px solid #ddd;
}
.h-container .item.cont {
	float: left;
	width: 85%;
	border-right: none;
	text-align: center;
}
</style>
<div class="h-container">
	<div class="item">
		<label>
	    <input type="radio" name="type" value="radA" checked />장의용품</label><br> 
	    <label> 
	    <input type="radio" name="type" value="radB" />식당상품</label><br>
	    <label> 
	    <input type="radio" name="type" value="radC" />매점용품</label><br>
	    <label> 
	    <input type="radio" name="type" value="radD" />기타물품</label>
	</div>
	<div class="item cont">

	</div>
</div> 