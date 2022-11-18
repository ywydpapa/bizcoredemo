<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html> 
<html>
<head>
<title>BizCore</title>
<meta name="format-detection" 		content="telephone=no" />
<meta http-equiv="X-UA-Compatible" 	content="IE=edge" />
<meta http-equiv="Content-Type" 	content="text/html; charset=utf-8"/>
<meta http-equiv="Cache-Control" 	content="no-cache; no-store; no-save">

<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="djkim in SWCORE">
<!-- Favicon icon -->
<link rel="icon" href="${path}/assets/images/favicon.ico" type="image/x-icon">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css" href="${path}/assets/icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css" href="${path}/assets/icon/icofont/css/icofont.css">
<!-- simple-line-icons-->
<link rel="stylesheet" type="text/css" href="${path}/assets/icon/simple-line-icons/css/simple-line-icons.css">
<!-- font-awesome-->
<link rel="stylesheet" type="text/css" href="${path}/assets/icon/font-awesome/css/font-awesome.min.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="${path}/assets/css/bootstrap/css/bootstrap.min.css">
<!-- CSS only -->
<link rel="stylesheet" type="text/css" href="${path}/assets/css/jquery.mCustomScrollbar.css">
<link type="text/css" href='${path}/assets/jstree/css/style.css' rel='stylesheet' />
<link rel="stylesheet" type="text/css" href="${path}/assets/css/style.css">
<link rel="stylesheet" type="text/css" href="${path}/assets/css/_pcmenu.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- data tables css -->
<link rel="stylesheet" href="${path}/assets/css/plugins/dataTables.bootstrap4.min.css">
<!-- -->
<style>
  .requiredTextCss{
	  color: red !important;
  }
  @media only screen and (min-width: 993px) and (max-width: 1672px) {
	  body{
		  overflow-x: scroll;
	  }
  }
</style>

    
<!-- CUSTOM CSS -->
<link rel="stylesheet" type="text/css" href="${path}/assets/css/style2.css"><!-- style2.css를 제일 마지막에 놓아주세요. -->

<!-- Required Jquery -->
<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${path}/js/popper.min.js"></script>
<script type="text/javascript" src="${path}/js/bootstrap.min.js"></script>

<!-- jquery slimscroll js -->
<script type="text/javascript" src="${path}/js/jquery.slimscroll.js"></script>

<!-- modernizr js -->
<script type="text/javascript" src="${path}/js/modernizr.js"></script>
<script type="text/javascript" src="${path}/js/css-scrollbars.js"></script>

<!-- data-table js -->
<script src="${path}/js/jquery.dataTables.min.js"></script>
<script src="${path}/js/dataTables.buttons.min.js"></script>
<script src="${path}/assets/pages/data-table/js/jszip.min.js"></script>
<script src="${path}/assets/pages/data-table/js/pdfmake.min.js"></script>
<script src="${path}/assets/pages/data-table/js/vfs_fonts.js"></script>
<script src="${path}/js/buttons.print.min.js"></script>
<script src="${path}/js/buttons.html5.min.js"></script>
<script src="${path}/js/dataTables.bootstrap4.min.js"></script>
<script src="${path}/js/dataTables.responsive.min.js"></script>
<script src="${path}/js/responsive.bootstrap4.min.js"></script>

<!-- i18next.min.js -->
<script type="text/javascript" src="${path}/js/i18next.min.js"></script>
<script type="text/javascript" src="${path}/js/i18nextXHRBackend.min.js"></script>
<script type="text/javascript" src="${path}/js/i18nextBrowserLanguageDetector.min.js"></script>
<script type="text/javascript" src="${path}/js/jquery-i18next.min.js"></script>
<!-- ChartJS css -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script> -->
<!--EChart css -->
<script type="text/javascript" src="${path}/assets/echart/echarts-all.js"></script>
<!-- Custom js -->
<script src="${path}/assets/pages/data-table/js/data-table-custom.js"></script>
<script src="${path}/assets/js/pcoded.min.js"></script>
<script src="${path}/assets/js/demo-12.js"></script>
<script src="${path}/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/script.js"></script>

