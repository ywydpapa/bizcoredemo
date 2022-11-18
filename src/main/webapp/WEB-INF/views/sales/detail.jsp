<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:if test="${empty simple}">
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
</c:if>
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						영업활동 상세
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<!--영업활동등록-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst02">
							<colgroup>
								<col width="15%" />
								<col width="35%" />
								<col width="15%" />
								<col width="35%" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="requiredTextCss">활동일</th>
									<td colspan="3">
										<div class="input-group input-group-sm mb-0 mr-1">
											<input id="salesFrdatetime" class="form-control form-control form-control-sm col-md-4 m-r-10" type="date" value ="" onChange="javascript:inputDate(setDateHourMinute($('#salesFrdatetime').val(), $('#startTime').val()), setDateHourMinute($('#salesTodatetime').val(), $('#endTime').val()), this)">
											<select id="startTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#salesFrdatetime').val(), $('#startTime').val()), setDateHourMinute($('#salesTodatetime').val(), $('#endTime').val()), this)"></select>
											<span> ~ </span>
											<input id="salesTodatetime" class="form-control form-control form-control-sm col-md-4 m-r-10" type="date" value ="" onChange="javascript:inputDate(setDateHourMinute($('#salesFrdatetime').val(), $('#startTime').val()), setDateHourMinute($('#salesTodatetime').val(), $('#endTime').val()), this)">
											<select id="endTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#salesFrdatetime').val(), $('#startTime').val()), setDateHourMinute($('#salesTodatetime').val(), $('#endTime').val()), this)"></select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">장소</th>
									<td><input type="text" class="form-control form-control-sm" id="salesPlace" name="salesPlace" value="${dto.salesPlace}"></td>
									<th>활동형태</th>
									<td><select name="salesType" id="salesType" class="form-control form-control-sm">
										<c:forEach var="acttype" items="${acttype}">
										<option value="${acttype.codeNo}" <c:if test="${acttype.codeNo == dto.salesType}">selected</c:if>>${acttype.desc03}</option>
										</c:forEach>
									</select></td>
								</tr>
								<tr>
									<th class="requiredTextCss">담당사원</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="userName" id="userName" value="${dto.userName}" />
											<input type="hidden" class="form-control" name="userNo" id="userNo" value="${dto.userNo}" />
											 <span class="input-group-btn">
												<button class="btn btn-primary sch-company"
													data-remote="${path}/modal/popup.do?popId=user"
													type="button" data-toggle="modal" data-target="#userModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="userModal" tabindex="-1"
												role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">사용자목록</h4>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>사용자목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<%--<button type="button"
																class="btn btn-default waves-effect "
																onclick="$('#userModal').modal('hide');">Close</button>--%>
															<button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<th scope="row">영업기회</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="soppTitle" id="soppTitle" value="${dto.soppTitle}" />
											<input type="hidden" class="form-control" name="soppNo" id="soppNo" value="${dto.soppNo }" />
											<span class="input-group-btn">
												<button class="btn btn-primary sch-opportunity2"
													data-remote="${path}/modal/popup.do?popId=sopp"
													type="button" data-toggle="modal" data-target="#soppModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="soppModal" tabindex="-1" role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">영업기회목록</h4>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>영업기회목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">매출처</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="custName" id="custName" value="${dto.custName}" />
											 <input type="hidden" name="custNo" id="custNo" value="${dto.custNo}" /> <span class="input-group-btn">
												<button class="btn btn-primary sch-company"
													data-remote="${path}/modal/popup.do?popId=cust"
													type="button" data-toggle="modal" data-target="#custModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="custModal" tabindex="-1"
												role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">매출처목록</h4>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>매출처목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<th scope="row">엔드유저</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" id="endCustName" value="${dto.ptncName}" />
											<input type="hidden" id="endCustNo" value="${dto.ptncNo}" />
											<span class="input-group-btn">
												<button class="btn btn-primary sch-partner" data-remote="${path}/modal/popup.do?popId=endCust" type="button" data-toggle="modal" data-target="#endCustModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="endCustModal" tabindex="-1" role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title"></h4>
															<button type="button" class="close" onclick="$('#endCustModal').modal('hide');" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>엔드유저 목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default waves-effect" onclick="$('#endCustModal').modal('hide');">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" class="requiredTextCss">제목</th>
									<td colspan="3"><input type="text"
										class="form-control form-control-sm" id="salesTitle" name="salesTitle"
										value="${dto.salesTitle}"></td>
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td colspan="3"><textarea name="salesDesc" id="salesDesc" rows="8"
											class="form-control">${dto.salesDesc}</textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="btn_wr text-right mt-3">
					<input type="hidden" id="salesNo" value ="${dto.salesNo}">
					<button class="btn btn-md btn-success f-left modal-list-btn" onClick="javascript:location.href='${path}/sales/list.do'">목록</button>
					<c:if test="${dto.userNo eq sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
						<button class="btn btn-md btn-danger" onClick="fn_DeleteSales()">삭제</button>
						<button class="btn btn-md btn-primary" onClick="fn_UpdateSales()">수정</button>
						<button class="btn btn-md btn-inverse modal-list-btn" onClick="javascript:location='${path}/sales/list.do'">취소</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--//영업활동등록-->


	<script>
		$('#custModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#userModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#ptncModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#soppModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#endCustModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
    	function fnSetCustData(a, b) {
			$("#custName").val(a);
			$("#custNo").val(b);
			$(".modal-backdrop").remove();
			$("#custModal").modal("hide");
		}
    	
		function fnSetUserData(a, b) {
			$("#userNo").val(a);
			$("#userName").val(b);
			$(".modal-backdrop").remove();
			$("#userModal").modal("hide");
			
		}
		
		function fnSetPtncData(a, b) {
			$("#ptncNo").val(b);
			$("#ptncName").val(a);
			$(".modal-backdrop").remove();
			$("#ptncModal").modal("hide");
		}
		
		function fnSetSoppData(a, b) {
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		}

		function fnSetEndCustData(a, b) {
			$("#endCustNo").val(b);
			$("#endCustName").val(a);
			$(".modal-backdrop").remove();
			$("#endCustModal").modal("hide");
		}

		function fn_UpdateSales() {
			var salesData = {};
			salesData.salesNo = $("#salesNo").val();
			salesData.salesFrdatetime = setDateHourMinute($("#salesFrdatetime").val(), $("#startTime").val()); 
			salesData.salesTodatetime = setDateHourMinute($("#salesTodatetime").val(), $("#endTime").val());
			salesData.salesTitle 		= $("#salesTitle").val();
		 	salesData.salesPlace		= $("#salesPlace").val();
			salesData.userNo 		= $("#userNo").val();
			salesData.custNo 		= $("#custName").val() != "" ? Number($("#custNo").val()) : 0;
			salesData.soppNo 		= $("#soppName").val() != "" ? Number($("#soppNo").val()) : 0;
			salesData.ptncNo 		= $("#endCustName").val() != "" ? Number($("#endCustNo").val()) : 0;
			salesData.salesType 		= $("#salesType").val();
			salesData.salesDesc 		= $("#salesDesc").val();
			
			$.ajax({
				url: "${path}/sales/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: salesData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					var eventModal = $('#eventModal');
					if(eventModal[0]) {
						$(".modal-backdrop").remove();
						var url ='${path}/calendar/calmain.do';
						location.href = url;
					}else {
						var url = '${path}/sales/list.do';
						location.href = url;
					}
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		function fn_DeleteSales() {
			var salesData = {};
			salesData.salesNo = Number($("#salesNo").val());

			$.ajax({
				url: "${path}/sales/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: salesData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					var eventModal = $('#eventModal');
					if(eventModal[0]) {
						$(".modal-backdrop").remove();
						var url ='${path}/calendar/calmain.do';
						location.href = url;
					}else {
						var url = '${path}/sales/list.do';
						location.href = url;
					}
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});

		}

		$(document).ready(function(){
			setTimeComboBox(['#startTime', '#endTime']);
			var startDate = '${dto.salesStime}'.split("T")[0];
			var startTimelocal = '${dto.salesStime}'.split("T")[1].substring(0, 5);
			var endDate = '${dto.salesEtime}'.split("T")[0];
			var endTimelocal = '${dto.salesEtime}'.split("T")[1].substring(0, 5);
			
			$('#salesFrdatetime').val(startDate);
			$('#startTime').val(startTimelocal);
			$('#salesTodatetime').val(endDate);
			$('#endTime').val(endTimelocal);

			Sdate = startDate;
			startTime = startTimelocal;
			EDate = endDate;
			endTime = endTimelocal;
		});

	</script>
<c:if test="${empty simple}">
</div>
<jsp:include page="../body-bottom.jsp"/>
</c:if>