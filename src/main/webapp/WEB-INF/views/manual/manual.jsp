<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BizCore manual</title>
</head>
<body>
	<aside>
		<div style="float:left;">
			<img class="img-fluid" src="${path}/assets/images/auth/logo_008.png" alt="Theme-Logo" style="width: 110px; height: 28px;"/>
		</div>
		<h1>비즈코어 메뉴얼</h1>
  		<h3>welcome to Bizcore</h3>
	</aside>
	<input type="checkbox" id="menu-toggle"/>
  	<label id="trigger" for="menu-toggle"></label>
  	<label id="burger" for="menu-toggle"></label>
  	<ul id="menu">
    	<%-- <li><a href="${path}/manual_detail/introduction.do">소개</a></li>
    	<li><a href="${path}/manual_detail/calendar_menual.do">일정</a></li>
    	<li><a href="${path}/manual_detail/sales_menual.do">영업</a></li>
    	<li><a href="${path}/manual_detail/contract_menual.do">계약</a></li> dd--%>
    	<li><a href="${path}/manual_detail/contract_menual2.do">계약서</a></li>
    	<li><a href="${path}/manual_detail/bill_account_sample_menual.do" class="nav-link">계산서&계좌 파일</a></li>
    	<li><a href="${path}/manual_detail/maintenance_menual.do" class="nav-link">유지보수 계산서</a></li>
  	</ul>
</body>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,700);

@keyframes checked-anim {
    50% {a
        width: 3000px;
        height: 3000px;
    }
    100% {
        width: 100%;
        height: 100%;
        border-radius: 0;
    }
}
@keyframes not-checked-anim {
    0% {
        width: 3000px;
        height: 3000px;
    }
}
li, a {
    margin: 75px 0 -55px 0;
    color: #03A9F4;
    font: 14pt "Roboto", sans-serif;
    font-weight: 700;
    line-height: 1.8;
    text-decoration: none;
    text-transform: none;
    list-style: none;
    outline: 0;
    display: none;
}
li {
    width: 230px;
    text-indent: 56px;}
a:focus {
    display: block;
    color: #333;
    background-color: #eee;
    transition: all .5s;
}
aside {
    position: absolute;
    color: white;
    top: 35%;
    right: 10%;
    text-align: right;
}
h1 {
    line-height: 0;
    font-size: 4vw;
    font-weight: 700;
}
h3 {
    float: right;
    line-height: .3;
    font-size: 2.5vw;
    font-weight: lighter;
}
h4 {
    float: left;
    margin-left: -2%;
    font-size: 1.5vw;
    font-weight: lighter;
}

html, body {
    margin: 0;
    padding: 0;
    background-color: #03A9F4;
    font-family: 'Roboto', sans-serif;
    overflow: hidden;
}

#trigger, #burger, #burger:before, #burger:after {
    position: absolute;
    top: 25px;
    left: 25px;
    background: #03A9F4;
    width: 30px;
    height: 5px;
    transition: .2s ease;
    cursor: pointer;
    z-index: 1;
}
#trigger {
    height: 25px;
    background: none;
}
#burger:before {
    content: " ";
    top: 10px;
    left: 0;
}
#burger:after {
    content: " ";
    top: 20px;
    left: 0;
}
#menu-toggle:checked + #trigger + #burger {
    top: 35px;
    transform: rotate(180deg);
    transition: transform .2s ease;
}

#menu-toggle:checked + #trigger + #burger:before {
    width: 20px;
    top: -2px;
    left: 18px;
    transform: rotate(45deg) translateX(-5px);
    transition: transform .2s ease;
}
#menu-toggle:checked + #trigger + #burger:after {
    width: 20px;
    top: 2px;
    left: 18px;
    transform: rotate(-45deg) translateX(-5px);
    transition: transform .2s ease;
}
#menu {
    position: absolute;
    margin: 0; padding: 0;
    width: 110px;
    height: 110px;
    background-color: #fff;
    border-bottom-right-radius: 100%;
    box-shadow: 0 2px 5px rgba(0,0,0,0.26);
    animation: not-checked-anim .2s both;
    transition: .2s;
}
#menu-toggle:checked + #trigger + #burger + #menu {
    animation: checked-anim 1s ease both;
}
#menu-toggle:checked + #trigger ~ #menu > li, a {
    display: block;
}
[type="checkbox"]:not(:checked), [type="checkbox"]:checked {
    display: none;
}
</style>
<script>
$('#header').prepend('<div id="menu-icon"><span class="first"></span><span class="second"></span><span class="third"></span></div>');

$("#menu-icon").on("click", function(){
$("nav").slideToggle();
$(this).toggleClass("active");
});
</script>
</html>