<script>
	$(function(){
		$("#topMenu a").click(function(evt){
			var url = this.href;
			evt.preventDefault();
			$("#topMenu a").removeClass('on'); // Remove class on all menu items
			$(this).addClass('on');     	// Add class to current menu item
			fnSetSideMenu(url);
		});
 		});
	function fnSetSideMenu(url, data){
		<!-- $.LoadingOverlay("show", true); -->
		$("#sideMenu").empty();
		$("#sideMenu").load(url, data, function(){
		setTimeout(function(){
			    <!--$.LoadingOverlay("hide", true);-->
			}, 50);
		});
	}
	function fnSetPage(url, data){
		<!-- $.LoadingOverlay("show", true); -->
			$("#main_content").empty();
			$("#main_content").load(url, data, function(){
				setTimeout(function(){
					<!--$.LoadingOverlay("hide", true);-->
				}, 500);
		});
	}
	
	function fnClearall(){
		var parrentElement = $(this).closest("#searchForm");
		var elements = $("#searchForm").find("input");
		for(var i = 0; i < elements.length; i++) {
			elements[i].value = null;
		}
	}
	
	function fnSetList(url, data){
		<!-- $.LoadingOverlay("show", true); -->
			$("#list-container").empty();
			$("#list-container").load(url, data, function(){
				setTimeout(function(){
					<!--$.LoadingOverlay("hide", true);-->
				}, 500);
		});
	}
	
	// function inputDate(fromDate, toDate){
	// 	if(fromDate != null && fromDate != '' && toDate != null && toDate != ''){
	// 		if(fromDate > toDate) {
	// 			alert('시작날짜는 종료날짜보다 초과할수 없습니다.');
    // 			$("#"+event.target.id).val(null);
	// 		}
	// 	}
	// }
	
	/* function fnChangeInfo() {
		var userId = $("#userInfoForm").find("input[name=userId]").val();
		var currentPassword = $("#userPasswd").val();
		var changePassword = $("#userChangePasswd").val();
		var checkedChangePassword = $("#checkedUserChangePasswd").val();
		
		if(fnIsNullOrEmpty(currentPassword) || fnIsNullOrEmpty(changePassword) || fnIsNullOrEmpty(checkedChangePassword)) {
			alert("정보를 올바르게 입력하여 주십시오.");
			return;
		}
		if(changePassword != checkedChangePassword) {
			alert("변경할 비밀번호를 다시 확인하여 주십시오.");
			return;
		}
		
		var userData = {};
		userData.userId = userId;
		userData.userPasswd = currentPassword;
		userData.userChangePasswd = changePassword;
		
		$.ajax({
			url : "${path}/user/update.do",
			data : userData,
			method : "POST",
			dataType : "json"
		}).done(function(data){
			if(data.code == 10001){
				alert("개인정보가 수정되었습니다.")
			}else{
				alert("유저 정보를 찾을 수 없습니다.");
			}
		}).fail(function(xhr, status, errorThrown) { 
			alert("통신 실패");
		});
		
	} */
	
	function fnIsNullOrEmpty(value) {
		if(value == null || value == undefined || value == '') {
			return true;
		}else {
			return false;
		}
	}
	
	function setTimeComboBox(idArray) {
		if(fnIsNullOrEmpty(idArray) || idArray.length == 0) {
			return;
		}
		
		for(var i = 0; i < 24; i++){
			var hour = i;
			if(String(i).length == 1) {
				hour = "0"+ i;
			}
			
			for(var j = 0; j < idArray.length; j++) {
				$(idArray[j]).append('<option value=' + hour + ":" + "00" + '>' + hour + ":" + "00" + '</option>');
				$(idArray[j]).append('<option value=' + hour + ":" + "30" + '>' + hour + ":" + "30" + '</option>');
			}
		}
	}
	
	function setDateHourMinute(date, hourMinute) {
		if(!fnIsNullOrEmpty(date)) {
			return date + "T" + hourMinute;	
		}else {
			return null;
		}
	}

</script>
	<style>
		.navbar-logo > .mobile-menu {
			width: 35px;
		}
		@media only screen and (max-width: 992px) {
			.header-navbar .navbar-wrapper .navbar-logo a img {
				margin-top: 0px;
			}
		}
	</style>
</head>
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
					<a href="${path}/">
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
									<c:if test="${sessionScope.userRole === 'ADMIN'}">
										<li><a class="menuLink" href="${path}/sidemenu/menu3.do">회계관리</a></li>
									</c:if>
									<li><a class="menuLink" href="${path}/sidemenu/menu4.do">경영정보</a></li>
								</ul>
							</div>
						</li>
					</ul>
					<ul class="nav-right">
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
								<div class="modal fade" id="userInfoChangeModal" tabindex="-1" role="dialog">
									<div class="modal-dialog modal-80size" role="document">
										<div class="modal-content modal-80size">
											<div class="modal-header">
												<h4 class="modal-title">개인정보수정2</h4>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form id="userInfoForm">
													<div class="form-group">
												    	<label>아이디</label>
												    	<input type="text" class="form-control" name="userId" value="${sessionScope.userId}" readonly>
													</div>
												 	<div class="form-group">
												    	<label>이름</label>
												    	<input type="text" class="form-control" name="userName" value="${sessionScope.userName}" readonly>
												  	</div>
												  	<div class="form-group">
												    	<label for="userPasswd">현재 비밀번호</label>
												    	<input type="password" class="form-control" id="userPasswd">
													</div>
												 	<div class="form-group">
												    	<label for="userChangePasswd">변경할 비밀번호</label>
												    	<input type="password" class="form-control" id="userChangePasswd" >
												  	</div>
												  	<div class="form-group">
												    	<label for="checkedUserChangePasswd">비밀번호 확인</label>
												    	<input type="password" class="form-control" id="checkedUserChangePasswd">
												  	</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default waves-effect" onclick="javascript:fnChangeInfo()">Change</button>
												<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- main_contents Start -->
								<div id="main_content"></div>
							<!-- main_contents end -->
							</div>
							<!-- Page-body end -->
						</div>
						<!--page-wrapper end-->
					</div>
					<!--Main-body  end-->
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$("#userInfoChangeModal").on('show.bs.modal', function(e){
		$("#userInfoForm")[0].reset();
	});
</script>

<!-- Custom js -->
<script src='${path}/assets/jstree/js/jstree.js'></script>
<script type="text/javascript" src="${path}/assets/pages/treeview/jquery.tree.js"></script>
<script src="${path}/assets/pages/data-table/js/data-table-custom.js"></script>
<script src="${path}/assets/js/pcoded.min.js"></script>
<script src="${path}/assets/js/demo-12.js"></script>

<script src="${path}/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/script.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	var url ='${path}/myboard.do';
	location.herf = url;
});
</script>
</body>
</html>