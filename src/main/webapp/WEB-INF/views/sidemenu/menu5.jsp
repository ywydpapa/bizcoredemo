<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<script src="${path}/assets/js/pcoded.min.js"></script>
<script src="${path}/js/script.js"></script>
<script src="${path}/assets/js/demo-12.js"></script>
<script>

</script>

<nav>
                    <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="${path}/myboard.do" class="current">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.dash.main">나의 업무 홈</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/store/inOutList.do' ||path2 eq '/store/listStore.do' || path2 eq '/store/writeStore.do' || path2 eq '/code/writeLoc.do'|| path2 eq '/store/detail.do' || path2 eq '/store/writeInout.do'}">pcoded-trigger</c:if>">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="icon-calculator"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">재고 관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/store/listStore.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">재고 현황</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <!--  <li class="pcoded-hasmenu">
                                            <a href="${path}/store/writeStore.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">재고 등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>-->
                                         <li class="pcoded-hasmenu">
                                            <a href="${path}/store/writeInout.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">입출고 등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                         <li class="pcoded-hasmenu">
                                            <a href="${path}/store/inOutList.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-24">입출고 내역</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                         <li class="pcoded-hasmenu">
                                            <a href="${path}/code/writeLoc.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-24">위치 등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                 </li>
                            </ul>
                         
                         <div class="pcoded-navigatio-lavel" data-i18n="nav.category.other">설정</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/cust/list.do' || path2 eq '/product/list.do'}">pcoded-trigger</c:if>  ">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-settings"></i></span>
                                        <span class="pcoded-mtext" data-i18n="nav.menu-levels.main">설정</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/cust/list.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">고객/거래처 설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu" >
                                            <a href="${path}/product/list.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">상품설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                            </ul>
                                        </li>
                                      <!--  <li class="pcoded-hasmenu">
                                            <a href="javascript:void(0)">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">사용자 설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li> -->
                                        <li class="pcoded-hasmenu">
                                         <a href="javascript:fnSetPage('${path}/code/list.do')">
	              						<span class="pcoded-micon">
         								<i class="ti-angle-right"></i>
            							</span>
                                        <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">기초코드 설정</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>

                            </ul>
                                    
</nav>                                                        