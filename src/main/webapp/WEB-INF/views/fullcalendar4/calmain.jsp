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

    	                            	    //?????? ????????? ???????????? ????????????
    	                            	    var $contextMenu = $("#contextMenu");
    	                            	    $contextMenu.on("click", "a", function (e) {
    	                            	      e.preventDefault();

    	                            	      //?????? ????????? ?????????
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
				<h4 class="modal-title">???????????????</h4>
			</div>
			<div class="modal-body">
				<table class="table table-sm bst02">
					<colgroup>
						<col width="30%" />
						<col width="70%" />
					</colgroup>
					<tbody>
						<tr>
							<td><label class="col-xs-4" for="edit-type">????????????</label>
							<td><select class="inputCat" name="schedCat" id="schedCat">
									<option value="770010">????????????</option>
									<option value="770100">????????????</option>
									<option value="770800">????????????</option>
							</select></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedAllday">????????????</label></td>
							<td><label class="col-xs-4" for="schedAllday"></label><input
								class='allDayNewEvent' id="schedAllday" type="checkbox"></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="edit-type">????????????</label>
							<td><select class="inputCat" name="schedType" id="schedType">
									<option value="1001">??????</option>
									<c:forEach var="actlist" items="${actlist}">
									<option value="${actlist.code03}">${actlist.desc03}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedTitle">?????????</label></td>
							<td><input class="" type="text" name="schedTitle"
								id="schedTitle" required="required" /> <input type="hidden"
								name="userNo" id="userNo" /> <input type="hidden" name="custNo"
								id="custNo" /></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedTitle">??????</label></td>
							<td><input class="" type="text" name="schedPlace"
								id="schedPlace" required="required" /></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedFrom">????????????</label></td>
							<td><input class="" type="datetime-local" name="schedFrom"
								id="schedFrom" /></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedTo">????????????</label></td>
							<td><input class="" type="datetime-local" name="schedTo"
								id="schedTo" /></td>
						</tr>
						<tr>
							<td><label class="col-xs-4">????????????</label></td>
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
													<h5>??????????????????</h5>
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
							<td><label class="col-xs-4">?????? ??????</label></td>
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
													<h5>??????????????????</h5>
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
							<td><label class="col-xs-4" for="schedColor">??????</label></td>
							<td><select class="inputModal" name="color" id="schedColor">
									<option value="#D25565" style="color: #D25565;">?????????</option>
									<option value="#9775fa" style="color: #9775fa;">?????????</option>
									<option value="#ffa94d" style="color: #ffa94d;">?????????</option>
									<option value="#74c0fc" style="color: #74c0fc;">?????????</option>
									<option value="#f06595" style="color: #f06595;">?????????</option>
									<option value="#63e6be" style="color: #63e6be;">?????????</option>
									<option value="#a9e34b" style="color: #a9e34b;">?????????</option>
									<option value="#4d638c" style="color: #4d638c;">??????</option>
									<option value="#495057" style="color: #495057;">?????????</option>
							</select></td>
						</tr>
						<tr>
							<td><label class="col-xs-4" for="schedDesc">??????</label></td>
							<td><textarea rows="4" cols="50" class="inputModal"
									name="schedDesc" id="schedDesc"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="modal-footer modalBtnContainer-addEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
					<button type="button" class="btn btn-primary" id="save-event">??????</button>
				</div>

				<div class="modal-footer modalBtnContainer-modifyEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
					<button type="button" class="btn btn-danger" id="deleteEvent">??????</button>
					<button type="button" class="btn btn-primary" id="updateEvent">??????</button>
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
	 *  ????????? ?????? ??????
	 * ************** */
	var newEvent = function(start, end, schedCat) {

		//modalTitle.html('????????? ????????????');
		schedTitle.val('');
		schedFrom.val(start);
		schedTo.val(end);
		schedDesc.val('');
		addBtnContainer.show();
		modifyBtnContainer.hide();
		eventModal.modal('show');

		//????????? ?????? ???????????? ??????
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
						alert('????????? ????????? ?????? ??? ????????????.');
						return false;
					}
					if (schedData.schedTitle === '') {
						alert('???????????? ???????????????.');
						return false;
					}
					var realEndDay;
					if (schedAllday.is(':checked')) {
						schedData.schedFrom = moment(schedData.schedFrom)
								.format('YYYY-MM-DD HH:mm');
						//render??? ??????????????????
						schedData.schedTo = moment(schedData.schedTo).add(1,
								'days').format('YYYY-MM-DD HH:mm');
						//DB??? ?????????(??????)
						realEndDay = moment(schedData.schedTo).format(
								'YYYY-MM-DD HH:mm');
						schedData.schedAllday = true;
					}

					$.ajax({
						url : "${path}/sched/insert.do", // ?????????????????? HTTP ????????? ?????? ????????? URL ?????? 
						data : schedData, // HTTP ????????? ?????? ????????? ?????? ????????? 
						method : "POST", // HTTP ?????? ?????????(GET, POST ???) 
						async : false,
						dataType : "json" // ???????????? ????????? ???????????? ?????? 
					}) // HTTP ????????? ???????????? ????????? ???????????? done() ???????????? ?????????. .
					.done(function(data) {
						if (data.code == 10001) {
							alert("?????? ??????");
							location.reload(true);
							location.href = location.href;
							history.go(0);
						} else {
							alert("?????? ??????");
						}
					}) // HTTP ????????? ???????????? ????????? ????????? ?????? ????????? fail() ???????????? ?????????. 
					.fail(function(xhr, status, errorThrown) {
						alert("?????? ??????");
					});
					eventModal.find('input, textarea').val('');
					schedAllday.prop('checked', false);
					eventModal.modal('hide');
					//????????? ?????? ??????
				});
	};
	
</script>
    