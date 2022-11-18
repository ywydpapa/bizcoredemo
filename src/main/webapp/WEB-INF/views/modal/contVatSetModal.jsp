<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div>
	<span>품목명</span>
	<input type="text" id="contVatProduct" class="form-control" /><br>
	<span>규격</span>
	<input type="text" id="contVatStandard" class="form-control" /><br>
	<span>설정갯수</span>
	<input type="text" class="form-control" id="addNum" placeholder="만들 갯수 입력(ex:5)" value="1" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
</div>
