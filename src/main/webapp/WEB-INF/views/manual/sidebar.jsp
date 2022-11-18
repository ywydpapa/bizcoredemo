<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<aside class="sidebar">
        <nav class="nav">
            <ul class="nav-items">
                <li class="nav-title">비즈코어</li>
               <%--  <li><a href="${path}/manual_detail/introduction.do" class="nav-link">소개</a></li>
                <li><a href="${path}/manual_detail/calendar_menual.do" class="nav-link">일정</a></li>
                <li><a href="${path}/manual_detail/sales_menual.do" class="nav-link">영업</a></li>
                <li><a href="${path}/manual_detail/contract_menual.do" class="nav-link">계약</a></li> --%>
                <li><a href="${path}/manual_detail/contract_menual2.do" class="nav-link">계약 - 계산서 연결</a></li>
                <li><a href="${path}/manual_detail/bill_account_sample_menual.do" class="nav-link">계산서&계좌 파일</a></li>
                <li><a href="${path}/manual_detail/maintenance_menual.do" class="nav-link">유지보수 계산서 연결</a></li>
            </ul>
            <div class="sidebar-separator"></div>
        </nav>
    </aside>
    <div class="hamburger">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
    </div>
</body>
<style>
	/* Page */

html {
    box-sizing: border-box;
    overflow: hidden;
}

*, 
*:before, 
*:after {
    box-sizing: inherit;
}

html, body {
	width: 100%;
    height: 100%;
}

body {
    background: #fff;
    font-family: 'Roboto', sans-serif;
    line-height: 1.5em;
    color: #888;
}

.container {
    position: relative;
    overflow-x: hidden;
    height: 100%;
    width: 100%;
}

/* Main */

.main {
    display: table;
    height: 100%;
    position: relative;
    transition-property: transform;
}

.mask {
    display: table-row;
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0, 0, 0, 0.4);
    opacity: 0;
    pointer-events: none;
    transition-property: opacity;
}

header {
    background-color: #3498db;
    background-image: linear-gradient(to bottom, #3498db 0%, #217dbb 100%);
    padding: 100px 50px;
    text-align: center;
}

header h1 {
    color: #fff;
    font-size: 3em;
    line-height: 1;
    text-shadow: 0 1px 5px rgba(0, 0, 0, 0.3);
}

.content {
    margin: 100px 100px;
}

/* Sidebar */

.sidebar {
    position: fixed;
    z-index: 5;
    top: 0;
    left: 0;
    height: 100%;
    width: 260px;
    background: #1d2127;
    border-right: 3px solid #0f1114;
    overflow: hidden;
    transform: translate3d(-260px, 0, 0);
    transition-property: transform;
    will-change: transform, -webkit-transform;
}

.sidebar, .sidebar a {
    color: #abb4be;
}

.nav {
    margin-top: 100px;
}

.nav-items {
    margin: 0;
    padding: 0;
    list-style: none;
}

.nav-title {
    display: block;
    padding: 10px 50px;
    text-transform: uppercase;
    font-weight: 600;
    color: #465162;
}

.nav-link {
    display: block;
    padding: 10px 50px;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.nav-link:hover {
    background-color: #282d36;
}

.sidebar-separator {
    margin: 30px;
    height: 2px;
    background-color: #000;
    border-bottom: 1px solid #2b313a;
}

/* Hamburger Icon */

.hamburger {
    display: block;
    position: fixed;
    left: 50px;
    top: 20px;
    cursor: pointer;
    z-index: 10;
    border-radius: 5px;
    background-color: #3498db;
    border: 2px solid #ddd;
    padding: 10px 7px;
    width: 50px;
    height: 46px;
    transition-property: background-color, border-color;
}

.bar {
    display: block;
    position: relative;
    background-color: #ddd;
    width: 100%;
    height: 4px;
    border-radius: 2px;
    margin: 0 auto;
    transition-property: transform, opacity, background-color, width;
}

.bar:first-child {
    top: 0;
}

.bar:nth-child(2) { 
    opacity: 1;
}

.bar:last-child {
    bottom: 0;
}

.hamburger:hover {
    border-color: #fff;
}

.hamburger:hover .bar {
    background-color: #fff;
}

.bar + .bar {
    margin-top: 5px;
}

/* Animation */

.main, .sidebar, .mask, .hamburger, .bar {
    transition-duration: 0.3s;
    transition-timing-function: cubic-bezier(.694, .0482, .335, 1);
}

/* Show Sidebar */

.show-sidebar .main {
    transform: translate3d(252px, 0, 0);
}

.show-sidebar .sidebar {
    transform: translate3d(0, 0, 0);
}

.show-sidebar .mask {
    opacity: 1;
    pointer-events: auto;
}

.show-sidebar .hamburger {
    background-color: #282d36;
    border-color: #0f1114;
}

.show-sidebar .bar {
    background-color: #abb4be;
}

.show-sidebar .bar:first-child {
    width: 120%;
    transform: rotate(45deg) translate(5px, 8px);
}

.show-sidebar .bar:nth-child(2) {
    opacity: 0;
}

.show-sidebar .bar:last-child {
    width: 120%;
    transform: rotate(-45deg) translate(4px, -8px);
}
</style>
<script>
var container = document.querySelector('.container');
var main = document.querySelector('.main');

function toggleSidebar(){
    isShowingSidebar() ? hideSidebar() : showSidebar();
}

function showSidebar(){
    container.classList.add('show-sidebar');
}

function hideSidebar(){
    container.classList.remove('show-sidebar');
}

function isShowingSidebar(){
    return container.classList.contains('show-sidebar');
}

document.querySelector('.hamburger').addEventListener('click', toggleSidebar, false);

container.addEventListener('click', function(e){
    if(isShowingSidebar() && main.contains(e.target)){
        e.preventDefault();
        hideSidebar();
    }
}, true);
</script>
</html>