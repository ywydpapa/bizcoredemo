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
					<div class="d-inline">기술지원 등록</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->
	<!--기술지원 대상등록-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst02">
							<colgroup>
								<col width="5%"/>
								<col width="15%"/>
								<col width="5%"/>
								<col width="15%"/>
								<col width="5%"/>
								<col width="15%"/>
								<col width="5%"/>
								<col width="15%"/>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="requiredTextCss">등록구분</th>
									<td colspan="3">
										<div class="form-radio">
											<form>
												<div class="radio radio-inline">
													<label style="margin-top: 10px;"> <input type="radio" name="contractType" value="NEW" checked="checked"> <i class="helper"></i>신규영업지원
													</label>
												</div>
												<div class="radio radio-inline">
													<label> <input type="radio" name="contractType" value="ING" > <i class="helper"></i>유지보수</label>
												</div>
											</form>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" class="requiredTextCss">기술지원 요청명</th>
									<td><input type="text" class="form-control form-control-sm" id="techdTitle" name="techdTitle" placeholder="기술지원 요청명을 입력하십시오" required></td>
									<th scope="row" class="techdDetailSopp requiredTextCss">영업기회</th>
									<td class="techdDetailSopp">
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="soppTitle"
												   id="soppTitle" value="${dto.soppTitle}" readonly /> <input type="hidden"
																											  name="soppNo" id="soppNo" value="" /> <span
												class="input-group-btn">
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
															<h4 class="modal-title"></h4>
															<button type="button" class="close" onclick="$('#soppModal').modal('hide');"
																	aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>영업기회목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button"
																	class="btn btn-default waves-effect "
																	onclick="$('#soppModal').modal('hide');">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<th scope="row" class="techdDetailCont requiredTextCss">계약</th>
									<td class="techdDetailCont">
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="contTitle"
												   id="contTitle" value="${dto.contTitle}" readonly /> 
												   <input type="hidden" id="contSoppNo" />
												   <input type="hidden" name="contNo" id="contNo" value="" /> 
												   <span class="input-group-btn">
												<button class="btn btn-primary sch-opportunity2"
														data-remote="${path}/modal/popup.do?popId=cont"
														type="button" data-toggle="modal" data-target="#contModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="contModal" tabindex="-1"
												 role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title"></h4>
															<button type="button" class="close" onclick="$('#contModal').modal('hide');"
																	aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>계약 목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button"
																	class="btn btn-default waves-effect "
																	onclick="$('#contModal').modal('hide');">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<th scope="row" class="requiredTextCss">엔드유저</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="endCustName" readonly id="endCustName" value="" />
											<input type="hidden" name="endCustNo" id="endCustNo" value="" /> <span class="input-group-btn">
												<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=endCust" type="button" data-toggle="modal" data-target="#endCustModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="endCustModal" tabindex="-1"
												role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">엔드유저검색</h4>
															<button type="button" class="close" onclick="$('#endCustModal').modal('hide');"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>엔드유저목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button"
																class="btn btn-default waves-effect "
																onclick="$('#endCustModal').modal('hide');">Close</button>
															<button type="button" class="btn btn-success waves-effect" id="custRegSimple">간편추가</button>
														</div>
														<div style="display: none; border: solid; width: 80%; margin: auto; margin-bottom: 5px;" id="custRegSimple_div">
															<table>
																<colgroup>
																	<col width="10%">
																	<col width="75%">
																	<col width="15%">
																</colgroup>
																<tbody>
																	<tr>
																		<th>엔드유저명*</th>
																		<td><input type="text" value="" id="custRegSimple_custName" style="width: 100%;"> </td>
																		<td><button type="button" class="btn-sm btn-dark" id="custRegSimple_custName_check">중복확인</button></td>
																	</tr>
																	<tr>
																		<th>담당자</th>
																		<td><input type="text" value="" id="custRegSimple_custMemerName" style="width: 100%;" placeholder="미입력시 미정으로 세팅됩니다."></td>
																		<td><button type="button" class="btn-sm btn-success" id="custRegSimple_custName_register">등록</button></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<th scope="row">엔드유저 담당자</th>
									<td>

										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="custmemberName"  id="custmemberName" value="" readonly/>
											<input type="hidden" name="custmemberNo" id="custmemberNo" value="" />
											<span class="input-group-btn">
												<button class="btn btn-primary sch-partner"
													data-remote="${path}/modal/popup.do?popId=custmem&compNo="
													type="button" data-toggle="modal" data-target="#custmemberModal"
													id="custmemberModalbtn">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="custmemberModal" tabindex="-1"
												role="dialog">
												<div class="modal-dialog modal-80size" role="document">
													<div class="modal-content modal-80size">
														<div class="modal-header">
															<h4 class="modal-title">고객 검색</h4>
															<button type="button" class="close" onclick="$('#custmemberModal').modal('hide');"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>엔드유저 담당자 목록</h5>
															<p>엔드유저(거래처)를 먼저 입력해주셔야 목록이 보입니다.</p>
														</div>
														<div class="modal-footer">
															<button type="button"
																class="btn btn-default waves-effect "
																onclick="$('#custmemberModal').modal('hide');">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">모델</th>
									<td><input type="text" class="form-control form-control-sm"
										id="techdItemmodel" name="techdItemmodel" placeholder=""></td>
									<th>버전</th>
									<td><input type="text" class="form-control form-control-sm"
										id="techdItemversion" name="techdItemversion" placeholder=""></td>
									<th scope="row">장소</th>
									<td><input type="text" class="form-control form-control-sm" id="techdPlace" name="techdPlace" placeholder=""></td>
									<th scope="row" class="requiredTextCss">담당사원</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="userName" readonly
												   id="userName" value="${sessionScope.userName}" /> <input type="hidden" name="userNo"
																											id="userNo" value="${sessionScope.userNo}" /> <span class="input-group-btn">
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
															<h4 class="modal-title">담당사원 검색</h4>
															<button type="button" class="close" onclick="$('#userModal').modal('hide');"
																	aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>사용자목록</h5>
															<p>Loading!!!</p>
														</div>
														<div class="modal-footer">
															<button type="button"
																	class="btn btn-default waves-effect "
																	onclick="$('#userModal').modal('hide');">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" class="requiredTextCss">지원일자</th>
									<td colspan="3">
										<!-- <div class="col-sm-9 f-left m-b-0 p-l-0"> -->
											<div class="input-group input-group-sm mb-0 mr-1">
												<input class="form-control form-control-sm col-md-4 m-r-10" type="date" max="9999-12-30" id="techdFrom" name="techdFrom" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()),this)">
												<select id="startTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()),this)"></select>
												<span style="line-height:30px;">&nbsp;~&nbsp;</span>
												<input class="form-control form-control-sm col-md-4 m-r-10" type="date" max="9999-12-31" id="techdTo" name="techdTo" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()),this)">
												<select id="endTime" style="width:100px" onChange="javascript:inputDate(setDateHourMinute($('#techdFrom').val(), $('#startTime').val()), setDateHourMinute($('#techdTo').val(), $('#endTime').val()),this)"></select>
											</div>
										<!-- </div> -->
									</td>
									<th scope="row">지원형태</th>
									<td><select name="techdType" id="techdType" class="form-control form-control-sm">
									<option value="">선택</option>
									<c:forEach var="rows" items="${sprttype}">
									<option value="${rows.codeNo}">${rows.desc03}</option>
									</c:forEach>
									</select></td>
									<th scope="row">진행단계</th>
									<td><select name="techdSteps" id="techdSteps"
										class="form-control form-control-sm">
											<option value="">선택</option>
									<c:forEach var="rows" items="${sprtstat}">
									<option value="${rows.codeNo}">${rows.desc03}</option>
									</c:forEach>

									</select></td>
								</tr>
								<tr>
									<th scope="row">설명</th>
									<td colspan="7"><textarea name="techdDesc" id="techdDesc" rows="8"
											class="form-control"></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="btn_wr text-right mt-3">
					<button class="btn btn-md btn-success f-left modal-list-btn" onClick="javascript:location='${path}/techd/list.do'">목록</button>
					<button class="btn btn-md btn-primary" onClick="fn_sprtInsert()">저장</button>
					<button class="btn btn-md btn-inverse modal-cancel-btn" onClick="javascript:location='${path}/techd/list.do'">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!--//기술지원 대상등록-->


	<script>
	$('#endCustModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
	$('#userModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});

	//


	$('#custmemberModal').on('show.bs.modal', function(e) {
		var custNo = $("#endCustNo").val();
		var url = '${path}/modal/popup.do?popId=custmem&compNo=' + custNo;
		$("#custmemberModalbtn").data("remote",url);

		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});

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



	/* function fnSetCustData(a, b) {
		$("#endCustNo").val(b);
		$("#endCustName").val(a);
		$(".modal-backdrop").remove();
		$("#endCustModal").modal("hide");
		
		$("#custmemberModalbtn").attr('disabled', false);
		$("#custmemberModalbtn").removeClass("btn-danger");
		$("#custmemberModalbtn").addClass("btn-primary");
		// 고객검색 아이콘을 danger
		
	} */

	function fnSetUserData(a, b) {
		$("#userName").val(b);
		$("#userNo").val(a);
		$(".modal-backdrop").remove();
		$("#userModal").modal("hide");
	}

	function fnSetCustmereData(a, b) {
		$("#custmemberNo").val(a);
		$("#custmemberName").val(b);
		$(".modal-backdrop").remove();
		$("#custmemberModal").modal("hide");
	}

	function fnSetSoppData(a, b) {
		$("#soppNo").val(b);
		$.ajax({
			url: "${path}/acc/endusernamelist.do/" + b,
			method: "post",
			dataType: "json"
		})
		.done(function(result){
			$("#endCustNo").val(result.data[0].buyrNo);
			$("#endCustName").val(result.data[0].custName);
		});
		$("#soppTitle").val(a);
		$(".modal-backdrop").remove();
		$("#soppModal").modal("hide");
	}

	function fnSetContData(a, b, c, d, e) {
		$("#contNo").val(b);
		$.ajax({
			url: "${path}/acc/endusernamelist_cont.do/" + b,
			method: "post",
			dataType: "json"
		})
		.done(function(result){
			if(result.data[0].buyrNo == '' || result.data[0].buyrNo == null){
				alert("해당 계약은 엔드유저가 등록되어있지 않습니다.");
			}else if(result.data[0].buyrNo != '' || result.data[0].buyrNo != null){
				$("#endCustNo").val(result.data[0].buyrNo);
				$("#endCustName").val(result.data[0].custName);
				$('#custmemberName').val(result.data[0].custMname);
				$('#custmemberNo').val(result.data[0].buyrMemberNo);
			}
		});
		$("#contTitle").val(a);
		$("#contSoppNo").val(e);
		$(".modal-backdrop").remove();
		$("#contModal").modal("hide");
	}
	
	function fnSetEndCustData(a, b) {
		$("#endCustNo").val(b);
		$("#endCustName").val(a);
		$("#endCustmemberModalbtn").data('whatever', b);
		$(".modal-backdrop").remove();
		$("#endCustModal").modal("hide");
	}

	function fn_sprtInsert() {
		var sprtData = {};
		var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
		if(contractType == "NEW"){
			sprtData.soppNo					= $("#soppNo").val();			// 영업기회
			sprtData.exContNo				= 0;							// 기존계약
			sprtData.cntrctMth				= ${contractType[0].codeNo};
		} else {
			console.log($("#contSoppNo").val());
			sprtData.soppNo					= $("#contSoppNo").val();							// 영업기회
			sprtData.exContNo				= $("#contNo").val();			// 기존계약
			sprtData.cntrctMth				= ${contractType[1].codeNo};
		}
		sprtData.techdTitle			= $("#techdTitle").val();					// 기술지원 요청명
		sprtData.userNo				= $("#userNo").val() ? $("#userNo").val() : 0;						// 담당사원
		sprtData.custNo				= $("#custNo").val() ? $("#custNo").val() : 0;						// 거래처
		sprtData.custmemberNo		= $("#custmemberNo").val() ? $("#custmemberNo").val() : 0;					// 고객
		sprtData.techdItemmodel		= $("#techdItemmodel").val();				// 모델
		sprtData.techdItemversion	= $("#techdItemversion").val();				// 버전
		sprtData.techdPlace			= $("#techdPlace").val();					// 장소
		sprtData.techdFrom			= setDateHourMinute($("#techdFrom").val(), $("#startTime").val());					// 지원일자 시작
		sprtData.techdTo			= setDateHourMinute($("#techdTo").val(), $("#endTime").val());						// 지원일자 종료
		sprtData.techdType			= $("#techdType").val();					// 지원형태
		sprtData.techdSteps			= $("#techdSteps").val();					// 진행단계
		sprtData.endCustNo 			= $("#endCustNo").val();
		
		if($("textarea").attr("style") === "display: none;"){
			sprtData.techdDesc			= tinyMCE.get("techdDesc").getContent();
		}else{
			sprtData.techdDesc 		= $("#techdDesc").val();
		}
		
		/* sprtData.soppNo				= $("#soppNo").val() ? $("#soppNo").val() : 0; // 영업기회번호 */
		sprtData.contNo				= $("#contNo").val() ? $("#contNo").val() : 0; // 계약번호
		
		console.log(sprtData.techdFrom);
		
		if(!sprtData.techdTitle){
			alert("기술지원 요청명을 입력하십시오.");
			return;
		} else if(sprtData.techdFrom === null || sprtData.techdTo === null){
			alert("지원일자를 선택하십시오.");
			return;
		} else if($("#endCustName").val() === ""){
			alert("엔드유저를 선택하십시오.");
			return;
		} else if(!contractType) {
			alert("영업기회(신규 영업지원) 및 계약을 입력하십시오.");
			return;
		} else if(contractType != undefined) {
			if(contractType == 'NEW'){
				if ($("#soppTitle").val() == "" || $("#soppTitle").val() == "0"){
					alert("영업기회을 입력하십시오.");
					return;
				}
			} else if (contractType == 'ING'){
				if ($("#contTitle").val() == "" || $("#contTitle").val() == "0"){
					alert("계약을 입력하십시오.");
					return;
				}
			}
		} else if(!sprtData.userNo){
			alert("유저를 선택하십시오.");
			return;
		}
		
		$.ajax({ url: "${path}/techd/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: sprtData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("저장 성공");
						var eventModal = $('#eventModal');
						if(eventModal[0]) {
							$(".modal-backdrop").remove();
							var url ='${path}/calendar/calmain.do';
							location.href = url;
						}else {
							var url = '${path}/techd/list.do';
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

	$(document).ready(function(){
		$('.techdDetailCont').hide();
		$('input[name=contractType]').change(function() {
			if ($(this).val() == 'NEW') {
				$('.techdDetailSopp').show();
				$('.techdDetailCont').hide();
			} else {
				$('.techdDetailSopp').hide();
				$('.techdDetailCont').show();
			}
		});

		setTimeComboBox(['#startTime', '#endTime']);
	});
	
	$("#custRegSimple").on("click",function (event) {
		if($("#custRegSimple_div").is(':visible') == false){
			$("#custRegSimple_div").show();
			$("#custRegSimple").html("간편등록 취소");
		} else {
			$("#custRegSimple_div").hide();
			$("#custRegSimple").html("간편등록");
		}
	});
	
	$("#custRegSimple_custName_check").on("click", function (event) {
		var custRegSimple_custName = $("#custRegSimple_custName").val();
		var obj = new Object();
		obj.custName = custRegSimple_custName;
		$.ajax({
			url: "${path}/cust/custNameCheck", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
			method: "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(data) {
			// console.dir(data);
			if(data.code == 10001){
				// console.log("응답 성공");
				var html= "";
				if(data.result1.length > 0){
					var tempArr = data.result1;
					html += "같은 결과) \n";
					for(var i=0; i<tempArr.length; i++){
						html += "번호 : " + tempArr[i].custNo + " / 매출처 : " + tempArr[i].custName + "\n";
					}
				}

				if(data.result2.length > 0){
					var tempArr = data.result2;
					html += "\n유사 결과) \n";
					for(var i=0; i<tempArr.length; i++){
						html += "번호 : " + tempArr[i].custNo + " / 매출처 : " + tempArr[i].custName + "\n";
					}
				}

				if(data.result1.length == 0 && data.result2.length == 0){
					html += "일치검색, 유사검색결과가 존재하지 않습니다.\n";
				}

				html += "\n등록하시겠습니까?";
				var result = confirm(html);

				if(result){
					// console.log("등록진행");
				} else {
					// console.log("등록거부");
				}
			}else{
				alert("응답 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	});

	$("#custRegSimple_custName_register").on("click", function (event) {
		var custRegSimple_custName = $("#custRegSimple_custName").val();
		var custRegSimple_custMemerName = $("#custRegSimple_custMemerName").val();

		var obj = new Object();
		obj.custName = custRegSimple_custName;
		obj.custMemberName = custRegSimple_custMemerName;

		$.ajax({
			url: "${path}/cust/simpleRegister", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
			method: "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(result) {
			// console.dir(result);
			if(result.code == 10001){
				alert("저장 성공");
				$('#endCustModal').modal('hide');
				$("#endCustName").val(result.data.custName);
				$("#endCustNo").val(result.data.custNo);
			}else{
				alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	});
	
	setTimeComboBox(['#startTime', '#endTime']);
	
	</script>
<c:if test="${empty simple}">
</div>
<jsp:include page="../body-bottom.jsp"/>
</c:if>