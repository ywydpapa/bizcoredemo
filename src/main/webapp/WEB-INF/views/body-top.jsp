<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<body style="overflow-y: scroll;">

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

<div id="pcoded" class="pcoded">
	<div class="pcoded-overlay-box"></div>
	<div class="pcoded-container navbar-wrapper">
		<nav class="navbar header-navbar pcoded-header" >
			<div class="navbar-wrapper">
				<div class="navbar-logo">
					<a class="mobile-menu" id="mobile-collapse" href="#!">
						<i class="ti-menu"></i>
					</a>
					<a class="mobile-search morphsearch-search" href="#">
						<i class="ti-search"></i>
					</a>
					<a href="${path}/myboard.do">
						<img class="img-fluid" src="${path}/assets/images/auth/logo_008.png" alt="Theme-Logo" style="width: 110px; height: 28px;"/>
					</a>
					<a class="mobile-options">
						<i class="ti-more"></i>
					</a>
				</div>
				<div class="navbar-container container-fluid">
					<ul class="nav-left">
						<li>
							<div class="sidebar_toggle"><a href="#"><i class="ti-menu"></i></a></div>
						</li>
						<li>
							<a href="#!" onclick="javascript:toggleFullScreen()">
								<i class="ti-fullscreen"></i>
							</a>
						</li>
						<li>
							<div id="topMenu" class="nav_menu">
								<ul>
									<li><a class="menuLink on" href="${path}/sidemenu/menu1.do">업무관리</a></li>
									<li><a class="menuLink" href="${path}/sidemenu/menu2.do">그룹웨어</a></li>
									<c:if test="${sessionScope.userRole eq 'ADMIN'}">
										<li><a class="menuLink" href="${path}/sidemenu/menu3.do">회계관리</a></li>
									</c:if>
									<c:if test="${sessionScope.userRole eq 'ADMIN'}">
										<li><a class="menuLink" href="${path}/sidemenu/menu4.do">경영정보</a></li>
									</c:if>
								</ul>
							</div>
						</li>
					</ul>
					<ul class="nav-right">
						<jsp:include page="notification.jsp"/>
						<jsp:include page="userProfile.jsp"/>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="pcoded-main-container">
		<div class="pcoded-wrapper">
			<nav class="pcoded-navbar">
				<div class="sidebar_toggle">
					<a href="#"><i class="icon-close icons"></i></a>
				</div>
			    <div class="pcoded-inner-navbar main-menu">	
					<!-- 사이드메뉴 시작 -->
					<div id="sideMenu">
						<jsp:include page="/WEB-INF/views/sidemenu/menu1.jsp" />
					</div>
					<!--  사이드 메뉴 종료 -->
			    </div>
			</nav>
			<div class="pcoded-content">
				<div class="pcoded-inner-content">
					<!-- Main-body start -->
					<div class="main-body">
						<!--page-wrapper-->
						<div class="page-wrapper <%--card--%>">
  							<!-- Page-body start -->
							<div class="page-body">
								<jsp:include page="modal/userInfoChangeModal.jsp"/>
								<!-- main_contents Start -->
