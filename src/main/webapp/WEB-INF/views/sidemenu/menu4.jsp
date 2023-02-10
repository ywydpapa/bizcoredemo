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
                                <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/mis/sumSvatlist.do' || path2 eq '/mis/sumBvatlist.do' || path2 eq '/mis/iolist.do'}">pcoded-trigger</c:if>">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="icon-calculator"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">매입매출현황</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/mis/iolist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">매입매출현황</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/mis/sumBvatlist.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">미지급 현황</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/mis/sumSvatlist.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">미수금 현황</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                 </li>
                                 <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/mis/bacinoutlist.do'}">pcoded-trigger</c:if>">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="fa fa-krw"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.form-select.main">자금현황</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/mis/bacinoutlist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">입출금조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/mis/bacstatuslist.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">일자별 자금일보</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    </li>
                                    <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/mis/soppstatuslist.do' || path2 eq '/mis/soppcostlist.do' || path2 eq '/mis/soppmarginlist.do'}">pcoded-trigger</c:if>">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="icon-folder-alt"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">프로젝트 현황</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                                                        <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/mis/soppstatuslist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">프로젝트 진행조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/mis/soppcostlist.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">프로젝트별 수익분석</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/mis/soppmarginlist.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">계약별 수익분석</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    </li>
                                    <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/mis/hrdutylist.do' || path2 eq '/mis/hrcostlist.do'}">pcoded-trigger</c:if>">
	                                    <a href="javascript:void(0)">
	                                        <span class="pcoded-micon"><i class="icon-people"></i></span>
	                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">인사관리 현황</span>
	                                        <span class="pcoded-mcaret"></span>
	                                    </a>
	                                    <ul class="pcoded-submenu">
	                                        <li class="pcoded-hasmenu ">
	                                            <a href="${path}/mis/hrdutylist.do">
	                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
	                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">근태현황 조회</span>
	                                                <span class="pcoded-mcaret"></span>
	                                            </a>
	                                        </li>
	                                        <li class="pcoded-hasmenu">
	                                            <a href="${path}/mis/hrcostlist.do">
	                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">개인별 원가분석</span>
	                                                <span class="pcoded-mcaret"></span>
	                                            </a>
	                                        </li>
	                                    </ul>
                                	 </li>
                                	 <!-- 영업 분석 -->
                                	<c:if test="${sessionScope.compNo == 100002}">
                                	  <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/salesTarget/sales_analysis.do'}">pcoded-trigger</c:if>">
	                                    <a href="javascript:void(0)">
	                                        <span class="pcoded-micon"><i class="icon-folder-alt"></i></span>
	                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">영업 분석</span>
	                                        <span class="pcoded-mcaret"></span>
	                                    </a>
										<ul class="pcoded-submenu">
	                                        <li class="pcoded-hasmenu" style="display: none;">
	                                            <a href="${path}/salesTarget/goal_analysis.do">
	                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
	                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">목표 분석</span>
	                                                <span class="pcoded-mcaret"></span>
	                                            </a>
	                                        </li>
	                                        <li class="pcoded-hasmenu">
	                                            <a href="${path}/salesTarget/sales_analysis.do">
	                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">매출 분석</span>
	                                                <span class="pcoded-mcaret"></span>
	                                            </a>
	                                        </li>
	                                    </ul>
                                    </li>  
                                    </c:if>
                                	 <!-- 영업 분석 -->
                                	 
                                	 
                            </ul>
                         
                         <div class="pcoded-navigatio-lavel" data-i18n="nav.category.other">설정</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu ">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-settings"></i><b>M</b></span>
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
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/product/list.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">상품설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                            </ul>
                                        </li>
                                    </ul>
                                    
</nav>                                                        