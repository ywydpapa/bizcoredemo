<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
					<div class="d-inline">수주판매보고승인</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->
	<div class="cnt_wr">
		<!-- Row start -->
		<div class="row">
			<div class="col-lg-12 col-xl-12">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs  tabs" role="tablist" id="tablist">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab01" role="tab">기본정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab02" role="tab" id="dataType01_tab02">매입매출 내역</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab03" role="tab" id="dataType01_tab03">견적 내역</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab04" role="tab">파일첨부(${fn:length(soppFiles)})</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab05" role="tab">기술지원 내역(${fn:length(techdinsopp)})</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab06" role="tab">영업활동 내역(${fn:length(salesinsopp)})</a></li>
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
														<input type="text" class="form-control form-control-sm" id="soppTitle" name="soppTitle" value="${dto.soppTitle}"> 
														<input type="hidden" id="soppNo" name="soppNo" value="${dto.soppNo}">
													</td>
													<th scope="row" class="requiredTextCss">담당사원</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="userName"
																   id="userName" value="${dto.userName}" /> <input
																type="hidden" name="userNo" id="userNo"
																value="${dto.userNo}" /> <span class="input-group-btn">
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
																			<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
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
													<th scope="row">매출처</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="custName"
																   id="custName" value="${dto.custName}" /> <input
																type="hidden" name="custNo" id="custNo"
																value="${dto.custNo}" /> <span class="input-group-btn">
																	<button class="btn btn-primary sch-company"
																			data-remote="${path}/modal/popup.do?popId=cust"
																			type="button" data-toggle="modal"
																			data-target="#custModal">
																		<i class="icofont icofont-search"></i>
																	</button>
																</span>
															<div class="modal fade " id="custModal" tabindex="-1"
																 role="dialog">
																<div class="modal-dialog modal-80size" role="document">
																	<div class="modal-content modal-80size">
																		<div class="modal-header">
																			<h4 class="modal-title">거래처검색</h4>
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
																			<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</td>
													<th scope="row">매출처 담당자</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="custmemberName" id="custmemberName" value="${dto.custMemberName}" />
															<input type="hidden" name="custmemberNo" id="custmemberNo" value="${cto.custMemberNo}" />
															<span class="input-group-btn">
																	<button class="btn btn-primary sch-partner" data-remote="${path}/modal/popup.do?popId=custmem&compNo=" type="button" data-toggle="modal" data-target="#custmemberModal" id="custmemberModalbtn">
																		<i class="icofont icofont-search"></i>
																	</button>
																</span>
															<div class="modal fade " id="custmemberModal"
																 tabindex="-1" role="dialog">
																<div class="modal-dialog modal-80size" role="document">
																	<div class="modal-content modal-80size">
																		<div class="modal-header">
																			<h4 class="modal-title">매출처 담당자 목록</h4>
																			<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<h5>매출처 담당자 목록</h5>
																			<p>매출처를 먼저 입력해주셔야 목록이 보입니다.</p>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">엔드유저</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" id="endCustName" value="${dto.buyrName}" />
															<input type="hidden" id="endCustNo" value="${dto.buyrNo}" />
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
													<th scope="row" class="requiredTextCss">진행단계</th>
													<td><select name="soppStatus" id="soppStatus" class="form-control form-control-sm" onchange="javascript:changeProbability()">
														<c:forEach var="sstatuslist" items="${sstatuslist}">
															<option value="${sstatuslist.codeNo}">${sstatuslist.desc03}</option>
														</c:forEach>
													</select></td>
													<th scope="row">가능성</th>
													<td class="text-right">
														<span class="input_inline">
															<input type="text" style="text-align:right;" class="form-control form-control-sm" id="soppSrate" name="soppSrate" value="${dto.soppSrate}">
														</span>
														%
													</td>
													<th scope="row">계약구분</th>
													<td>
														<select name="cntrctMth" id="cntrctMth" class="form-control form-control-sm">
															<option value="">선택</option>
															<option value="10247" <c:if test="${dto.cntrctMth eq 10247}">selected</c:if> >판매계약</option>
															<option value="10248" <c:if test="${dto.cntrctMth eq 10248}">selected</c:if> >유지보수</option>
															<option value="10254" <c:if test="${dto.cntrctMth eq 10254}">selected</c:if> >임대계약</option>
														</select>
													</td>
												</tr>
												<tr>
													<th scope="row">매출예정일</th>
													<td>
														<input class="form-control form-control-sm" name="soppTargetDate" id="soppTargetDate" type="date" max="9999-12-30" value="${dto.soppTargetDate}">
													</td>
													<th scope="row">판매방식</th>
													<td>
														<select name="soppType" id="soppType" class="form-control form-control-sm">
														<option value="">
															선택
														</option>
														<c:forEach var="saleslist" items="${saleslist}">
															<option value="${saleslist.codeNo}"
																<c:if test="">selected</c:if>>${saleslist.desc03}</option>
														</c:forEach>
														</select>
													</td>
													<th scope="row">예상매출</th>
													<td class="text-right">
														<span class="input_inline">
														<input
															style="text-align: right" type="text"
															class="form-control form-control-sm" id="soppTargetAmt"
															name="soppTargetAmt"
															value="<fmt:formatNumber value="${dto.soppTargetAmt}" pattern="#,###"/>">
														</span>원
													</td>
													<th class="requiredTextCss" id="Maintenance_name" style="display: none;">유지보수 기간</th>
													<td id="Maintenance_input" style="display: none; line-height: 30px;">
														<div class="input-group input-group-sm mb-0">
															<input class="form-control form-control-sm col-sm-6 m-r-5" type="date" max="9999-12-30" id="maintenance_S" value="${dto.maintenance_S}"> ~ <input class="form-control form-control-sm col-sm-6 m-l-5" type="date" max="9999-12-31" id="maintenance_E" value="${dto.maintenance_E}">
														</div>
													</td>	
												</tr>
												<tr>
													<th scope="row">설명</th>
													<td colspan="7"><textarea name="soppDesc" id="soppDesc" rows="8" class="form-control">${dto.soppDesc}</textarea></td>
												</tr>
												<c:if test="${dto.sopp2regDatetime == null}">
												<tr>
													<th scope="row">의견</th>
													<td colspan="7"><textarea name="sopp2Desc" id="sopp2Desc" rows="8" class="form-control"></textarea></td>
												</tr>
												</c:if>
												<c:if test="${dto.sopp2regDatetime != null}">
													<tr>
														<th scope="row">승인/반려 의견<br />(시간 :
															<fmt:parseDate value="${dto.sopp2regDatetime}" var="sopp2regDatetime" pattern="yyyy-MM-dd HH:mm:ss"/>
															<fmt:formatDate value="${sopp2regDatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
															)
														</th>
														<td colspan="7"><textarea name="sopp2Desc" id="sopp2Desc" rows="8" class="form-control">${dto.sopp2Desc}</textarea></td>
													</tr>
												</c:if>
												</tbody>
											</table>

										</div>
									</div>
									<div class="btn_wr text-right mt-3" id="tab01_bottom">
										<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/sopp/list2.do'">목록</button>
										<c:if test="${sessionScope.userRole eq 'ADMIN'}">
											<button class="btn btn-md btn-primary" onClick="fn_sopp2Aprv()">승인</button>
											<button class="btn btn-md btn-inverse" onClick="fn_sopp2Reject()">반려</button>
											<%--
											<c:if test="${dto.userNo eq sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
												<button class="btn btn-md btn-danger" onClick="fn_soppDelete()">삭제</button>
											</c:if>
											--%>
											<button class="btn btn-md btn-warning" onClick="fn_soppUpdate()">수정</button>
											<%--<button class="btn btn-md btn-inverse" onClick="javascript:fnSetPage('${path}/sopp/list.do')">취소</button>--%>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<!--//영업기회등록-->
					</div>
					<div class="tab-pane " id="tab02" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<jsp:include page="/WEB-INF/views/module/inputSet/inputSetProductSalesInOut.jsp"/>
								<jsp:include page="/WEB-INF/views/sopp/inoutlist.jsp"/>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab03" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<jsp:include page="/WEB-INF/views/module/inputSet/inputSetProductSalesEstimate.jsp"/>
								<jsp:include page="/WEB-INF/views/sopp/qutylist.jsp"/>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab04" role="tabpanel">
						<jsp:include page="filelist.jsp"/>
					</div>
					<div class="tab-pane " id="tab05" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<form name="form2" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="10%" />
											<col width="20%" />
											<col width="40%" />
											<col width="20%" />
											<col width="10%" />
										</colgroup>
										<thead>
										<tr>
											<th class="text-center">일자</th>
											<th class="text-center">지원형태</th>
											<th class="text-center">장소</th>
											<th class="text-center">담당자</th>
											<th class="text-center">비고</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach var="row2" items="${techdinsopp}">
											<tr class="item1">
												<td>${row2.techdFrom}</td>
												<td>${row2.techdTypeN}</td>
												<td>${row2.techdPlace}</td>
												<td>${row2.userName}</td>
												<td>${row2.techdDesc}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab06" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<form name="form2" method="post" onsubmit="return false;">
									<table class="table table-sm bst02" id="example">
										<colgroup>
											<col width="10%" />
											<col width="30%" />
											<col width="20%" />
											<col width="10%" />
											<col width="10%" />
											<col width="20%" />
										</colgroup>
										<thead>
										<tr>
											<th class="text-center">일자</th>
											<th class="text-center">활동종류</th>
											<th class="text-center">내역</th>
											<th class="text-center">담당자</th>
											<th class="text-center">장소</th>
											<th class="text-center">비용</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach var="row2" items="${salesinsopp}">
											<tr class="item1">
												<td>${row2.salesFrdatetime}</td>
												<td>${row2.salesTypeN}</td>
												<td>${row2.salesDesc}</td>
												<td>${row2.userName}</td>
												<td>${row2.salesPlace}</td>
												<td>경비관련 연결예정</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
					<div class="btn_wr text-right mt-3" id="tab_common_bottom">
						<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/sopp/list2.do'">목록</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Row end -->
	</div>
	<!--영업기회등록-->
	<script>
	
		if($("#cntrctMth").val() == '10248'){
			$('#Maintenance_name').show();
			$('#Maintenance_input').show();
		};
	
		$("#tablist > li:nth-child(1)").click(function (){
			$("#tab01_bottom").show();
			$("#tab_common_bottom").hide();
		});

		$("#tablist > li:nth-child(n+2)").click(function (){
			$("#tab01_bottom").hide();
			$("#tab_common_bottom").show();
		});

		function fn_Reloaddata01(url, data){
			$("#inoutlist").empty();
			$("#inoutlistSum").remove();
			$("#inoutlist").load(url, data, function(){
				setTimeout(function(){
				}, 500);
			});
		}

		function fn_Reloaddata02(url, data){
			$("#qutylist").empty();
			$("#qutylistSum").remove();
			$("#qutylist").load(url, data, function(){
				setTimeout(function(){
				}, 500);
			});
		}

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

		var soppStatusSelected = '${dto.soppStatus}';
		if (soppStatusSelected != '' && soppStatusSelected != '0') 	$('#soppStatus').val('${dto.soppStatus}').prop("selected",true);
		else $('#soppStatus').val("").prop("selected",true);

		var soppTypeSelected = '${dto.soppType}';
		if (soppTypeSelected != '' && soppTypeSelected != '0') $('#soppType').val('${dto.soppType}').prop("selected",true);
		else $('#soppType').val("").prop("selected",true);

		var soppSourceSelected = '${dto.soppSource}';
		if (soppSourceSelected != '' && soppSourceSelected != '0') 	$('#soppSource').val('${dto.soppSource}').prop("selected",true);
		else $('#soppSource').val("").prop("selected",true);

		// 기존상품외 임의로 기입
		$("#data01Title").on("change",function () {
			$("#productNo1").val("");
		});
		$("#data02Title").on("change",function () {
			$("#productNo2").val("");
		});

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
		function fnSetproductdata(a,b){
			$("#productNo1").val(a);
			$("#data01Title").val(b);
			//$(".modal-backdrop").remove();
			//$("#productdataModal").modal("hide");
			// 모달이 정상적으로 제거되지않아 close 버튼 트리거로 구성함
			$("#productdataModal1").find(".modal-footer button").trigger('click');
		}
		function fnSetproductdata2(a,b){
			$("#productNo2").val(a);
			$("#data02Title").val(b);
			$("#productdataModal2").find(".modal-footer button").trigger('click');
		}
		function fnSetEndCustData(a, b) {
			$("#endCustNo").val(b);
			$("#endCustName").val(a);
			$("#endCustmemberModalbtn").data('whatever', b);
			$(".modal-backdrop").remove();
			$("#endCustModal").modal("hide");
		}


		function fn_soppUpdate() {
			var soppData = {};
			soppData.soppNo 		= $("#soppNo").val();
			soppData.soppTitle 		= $("#soppTitle").val();
			if($("#userName").val() != "")  	soppData.userNo 	= Number($("#userNo").val());
			if($("#custName").val() != "")	soppData.custNo 		= Number($("#custNo").val());
			if($("#endCustName").val() != "")	soppData.buyrNo 	= Number($("#endCustNo").val());
			if($("#soppSrate").val() != "")	soppData.soppSrate 		= Number($("#soppSrate").val());
			if($("#soppType").val() != "")	soppData.soppType 		= Number($("#soppType").val());
			if($("#cntrctMth").val() != "")	soppData.cntrctMth 		= Number($("#cntrctMth").val());
			if($("#custmemberName").val() != "") soppData.custMemberNo = Number($("#custmemberNo").val());
			if($("#soppStatus").val() != "") soppData.soppStatus 	= $("#soppStatus").val();
			if($("#soppSource").val() != "") soppData.soppSource 	= $("#soppSource").val();
			if($("#soppTargetDate").val() != "") soppData.soppTargetDate	= $("#soppTargetDate").val();
			if($("#soppTargetAmt").val() != "") soppData.soppTargetAmt 	= $("#soppTargetAmt").val().replace(/[\D\s\._\-]+/g, "");
			if($("#soppDesc").val() != "") soppData.soppDesc 		= $("#soppDesc").val();
			
			if($("#cntrctMth").val() == '10248'){
				if($('#maintenance_S').val() == '' || $('#maintenance_S').val() == null){
					alert("유지보수 시작일을 확인하십시오.");
					return;
				}else if($('#maintenance_E').val() == '' || $('#maintenance_E').val() == null){
					alert("유지보수 마감일을 확인하십시오.");
					return;
				}else{
					if($("#maintenance_S").val() != "") soppData.maintenance_S 		= $("#maintenance_S").val();
					if($("#maintenance_E").val() != "") soppData.maintenance_E 		= $("#maintenance_E").val();
				}
			}
			
			$.ajax({ url: "${path}/sopp/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: soppData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							var url = '${path}/sopp/list2.do';
							location.href = url;
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
		}

		function fn_soppDelete(){
			var soppData = {};
			soppData.soppNo 		= $("#soppNo").val();
			$.ajax({ url: "${path}/sopp/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: soppData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					var url = '${path}/sopp/list2.do';
					location.href = url;
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		function fn_data02delete(soppdataNo) {
			var msg = "선택한 건을 삭제하시겠습니까?";
			if( confirm(msg) ){
				$.ajax({
					url: "${path}/sopp/deletedata02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: {soppdataNo : soppdataNo}, // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
						.done(function(data) {
							if(data.code == 10001){
								alert("삭제 성공");
								var url="${path}/sopp/qutylist/"+$("#soppNo").val();
								fn_Reloaddata02(url);
							}else{
								alert("삭제 실패");
							}
						}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
						.fail(function(xhr, status, errorThrown) {
							alert("통신 실패");
						});
			}
		}

		function fn_sopp2Aprv() {
			var soppData = {};
			soppData.soppNo 		= $("#soppNo").val();
			soppData.sopp2Desc 		= $("#sopp2Desc").val();
			soppData.soppStatus 	= '${sstatuslist[5].codeNo}'; //수주단계로 변경
			$.ajax({
				url: "${path}/sopp/update2Sopp.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: soppData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("승인되었습니다.");
					/* var msg = "자동 계약서 생성을 진행할까요?";
					if (confirm(msg)){
						autocontCr();
						alert("자동으로 계약이 생성되었습니다. ");
					}else{
						alert("계약등록을 별도로 진행해야 합니다. ");
					} */
					autocontCr();
					location.href="${path}/sopp/list2.do";
				}else{
					alert("승인 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}
		
		function autocontCr(){
			var contData = {};
			contData.contTitle = $("#soppTitle").val()+"(자동생성)";
			contData.soppNo = $("#soppNo").val();
			contData.userNo = $("#userNo").val();
			contData.custNo = $("#custNo").val();
			contData.compNo = ${compNo};
			contData.contType = $("#soppType").val();
			contData.cntrctMth = $("#cntrctMth").val();
			contData.buyrNo =$('#endCustNo').val();
			contData.contAmt = $("#soppTargetAmt").val().replace(/[\D\s\._\-]+/g, "");
			contData.net_profit = $("#product01DiffSum").html().replace(/[\D\s\._\-]+/g, "");
			contData.vatYn = "N";
			console.log(contData);		
			
			//유상 유지보수에 한하여 별개 쿼리
			if($('#cntrctMth').val() == "10248"){
				
				contData.paymaintSdate = $('#maintenance_S').val();
				contData.paymaintEdate = $('#maintenance_E').val();
				
				$.ajax({ url: "${path}/cont/insert_maintenance.do",
					data: contData ,
					method: "POST", 
					dataType: "json" 
				}) 
			};
			//유상 유지보수에 한하여 별개 쿼리
			
			if($('#cntrctMth').val() != "10248"){
				$.ajax({ url: "${path}/cont/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data: contData , // HTTP 요청과 함께 서버로 보낼 데이터 
					method: "POST", // HTTP 요청 메소드(GET, POST 등) 
					dataType: "json" // 서버에서 보내줄 데이터의 타입 
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
					}else{
						alert("계약 저장 실패");
					}
				}) 
				.fail(function(xhr, status, errorThrown) { 
					alert("통신 실패");
				});
			}
		}
		
		function fn_sopp2Reject(){
			var role = '${sessionScope.userRole}';
			if(role != 'ADMIN'){
				alert("관리자만 접근이 가능합니다.");
				return false;
			}

			var soppData = {};
			var soppDataDTOList = new Array();
			var obj = new Object();
			obj.soppNo = $("#soppNo").val();
			obj.sopp2Desc = "";
			soppDataDTOList.push(obj);
			soppData.soppDTOList = soppDataDTOList;
			soppData.soppStatus = '${sstatuslist[7].codeNo}'; 		//수주단계로 변경

			$.ajax({
				url: "${path}/sopp/Aprv.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: JSON.stringify(soppData) , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				contentType:"application/json",
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					if(data.msg != undefined){
						alert(data.msg);
					} else {
						alert("반려처리되었습니다.");
						location.href = "${path}/sopp/list2.do";
					}
				}else{
					alert("반려 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		$(document).ready(function(){
			var $input = $("#soppTargetAmt");

			// 이벤트 시작 ==========================================================================
			// 이벤트시 동작
			$input.on("keyup", function (event) {
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
			});
			$("#tab_common_bottom").hide();
		});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>