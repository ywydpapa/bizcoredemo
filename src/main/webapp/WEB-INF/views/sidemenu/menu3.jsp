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
                                <li class="pcoded-hasmenu  pcoded <c:if test="${path2 eq '/cont/sliplist.do' || path2 eq '/cont/slipwrite.do'}">pcoded-trigger</c:if>">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-receipt"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">전표관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/cont/sliplist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">전표조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/cont/slipwrite.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">전표등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    </li>
                                    <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/cont/iolist.do' || path2 eq '/cont/iowrite.do' || path2 eq '/cont/iowrite.do/0' || path2 eq '/acc/sumBvatlist.do' || path2 eq '/acc/sumSvatlist.do' || fn:startsWith(path2, '/cont/iowrite.do') || fn:startsWith(path2, '/cont/iodetail')}">pcoded-trigger</c:if>">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="icon-calculator"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.form-select.main">매입/매출관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/cont/iolist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">매입매출조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/cont/iowrite.do/0/0">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">매입매출등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/acc/sumBvatlist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">미지급 현황</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/acc/sumSvatlist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">미수금 현황</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    </li>
                                    <li class="pcoded-hasmenu  pcoded <c:if test="${path2 eq '/acc/baclist.do' || path2 eq '/acc/bacupload.do' || path2 eq '/acc/bacdetail.do' || path2 eq '/acc/bacupdate.do' || path2 eq '/acc/cardUpload.do' || path2 eq '/acc/cardDetail.do'}">pcoded-trigger</c:if>">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="fa fa-krw"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">자금관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/acc/baclist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">자금현황조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/acc/bacupdate.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">계좌내역등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/acc/bacdetail.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">계좌내역조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/acc/cardUpload.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">카드내역등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/acc/cardDetail.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">카드내역조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    </li>
                                    <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/acc/vatlistB.do' || path2 eq '/acc/vatlistS.do' || path2 eq '/acc/vatupload.do' || path2 eq '/acc/vatlist.do' || path2 eq '/acc/vatlistT.do' || path2 eq '/acc/check_connect.do' || path2 eq '/acc/custVatList.do' || path2 eq '/acc/custVatListS.do' || path2 eq '/acc/custVatListB.do'}">pcoded-trigger</c:if>">
                                    <a href="javascript:void(0)">
                                        <span class="pcoded-micon"><i class="ti-stats-up"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">세금계산서관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                   	<ul class="pcoded-submenu">
                                   		<%--<li class="pcoded-hasmenu ">
                                            <a href="${path}/acc/vatlist.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">업체별 계산서 조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>--%>
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/acc/vatlistB.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">매입 계산서 조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/acc/vatlistS.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">매출 계산서 조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/acc/vatupload.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">계산서 등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/acc/vatlistT.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">계산서 발행</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
	                                        <a href="${path}/acc/check_connect.do">
	                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                                            <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">계산서 연결현황</span>
	                                            <span class="pcoded-mcaret"></span>
	                                        </a>
                                    	</li>
                                    	<li class="pcoded-hasmenu">
	                                        <a href="${path}/acc/custVatListS.do">
	                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                                            <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">거래처별 매출 원장</span>
	                                            <span class="pcoded-mcaret"></span>
	                                        </a>
                                    	</li>
                                    	<li class="pcoded-hasmenu">
	                                        <a href="${path}/acc/custVatListB.do">
	                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                                            <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">거래처별 매입 원장</span>
	                                            <span class="pcoded-mcaret"></span>
	                                        </a>
                                    	</li>
                                    </ul>
                                 </li>
                            </ul>
                         
                         <div class="pcoded-navigatio-lavel" data-i18n="nav.category.other">설정</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu <c:if test="${path2 eq '/cust/list.do' || path2 eq '/acc/regbac.do' || path2 eq '/acc/regCard.do' || path2 eq '/code/write.do'}">pcoded-trigger</c:if>">
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
                                            <a href="${path}/acc/regbac.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">계좌 등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/acc/regCard.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">카드 등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu">
                                            <a href="${path}/code/write.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">코드 설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                      <!--   <li class="pcoded-hasmenu">
                                            <a href="javascript:void(0)">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">사용자 설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>--> 
                                    </ul>
                                </li>
                            </ul>
</nav>