<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <link href='${path}/fullcalendar4/core/main.css' rel='stylesheet' />
    <link href='${path}/fullcalendar4/daygrid/main.css' rel='stylesheet' />
    <link href='${path}/fullcalendar4/bootstrap/main.css' rel='stylesheet' />
    <script src='${path}/fullcalendar4/core/main.js'></script>
    <script src='${path}/fullcalendar4/daygrid/main.js'></script>
    <script src='${path}/fullcalendar4/interaction/main.js'></script>
    <script src='${path}/fullcalendar4/list/main.js'></script>
    <script src='${path}/fullcalendar4/timegrid/main.js'></script>
    <%-- <script src='${path}/fullcalendar4/moment/main.js'></script> --%>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
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
        	dateClick:function (startDate, endDate, jsEvent, view) {
        						$(".fc-body").unbind('click');
    	                   	    $(".fc-body").on('click', 'td', function (e) {
    	                   		newEvent(startDate, endDate, $(this).html());
    	                  	    });
    	                            	    //var today = moment();
    	                            	    /* if (view.name == "month") {
    	                            	      startDate.set({
    	                            	        hours: today.hours(),
    	                            	        minute: today.minutes()
    	                            	      });
    	                            	      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
    	                            	      endDate = moment(endDate).subtract(1, 'days');

    	                            	      endDate.set({
    	                            	        hours: today.hours() + 1,
    	                            	        minute: today.minutes()
    	                            	      });
    	                            	      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
    	                            	    } else {
    	                            	      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
    	                            	      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
    	                            	    }

    	                            	    //날짜 클릭시 카테고리 선택메뉴
    	                            	    var $contextMenu = $("#contextMenu");
    	                            	    $contextMenu.on("click", "a", function (e) {
    	                            	      e.preventDefault();

    	                            	      //닫기 버튼이 아닐때
    	                            	      if ($(this).data().role !== 'close') {
    	                            	        newEvent(startDate, endDate, $(this).html());
    	                            	      }
    	                            	      $contextMenu.removeClass("contextOpened");
    	                            	      $contextMenu.hide();
    	                            	    });

    	                            	   $('body').on('click', function () {
    	                            	      $contextMenu.removeClass("contextOpened");
    	                            	      $contextMenu.hide();
    	                            	    }); */ 
    	                            	  },
        	eventSources: [
        	                                {
        	                                  url: '${path}/calendar/listEvent.do',
        	                                  color: 'yellow',    // an option!
        	                                  textColor: 'black'  // an option!
        	                                }
        	                                ],   
        	                            
            eventClick: function(info) {
   	                                var url="${path}/sched/detail/"+info.event.id;
   	                                console.log(url);
   	                                fnSetPage(url);
        	                              },
        });
        calendar.render();
      });
    </script>
    
  <!-- Modal body Start -->
<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">새일정추가</h4>
			</div>
			<div class="modal-body">
				<table class="table table-sm bst02">
					<colgroup>
						<col width="30%" />
						<col width="70%" />
					</colgroup>
					<tbody>
						<tr>
							<td><label class="col-xs-4" for="edit-type">일정구분</label>
							<td><select class="inputCat" name="schedCat" id="schedCat">
									<option value="770010">영업일정</option>
									<option value="770100">기술지원</option>
									<option value="770800">기타일정</option>
							</select></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedAllday">하루종일</label></td>
							<td><label class="col-xs-4" for="schedAllday"></label><input
								class='allDayNewEvent' id="schedAllday" type="checkbox"></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="edit-type">활동형태</label>
							<td><select class="inputCat" name="schedType" id="schedType">
									<option value="1001">선택</option>
									<c:forEach var="actlist" items="${actlist}">
									<option value="${actlist.code03}">${actlist.desc03}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedTitle">일정명</label></td>
							<td><input class="" type="text" name="schedTitle"
								id="schedTitle" required="required" /> <input type="hidden"
								name="userNo" id="userNo" /> <input type="hidden" name="custNo"
								id="custNo" /></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedTitle">장소</label></td>
							<td><input class="" type="text" name="schedPlace"
								id="schedPlace" required="required" /></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedFrom">일정시작</label></td>
							<td><input class="" type="datetime-local" name="schedFrom"
								id="schedFrom" /></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedTo">일정종료</label></td>
							<td><input class="" type="datetime-local" name="schedTo"
								id="schedTo" /></td>
						</tr>
						<tr>
							<td><label class="col-xs-4">영업기회</label></td>
							<td>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="soppTitle"
										id="soppTitle" value="" readonly /> <input type="hidden"
										name="soppNo" id="soppNo" value="" /> <span
										class="input-group-btn">
										<button class="btn btn-primary sch-opportunity2"
											data-remote="${path}/modal/popup.do?popId=sopp" type="button"
											data-toggle="modal" data-target="#soppModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="soppModal" tabindex="-1"
										role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title"></h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>영업기회목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect "
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td><label class="col-xs-4">계약 현황</label></td>
							<td>
								<div class="input-group input-group-sm mb-0">
									<input type="text" class="form-control" name="contTitle"
										id="contTitle" value="" readonly /> <input type="hidden"
										name="contNo" id="contNo" value="" /> <span
										class="input-group-btn">
										<button class="btn btn-primary sch-opportunity2"
											data-remote="${path}/modal/popup.do?popId=cont" type="button"
											data-toggle="modal" data-target="#contModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
									<div class="modal fade " id="contModal" tabindex="-1"
										role="dialog">
										<div class="modal-dialog modal-80size" role="document">
											<div class="modal-content modal-80size">
												<div class="modal-header">
													<h4 class="modal-title"></h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>영업기회목록</h5>
													<p>Loading!!!</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default waves-effect "
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<td><label class="col-xs-4" for="schedColor">색상</label></td>
							<td><select class="inputModal" name="color" id="schedColor">
									<option value="#D25565" style="color: #D25565;">빨간색</option>
									<option value="#9775fa" style="color: #9775fa;">보라색</option>
									<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
									<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
									<option value="#f06595" style="color: #f06595;">핑크색</option>
									<option value="#63e6be" style="color: #63e6be;">연두색</option>
									<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
									<option value="#4d638c" style="color: #4d638c;">남색</option>
									<option value="#495057" style="color: #495057;">검정색</option>
							</select></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedDesc">설명</label></td>
							<td><textarea rows="4" cols="50" class="inputModal"
									name="schedDesc" id="schedDesc"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="modal-footer modalBtnContainer-addEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="save-event">저장</button>
				</div>

				<div class="modal-footer modalBtnContainer-modifyEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
					<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
