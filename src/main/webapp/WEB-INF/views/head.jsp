<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
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
    
    modal{
    	width:100px;
    	height:100px;
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
    <script type="text/javascript" src="${path}/assets/js/common-pages.js"></script>
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
<script src="${path}/js/html2pdf.bundle.min.js"></script>

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
<%-- <script type="text/javascript" src="${path}/js/print.min.js"></script> --%>
<script src="https://cdn.tiny.cloud/1/kh4eirod6bgv8u2sxlaeikxy5hxfogh0edhzloljxh6zf046/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
<script src="${path}/js/allim.js"></script>
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
<script>
	var timer;
    const DEFAULT_NUM = 15;
	const CLICK_PAGE_NUM = 10;
	
	$(function(){
		$("#topMenu a").click(function(evt){
			var url = this.href;
			evt.preventDefault();
			$("#topMenu a").removeClass('on'); 	// Remove class on all menu items
			$(this).addClass('on');     		// Add class to current menu item
			fnSetSideMenu(url);
		});
	});

	function fnSetPage(url, data){
		<!-- $.LoadingOverlay("show", true); -->
			$("#main_content").empty();
			$("#main_content").load(url, data, function(){
				setTimeout(function(){
					<!--$.LoadingOverlay("hide", true);-->
				}, 500);
		});
	}
	
	function fnSetSideMenu(url, data){
		<!-- $.LoadingOverlay("show", true); -->
		$("#sideMenu").empty();
		$("#sideMenu").load(url, data, function(){
		setTimeout(function(){
			    <!--$.LoadingOverlay("hide", true);-->
			}, 50);
		});
	}
	
	function fnClearall(){
		var parrentElement = $(this).closest("#searchForm");
		var elements = $("#searchForm").find("input");
		for(var i = 0; i < elements.length; i++) {
			elements[i].value = null;
		}
	}

    var Sdate = "", EDate = "", startTime = "00:00", endTime = "00:00";
	
	function inputDate(fromDate, toDate, e){
	    console.log($(e));
        console.log(fromDate);
        console.log(toDate);
        if(fromDate != null && fromDate != '' && toDate != null && toDate != ''){
			if(fromDate > toDate) {
				alert('시작날짜(시간포함)는 종료날짜(시간포함)보다 초과할수 없습니다.');
    			// $("#"+event.target.id).val(null);
                var id = $(e).attr("id");
                // console.log(id);
                if(id == 'schedSdate') $(e).val(Sdate);
                if(id == 'schedFrom') $(e).val(Sdate);
                if(id == 'salesFrdatetime') $(e).val(Sdate);
                if(id == 'techdFrom') $(e).val(Sdate);
                if(id == 'startTime') $(e).val(startTime);
                if(id == 'schedEdate') $(e).val(EDate);
                if(id == 'schedTo') $(e).val(EDate);
                if(id == 'salesTodatetime') $(e).val(EDate);
                if(id == 'techdTo') $(e).val(EDate);
                if(id == 'endTime') $(e).val(endTime);
    			return false;
			} else {
			    var from = fromDate.split("T");
                Sdate = from[0];
                startTime = from[1];

                var toDate = toDate.split("T");
                EDate = toDate[0];
                endTime = toDate[1];

                // console.log(Sdate + " " + startTime);
                // console.log(EDate + " " + endTime);
			    return true;
            }
		}
	}

	function inputDateFormat(Date, Time){
	    if(Date != ''){
	        if(Time === undefined) return Date+"T00:00"
	        else return Date+"T"+Time;
        } else {
	        return "";
        }
    }

    function fnChangeInfo() {
		var userId = $("#userInfoForm").find("input[name=userId]").val();
		var currentPassword = $("#userPasswd").val();
		var changePassword = $("#userChangePasswd").val();
		var checkedChangePassword = $("#checkedUserChangePasswd").val();
		var listDateFrom = $("#listDateFrom").val();
		
		if(fnIsNullOrEmpty(currentPassword)) {
			alert("현재 비밀번호는 필수입니다.");
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
		userData.listDateFrom = listDateFrom;
		
		$.ajax({
			url : "${path}/user/updatePass.do",
			data : userData,
			method : "POST",
			dataType : "json"
		}).done(function(data){
			if(data.code == 10001){
				alert("개인정보가 수정되었습니다.");
				location.href = "${path}/user/logout.do";
				alert("다시 로그인해주십시오.")
			}else{
				alert("유저 정보를 찾을 수 없습니다.");
			}
		}).fail(function(xhr, status, errorThrown) { 
			alert("통신 실패");
		});
	}
	
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
	
	function setTiny(){
		var plugins = [
		    "advlist", "autolink", "lists", "link", "image", "charmap", "print", "preview", "anchor",
		    "searchreplace", "visualblocks", "code", "fullscreen", "insertdatetime", "media", "table",
		    "paste", "code", "help", "wordcount", "save"
		];
		
		var edit_toolbar = 'formatselect fontselect fontsizeselect |'
		       + ' forecolor backcolor |'
		       + ' bold italic underline strikethrough |'
		       + ' alignjustify alignleft aligncenter alignright |'
		       + ' bullist numlist |'
		       + ' table tabledelete |'
		       + ' link image';
		
		tinymce.init({
			language: "ko_KR",
		    height: 500,
		    menubar: false,
		    plugins: plugins,
		    toolbar: edit_toolbar,
		  	selector: 'textarea',
		  	height : "200",
		});
	}
	
	function selectAllimClick(e){
		var updateData = {};
		var allimSpan = $("#headerAllim span");
		var allimMainUl = $("#headerAllim #headerAllimUl");
		updateData.allimNo = $(e).attr("data-id");
		updateData.readCheck = 1;
		
		$.ajax({
			url: "${path}/allim/allimReadUpdate.do",
			method: "post",
			data: updateData,
			async: false,
			dataType: "json",
			success:function(){
				/* location.href = "${path}" + $(e).attr("data-path"); */
				$(e).parent().remove();
				allimSpan.html(parseInt(allimSpan.html()) - 1); 
				
				if(parseInt(allimSpan.html()) < 1){
					allimSpan.html("0");
					allimMainUl.html("<li style='text-align:center;'><h6>새로운 알림이 없습니다.</h6></li>");
				}
			}
		});
	}

	function timeAllimUpdate(){
		var allimData = {};
		var userNo = "${sessionScope.userNo}";
		var compNo = "${sessionScope.compNo}";
		var allimRole = "${sessionScope.docRole}";
		var allimSpan = $("#headerAllim span");
		var allimMainUl = $("#headerAllim #headerAllimUl");
		
		allimData.userNo = userNo;
		allimData.compNo = compNo;
		allimData.allimRole = allimRole;
		
		$.ajax({
			url: "${path}/allim/timeAllimSelect.do",
			method: "post",
			data: allimData,
			async: false,
			dataType: "json",
			success:function(data){
				allimSpan.html("");	
				allimMainUl.html("");
				
				if(data.length > 0 && data.length < 99){
					allimSpan.html(data.length);
				
					for(var i = 0; i < data.length; i++){
						allimMainUl.append("<li class='list-group-item' style='font-weight:600; padding:10px 20px;'><a href='#' data-path='" + data[i].allimPath + "' data-id='" + data[i].allimNo + "' onClick='selectAllimClick(this);'>" + data[i].allimContents + "<br>" + data[i].regDateTime + "</a></li>");												
					}
				}else if(data.length > 99){
					allimSpan.html("99+");
					
					for(var i = 0; i < data.length; i++){
						allimMainUl.append("<li><a href=''>" + data[i].allimContents + "<br>" + data[i].regDateTime + "</a></li>");												
					}
				}else{
					allimSpan.html("0");
					allimMainUl.html("<li style='text-align:center;'><h6>새로운 알림이 없습니다.</h6></li>");
				}
			}
		});
		
		timer = setTimeout("timeAllimUpdate()", 180000);
	}
	
	/* function pageClick(e){
		var page = $(e).attr("data-number");
		var setFirstPage = $(e).parents("ul").find("li:first").next().children().attr("data-number");
		
		localStorage.setItem("activePage", page);
		localStorage.setItem("setFirstPage", setFirstPage);
		pageNation(page, DEFAULT_NUM, null);
	} */
	
	function pageHtml(start, last){
		var pageHtml = "";
		
		$("#pageDiv").empty();
		
		pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
		
		for(var i = start; i <= last; i++){
			pageHtml += "<li class='page-item' id='page_"+ i +"'><a class='page-link' href='#' data-number='"+ i +"' onClick='pageClick(this);'>" + i + "</a></li>"
		}
		
		pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
		
		$("#pageDiv").html(pageHtml);
	}
	
	function pagePrevious(e){
		var preFirstNum = $(e).parent().next().children().attr("data-number");
		var calFirstNum = parseInt(preFirstNum) - CLICK_PAGE_NUM;
		var calLastNum = 0;
		
		if(calFirstNum < 1){
			calFirstNum = 1;
		}

		calLastNum = calFirstNum + 9;
		
		if(calLastNum > localStorage.getItem("lastPageNum")){
			calLastNum = localStorage.getItem("lastPageNum");
		}
			
		pageHtml(calFirstNum, calLastNum);
	}
	
	function pageNext(e){
		var preFirstNum = $(e).parents("ul").find("li:first").next().children().attr("data-number");
		var calFirstNum = parseInt(preFirstNum) + CLICK_PAGE_NUM;
		var calLastNum = calFirstNum + 9;
		
		if(calFirstNum > localStorage.getItem("lastPageNum")){
			calFirstNum = preFirstNum;
		}
		
		if(calLastNum > localStorage.getItem("lastPageNum")){
			calLastNum = localStorage.getItem("lastPageNum");	
		}
		
		pageHtml(calFirstNum, calLastNum);
	}
	
	function pageHtmlModal(start, last){
		var pageHtml = "";
		
		$("#pageDiv_modal").empty();
		
		pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePreviousModal(this);'>Previous</a></li>";
		
		for(var i = start; i <= last; i++){
			pageHtml += "<li class='page-item' id='page_"+ i +"'><a class='page-link' href='#' data-number='"+ i +"' onClick='pageClickModal(this);'>" + i + "</a></li>"
		}
		
		pageHtml += "<li class='page-item'><a class='page-link' href='#' onClick='pageNextModal(this);'>Next</a></li></ul>";
		
		$("#pageDiv_modal").html(pageHtml);
	}
	
	function pagePreviousModal(e){
		var preFirstNum = $(e).parent().next().children().attr("data-number");
		var calFirstNum = parseInt(preFirstNum) - CLICK_PAGE_NUM;
		var calLastNum = 0;
		
		if(calFirstNum < 1){
			calFirstNum = 1;
		}

		calLastNum = calFirstNum + 9;
		
		if(calLastNum > localStorage.getItem("lastPageNumModal")){
			calLastNum = localStorage.getItem("lastPageNumModal");
		}
			
		pageHtmlModal(calFirstNum, calLastNum);
	}
	
	function pageNextModal(e){
		var preFirstNum = $(e).parents("ul").find("li:first").next().children().attr("data-number");
		var calFirstNum = parseInt(preFirstNum) + CLICK_PAGE_NUM;
		var calLastNum = calFirstNum + 9;
		
		if(calFirstNum > localStorage.getItem("lastPageNumModal")){
			calFirstNum = preFirstNum;
		}
		
		if(calLastNum > localStorage.getItem("lastPageNumModal")){
			calLastNum = localStorage.getItem("lastPageNumModal");	
		}
		
		pageHtmlModal(calFirstNum, calLastNum);
	}
	
	function moneyFormatHtml(){
		$("table").find(".moneyTdHtml").each(function(index, item){
			if(isNaN($(item).html()) === true || $(item).html() === ""){
				$(item).html(0);
			}else{
				$(item).html(parseInt($(item).html()).toLocaleString("en-US"));
			}
		});
	}
	
	function moneyFormatInput(e){
		if(isNaN($(e).val().replaceAll(",", "")) === true || $(e).val().replaceAll(",", "") === ""){
			$(e).val(0);
		}else{
			$(e).val(parseInt($(e).val().replaceAll(",", "").replace(/[^0-9]/g, "")).toLocaleString("en-US"));
		}
	
	}
	function dataListChange(e){
		let thisList = $(e);
		let dataValue = thisList.next().children().filter((index, item) => {
			return $(item).val() === thisList.val();
		}).data("value");
		
		thisList.next().next().val(dataValue);
	}
	
	$(document).ready(function(){
		timeAllimUpdate();
		setTiny();
		moneyFormatHtml();
	});

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
	.ex_reduce {
			margin-left: -10px;
		}
	.form-control-sm {
		height: 44%;		
	}
</style>

</head>