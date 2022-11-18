<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					수주판매보고 조회
				</div>
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
			<ul class="nav nav-tabs  tabs" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#tab01" role="tab">기본정보</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#tab02" role="tab">매입매출 내역</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#tab03" role="tab">견적 내역</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#tab04" role="tab">파일첨부</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#tab05" role="tab">기술지원 내역</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#tab06" role="tab">영업활동 내역</a></li>
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
												<col width="15%" />
												<col width="35%" />
												<col width="15%" />
												<col width="35%" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">영업기회</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="soppTitle" id="soppTitle" value="" readonly />
															<input type="hidden" name="soppNo" id="soppNo"	value="${dto.soppNo}" />
															<span class="input-group-btn">
																<button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=sopp"	type="button" data-toggle="modal" data-target="#soppModal">
																	<i class="icofont icofont-search"></i>
																</button>
															</span>
															<div class="modal fade " id="soppModal" tabindex="-1" role="dialog">
																<div class="modal-dialog modal-80size" role="document">
																	<div class="modal-content modal-80size">
																		<div class="modal-header">
																			<h4 class="modal-title">영업기회 검색</h4>
																			<button type="button" class="close"
																				data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<h5>영업기회 목록</h5>
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
													<th scope="row">계약 관련</th>
														<td>
															<div class="input-group input-group-sm mb-0">
																<input type="text" class="form-control" name="contTitle"
																	id="contTitle" value="" readonly /> <input type="hidden"
																	name="contNo" id="contNo" value="" /> <span
																	class="input-group-btn">
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
																				<button type="button" class="close" data-dismiss="modal"
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
																					data-dismiss="modal">Close</button>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</td>
												</tr>
												<tr>
													<th scope="row">담당사원</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="userName"
																id="userName" value="${dto.userName}" readonly /> <input
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
																id="custName" value="${dto.custName}" readonly /> <input
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
																			<h5>거래처목록</h5>
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
												</tr>
												<tr>
													<th scope="row">고객</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="buyrName"
																id="buyrName" value="" readonly /> <input type="hidden"
																name="buyrNo" id="buyrNo" value="" /> <span
																class="input-group-btn">
																<button class="btn btn-primary sch-partner"
																	data-remote="${path}/modal/popup.do?popId=buyr"
																	type="button" data-toggle="modal"
																	data-target="#buyrModal">
																	<i class="icofont icofont-search"></i>
																</button>
															</span>
															<div class="modal fade " id="buyrModal" tabindex="-1"
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
																			<h5>고객목록</h5>
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
													<th scope="row">협력사</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="ptncName"
																id="ptncName" value="${dto.ptncName}" readonly /> <input
																type="hidden" name="ptncNo" id="ptncNo"
																value="${dto.ptncNo}" /> <span class="input-group-btn">
																<button class="btn btn-primary sch-partner"
																	data-remote="${path}/modal/popup.do?popId=ptnc"
																	type="button" data-toggle="modal"
																	data-target="#ptncModal">
																	<i class="icofont icofont-search"></i>
																</button>
															</span>
															<div class="modal fade " id="ptncModal" tabindex="-1"
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
																			<h5>협력사목록</h5>
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
												</tr>
												<tr>
													<th scope="row">진행단계</th>
													<td><select name="soppStatus" id="soppStatus"
														class="form-control form-control-sm" readonly
														onchange="javascript:changeProbability()">
															<c:forEach var = "sstatuslist" items="${sstatuslist}">	
																<option value="${sstatuslist.codeNo}">${sstatuslist.desc03}</option>			
															</c:forEach>
													</select></td>
													<th scope="row">가능성</th>
													<td><span class="input_inline"><input
															type="text" class="form-control form-control-sm"
															id="soppSrate" readonly name="soppSrate" value="${dto.soppSrate}"></span>
														%</td>
												</tr>
												<tr>
													<th scope="row">출처</th>
													<td><select name="soppSource" id="soppSource" readonly
														class="form-control form-control-sm">
															<option value="">선택</option>
															<option value="201">인터넷</option>
															<option value="202">방송</option>
															<option value="203">신문</option>
															<option value="204">거래처</option>
															<option value="205">동료</option>
															<option value="206">기타</option>
													</select></td>
													<th scope="row">매출예정일</th>
													<td><input 	class="form-control form-control-sm col-md-8"
														name="soppTargetDate" id="soppTargetDate" type="date" readonly
														value="${dto.soppTargetDate}"></td>
												</tr>
												<tr>
													<th scope="row">영업 타입</th>
													<td><select name="soppType" id="soppType" readonly
														class="form-control form-control-sm col-md-4">
															<c:forEach var = "saleslist" items="${saleslist}">	
																<option value="${saleslist.codeNo}">${saleslist.desc03}</option>			
															</c:forEach>
													</select></td>
													<th scope="row">예상매출</th>
													<td><span class="input_inline"><input style="text-align:right"
															type="text" class="form-control form-control-sm"
															id="soppTargetAmt" name="soppTargetAmt" readonly value="<fmt:formatNumber value="${dto.soppTargetAmt}" pattern="#,###"/>"></span>원</td>
												</tr>
												<tr>
													<th scope="row">설명</th>
													<td colspan="3"><textarea name="soppDesc" readonly
															id="soppDesc" rows="8" class="form-control">${dto.soppDesc}</textarea></td>
												</tr>
												<tr>
													<th scope="row">의견</th>
													<td colspan="3"><textarea name="sopp2Desc" 
															id="sopp2Desc" rows="8" class="form-control"></textarea></td>
												</tr>
												
											</tbody>
										</table>

									</div>
								</div>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-primary"
										onClick="fn_sopp2Aprv()">승인</button>
									<button class="btn btn-md btn-inverse" onClick="fn_sopp2Reject()">반려</button>
								</div>
							</div>
						</div>
					</div>
					<!--//영업기회등록-->
				</div>

				<div class="tab-pane " id="tab02" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table class="table table-sm bst02" id="inoutlist">
								<colgroup>
									<col width="5%" />
									<col width="30%" />
									<col width="15%" />
									<col width="10%" />
									<col width="20%" />
									<col width="15%" />
									<col width="5%" />
								</colgroup>
								<thead>
									<tr>
										<th class="text-center">구분(매입/매출)</th>
										<th class="text-center">항목</th>
										<th class="text-center">단가</th>
										<th class="text-center">수량</th>
										<th class="text-center">금액</th>
										<th class="text-center">비고</th>
										<th class="text-center">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${dtodata01}">
									<tr class="item1">
										<td><c:if test="${row.dataType eq '1101'}">매입 </c:if><c:if test="${row.dataType eq '1102'}">매출 </c:if></td>
										<td>${row.dataTitle}</td>
										<td style="text-align:right"><fmt:formatNumber value="${row.dataNetprice}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row.dataQuanty}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row.dataAmt}" pattern="#,###"/></td>
										<td>${row.dataRemark}</td>
										<td><button id="inoutDelbtn" onClick="javascript:fn_data01delete(${row.soppdataNo})">삭제</button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tab03" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table class="table table-sm bst02">
								<tbody>
									<tr>
										<th scope="row">견적목록</th>
									</tr>
								</tbody>
							</table>
							<table class="table table-sm bst02" id="qutylist">
								<colgroup>
									<col width="5%" />
									<col width="30%" />
									<col width="15%" />
									<col width="10%" />
									<col width="20%" />
									<col width="15%" />
									<col width="5%" />
								</colgroup>
								<thead>
									<tr>
										<th class="text-center">구분(상품/서비스)</th>
										<th class="text-center">항목</th>
										<th class="text-center">단가</th>
										<th class="text-center">수량</th>
										<th class="text-center">금액</th>
										<th class="text-center">비고</th>
										<th class="text-center">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row2" items="${dtodata02}">
									<tr class="item1">
										<td><c:if test="${row2.dataType eq '2201'}">상품 </c:if><c:if test="${row2.dataType eq '2202'}">서비스</c:if></td>
										<td>${row2.dataTitle}</td>
										<td style="text-align:right"><fmt:formatNumber value="${row2.dataNetprice}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row2.dataQuanty}" pattern="#,###"/></td>
										<td style="text-align:right"><fmt:formatNumber value="${row2.dataAmt}" pattern="#,###"/></td>
										<td>${row2.dataRemark}</td>
										<td><button id="inoutDelbtn" onClick="javascript:fn_data02delete(${row2.soppdataNo})">삭제</button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left"
									onClick="javascript:location='${path}/sopp/list.do'">목록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tab04" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form2" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<colgroup>
										<col width="25%" />
										<col width="45%" />
										<col width="20%" />
										<col width="10%" />
									</colgroup>
									<thead>
										<th class="text-center">일자</th>
										<th class="text-center">파일설명</th>
										<th class="text-center">파일명</th>
										<th class="text-center">추가</th>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td><button>추가</button></td>
										</tr>
									</tbody>
								</table>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left"
									onClick="javascript:location='${path}/sopp/list.do'">목록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tab05" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
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
										<th class="text-center">일자</th>
										<th class="text-center">양업종류</th>
										<th class="text-center">장소</th>
										<th class="text-center">담당자</th>
										<th class="text-center">비고</th>
									</thead>
									<tbody>
									<c:forEach var="row2" items="${salesinsopp}">
									<tr class="item1">
										<td>${row2.salesFrdatetime}</td>
										<td>${row2.salesTypeN}</td>
										<td>${row2.salesPlace}</td>
										<td>${row2.userName}</td>
										<td>${row2.salesDesc}</td>
									</tr>
									</c:forEach>									</tbody>
								</table>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left"
									onClick="javascript:location='${path}/sopp/list.do'">목록</button>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane " id="tab06" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
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
									</c:forEach>																		</tbody>
								</table>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left"
									onClick="javascript:location='${path}/sopp/list.do'">목록</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Row end -->