</div>
<%
	String userId = "";
	if ((String) session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
%>
	
<div id='calendar'></div>			
<script>
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

	var eventModal = $('#eventModal');
	var schedAllday = $('#schedAllday');
	var schedPlace = $('#schedPlace');
	var schedTitle = $('#schedTitle');
	var schedFrom = $('#schedFrom');
	var schedTo = $('#schedTo');
	var schedCat = $('#schedCat');
	var schedColor = $('#schedColor');
	var schedDesc = $('#schedDesc');
	var soppNo = $('#soppNo');
	var addBtnContainer = $('.modalBtnContainer-addEvent');
	var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');

	/* ****************
	 *  새로운 일정 생성
	 * ************** */
	var newEvent = function(start, end, schedCat) {

		//modalTitle.html('새로운 일정등록');
		schedTitle.val('');
		schedFrom.val(start);
		schedTo.val(end);
		schedDesc.val('');
		addBtnContainer.show();
		modifyBtnContainer.hide();
		eventModal.modal('show');

		//새로운 일정 저장버튼 클릭
		$('#save-event').unbind();
		$('#save-event').on('click', function() {
					var schedData = {};
					var userIdn = "<%=userId%>";
					schedData.schedPlace = $("#schedPlace").val();
					schedData.soppNo = $("#soppNo").val();
					schedData.contNo = $("#contNo").val();
					schedData.schedDesc = $("#schedDesc").val();
					schedData.schedType = $("#schedType").val();
					schedData.userId = userIdn;
					schedData.schedFrom = $("#schedFrom").val();
					schedData.schedTo = $("#schedTo").val();
					schedData.schedTitle = $("#schedTitle").val();
					schedData.schedColor = $("#schedColor").val();
					schedData.custNo = $("#custNo").val();
					schedData.schedCat = $("#schedCat").val();
					console.log(schedData);
					if (schedData.schedFrom > schedData.schedTo) {
						alert('끝나는 날짜가 앞설 수 없습니다.');
						return false;
					}
					if (schedData.schedTitle === '') {
						alert('일정명은 필수입니다.');
						return false;
					}
					var realEndDay;
					if (schedAllday.is(':checked')) {
						schedData.schedFrom = moment(schedData.schedFrom)
								.format('YYYY-MM-DD HH:mm');
						//render시 날짜표기수정
						schedData.schedTo = moment(schedData.schedTo).add(1,
								'days').format('YYYY-MM-DD HH:mm');
						//DB에 넣을때(선택)
						realEndDay = moment(schedData.schedTo).format(
								'YYYY-MM-DD HH:mm');
						schedData.schedAllday = true;
					}

					$.ajax({
						url : "${path}/sched/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
						data : schedData, // HTTP 요청과 함께 서버로 보낼 데이터 
						method : "POST", // HTTP 요청 메소드(GET, POST 등) 
						async : false,
						dataType : "json" // 서버에서 보내줄 데이터의 타입 
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if (data.code == 10001) {
							alert("저장 성공");
							location.reload(true);
							location.href = location.href;
							history.go(0);
						} else {
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
					eventModal.find('input, textarea').val('');
					schedAllday.prop('checked', false);
					eventModal.modal('hide');
					//새로운 일정 저장
				});
	};
	
</script>
    