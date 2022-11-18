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
						수주 판매 보고 등록
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
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tab02" role="tab">매입매출 내역</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tab03" role="tab">견적 내역</a></li>
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
													<!-- 	<input type="text"
															class="form-control form-control-sm" id="soppTitle"
															name="soppTitle" value=""> <input
															type="hidden" id="soppNo" name="soppNo"
															value=""> -->



															<div class="input-group input-group-sm mb-0">
																		<input type="text" class="form-control" name="soppTitle"
																			id="soppTitle" value="" readonly /> <input
																			type="hidden" name="soppNo" id="soppNo"
																			value="" /> <span class="input-group-btn">
																			<button class="btn btn-primary sch-company"
																				data-remote="${path}/modal/popup.do?popId=sopp"
																				type="button" data-toggle="modal"
																				data-target="#soppModal">
																				<i class="icofont icofont-search"></i>
																			</button>
																		</span>
																		<div class="modal fade " id="soppModal" tabindex="-1"
																			role="dialog">
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
																	id="userName" value="" readonly /> <input
																	type="hidden" name="userNo" id="userNo"
																	value="" /> <span class="input-group-btn">
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
																	id="custName" value="" readonly /> <input
																	type="hidden" name="custNo" id="custNo"
																	value="" /> <span class="input-group-btn">
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
														<th scope="row">엔드유저</th>
														<td>
															<div class="input-group input-group-sm mb-0">
																<input type="text" class="form-control" name="ptncName"
																	id="ptncName" value="" readonly /> <input
																	type="hidden" name="ptncNo" id="ptncNo"
																	value="" /> <span class="input-group-btn">
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
															class="form-control form-control-sm"
															onchange="javascript:changeProbability()">
																<option value="301">영업정보파악</option>
																<option value="320">초기접촉</option>
																<option value="330">제안서제출 및 PT</option>
																<option value="340">견적서제출</option>
																<option value="350">계약요청</option>
																<option value="360">수주</option>
																<option value="380">매출</option>
																<option value="385">수금완료</option>
																<option value="386">은행입금</option>
																<option value="390">계약실패</option>
																<option value="391">발주서입수</option>
																<option value="392">협력사요청</option>
														</select></td>
														<th scope="row">가능성</th>
														<td><span class="input_inline"><input
																type="text" class="form-control form-control-sm"
																id="soppSrate" name="soppSrate" value="${dto.soppSrate}"></span>
															%</td>
													</tr>
													<tr>
														<th scope="row">출처</th>
														<td><select name="soppSource" id="soppSource"
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
														<td><input
															class="form-control form-control-sm col-md-8"
															name="soppTargetDate" id="soppTargetDate" type="date"
															value=""></td>
													</tr>
													<tr>
														<th scope="row">영업 타입</th>
														<td><select name="soppType" id="soppType"
															class="form-control form-control-sm col-md-4">
																<option value="">선택</option>
																<option value="101">신규</option>
																<option value="102">노후화교체</option>
																<option value="103">윈백</option>
																<option value="104">증설</option>
																<option value="105">이중화</option>
																<option value="106">조달구매</option>
																<option value="199">기타</option>
														</select></td>
														<th scope="row">예상매출</th>
														<td><span class="input_inline"><input
																type="text" class="form-control form-control-sm"
																id="soppTargetAmt" name="soppTargetAmt"
																value="${dto.soppTargetAmt}"></span>원</td>
													</tr>
													<tr>
														<th scope="row">설명</th>
														<td colspan="3"><textarea name="soppDesc"
																id="soppDesc" rows="8" class="form-control">${dto.soppDesc}</textarea></td>
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

					<div class="tab-pane " id="tab02" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<form name="form2" method="post" onsubmit="return false;">
									<table class="table table-sm bst02" id="addinout">
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
											<tr class="item1">
												<td>
													<select>
														<option value="1101">매입</option>
														<option value="1102">매출</option>
													</select>
												</td>
												<td><input type="text"  class="form-control form-control-sm readonly" style="min-width:120px;" /></td>
												<td><input type="text" id="data01Netprice" class="form-control form-control-sm" style="min-width:80px;"/></td>
												<td><input type="text" id="data01Quanty" class="form-control form-control-sm" style="min-width:80px;"/></td>
												<td><input type="text" id="data01Amt" class="form-control form-control-sm" style="min-width:80px;"/></td>
												<td><input type="text" class="form-control form-control-sm"/></td>
												<td><button id="Additembtn">추가</button></td>
												<td class="text-center"></td>
											</tr>
										</tbody>
									</table>
								</form>

								  <table class="table table-sm bst02" id="itemlist">
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
										  <tr class="item1">
											  <td></td>
											  <td></td>
											  <td></td>
											  <td></td>
											  <td></td>
											  <td></td>
											  <td><button id="Delitembtn">삭제</button></td>
											  <td class="text-center"></td>
										  </tr>
									  </tbody>
								  </table>

								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/sopp/list.do'">목록</button>
								</div>

							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab03" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<form name="form2" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<tbody>
											<tr>
												<th scope="row">견적추가</th>
											</tr>
										</tbody>
									</table>
									<table class="table table-sm bst02" id="addquty">
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
											  <th class="text-center">추가</th>
										  </tr>
									  </thead>
									  <tbody>
										  <tr class="item1">
											  <td><select >
											  <option value="1201">상품</option>
											  <option value="1202">서비스</option>
											  </select></td>
											  <td><input type="text" class="form-control form-control-sm readonly" style="min-width:120px;" /></td>
											  <td><input type="number" class="form-control form-control-sm" style="min-width:80px;"/></td>
											  <td><input type="number" class="form-control form-control-sm" style="min-width:80px;"/></td>
											  <td><input type="number" class="form-control form-control-sm" style="min-width:80px;"/></td>
											  <td><input type="text" class="form-control form-control-sm"/></td>
											  <td><button id="inoutAddbtn">추가</button></td>
											  <td class="text-center"></td>
										  </tr>
									  </tbody>
								  </table>

								</form>
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
											  <tr class="item1">
												  <td></td>
												  <td></td>
												  <td></td>
												  <td></td>
												  <td></td>
												  <td></td>
												  <td><button id="inoutDelbtn">삭제</button></td>
												  <td class="text-center"></td>
											  </tr>
										  </tbody>
								    </table>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/sopp/list.do'">목록</button>
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

	function fn_soppInsert() {
		var soppData = {};
		soppData.soppTitle 		= $("#soppTitle").val();
		soppData.userNo 		= $("#userNo").val();
		soppData.custNo 		= $("#custNo").val();
		soppData.ptncNo 		= $("#ptncNo").val();
		soppData.soppStatus 	= $("#soppStatus").val();
		soppData.soppSrate 		= $("#soppSrate").val();
		soppData.soppSource 	= $("#soppSource").val();
		soppData.soppTargetDate	= $("#soppTargetDate").val();
		soppData.soppType 		= $("#soppType").val();
		soppData.soppTargetAmt 	= $("#soppTargetAmt").val().replace(/[\D\s\._\-]+/g, "");
		soppData.soppDesc 		= $("#soppDesc").val();
		if (!soppData.soppTitle) {
			alert("영업기회 제목을 입력하십시오.!!");
			return;
		}
		else if (!soppData.userNo){
			alert("담당사원을 조회 후 선택해 주십시오.");
			return;
		}
		else if (!soppData.custNo){
			alert("매출처를 조회 후 선택해 주십시오.");
			return;
		}
		else if (!soppData.soppStatus){
			alert(" 진행단계를 선택해 주십시오.");
			return;
		}
		else if (!soppData.soppSrate){
			alert("가능성을 입력해 주십시오.");
			return;
		}
		else if (!soppData.soppSource){
			alert("영업출처를 선택해 주십시오.");
			return;
		}
		else if (!soppData.soppTargetDate){
			alert("매출예정일을 입력해 주십시오.");
			return;
		}
		else if (!soppData.soppType){
			alert("영업타입을 선택해 주십시오.");
			return;
		}
		else if (!soppData.soppTargetAmt){
			alert("예상매출 금액을 입력해 주십시오.");
			return;
		}
		console.log(soppData);
		$.ajax({ url: "${path}/sopp/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
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
		$("#soppTargetAmt").on("keyup", function (event) {
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

		$('#data01Netprice,#data01Quanty').on('keyup',function(){

			var sum1 = parseInt($("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
			var sum2 = parseInt($("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0 );

			var sum = sum1 * sum2;
			$("#data01Netprice").val(sum1.toLocaleString("en-US"));
			$("#data01Quanty").val(sum2.toLocaleString("en-US"));
			$("#data01Amt").val(sum.toLocaleString("en-US"));
		});
		$('#data02Netprice,#data02Qty').on('keyup',function(){
			// data02Quanty

			var sum1 = parseInt($("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
			var sum2 = parseInt($("#data02Qty").val().replace(/[\D\s\._\-]+/g, "") || 0);

			var sum = sum1 * sum2;
			$("#data02Netprice").val(sum1.toLocaleString("en-US"));
			$("#data02Qty").val(sum2.toLocaleString("en-US"));
			$("#data02Amt").val(sum.toLocaleString("en-US"));
		});
	});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>