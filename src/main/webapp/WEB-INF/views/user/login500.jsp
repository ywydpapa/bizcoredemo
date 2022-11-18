<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <title>소프트코어 서비스 로그인 </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="#">
    <meta name="keywords" content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="#">
    <!-- Favicon icon -->
     <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font--><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="${path}/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="${path}/assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="${path}/assets/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="${path}/assets/css/style.css">
	<link rel="stylesheet" type="text/css" href="${path}/assets/css/style2.css">
    
<script>
<c:if test="${path2 eq '/user/logout.do'}">
    var url = "${path}/";
    history.pushState(null, null, url);
</c:if>

$(document).ready(function(){
	var resultMsg = "${msg}";
	if(resultMsg == "Fail") {
		alert("로그인 정보를 다시 입력해주세요.");
	}
	
	$("#btnlogin").click(function(){
		var userData = {};
		
		var compId=$("#compId").val();
		var userId=$("#userId").val();
		var userPasswd=$("#userPasswd").val();
		if(userId==""){
			alert("아이디를 입력해 주세요.");
			$("#userId").focus();
			return;
		}
		if(compId==""){
				alert("회사 아이디를 입력해 주세요.");
				$("#compId").focus();
				return;
			}
		if(userPasswd==""){
				alert("암호를 입력해 주세요.");
				$("#userPasswd").focus();
				return;
			}
		
		userData.compId = compId;
		userData.userId = userId;
		userData.userPasswd = userPasswd;
		
		document.form1.action="${pageContext.request.contextPath}/user/login_check.do";
		document.form1.submit();
	});


    var agent = navigator.userAgent.toLowerCase();
    var ieVersion = 0;
    if(agent.indexOf('Trident')>-1 || agent.indexOf('trident')>-1){
        //alert("IE");
        ieVersion = -1;
    }

    if (ieVersion == -1) {
        alert('서비스를 정상적으로 이용하기 위해\n크롬부라우저로 접속해주시기 바랍니다.');
    }
});
</script>


</head>

<body class="fix-menu">
    <!-- Pre-loader start --> 
    <div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
        </div>
    </div>
</div>
    <!-- Pre-loader end -->
    <section class="login p-fixed d-flex text-center bg-primary">
        <!-- Container-fluid starts -->
        <div class="container-fluid">
            <div class="row" align="center">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="signin-card card-block auth-body">
                        <form name="form1" class="md-float-material" method="post">
                            <div class="text-center">
                                <img src="${path}/assets/images/auth/logo_008.png" alt="소프트코어" style="width: 50%; height: 50%;">
                                <!--<img src="${path}/assets/images/auth/logo-dark.png" alt="logo.png">-->
                            </div>
                            <div class="auth-box">
								<!-- 
								<div class="row m-b-20">
									<div class="col-md-3"  >
										<h3 class="text-center txt-primary"></h3>
									</div>
								 </div> -->
								<div class="inwrap">
									<p class="text-inverse b-b-default text-center p-b-10">세션 만료에 의해 재로그인이 필요합니다. 다시 로그인 하십시오.</p>
									<div class="input-group">
										<input type="text" id="compId" name="compId" class="form-control" placeholder="회사 아이디" required>
										<span class="md-line"></span>
									</div>
									<div class="input-group">
										<input type="text" id="userId" autocomplete="off" name="userId" class="form-control" placeholder="사용자 아이디" required>
										<span class="md-line"></span>
									</div>
									<div class="input-group">
										<input type="password" id="userPasswd" autocomplete="off" name="userPasswd" class="form-control" placeholder="암호를 입력해 주십시오." required>
										<span class="md-line"></span>
									</div>
									<div class="row m-t-30">
										<div class="col-md-12">
											<button type="button" id="btnlogin" name="btnlogin" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">LOGIN</button>
										</div>
									</div>
								</div>
                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    <!-- Required Jquery -->
    <script type="text/javascript" src="${path}/assets/js/popper.js/js/popper.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="${path}/assets/js/common-pages.js"></script>
</body>
<script>
    // ID, PW창에 엔터 누르면 로그인처리과정 진입
    $('#userId, #userPasswd').keydown(function(event) {
        if (event.keyCode === 13) {
            $("#btnlogin").trigger("click");
        }
    });
</script>

</html>
