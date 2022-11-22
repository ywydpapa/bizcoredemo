<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html> 
<html>
<head>
<meta name="format-detection" 		content="telephone=no" />
<meta http-equiv="X-UA-Compatible" 	content="IE=edge" />
<meta http-equiv="Content-Type" 	content="text/html; charset=utf-8"/>
<meta http-equiv="Cache-Control" 	content="no-cache; no-store; no-save">

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/assets/css/bootstrap/css/bootstrap.min.css">  
<link href='${path}/fullcalendar/main.css' rel='stylesheet' />
<script src='${path}/fullcalendar/main.js'></script>
<script src='${path}/fullcalendar/locales/locales-all.js'></script>

<style>
#topMenu { 	 
	height:30px;  
	width:850px; 	
}

#topMenu ul li { 
	list-style:none;  
	color:white;  
	background-color:#2d2d2d;  
	float:left; 
	line-height:30px; 
	vertical-align:middle; 
	text-align:center; 	
}

#topMenu .menuLink { 
	text-decoration:none;  
	color:white; 
	display:block; 
	width:150px; 
	font-size:12px;
	font-weight:bold; 
	font-family:"Trebuchet MS", Dotum, Arial;	
}

#topMenu .menuLink:hover { 
	color:red; 
	background-color:#4d4d4d;
}
 
#topMenu .selected { 
	color:red; 
	background-color:#4d4d4d;
}

/*사이드메뉴*/
#sideMenu { 	 
	height:700px;  
	width:250px; 	
}

#sideMenu ul li { 
	list-style:none;  
	color:white;  
	background-color:#2d2d2d;  
	float:left; 
	line-height:30px; 
	vertical-align:middle; 
	text-align:center; 	
}
 
#sideMenu .menuLink { 
	text-decoration:none;  
	color:white; 
	display:block; 
	width:150px; 
	font-size:12px;
	font-weight:bold; 
	font-family:"Trebuchet MS", Dotum, Arial;	
}
#sideMenu .menuLink:hover { 
	color:red; 
	background-color:#4d4d4d;
}

#sideMenu .selected { 
	color:green; 
	background-color:#4d4d4d;
}

#main_content {
	border:1pt solid black;
	width:100%;
	min-height:200px;
}

#wrapper{
width:1380px;
padding:10px;
position:absolute;
top:10px;
left:50%;
margin-left:-533px;
overflow:hidden;
}

#main_content{
border:1px;
width: 1000px;
float:left;
padding:10px;
}

#sideMenu{
border:1px;
width: 400px;
float:left;
padding:10px;
margin-left:10px;

}
</style>
 
<script>
	
	$(function(){
		$("#topMenu a").click(function(evt){
			var url = this.href;
			evt.preventDefault();
			
			$("#topMenu a").removeClass('selected'); // Remove class on all menu items
			$(this).addClass('selected');     	// Add class to current menu item
			fnSetSideMenu(url);
		});
		
		$("#sideMenu a").click(function(evt){
			var url = this.href;
			evt.preventDefault();
			
			$("sideMenu a").removeClass('selected'); // Remove class on all menu items
			$(this).addClass('selected');     	// Add class to current menu item
			fnSetPage(url);
		});
	});
	
	function fnSetSideMenu(url, data){
		$.LoadingOverlay("show", true);

		$("#sideMenu").empty();
		$("#sideMenu").load(url, data, function(){
			setTimeout(function(){
			    $.LoadingOverlay("hide", true);
			}, 500);
		});
	}
		
	function fnSetPage(url, data){
			$.LoadingOverlay("show", true);

			$("#main_content").empty();
			$("#main_content").load(url, data, function(){
				setTimeout(function(){
				    $.LoadingOverlay("hide", true);
				}, 500);
		});
	
	}
</script>
<title>BizCore</title>
 
<script type="text/javaScript" language="javascript">

</script>
 
</head>

<body>
 
<script type="text/javascript">$.LoadingOverlay("show", true);</script>
 
