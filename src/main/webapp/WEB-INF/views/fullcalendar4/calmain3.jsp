<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
    <link href='${path}/fullcalendar4/core/main.css' rel='stylesheet' />
    <link href='${path}/fullcalendar4/daygrid/main.css' rel='stylesheet' />
    <link href='${path}/fullcalendar4/bootstrap/main.css' rel='stylesheet' />
    <link href='${path}/assets/css/font-awesome.min.css' rel="stylesheet" type="text/css">
<%--	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->--%>
	<link href="${path}/fancytree/skin-win8/ui.fancytree.css" rel="stylesheet">

    <script src='${path}/fullcalendar4/core/main.js'></script>
    <script src='${path}/fullcalendar4/daygrid/main.js'></script>
    <script src='${path}/fullcalendar4/interaction/main.js'></script>
    <script src='${path}/fullcalendar4/list/main.js'></script>
    <script src='${path}/fullcalendar4/timegrid/main.js'></script>
<%--    <script src='${path}/fullcalendar4/moment/main.js'></script>--%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src='${path}/fancytree/jquery.fancytree-all-deps.js'></script>
	<script src='${path}/fancytree/jquery.fancytree-all.js'></script>

	<style>
		#organizationChartView {
			min-width: 200px;
			background-color: #fff;
			display: none;
			position: absolute;
			z-index: 9999;
			padding: 5px 5px 10px 5px;
			border : 2px solid #efefef;
		}
		
		input[type=checkbox] {
		    margin: 4px 0 0 0;
		}
		
		.fa-caret-down, .fa-caret-right {
    		cursor: pointer;
		}

		.fancytree-container {
			outline: none;
		}

		#selectedPerson > div > button {
			margin-top: 2px;
			margin-right: 4px;
		}

		#selectedPerson > div > button > span {
			font-size: 22px;
			color: #f00;
		}
		
	</style>
    
  <!-- Modal body Start -->
	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">일정추가</h4>
				</div>
				<div class="modal-body">
					<div class="eventModalRadioGroup">
						<div class="form-radio">
							<form>
								<div class="radio radio-inline">
									<label><input type="radio" name="schedCat" value="770010" onclick="fnSetDetail(this.value)"/><i class="helper"></i>영업일정</label>
								</div>
								<div class="radio radio-inline">
									<label><input type="radio" name="schedCat" value="770100" onclick="fnSetDetail(this.value)"/><i class="helper"></i>기술지원</label>
								</div>
								<div class="radio radio-inline">
									<label><input type="radio" name="schedCat" value="770800" onclick="fnSetDetail(this.value)"/><i class="helper"></i>기타일정</label>
								</div>
							</form>
						</div>
					</div>
					<div id="detail-content">

					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div style="float:left; margin:0px 5px">
			<input type="text" id="organizationChartOpen" class="form-control" value="조직도" style="width:200px; cursor:pointer" readonly/>
			<div id="organizationChartView">
				<div id="tree" style="display: inline-block;">
					<ul>
						<li class="folder expanded topElement" data-json='{"icon": "${path}/images/tree-icon1.png"}'>${organizationArrList[0].title}
							<ul>
								<c:forEach var="i" begin="0" end="${fn:length(organizationArrList[0].children)-1}" varStatus="status" step="1">
									<c:set var="item" value="${organizationArrList[0].children[i]}"/>
									<li class="folder">${status.current}.${item.title}
										<ul>
											<c:forEach var="user" items="${item.children}">
												<li data-json='{"icon": "${path}/images/personIcon1.png"}' id="li_${user.userNo}">${user.title}</li>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</div>
				<div style="text-align:center; margin-top:5px;"><button class="btn btn-sm btn-inverse" onClick="javascript:$('#organizationChartView').hide();">닫기</button></div>
			</div>
		</div>
		<input type="button" onclick="fnSearchCalendar()" value="검색">
	</div>
	<div id='calendar'></div>
	<!-- <div style="margin-top: 10px;">선택한 사람 : <br/>
		<div id="selectedPerson"></div>
	</div> -->
	<script>
		var userNoSelected = {
			<c:forEach var="i" begin="0" end="${fn:length(organizationArrList[0].children)-1}" varStatus="status" step="1">
				<c:set var="item" value="${organizationArrList[0].children[i]}"/>
					<c:forEach var="user" items="${item.children}">
						${user.userNo} : false,
					</c:forEach>
			</c:forEach>
		}
		var userNoMatchName = {
			<c:forEach var="i" begin="0" end="${fn:length(organizationArrList[0].children)-1}" varStatus="status" step="1">
				<c:set var="item" value="${organizationArrList[0].children[i]}"/>
				<c:forEach var="user" items="${item.children}">
					${user.userNo} : '${user.title}',
				</c:forEach>
			</c:forEach>
		}

		$('#soppModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#contModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		//계약 table의 soppNo 값이 0일 경우 
		function fnSetContData1(a,b,c,d,e){
			//영업기회와 sopno이 연결되어있지 않은 경우 경고창
			alert("영업기회에 연결되어있지 않은 계약압니다.");
			return false;
			//영업기회와 sopno이 연결되어있지 않은 경우 경고창
			/* $("#soppNo").val(e);
			location.href = "${path}/cont/iowrite.do/" + e; */
		}
		
		function fnSetSoppData(a, b, c, d) {
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$("#userNo").val(c);
			$("#custNo").val(d);
			$("#soppModal").modal("hide");
		}
		function fnSetContData(a, b) {
			$("#contNo").val(b);
			$("#contTitle").val(a);
			$("#contModal").modal("hide");
		}

		function fnSetDetail(value, info) {
			var path;

			if(value == '770010') {
				path = '${path}/sales/write.do?simple=Y';
			}else if(value == '770100'){
				path = '${path}/techd/write.do?simple=Y';
			}else if(value == '770800'){
				path = '${path}/sched/write.do?simple=Y';
			}else if(value == 'modify'){
				var schedType = info.event.extendedProps.schedType;
				if(schedType == '영업일정') {
					path = '${path}/sales/detail/'+info.event.id+'?simple=Y';
				}else if(schedType == '기술지원'){
					path = '${path}/techd/detail/'+info.event.id+'?simple=Y';
				}else if(schedType == '기타일정'){
					path = '${path}/sched/detail/'+info.event.id+'?simple=Y';
				}
			}

			if(path) {
				$('#detail-content').load(path, function() {
					$('.modal-list-btn').hide();
					$('.modal-cancel-btn').hide();
					$('#detail-content').find('.modal-dialog').draggable({
						handle: ".modal-header"
					});

					fnSetCurrentDate();
				});
			}
			
		}
		var calendar;
		function setCalendar(event, userNoList) {
			var userNoList = userNoList;
			if(event != 'search') {
				userNoList = ["${sessionScope.userNo}"];
			}

			var calendarEl = document.getElementById('calendar');
			calendar = new FullCalendar.Calendar(calendarEl, {
				header : {
					left:   '',
					center: 'title',
					right:  'prevYear prev today next nextYear'
				},
				plugins: [ 'dayGrid','interaction','timeGrid','list' ],
				locale                    : 'ko',
				timezone                  : "local",
				firstDay                  : 0,
				weekNumbers               : false,
				selectable                : true,
				weekNumberCalculation     : "ISO",
				nextDayThreshold          : "09:00:00",
				allDaySlot                : true,
				displayEventTime          : false,
				displayEventEnd           : true,
				eventLimit                : true,
				views                     : {
												month : { eventLimit : 3 }
											},
				dateClick:function (info) {
					$('#detail-content').empty();
					$('#detail-content')[0].selectedDate = info.dateStr;
					fnInitializeRadio();
					$('.eventModalRadioGroup').show();
					$('#eventModal').modal('show');
				},

				eventSources: [{
					url: '${path}/calendar/listEvent.do',
					method: 'POST',
					extraParams: {
						userNoList : userNoList
					},
					success : function(rawData, response) {
						return rawData;
					},
					failure: function(error) {
						// console.dir(error);
						alert('캘린더 데이터 요청 실패');
					},
					color: 'yellow',    // an option!
					textColor: 'black',  // an option!
				}],

				eventClick: function(info) {
					$('#detail-content').empty();
					$('.eventModalRadioGroup').hide();
					$('#eventModal').modal('show');
					fnSetDetail('modify', info);
				},
				eventRender : function(info) {
					info.el.style.backgroundColor = info.event.extendedProps.color;
					info.el.style.borderColor = info.event.extendedProps.color;
				}
			});
			calendar.render();

			if(event == 'search'){
			}
		}

		function fnSearchCalendar() {
			var userNoList = [];
			for (const key in userNoSelected){
				var userNo = key;
				var bool = userNoSelected[key];
				if(bool){
					userNoList.push(userNo);
				}
			}

			$('#calendar').empty();
			setCalendar('search', userNoList);
		}

		function fnOrganizationCheck(companyCheckbox) {
			var organizations = $('.organization-checkbox');
			$('.organization-checkbox').each(function(index, item){
				item.checked = companyCheckbox.checked;
			});
		}

		function fnCaretClick () {
			if($('.organizationList-ul').is(":visible")) {
				$('.organizationList-ul').hide();
				$('#caret1')[0].className = 'fa-li fa fa-caret-right'

			}else {
				$('.organizationList-ul').show();
				$('#caret1')[0].className = 'fa-li fa fa-caret-down'
			}
		}

		function fnSetCurrentDate() {
			var startDate = $('#detail-content').find('input[type=date]')[0];
			var startTime = $('#startTime');
			var endDate = $('#detail-content').find('input[type=date]')[1];
			var endTime = $('#endTime');

			startDate.value = $('#detail-content')[0].selectedDate;
			startTime.val("09:00");
			endDate.value = $('#detail-content')[0].selectedDate;
			endTime.val("23:30");
		}

		function fnInitializeRadio() {
			var radioButtons = $('.eventModalRadioGroup').find('input[type=radio]');

			for(var i = 0; i < radioButtons.length; i++) {
				radioButtons[i].checked = false;
			}
		}

		function userNoSelected_Delete(userNo){
			$("#tree").fancytree("getTree").visit(function(node) {
				if(node.key == ("li_"+userNo)){
					node.setSelected(false);
				}
			});
		}

		function userNoSelected_ElementCreate(){
			var html = "";
			for (const key in userNoSelected){
				var userNo = key;
				var usrName = userNoMatchName[key];
				var bool = userNoSelected[key];
				if(bool){
					html = html + '<div style="display: inline-block;border: solid 0.5px #ffb64d; margin-right:5px;">' +
							'<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="" onclick="userNoSelected_Delete('+userNo+');">' +
							'<span aria-hidden="true" style="">×</span>' +
							'</button>' +
							'<strong style=" padding: 5px; font-size: 1.2em;">' + usrName + '</strong>' +
							'</div>';
				}
			}
			$("#selectedPerson").empty();
			$("#selectedPerson").append(html);
		}
		var calYear = "";
		var calDate = "";
		$(document).ready(function() {
			setCalendar();
			// setOrganizationList();
			//setOrganizationTree();
			$('#organizationChartOpen').on('click', function() {
				if ($('#organizationChartView').is(":visible")) {
					$('#organizationChartView').hide();
				} else {
					$('#organizationChartView').show();
				}
			});
			$("#tree").fancytree({
				checkbox: true,
				selectMode: 3,
				select: function(event, data) {
					// console.dir(data.node);
					var html = "";
					if(data.node.children == null) {
						var userNo = data.node.key.split("_")[1];
						if(data.node.isSelected()) userNoSelected[userNo] = true;
						else userNoSelected[userNo] = false;
					} else {
						if(data.node.extraClasses == "topElement"){
							data = data.node.children;
							for(var i=0; i<data.length; i++){
								var data2 = data[i];
								for(var j=0; j<data2.children.length; j++) {
									var t = data2.children[j];
									var userNo = t.key.split("_")[1];
									if (t.isSelected()) userNoSelected[userNo] = true;
									else userNoSelected[userNo] = false;
								}
							}
						} else {
							for(var i=0; i<data.node.children.length; i++){
								var t = data.node.children[i];
								var userNo = t.key.split("_")[1];
								if(t.isSelected()) userNoSelected[userNo] = true;
								else userNoSelected[userNo] = false;
							}
						}
					}
					// console.dir(userNoSelected);
					userNoSelected_ElementCreate();
				}
			});

			$("#tree").fancytree("getTree").visit(function(node) {
				// node.setExpanded(true);
				node.setSelected(true);
				/* if(node.key == ("li_"+${sessionScope.userNo})){
					node.setSelected(true);
				} */
			});

			$(document).on("click",'.fc-prevYear-button, .fc-icon-chevron-left, .fc-next-button, .fc-nextYear-button',function () {
				var moment = ($('#calendar')[0].firstChild.outerText.split('\n')[0]).replaceAll('년','').replaceAll('월','').split(' ');
				calYear = moment[0];
				calDate = moment[1];
			});
			$(document).on("click",'fc-today-button',function () {
				var moment = ($('#calendar')[0].firstChild.outerText.split('\n')[0]).replaceAll('년','').replaceAll('월','').split(' ');
				calYear = "";
				calDate = "";
			});
		});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>
    