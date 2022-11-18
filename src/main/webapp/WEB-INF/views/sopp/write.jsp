<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						영업기회등록
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->
	<!--Page-header end 페이지 타이틀 -->
	<div class="cnt_wr">
		<!-- Row start -->
		<div class="row">
			<div class="col-lg-12 col-xl-12">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs  tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#tab01" role="tab">기본정보</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabs m-t-20">
					<div class="tab-pane active" id="tab01" role="tabpanel">
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
														<th scope="row" class="requiredTextCss">영업기회명</th>
														<td>
															<input type="text" class="form-control form-control-sm" id="soppTitle" name="soppTitle" value="">
															<input type="hidden" id="soppNo" name="soppNo" value="">
														</td>
														<th scope="row" class="requiredTextCss">담당사원</th>
														<td>
															<div class="input-group input-group-sm mb-0">
																<input type="text" class="form-control" name="userName"	id="userName" value="${userInfo.userName}" readonly>
																<input type="hidden" name="userNo" id="userNo" value="${userInfo.userNo}" />
																<span class="input-group-btn">
																	<button class="btn btn-primary sch-company"
																		data-remote="${path}/modal/popup.do?popId=user"
																		type="button" data-toggle="modal"
																		data-target="#userModal">
																		<i class="icofont icofont-search"></i>
																	</button>
																</span>
																<div class="modal fade " id="userModal" tabindex="-1"
																	role="dialog">
																	<div class="modal-dialog modal-80size" role="document">
																		<div class="modal-content modal-80size">
																			<div class="modal-header">
																				<h4 class="modal-title"></h4>
																				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
																					data-dismiss="modal">Close</button>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</td>
														<th class="requiredTextCss" scope="row">매출처</th>
														<td>
															<div class="input-group input-group-sm mb-0">
																<input type="text" class="form-control" name="custName" id="custName" value="" readonly>
																<input type="hidden" name="custNo" id="custNo" value="" />
																<span class="input-group-btn">
																	<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=cust" type="button" data-toggle="modal" data-target="#custModal">
																		<i class="icofont icofont-search"></i>
																	</button>
																</span>
																<div class="modal fade " id="custModal" tabindex="-1"
																	role="dialog">
																	<div class="modal-dialog modal-80size" role="document">
																		<div class="modal-content modal-80size">
																			<div class="modal-header">
																				<h4 class="modal-title">매출처검색</h4>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">
																				<h5>매출처목록</h5>
																				<p>Loading!!!</p>
																			</div>
																			<div class="modal-footer">
																				<button type="button"
																					class="btn btn-default waves-effect "
																					data-dismiss="modal">Close</button>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</td>
														<th scope="row">매출처 담당자</th>
														<td>
															<div class="input-group input-group-sm mb-0">
																<input type="text" class="form-control" name="custmemberName"  id="custmemberName" value="" readonly>
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
																				<h4 class="modal-title">매출처 담당자 검색</h4>
																				<button type="button" class="close"	data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">
																				<h5>매출처 담당자 목록</h5>
																				<p>매출처를 먼저 입력해주셔야 목록이 보입니다.</p>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="close"	data-dismiss="modal" aria-label="Close"/>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</td>
													</tr>
													
													<tr>
														<th class="requiredTextCss" scope="row">엔드유저</th>
														<td>
															<div class="input-group input-group-sm mb-0">
																<input type="text" class="form-control" id="endCustName" value="" readonly>
																<input type="hidden" id="endCustNo" value="" />
																<span class="input-group-btn">
																	<button class="btn btn-primary sch-partner" data-remote="${path}/modal/popup.do?popId=endCust" type="button" data-toggle="modal" data-target="#endCustModal">
																		<i class="icofont icofont-search"></i>
																	</button>
																</span>
																<div class="modal fade " id="endCustModal" tabindex="-1" role="dialog">
																	<div class="modal-dialog modal-80size" role="document">
																		<div class="modal-content modal-80size">
																			<div class="modal-header">
																				<h4 class="modal-title">엔드유저검색</h4>
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
														<th scope="row" class="requiredTextCss">진행단계</th>
														<td><select name="soppStatus" id="soppStatus" class="form-control form-control-sm">
																<option value="10178">영업정보파악</option>
																<option value="10179">초기접촉</option>
																<option value="10180">제안서제출 및 PT</option>
																<option value="10181">견적서제출</option>
																<%--<option value="10182">계약요청</option>
																<option value="">수금완료</option>
																<option value="">은행입금</option>
																<option value="10187">계약실패</option>
																<option value="10193">계약진행보류</option>
																<option value="">발주서입수</option>
																<option value="">협력사요청</option>--%>
														</select></td>
														<th scope="row">가능성</th>
														<td class="text-right">
															<span class="input_inline">
																<input type="text" class="form-control form-control-sm" id="soppSrate" name="soppSrate"  style="text-align:right;" value="0">
															</span>
															%
														</td>
														<th class="requiredTextCss" scope="row">계약구분</th>
														<td><select name="cntrctMth" id="cntrctMth"
															class="form-control form-control-sm" onchange="test()">
																<option value="">선택</option>
																<option value="10247">판매계약</option>
																<option value="10248">유지보수</option>
																<option value="10254">임대계약</option>
														</select></td>
													</tr>
													
													<tr>
														<th scope="row">매출예정일</th>
														<td>
															<input class="form-control form-control-sm" name="soppTargetDate" id="soppTargetDate" type="date" max="9999-12-31" value="0">
														</td>
														<th class="requiredTextCss" scope="row">판매방식</th>
														<td>
														<!-- <select name="soppType" id="soppType"
															class="form-control form-control-sm col-md-4">
																<option value="">선택</option>
																<option value="101">신규</option>
																<option value="102">노후화교체</option>
																<option value="103">윈백</option>
																<option value="104">증설</option>
																<option value="105">이중화</option>
																<option value="106">조달구매</option>
																<option value="199">기타</option>
														</select> -->
															<select class="form-control form-control-sm" name="soppType" id="soppType">
																<option value>선택</option>
																<c:forEach var = "saleslist" items="${saleslist}">
																	<option value="${saleslist.codeNo}">${saleslist.desc03}</option>
																</c:forEach>
															</select>
														</td>
														<th scope="row">예상매출</th>
														<td class="text-right"><span class="input_inline">
															<input type="text" class="form-control form-control-sm" id="soppTargetAmt" name="soppTargetAmt" onkeyup="moneyFormatInput(this);" style="text-align:right;" value="0"></span>원
														</td>
														<th class="requiredTextCss" id="Maintenance_name" style="display: none;">유지보수 기간</th>
														<td id="Maintenance_input" style="display: none; line-height: 30px;">
															<div class="input-group input-group-sm mb-0">
																<input class="form-control form-control-sm col-sm-6 m-r-5" type="date" max="9999-12-30" id="maintenance_S"> ~ <input class="form-control form-control-sm col-sm-6 m-l-5" type="date" max="9999-12-31" id="maintenance_E">
															</div>
														</td>
													</tr>
													<tr>
														<th scope="row">설명</th>
														<td colspan="7"><textarea name="soppDesc" id="soppDesc" rows="8" class="form-control">${dto.soppDesc}</textarea></td>
													</tr>
												</tbody>
											</table>

										</div>
									</div>
									<div class="btn_wr text-right mt-3">
										<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/sopp/list.do'">목록</button>
										<button class="btn btn-md btn-primary" onClick="fn_soppInsert()">등록</button>
										<button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/sopp/list.do'">취소</button>
									</div>
								</div>
							</div>
						</div>
						<!--//영업기회등록-->
					</div>
				</div>
			</div>
		</div>
		<!-- Row end -->
	</div>
		<!--영업기회등록-->
	<script>
			function test(){
				if($('#cntrctMth').val() == '10248'){
					$('#Maintenance_name').show();
					$('#Maintenance_input').show();
				}else{
					$('#Maintenance_name').hide();
					$('#Maintenance_input').hide();
				}
			}
		
			$("#maintenance_S").change(function(){
				var dateValue = $(this).val();
				var dateValueArr = dateValue.split("-");
				var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
				var EdateValue = $("#maintenance_E").val();
				var EdateDateArr = EdateValue.split("-");
				var EdateDateCom = new Date(EdateDateArr[0], parseInt(EdateDateArr[1])-1, EdateDateArr[2]);
				
				if(EdateValue == ""){
					dateValueCom.setDate(dateValueCom.getDate()+1);
				}else if(dateValueCom.getTime() > EdateDateCom.getTime()){
					alert("시작일이 종료일보다 클 수 없습니다.");
					dateValueCom.setDate(dateValueCom.getDate()+1);
				}else{
					return null;
				}
				
				var year = dateValueCom.getFullYear();
				var month = dateValueCom.getMonth()+1;
				var day = dateValueCom.getDate();
				
				if(month < 10){
					month = "0" + month;
				}
				
				if(day < 10){
					day = "0" + day;
				}
				
				$("#maintenance_E").val(year + "-" + month + "-" + day);
			});
			
			$("#maintenance_E").change(function(){
				var SdateValue = $("#maintenance_S").val();
				var SdateValueArr = SdateValue.split("-");
				var SdateValueCom = new Date(SdateValueArr[0], parseInt(SdateValueArr[1])-1, SdateValueArr[2]);
				var thisDateValue = $(this).val();
				var thisDateArr = thisDateValue.split("-");
				var thisDateCom = new Date(thisDateArr[0], parseInt(thisDateArr[1])-1, thisDateArr[2]);
				
				if(SdateValue == ""){
					thisDateCom.setDate(thisDateCom.getDate()-1);
				}else if(SdateValueCom.getTime() > thisDateCom.getTime()){
					alert("종료일이 시작일보다 작을 수 없습니다.");
					thisDateCom.setDate(thisDateCom.getDate()-1);
				}else{
					return null;
				}
				
				var year = thisDateCom.getFullYear();
				var month = thisDateCom.getMonth()+1;
				var day = thisDateCom.getDate();
				
				if(month < 10){
					month = "0" + month;
				}
				
				if(day < 10){
					day = "0" + day;
				}
				
				$("#maintenance_S").val(year + "-" + month + "-" + day);
			});
	
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
			$('#buyrModal').on('show.bs.modal', function(e) {
				var button = $(e.relatedTarget);
				var modal = $(this);
				modal.find('.modal-body').load(button.data("remote"));
			});
			$('#ptncModal').on('show.bs.modal', function(e) {
				var button = $(e.relatedTarget);
				var modal = $(this);
				modal.find('.modal-body').load(button.data("remote"));
			});
			$('#custmemberModal').on('show.bs.modal', function(e) {
				var custNo = $("#custNo").val();
				var url = '${path}/modal/popup.do?popId=custmem&compNo=' + custNo;
				$("#custmemberModalbtn").data("remote",url);

				var button = $(e.relatedTarget);
				var modal = $(this);
				modal.find('.modal-body').load(button.data("remote"));
			});
			$('#endCustModal').on('show.bs.modal', function(e) {
				var button = $(e.relatedTarget);
				var modal = $(this);
				modal.find('.modal-body').load(button.data("remote"));
			});

			function fnSetCustmereData(a, b) {
				$("#custmemberNo").val(a);
				$("#custmemberName").val(b);
				$(".modal-backdrop").remove();
				$("#custmemberModal").modal("hide");
			}
			function fnSetCustData(a, b) {
				$("#custNo").val(b);
				$("#custName").val(a);
				$(".modal-backdrop").remove();
				$("#custModal").modal("hide");
			}
			function fnSetUserData(a, b) {
				$("#userName").val(b);
				$("#userNo").val(a);
				$(".modal-backdrop").remove();
				$("#userModal").modal("hide");
			}
			function fnSetBuyrData(a, b) {
				$("#buyrNo").val(b);
				$("#buyrName").val(a);
				$(".modal-backdrop").remove();
				$("#buyrModal").modal("hide");
			}
			function fnSetPtncData(a, b) {
				$("#ptncNo").val(b);
				$("#ptncName").val(a);
				$(".modal-backdrop").remove();
				$("#ptncModal").modal("hide");
			}
			function fnSetEndCustData(a, b) {
				$("#endCustNo").val(b);
				$("#endCustName").val(a);
				$("#endCustmemberModalbtn").data('whatever', b);
				$(".modal-backdrop").remove();
				$("#endCustModal").modal("hide");
			}

	function fn_soppInsert() {
		var soppData = {};
		soppData.soppTitle 		= $("#soppTitle").val();
		if($("#userName").val() != "")  	soppData.userNo 		= Number($("#userNo").val());
		if($("#custName").val() != "")	soppData.custNo 		= Number($("#custNo").val());
		if($("#endCustName").val() != "")	soppData.buyrNo 		= Number($("#endCustNo").val());
		if($("#soppSrate").val() != "")	soppData.soppSrate 		= Number($("#soppSrate").val());
		if($("#soppType").val() != "")	soppData.soppType 		= Number($("#soppType").val());
		if($("#cntrctMth").val() != "")	soppData.cntrctMth 		= Number($("#cntrctMth").val());
		if($("#custmemberName").val() != "") soppData.custMemberNo = Number($("#custmemberNo").val());
		if($("#soppStatus").val() != "") soppData.soppStatus 	= $("#soppStatus").val();
		if($("#soppTargetDate").val() != "") soppData.soppTargetDate	= $("#soppTargetDate").val();
		if($("#soppTargetAmt").val() != "") soppData.soppTargetAmt 	= $("#soppTargetAmt").val().replace(/[\D\s\._\-]+/g, "");
		if(tinyMCE.get("soppDesc").getContent() != "") soppData.soppDesc 		= tinyMCE.get("soppDesc").getContent();
		
		if($("#cntrctMth").val() == '10248'){
			if($('#maintenance_S').val() == ''){
				alert("유지보수 시작일을 선택해주십시오.!!");
				return;
			}
			if($('#maintenance_E').val() == ''){
				alert("유지보수 마감일을 선택해주십시오.!!");
				return;
			}
			soppData.maintenance_S = $('#maintenance_S').val();
			soppData.maintenance_E = $('#maintenance_E').val();
		}else {
			soppData.maintenance_S = '0000-00-00';
			soppData.maintenance_E = '0000-00-00';
		}
		
		console.dir(soppData);
		// 필수값 체크
		if (!soppData.soppTitle) {
			alert("영업기회명을 입력하십시오.!!");
			return;
		} else if(!soppData.custNo){
			alert("매출처를 선택해주십시오.");
			return;
		} else if(!soppData.buyrNo){
			alert("엔드유저를 선택해주십시오.");
			return;
		} else if(!soppData.cntrctMth){
			alert("계약구분을 선택해주십시오.");
			return;
		} else if(!soppData.soppType){
			alert("판매방식을 선택해주십시오.");
			return;
		}
		
		console.dir(soppData);

		$.ajax({ url: "${path}/sopp/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data: soppData, // HTTP 요청과 함께 서버로 보낼 데이터
			method: "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(data) {
			if(data.code == 10001){
				alert("저장 성공");
				var url = '${path}/sopp/list.do';
				location.href = url;
			}else{
				alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}

	</script>

	<script>
	$(document).ready(function(){
		// 옵션추가 버튼 클릭시
		$("#AdditemBtn").click(function(){
			// item 의 최대번호 구하기
			var lastItemNo = $("#itemlist tr:last").attr("class").replace("item", "");
			var newitem = $("#itemlist tr:eq(1)").clone();
			newitem.removeClass();
			newitem.find("td:eq(0)").attr("rowspan", "1");
			newitem.addClass("item"+(parseInt(lastItemNo)+1));
			$("#itemlist").append(newitem);
		});

		// 이벤트 시작 ==========================================================================
		// 이벤트시 동작
		/* $("#soppTargetAmt").on("keyup", function (event) {
			// 긁어와서 이벤트 체크
			var selection = window.getSelection().toString();
			if (selection !== '') return;
			if ($.inArray(event.keyCode, [38, 40, 37, 39]) !== -1) return;

			// 긁어오는값을 콤마를 제거해서 숫자변환
			var $this = $(this);
			var input = $this.val();
			var input = input.replace(/[\D\s\._\-]+/g, "");
			input = input ? parseInt(input, 10) : 0;
			var ti = input;

			// 데이터 반환
			$this.val(function () {
				return (input === 0) ? "0" : input.toLocaleString("en-US");
			});
		}); */
	});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>