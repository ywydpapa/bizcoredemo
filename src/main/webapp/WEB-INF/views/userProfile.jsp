<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%
	String userId = "";
	if ((String) session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}

	String userName = "";
	if ((String) session.getAttribute("userName") != null) {
		userName = (String) session.getAttribute("userName");
	}

	String userRole = "";
	if ((String) session.getAttribute("userRole") != null) {
		userRole = (String) session.getAttribute("userRole");
	}

	String compNo = "";
	if ((String) session.getAttribute("compNo") != null) {
		compNo = (String) session.getAttribute("compNo");
	}
%>

<% if (userId == null) {
%>
<li class="user-profile header-notification">
	<a href="#!">
		<img src="${path}/assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
		<span>로그인 해주세요. </span>
		<i class="ti-angle-down"></i>
	</a>
	<ul class="show-notification profile-notification">
		<li>
			<a href="${path}/user/login.do">
				<i class="ti-email"></i> 로그인
			</a>
		</li>
	</ul>
</li>
<%}else{%>
<li class="user-profile header-notification">
	<a href="#!">
		<img src="${path}/assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
		<span><%=userName %></span>
		<i class="ti-angle-down"></i>
	</a>
	<ul class="show-notification profile-notification">
		<li>
			<i class="ti-user"></i>
			<a href="#userInfoChangeModal" data-toggle="modal">개인정보수정</a>
		</li>
		<li>
			<a href="${path}/user/logout.do">
				<i class="ti-layout-sidebar-left"></i> Logout
			</a>
		</li>
	</ul>
</li>
<%}%>