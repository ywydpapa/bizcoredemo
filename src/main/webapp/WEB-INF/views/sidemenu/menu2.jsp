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
       <li class="pcoded-hasmenu pcoded <c:if test="${path2 eq '/gw/list.do' || path2 eq '/gw/write.do' || path2 eq '/gw/mylist.do' || path2 eq '/gw/mydoclist.do' || fn:startsWith(path2, '/gw/detail')}">pcoded-trigger</c:if>">
           <a href="javascript:void(0)">
               <span class="pcoded-micon"><i class="ti-stamp"></i></span>
               <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">전자결재</span>
               <span class="pcoded-mcaret"></span>
           </a>
           <ul class="pcoded-submenu">
               <li class="pcoded-hasmenu ">
                   <a href="${path}/gw/mylist.do">
                       <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                       <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">나의문서함</span>
                       <span class="pcoded-mcaret"></span>
                   </a>
               </li>
               <c:if test="${sessionScope.docRole == 'S' || sessionScope.docRole == 'A'}">
	               <li class="pcoded-hasmenu ">
	                   <a href="${path}/gw/mydoclist.do">
	                       <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
	                       <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">나의결재함</span>
	                       <span class="pcoded-mcaret"></span>
	                   </a>
	               </li>
               </c:if>
<%--                <li class="pcoded-hasmenu ">
                   <a href="${path}/gw/list.do">
                       <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                       <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">결재조회</span>
                       <span class="pcoded-mcaret"></span>
                   </a>
               </li>
 --%>               <li class="pcoded-hasmenu">
                   <a href="${path}/gw/write.do">
                       <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                       <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">결재 등록/처리</span>
                       <span class="pcoded-mcaret"></span>
                   </a>
               </li>
           </ul>
           </li>
           <%--<li class="pcoded-hasmenu  pcoded">
           <a href="javascript:void(0)">
               <span class="pcoded-micon"><i class="ti-calendar"></i></span>
               <span class="pcoded-mtext"  data-i18n="nav.form-select.main">일정관리</span>
               <span class="pcoded-mcaret"></span>
           </a>
           <ul class="pcoded-submenu">
               <li class="pcoded-hasmenu ">
                   <a href="${path}/sched/list.do">
                       <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                       <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">일정조회</span>
                       <span class="pcoded-mcaret"></span>
                   </a>
               </li>
               <li class="pcoded-hasmenu">
                   <a href="${path}/sched/write.do">
                       <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                       <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">일정등록</span>
                       <span class="pcoded-mcaret"></span>
                   </a>
               </li>
           </ul>
           </li>
           <li class="pcoded-hasmenu  pcoded">
           <a href="javascript:void(0)">
               <span class="pcoded-micon"><i class="ti-crown"></i></span>
               <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">총무업무</span>
               <span class="pcoded-mcaret"></span>
           </a>
                                               <ul class="pcoded-submenu">
               <li class="pcoded-hasmenu ">
                   <a href="${path}/commbiz/list.do">
                       <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                       <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">업무조회</span>
                       <span class="pcoded-mcaret"></span>
                   </a>
               </li>
               <li class="pcoded-hasmenu">
                   <a href="${path}/commbiz/write.do">
                       <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                       <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">업무등록/처리</span>
                       <span class="pcoded-mcaret"></span>
                   </a>
               </li>
           </ul>
           </li>--%>
           <li class="pcoded-hasmenu  pcoded <c:if test="${path2 eq '/gw/attlist.do' || path2 eq '/gw/attwrite.do' || fn:startsWith(path2, '/gw/attdetail')}">pcoded-trigger</c:if>">
           <a href="javascript:void(0)">
               <span class="pcoded-micon"><i class="ti-id-badge"></i></span>
               <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">인사업무</span>
               <span class="pcoded-mcaret"></span>
           </a>
               <ul class="pcoded-submenu">
               <li class="pcoded-hasmenu ">
                   <a href="${path}/gw/attlist.do">
                       <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                       <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">근태신청조회/관리</span>
                       <span class="pcoded-mcaret"></span>
                   </a>
               </li>
               <li class="pcoded-hasmenu">
                   <a href="${path}/gw/attwrite.do">
                       <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                       <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">근태등록</span>
                       <span class="pcoded-mcaret"></span>
                   </a>
               </li>
           </ul>
        </li>
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
	               
	               </li>
	               
	               <li class="pcoded-hasmenu">
						<a href="${path}/user/list.do">
							<span class="pcoded-micon">
								<i class="ti-direction-alt"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">조직도설정</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
	               
	               <li class="pcoded-hasmenu">
						<a href="${path}/sales/setTarget.do">
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span>
							<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">영업목표 설정</span>
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					
				<!--  	<li class="pcoded-hasmenu">
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
	           -->
	               
	               
	               
	               
	               </ul>
	           </li>
	           </ul>
	           
	           <!-- 23 02 09 수정 사항  -->
	           
	           
	           
	           
	           
	          <!--   <li class="pcoded-hasmenu">
	               <a href="javascript:void(0)">
	                   <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                   <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">사용자 설정</span>
	                   <span class="pcoded-mcaret"></span>
	               </a>
	           </li>-->
	       </ul>
   </nav>