<div class="wrapper">

	<nav id="topMenu">

		<ul><!-- 상단 메뉴 -->
			<li><a href="${path}/">home</a></li>
			<li><a class="menuLink selected" href="${path}/sidemenu/menu1.do">업무관리</a></li>
			<li><a class="menuLink" href="${path}/sidemenu/menu2.do">그룹웨어</a></li>
			<c:if test="${sessionScope.userRole eq 'ADMIN'}">
				<li><a class="menuLink" href="${path}/sidemenu/menu3.do">회계관리</a></li>
			</c:if>
			<li><a class="menuLink" href="${path}/sidemenu/menu4.do">경영정보</a></li>
		</ul>

	</nav>
<!-- 사이드메뉴 시작 -->
	<div id="sideMenu">
<nav>
<div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">업무메뉴</div>
                    <ul class="pcoded-item pcoded-left-item">
                                <li class="">
                                    <a href="${path}/" class="current">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.dash.main">나의 업무 홈</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li class="pcoded-hasmenu active pcoded-trigger">
                                	<c:if test="${sessionScope.userKey}"></c:if>
                                    <a href="#">
                                        <span class="pcoded-micon"><i class="ti-layout"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">일정관리</span>
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
                                        <li class="">
                                            <a href="${path}/sched/write.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">일정등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <a href="#">
                                        <span class="pcoded-micon"><i class="ti-layout-cta-right"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.form-select.main">영업관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                                                        <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/sales/list.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">영업조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="${path}/sales/write.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">영업등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <a href="#">
                                        <span class="pcoded-micon"><i class="ti-crown"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">영업기회</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                                                        <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/sopp/list.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">영업기회조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="${path}/sopp/write.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">영업기회등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <a href="#">
                                        <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                                        <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">계약관리</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/cont/list.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">계약조회</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="${path}/cont/write.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">계약등록</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                 </li>
                            </ul>
                         
                         <div class="pcoded-navigatio-lavel" data-i18n="nav.category.other">설정</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu ">
                                    <a href="#">
                                        <span class="pcoded-micon"><i class="ti-direction-alt"></i><b>M</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.menu-levels.main">설정</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class="">
                                            <a href="${path}/cust/list.do">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">고객/거래처 설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="pcoded-hasmenu ">
                                            <a href="${path}/product/list.do">
                                                <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22">상품설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                            </ul>
                                        </li>
                                        <li class="">
                                            <a href="#">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">사용자 설정</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            </nav>

	</div>
	<!--  사이드 메뉴 종료 -->

<!-- 메인컨텐츠 시작 -->
	<div id="main_content">
<!-- 최초 나오는 달력 -->
<script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth', locale:'ko'
        });
        calendar.setOption('locale','ko');
        calendar.render();
      });
  document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay'
    },
    events: [
      {
        title: 'All Day Event',
        start: '2020-11-01'
      },
      {
        title: 'Long Event',
        start: '2020-11-07',
        end: '2020-11-10'
      }
    ]
  });

  var calendar = new Calendar(calendarEl, {
     dateClick: function() {
       alert('a day has been clicked!');
     }
   });
  
  calendar.render();
  
  calendar.on('dateClick', function(info) {
  // console.log('clicked on ' + info.dateStr);
	});

});
</script>
<div class="main-body">
    <div class="page-wrapper full-calender">
        <!-- Page-header start -->
        <!-- Page-header end -->
        <div class="page-body">
            <div class="card">
                <div class="card-header">
                    <h5>업무 달력</h5>
                    <div class="card-header-right">    <ul class="list-unstyled card-option">        <li><i class="icofont icofont-simple-left "></i></li>        <li><i class="icofont icofont-maximize full-card"></i></li>        <li><i class="icofont icofont-minus minimize-card"></i></li>        <li><i class="icofont icofont-refresh reload-card"></i></li>        <li><i class="icofont icofont-error close-card"></i></li>    </ul></div>
                    <div id='calendar'></div>
                </div>
               <button class = "add-button" type="button" onclick="click_add();">일정추가 </button>
            </div>
        </div>
    </div>
</div>
<!-- 최초 나오는 달력 종료 -->
	</div>
<!-- 메인컨텐츠 종료 -->

	</div><!--  <div class="container"> 태그 종료 -->


	<script>
	setTimeout(function(){
	    $.LoadingOverlay("hide", true);
	}, 500);
	</script>


</body>
</html>