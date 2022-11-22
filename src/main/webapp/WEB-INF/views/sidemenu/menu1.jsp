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
			<a href="${path}/myboard.do">
				<span class="pcoded-micon">
					<i class="ti-home"></i>
					<b>D</b>
				</span>
				<span class="pcoded-mtext" data-i18n="nav.dash.main">나의 업무 홈</span>
				<span class="pcoded-mcaret"></span>
			</a>
		</li>
		<li class="">
			<a href="${path}/notice/list.do">
				<span class="pcoded-micon">
					<i class="ti-briefcase"></i>
					<b>D</b>
				</span>
				<span class="pcoded-mtext" data-i18n="nav.dash.main">공지사항</span>
				<span class="pcoded-mcaret"></span>
			</a>
		</li>
		<c:if test="${fn:indexOf(sessionScope.userKey, 'AA0') == -1}">
			<li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/calendar/calmain.do' || path2 eq '/sched/list.do' || path2 eq '/sched/write.do' || fn:startsWith(path2, '/sched')}">pcoded-trigger</c:if>">
				<a href="javascript:void(0)">
					<span class="pcoded-micon">
						<i class="ti-calendar"></i>
					</span>
					<span class="pcoded-mtext" data-i18n="nav.basic-components.main">일정관리</span>
					<span class="pcoded-mcaret"></span>
				</a>
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu">
						<a href="${path}/calendar/calmain.do">
							<span class="pcoded-micon">
								<i class="ti-direction-alt"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">캘린더</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/sched/list.do">
							<span class="pcoded-micon">
								<i class="ti-direction-alt"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">일정조회</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/sched/write.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">일정등록</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/sched/schedreport.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-24">개인 업무일지 작성</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/sched/listMreport.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-24">업무일지 검토</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
				</ul>
			</li>
		</c:if>
		<c:if test="${fn:indexOf(sessionScope.userKey, 'CC0') == -1}">
			<li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/sales/list.do' || path2 eq '/sales/list.do' || path2 eq '/sales/write.do' || fn:startsWith(path2, '/sales/detail')}">pcoded-trigger</c:if>">
				<a href="javascript:void(0)">
					<span class="pcoded-micon">
						<i class="ti-briefcase"></i>
					</span>
					<span class="pcoded-mtext" data-i18n="nav.form-select.main">영업활동관리</span>
					<span class="pcoded-mcaret"></span>
				</a>
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="${path}/sales/list.do">
							<span class="pcoded-micon">
								<i class="ti-direction-alt"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">영업활동조회</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/sales/write.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">영업활동등록</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
				</ul>
			</li>
		</c:if>
		<c:if test="${fn:indexOf(sessionScope.userKey, 'EE0') == -1}">
			<li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/sopp/list.do' ||  path2 eq '/sopp/list.do' || path2 eq '/sopp/write.do' || path2 eq '/gw/estlist.do' || path2 eq '/gw/estwrite.do' || fn:startsWith(path2, '/gw/estdetail') || fn:startsWith(path2, '/sopp/detail')}">pcoded-trigger</c:if>">
				<a href="javascript:void(0)">
					<span class="pcoded-micon">
						<i class="ti-agenda"></i>
					</span>
					<span class="pcoded-mtext" data-i18n="nav.basic-components.main">영업기회</span>
					<span class="pcoded-mcaret"></span>
				</a>
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="${path}/sopp/list.do">
							<span class="pcoded-micon">
								<i class="ti-direction-alt"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">영업기회조회</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/sopp/write.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">영업기회등록</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/gw/estlist.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">견적관리</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/gw/estwrite.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">견적작성</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
				</ul>
			</li>
		</c:if>
		<%-- <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/pps/ppslist.do' || path2 eq '/pps/ppsStatusList.do'|| path2 eq '/pps/mppsStatusList.do' || fn:startsWith(path2, '/pps/ppsdetail') || fn:startsWith(path2, '/pps/statusdetail')}">pcoded-trigger</c:if>">
			<a href="javascript:void(0)">
					<span class="pcoded-micon">
						<i class="ti-package"></i>
					</span>
				<span class="pcoded-mtext" data-i18n="nav.basic-components.main">조달 업무</span>
				<span class="pcoded-mcaret"></span>
			</a>
			<ul class="pcoded-submenu">
				<li class="pcoded-hasmenu">
					<a href="${path}/pps/ppslist.do">
						<span class="pcoded-micon">
							<i class="ti-angle-right"></i>
						</span>
						<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">조달 업무 할당</span>
						<span class="pcoded-mcaret"></span>
					</a>
				</li>
				<li class="pcoded-hasmenu">
					<a href="${path}/pps/ppsStatusList.do">
						<span class="pcoded-micon">
							<i class="ti-angle-right"></i>
						</span>
						<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">조달 진행 상황</span>
						<span class="pcoded-mcaret"></span>
					</a>
				</li>
				<li class="pcoded-hasmenu">
					<a href="${path}/pps/mppsStatusList.do">
						<span class="pcoded-micon">
							<i class="ti-angle-right"></i>
						</span>
						<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">조달 계약 관리</span>
						<span class="pcoded-mcaret"></span>
					</a>
				</li>
			</ul>
		</li> --%>
		<c:if test="${fn:indexOf(sessionScope.userKey, 'GG0') == -1}">
			<li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/sopp/list2.do' || path2 eq '/sopp/list2.do' || fn:startsWith(path2, '/sopp/detail2')}">pcoded-trigger</c:if>">
				<a href="javascript:void(0)">
					<span class="pcoded-micon">
						<i class="ti-package"></i>
					</span>
					<span class="pcoded-mtext" data-i18n="nav.basic-components.main">수주 판매보고</span>
					<span class="pcoded-mcaret"></span>
				</a>
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="${path}/sopp/list2.do">
							<span class="pcoded-micon">
								<i class="ti-direction-alt"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">수주 판매보고 조회</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
				</ul>
			</li>
		</c:if>
		<c:if test="${fn:indexOf(sessionScope.userKey, 'II0') == -1}">
			<li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/cont/list.do' || path2 eq '/cont/list.do' || path2 eq '/cont/write.do' || fn:startsWith(path2, '/cont/detail')}">pcoded-trigger</c:if>">
				<a href="javascript:void(0)">
					<span class="pcoded-micon">
						<i class="ti-pencil-alt"></i>
					</span>
					<span class="pcoded-mtext" data-i18n="nav.basic-components.main">계약관리</span>
					<span class="pcoded-mcaret"></span>
				</a>
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="${path}/cont/list.do">
							<span class="pcoded-micon">
								<i class="ti-direction-alt"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">계약조회</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/cont/write.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">계약등록</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/cust/list.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">업체정보 조회</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/cont/iowrite.do/0">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i></span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">매입/매출 자료등록</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
				</ul>
			</li>
		</c:if>
		<c:if test="${fn:indexOf(sessionScope.userKey, 'KK0') == -1}">
			<li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/techd/list.do' || path2 eq '/techd/list.do' || path2 eq '/techd/write.do' || path2 eq '/techd/contlist.do' || path2 eq '/techd/bbuycontlist.do' || fn:startsWith(path2, '/techd/detail') || fn:startsWith(path2, '/techd/contextdetail')}">pcoded-trigger</c:if>">
				<a href="javascript:void(0)">
					<span class="pcoded-micon">
						<i class="ti-agenda"></i></span>
					<span class="pcoded-mtext" data-i18n="nav.basic-components.main">기술지원업무</span>
					<span class="pcoded-mcaret"></span>
				</a>
				<ul class="pcoded-submenu">
					<li class="pcoded-hasmenu ">
						<a href="${path}/techd/list.do">
							<span class="pcoded-micon">
								<i class="ti-direction-alt"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">기술지원 조회</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/techd/write.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">기술지원 등록</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/techd/contlist.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">유지보수 계약 관리</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/techd/bbuycontlist.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">유지보수 매입 관리</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
				</ul>
			</li>
		</c:if>
		
		<!-- 게시판 관련  -->
		<li class="">
			<a href="${pageContext.request.contextPath}/board__file/board_file">
				<span class="pcoded-micon">
					<i class="ti-folder"></i></span>
				<span class="pcoded-mtext" >자료실</span>
				<span class="pcoded-mcaret"></span>
			</a>
		</li>
		<!-- 게시판 관련 -->
		<c:if test="${sessionScope.userRole eq 'ADMIN' && (sessionScope.docRole eq 'S' || sessionScope.docRole eq 'A')}">
			<li class="">
				<a href="${path}/manual.do" target="_blank">
					<span class="pcoded-micon">
						<i class="ti-book"></i></span>
					<span class="pcoded-mtext" >메뉴얼가이드</span>
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
		</c:if>
	</ul>
	
	<c:if test="${fn:indexOf(sessionScope.userKey, 'MM0') == -1 && sessionScope.userRole eq 'ADMIN'}">
		<div class="pcoded-navigatio-lavel" data-i18n="nav.category.other">설정</div>
		<ul class="pcoded-item pcoded-left-item">
			<li class="pcoded-hasmenu <c:if test="${path2 eq '/cust/list.do' || path2 eq '/product/list.do' || path2 eq '/sales/setTarget.do' || path2 eq '/user/list.do'}">pcoded-trigger</c:if>">
				<a href="javascript:void(0)">
					<span class="pcoded-micon">
						<i class="ti-settings"></i>
						<b>M</b>
					</span>
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
							<span class="pcoded-micon">
								<i class="ti-direction-alt"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">상품설정</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<%--
					<li class="pcoded-hasmenu">
						<a href="javascript:fnSetPage('${path}/code/list.do')">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">기초코드 설정</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					--%>
					<%--
					<li class="pcoded-hasmenu">
						<a href="javascript:fnSetPage('${path}/code/organizChart.do')">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">조직도 설정</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					--%>
					<%--
					<li class="pcoded-hasmenu">
						<a href="javascript:fnSetPage('${path}/board/regboard.do')">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">게시판 설정</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					--%>
					<li class="pcoded-hasmenu">
						<a href="${path}/sales/setTarget.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">영업목표 설정</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					<li class="pcoded-hasmenu">
						<a href="${path}/user/list.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">사용자 목록</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<li class="pcoded-hasmenu">
						<a href="${path}/user/write.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">사용자 등록</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</c:if>
	<ul class="pcoded-item pcoded-left-item">
		<li class="">
			<a href="${path}/user/logout.do">
				<span class="pcoded-micon" style="background-color: #000 !important;">
					<i class="ti-back-left"></i>
					<b>D</b>
				</span>
				<span class="pcoded-mtext" data-i18n="nav.dash.main">로그아웃</span>
				<span class="pcoded-mcaret"></span>
			</a>
		</li>
	</ul>
</nav>