</div>
<!--영업기회등록-->
<script>
	$('#soppStatus').val('${dto.soppStatus}').prop("selected",true);
	$('#soppType').val('${dto.soppType}').prop("selected",true);
	$('#soppSource').val('${dto.soppSource}').prop("selected",true);
	
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
	
	function fnSetSoppData(a, b) {
		$("#soppNo").val(b);
		$("#soppTitle").val(a);
		$(".modal-backdrop").remove();
		$("#soppModal").modal("hide");
	}
	function fnSetContData(a, b) {
		$("#contNo").val(b);
		$("#contTitle").val(a);
		$(".modal-backdrop").remove();
		$("#contModal").modal("hide");
	}
		
	function fn_sopp2Aprv() {
		var soppData = {};
		soppData.soppNo 		= $("#soppNo").val();
		soppData.sopp2Desc 		= $("#sopp2Desc").val();
		soppData.soppStatus 	= '10058'; //수주단계로 변경
		// console.log(soppData);
		$.ajax({ url: "${path}/sopp/insert2.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data: soppData , // HTTP 요청과 함께 서버로 보낼 데이터 
					method: "POST", // HTTP 요청 메소드(GET, POST 등) 
					dataType: "json" // 서버에서 보내줄 데이터의 타입 
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("승인되었습니다.");
						location.herf="/sopp/list2.do";
					}else{
						alert("승인 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
				.fail(function(xhr, status, errorThrown) { 
					alert("통신 실패");
				});
		}
	
	function fn_sopp2Reject() {
		var soppData = {};
		soppData.soppNo 		= $("#soppNo").val();
		soppData.sopp2Desc 		= $("#sopp2Desc").val();
		soppData.soppStatus 	= '10068'; //수주단계로 변경
		// console.log(soppData);
		$.ajax({ url: "${path}/sopp/insert2.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data: soppData , // HTTP 요청과 함께 서버로 보낼 데이터 
					method: "POST", // HTTP 요청 메소드(GET, POST 등) 
					dataType: "json" // 서버에서 보내줄 데이터의 타입 
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("반려처리 되었습니다.");
						location.herf="/sopp/list2.do";
					}else{
						alert("승인 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
				.fail(function(xhr, status, errorThrown) { 
					alert("통신 실패");
				});
		}


</script>