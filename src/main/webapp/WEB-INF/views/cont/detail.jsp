<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

	<script type="text/javascript">
		$('input[name=contractType]').on('click', function() {
			if ($(this).val() == 'NEW') {
				$('.contDetailSopp').show();
				$('.contDetailCont').hide();
			} else {
				$('.contDetailSopp').hide();
				$('.contDetailCont').show();
			}
		});
	</script>
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						계약 조회
					</div>
				</div>
			</div>
		</div>
	</div>

			<div class="col-lg-12 col-xl-12">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs  tabs" role="tablist" id="tablist">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab01" role="tab">기본정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab02" role="tab" id="dataType01_tab02">매입매출 내역(${fn:length(dtodata01)})</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab03" role="tab" id="dataType01_tab03">견적 내역</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab04" role="tab">파일첨부(${fn:length(contFiles)})</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab05" role="tab">기술지원 내역(${fn:length(techdinsopp)})</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab06" role="tab">영업활동 내역(${fn:length(salesinsopp)})</a></li>
					<c:if test="${sessionScope.userRole eq 'ADMIN'}">
						<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab07" role="tab">계산서 발행요청</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab08" role="tab">기여도 설정</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab09" role="tab">계산서 연결현황(${fn:length(data)})</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabs m-t-20">
					<div class="tab-pane active" id="tab01" role="tabpanel">
					<!--계약등록-->
					<div class="cnt_wr">
						<h5 class="cont_title"><i class="icofont icofont-square-right"></i>계약정보</h5>
						<div class="row">
							<div class="col-sm-12">
								<div class="card-block table-border-style">
									<div class="table-responsive">
										<table class="table table-sm bst02">
											<colgroup>
												<col width="5%" />
												<col width="15%" />
												<col width="5%" />
												<col width="15%" />
												<col width="5%" />
												<col width="15%" />
												<col width="5%" />
												<col width="15%" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">등록구분</th>
													<td colspan="3">
														<div class="form-radio">
															<form>
																<div class="radio radio-inline">
																	<label style="margin-top: 10px;"> <input type="radio" name="contractType" value="NEW" <c:if test="${contDto.cntrctMthN == '판매계약'}">checked</c:if>> <i class="helper"></i>판매계약</label>
																</div>
																<div class="radio radio-inline">
																	<label style="margin-top: 10px;"> <input type="radio" name="contractType" value="OLD" <c:if test="${contDto.cntrctMthN == '유지보수'}">checked</c:if>> <i class="helper"></i>유지보수</label>
																</div>
															</form>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" class="requiredTextCss">계약명</th>
													<td>
														<input type="text" class="form-control form-control-sm" id="contTitle" name="contTitle" value="${contDto.contTitle }">
														<input type="hidden" class="form-control" name="soppNo" id="soppNo" value="${contDto.soppNo}" />
													</td>
													<th scope="row" >계약번호</th>
													<td>
														<input type="text" id="contNo" name="contNo" class="form-control" readonly value="${contDto.contNo}">
													</td>
													<th class="contDetailSopp requiredTextCss">영업기회</th>
													<td class="contDetailSopp">
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="soppTitle" id="soppTitle" value="${contDto.soppTitle}" readonly>
															<input type="hidden" class="form-control" name="soppNo" id="soppNo" value="${contDto.soppNo}" />
															<span class="input-group-btn">
																<button class="btn btn-primary sch-opportunity2"
																	data-remote="${path}/modal/popup.do?popId=sopp"
																	type="button" data-toggle="modal" data-target="#soppModal">
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
																			<button type="button"
																				class="btn btn-default waves-effect "
																				data-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</td>
													<th class="contDetailCont requiredTextCss">영업기회</th>
													<td class="contDetailCont">
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="oldContTitle" id="oldContTitle" value="${contDto.exContName}"readonly>
															<input type="hidden" name="oldContNo" id="oldContNo" value="${contDto.exContNo}" />
															<span class="input-group-btn">
																<button class="btn btn-primary sch-opportunity2" data-remote="${path}/modal/popup.do?popId=cont"
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
																			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<h5>계약 목록</h5>
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
													<th scope="row" class="requiredTextCss">담당사원</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="userName" id="userName" value="${contDto.userName}" readonly>
															<input type="hidden" class="form-control" name="userNo" id="userNo" value="${contDto.userNo}" />
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
																			<h4 class="modal-title"></h4>
																			<button type="button" class="close" data-dismiss="modal"
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
																				data-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th class="requiredTextCss" scope="row">판매방식</th>
													<td>
														<select name="contType" class="form-control form-control-sm" id="contType">
															<option value="">선택</option>
															<c:forEach var ="contType" items="${contType}">
																<option value = "${contType.codeNo}" <c:if test="${contDto.contType == contType.codeNo}">selected</c:if>>${contType.desc03}</option>
															</c:forEach>
														</select>
													</td>
													<th class="requiredTextCss">매출처</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="custName" id="custName" value="${contDto.custName}" readonly>
															<input type="hidden" name="custNo" id="custNo" value="${contDto.custNo}" /> <span class="input-group-btn">
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
																			<h4 class="modal-title">매출처검색</h4>
																			<button type="button" class="close" data-dismiss="modal"
																					aria-label="Close">
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
													<th>매출처 담당자</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" id="custmemberName" name="custmemberName" class="form-control" value="${contDto.custmemberName}" readonly>
															<input type="hidden" id="custmemberNo" name="custmemberNo" class="form-control " value="${contDto.custmemberNo}">
															<span class="input-group-btn">
																<button class="btn btn-primary sch-company btn-sm" type="button"><i class="icofont icofont-search"></i></button>
															</span>
														</div>
													</td>
													<th class="requiredTextCss" scope="row">엔드유저</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" id="endCustName" value="${contDto.buyrName}" readonly>
                                                            <input type="hidden" id="endCustNo" value="${contDto.buyrNo}" />
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
												</tr>
												
												<tr>
													<th>엔드유저 담당자</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" id="endCustmemberName" name="endCustmemberName" class="form-control" value="${contDto.buyrMemberName}" readonly>
															<input type="hidden" id="endCustmemberNo" name="endCustmemberNo" class="form-control " value="${contDto.buyrMemberNo}">
															<span class="input-group-btn">
																<button class="btn btn-primary sch-company btn-sm"  data-remote="${path}/modal/popup.do?popId=endCustmem&compNo=" type="button" data-toggle="modal" data-target="#endCustmemberModal" id="endCustmemberModalbtn" data-whatever="">
																	<i class="icofont icofont-search"></i>
																</button>
															</span>
															<div class="modal fade " id="endCustmemberModal" tabindex="-1" role="dialog">
																<div class="modal-dialog modal-80size" role="document">
																	<div class="modal-content modal-80size">
																		<div class="modal-header">
																			<h4 class="modal-title">고객 검색</h4>
																			<button type="button" class="close" onclick="$('#endCustmemberModal').modal('hide');" aria-label="Close">
																				<span aria-hidden="true">&times;</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<h5>엔드유저 고객 목록</h5>
																			<p>엔드유저를 먼저 입력해주셔야 목록이 보입니다.</p>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-default waves-effect" onclick="$('#endCustmemberModal').modal('hide');">Close</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</td>
													<th scope="row">발주일자</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input class="form-control form-control-sm" type="date" id="contOrddate" name="contOrddate" value="${contDto.contOrddate}">
														</div>
													</td>
													<th scope="row">검수일자</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input class="form-control form-control-sm " type="date" id="delivDate" name="delivDate" value="${contDto.delivDate}">
														</div>
													</td>
													<th>(부)담당사원</th>
													<td>
														<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-control" name="secondUserName" id="secondUserName" value="${contDto.secondUserName}" readonly>
															<input type="hidden" class="form-control" name="secondUserNo" id="secondUserNo" value="${contDto.secondUserNo}" />
															 <span class="input-group-btn">
																<button class="btn btn-primary sch-company"
																	data-remote="${path}/modal/popup.do?popId=secondUser"
																	type="button" data-toggle="modal" data-target="#secondUserModal">
																	<i class="icofont icofont-search"></i>
																</button>
															</span>
															<div class="modal fade " id="secondUserModal" tabindex="-1"
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
												</tr>
												<tr>
													<th scope="row" class="contDetailSopp">무상 유지보수일자</th>
													<td class="contDetailSopp">
														<div class="input-group input-group-sm mb-0">
															<input class="form-control " type="date" id="freemaintSdate" value="${contDto.freemaintSdate}" >
															<span style="line-height:30px;">&nbsp;~&nbsp;</span>
															<input class="form-control " type="date" id="freemaintEdate" value="${contDto.freemaintEdate}">
														</div>
													</td>
													<th scope="row" class="contDetailCont">유상 유지보수일자</th>
													<td class="contDetailCont">
														<div class="input-group input-group-sm mb-0">
															<input class="form-control" type="date" id="paymaintSdate" value="${contDto.paymaintSdate}">
															<span style="line-height:30px;">&nbsp;~&nbsp;</span>
															<input class="form-control form-control-sm col-sm-6 m-l-5" type="date" id="paymaintEdate" value="${contDto.paymaintEdate}">
														</div>
													</td>
													<th >계약금액</th>
													<td>
														<input style="text-align: right;" type="text" id="contAmt" name="contAmt" class="form-control" onkeyup="moneyFormatInput(this);" value="<fmt:formatNumber value="${contDto.contAmt}" pattern="#,###"/>">
													</td>
													<th >VAT 포함여부</th>
													<td>
														 <select name="vatYn" id="vatYn" class="form-control form-control-sm ">
															 <option value="Y" <c:if test="${contDto.vatYn eq 'Y'}">selected</c:if> >Yes</option>
															<option value="N" <c:if test="${contDto.vatYn eq 'N'}">selected</c:if> >No</option>
														</select>
													</td>
													<th scope="row">매출이익</th>
													<td class="text-right">
														<input style="text-align: right;" type="text" id="net_profit" name="net_profit" class="form-control" onkeyup="moneyFormatInput(this);" value="<fmt:formatNumber value="${contDto.net_profit}" pattern="#,###"/>">
													</td>
												</tr>
												
												<%-- <tr>
													<th>계산서 발행방법</th>
													<td>
														<select id="vatIstype" class="form-control">
															<option value="OT">전체금액 한번</option>
															<option value="EM">1/12 매월 발행</option>
															<option value="QY">1/4 분기 발행</option>
															<option value="HY">1/2 반기 발행</option>
															<option value="RQ">요청 발행</option>
														</select>
													</td>
													<th>발행일자</th>
													<td>
														<select id="vatIsday" class="form-control">
															<option value="01">1일</option>
															<option value="10">10일</option>
															<option value="15">15일</option>
															<option value="20">20일</option>
															<option value="25">25일</option>
															<option value="31">말일</option>
														</select>
													</td>
													<th>계산서 발행일정</th>
													<td>
														<select id="vatsched" class="form-control">
															<option value="">연-월-일 금액</option>
														</select>
													</td>
													<th>지역</th>
													<td>
														<select name="select" id="contArea" class="form-control form-control-sm">
															<option value="">선택</option>
															<c:forEach var="contArea" items="${contArea}">
																<option value="${contArea.codeNo}" <c:if test="${contDto.contArea eq contArea.codeNo}">selected</c:if>>${contArea.desc03}</option>
															</c:forEach>
														</select>
													</td>
												</tr> --%>
												<tr>
													<th scope="row">내용</th>
													<td colspan="7">
														<textarea name="contDesc" id="contDesc" rows="8" class="form-control ">${contDto.contDesc}</textarea>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="btn_wr text-right mt-3" id="tab01_bottom">
							<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cont/list.do'">계약목록</button>
							<c:if test="${contDto.userNo eq sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
								<!-- <button class="btn btn-md btn-danger" onClick="fn_ExtendCont()">유지보수 계약연장</button> -->
								<button class="btn btn-md btn-danger" onClick="fn_DeleteCont()">삭제</button>
								<button class="btn btn-md btn-primary" onClick="fn_SaveCont()">계약정보 수정</button>
								<button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/cont/list.do'">취소</button>
							</c:if>
						</div>
					</div>
					</div>
					<div class="tab-pane " id="tab02" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<jsp:include page="/WEB-INF/views/module/inputSet/inputSetProductSalesInOut4.jsp"/>
								<jsp:include page="/WEB-INF/views/sopp/inoutlist4.jsp"/>
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
						<jsp:include page="../cont/filelist.jsp"/>
					</div>
					<div class="tab-pane " id="tab05" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<form name="form2" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="10%" />
											<col width="10%" />
											<col width="10%" />
											<col width="10%" />
											<col width="60%" />
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
											<col width="20%" />
											<col width="10%" />
											<col width="10%" />
										</colgroup>
										<thead>
										<tr>
											<th class="text-center">일자</th>
											<th class="text-center">활동종류</th>
											<th class="text-center">내역</th>
											<th class="text-center">비고</th>
											<th class="text-center">담당자</th>
											<th class="text-center">장소</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach var="row2" items="${salesinsopp}">
											<tr class="item1">
												<td>${row2.salesFrdatetime}</td>
												<td>${row2.salesTypeN}</td>
												<td>${row2.salesDesc}</td>
												<td>${row2.salesTitle}</td>
												<td>${row2.userName}</td>
												<td>${row2.salesPlace}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab07" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<jsp:include page="/WEB-INF/views/module/inputSet/inputSetBill.jsp"/>
							</div>
						</div>
						<%-- <div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<form name="form2" method="post" onsubmit="return false;">
									<table class="table table-sm bst02" id="vatIssuelist">
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
											<th class="text-center">예정일자</th>
											<th class="text-center">계약명</th>
											<th class="text-center">공급가</th>
											<th class="text-center">세액</th>
											<th class="text-center">합계금액</th>
											<th class="text-center">발행일자</th>
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
						</div> --%>
					</div>
					
					<div class="tab-pane " id="tab08" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<jsp:include page="/WEB-INF/views/module/inputSet/inputSetContribution.jsp"/>
							</div>
						</div>
					</div>
					
					<div class="tab-pane " id="tab09" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive" style="overflow-x: hidden;">
								<jsp:include page="/WEB-INF/views/module/inputSet/inputSetconnect_vat_now.jsp"/>
							</div>
						</div>
					</div>
					
				</div>
				<div class="btn_wr text-right mt-3" id="tab_common_bottom">
					<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cont/list.do'">계약목록</button>
				</div>
	<!--//계약등록-->

	<script>
		$("#tablist > li:nth-child(1)").click(function (){
			$("#tab01_bottom").show();
			$("#tab_common_bottom").hide();
		});

		$("#tablist > li:nth-child(n+2)").click(function (){
			$("#tab01_bottom").hide();
			$("#tab_common_bottom").show();
		});
		
		$("#tablist > li:nth-child(7)").click(function (){
			$("#tab_common_bottom").hide();
		});
		
		$('#endCustModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
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
		$('#secondUserModal').on('show.bs.modal', function(e) {
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
		$('#supplyModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#contModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		function fnSetBillCustData(a, b, c) {
	    	var index = localStorage.getItem("getItemIndex");
	        $("#billTableFirst tbody tr td #custNo_" + index).val(b);
	        $("#billTableFirst tbody tr td #custName_" + index).val(a);
	        $("#billTableFirst tbody tr td #custVatNo_" + index).val(c);
	        $(".modal-backdrop").remove();
	        $("#billCustModal").modal("hide");
	        localStorage.clear();
	    }
		
		function fnSetproductdata(a,b){
			$("#productNo1").val(a);
			$("#data01Title").val(b);
			//$(".modal-backdrop").remove();
			//$("#productdataModal").modal("hide");
			// 모달이 정상적으로 제거되지않아 close 버튼 트리거로 구성함
			$("#productdataModal1").find(".modal-footer button").trigger('click');
		}

		function fnSetEndCustData(a, b) {
			$("#endCustNo").val(b);
			$("#endCustName").val(a);
			$(".modal-backdrop").remove();
			$("#endCustModal").modal("hide");
		}
		
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
		
		function fnSetSecondUserData(a, b) {
			$("#secondUserNo").val(a);
			$("#secondUserName").val(b);
			$(".modal-backdrop").remove();
			$("#secondUserModal").modal("hide");
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

		function fnSetSupplyData(a, b) {
			$("#supplyNo").val(b);
			$("#supplyName").val(a);
			$(".modal-backdrop").remove();
			$("#supplyModal").modal("hide");
		}

		function fnSetContData(a,b,c,d){
			$("#oldContTitle").val(a);
			$("#oldContNo").val(b);
			$(".modal-backdrop").remove();
			$("#contModal").modal("hide");
		}
		
		function fnSetCustmereData(a, b) {
			$("#endCustmemberNo").val(a);
			$("#endCustmemberName").val(b);
			$(".modal-backdrop").remove();
			$("#endCustmemberModal").modal("hide");
		}
		
		$('#endCustmemberModal').on('show.bs.modal', function(e) {
			var custNo = $("#endCustNo").val();
			var url = '${path}/modal/popup.do?popId=custmem&compNo=' + custNo;
			$("#endCustmemberModalbtn").data("remote",url);

			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});

		function fn_SaveCont() {
			var contData = {};
			contData.contNo 					= Number($("#contNo").val());
			var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
			if(contractType == 'NEW'){
				contData.soppNo					= Number($("#soppNo").val());			// 영업기회
				contData.exContNo				= 0;							// 기존계약
				contData.cntrctMth				= Number(${contractType[0].codeNo});
			} else if(contractType == 'OLD'){
				contData.soppNo					= Number($("#soppNo").val());			// 영업기회
				contData.exContNo				= Number($("#oldContNo").val());		// 기존계약
				contData.cntrctMth				= Number(${contractType[1].codeNo});
			}
			contData.contTitle 					= $("#contTitle").val(); 		// 계약명
			if($("#userName").val() != "")			contData.userNo		 	= Number($("#userNo").val());			// 담당사원
			var net_profit = Number($("#net_profit").val().replace(/[\D\s\._\-]+/g, "")); // 매출이익
			if (net_profit >= 0){
				contData.net_profit = net_profit;
			} else {
				contData.net_profit = 0;
			}
			if($("#custName").val() != "")			contData.custNo 		= Number($("#custNo").val());			// 거래처
			if($("#custmemberName").val() != "")	contData.custmemberNo	= Number($("#custmemberNo").val());		// 거래처 담당자
			if($("#endCustName").val() != "") 		contData.buyrNo			= Number($("#endCustNo").val());		// 엔드유저
			if($("#endCustmemberName").val() != "") contData.buyrMemberNo	= Number($("#endCustmemberNo").val());	// 엔드유저 담당자
			if($("#contOrddate").val() != "")		contData.contOrddate 	= $("#contOrddate").val();				// 발주일자
			/* if($("#supplyDate").val() != "") 		contData.supplyDate 	= $("#supplyDate").val(); */				// 공급일자
			if($("#secondUserNo").val() != "") 		contData.secondUserNo	= Number($("#secondUserNo").val());		//(부)담당사원
			if($("#delivDate").val() != "")  		contData.delivDate	 	= $("#delivDate").val();				// 검수일자

			var contAmt = Number($("#contAmt").val().replace(/[\D\s\._\-]+/g, ""));									// 계약금액
			if (contAmt >= 0){
				contData.contAmt = contAmt;
			} else {
				contData.contAmt = 0;
			}
			if($("#freemaintSdate").val() != "") contData.freemaintSdate 	= $("#freemaintSdate").val();		// 무상유지보수 시작일자
			if($("#freemaintEdate").val() != "") contData.freemaintEdate 	= $("#freemaintEdate").val();		// 무상유지보수 마감일자
			if($("#paymaintSdate").val() != "") contData.paymaintSdate 		= $("#paymaintSdate").val();		// 유상유지보수 시작일자
			if($("#paymaintEdate").val() != "") contData.paymaintEdate 		= $("#paymaintEdate").val();		// 유상유지보수 마감일자
			if($("#vatYn").val() != "")			contData.vatYn				= $("#vatYn").val();				// VAT 포함여부 (기본값 : Y)
			if($("#contArea").val() != "") 		contData.contArea 			= $("#contArea").val();				// 지역
			if($("#contType").val() != "")		contData.contType 			= $("#contType").val();				// 판매방식
			if(tinyMCE.get("contDesc").getContent() != "")		contData.contDesc			= tinyMCE.get("contDesc").getContent();				// 계약내용

			if (!contData.contTitle) {
				alert("계약명 제목을 입력하십시오.");
				return;
			} else if(!contData.userNo){
				alert("담당자를 입력하십시오.");
				return;
			} else if (!contData.custNo){
				alert("매출처를 입력하십시오.");
				return;
			} else if(!contData.contType){
				alert("판매방식을 선택해주십시오.");
				return;
			} else if(!contData.buyrNo){
				alert("엔드유저를 선택해주십시오.");
				return;
			} else if (!contData.cntrctMth){
				alert("영업기회(신규 영업지원) 및 계약을 입력하십시오.");
				return;
			} else if(contractType != undefined) {
				if(contractType == 'NEW'){
					if ($("#soppTitle").val() == "" || $("#soppTitle").val() == "0"){
						alert("영업기회을 입력하십시오.");
						return;
					}
				} /* else if (contractType == 'OLD'){
					if ($("#oldContTitle").val() == "" || $("#oldContTitle").val() == "0"){
						alert("계약을 입력하십시오.");
						return;
					}
				} */
			}
			
			$.ajax({
				url: "${path}/cont/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: contData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					var url = '${path}/cont/list.do';
					location.href = url;
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

		function fn_ExtendCont() {
			var contData = {};
			contData.contNo 					= Number($("#contNo").val());
			var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
			if(contractType == 'NEW'){
				contData.soppNo					= Number($("#soppNo").val());			// 영업기회
				contData.exContNo				= 0;							// 기존계약
				contData.cntrctMth				= Number(${contractType[0].codeNo});
			} else if(contractType == 'OLD'){
				contData.soppNo					= 0;							// 영업기회
				contData.exContNo				= Number($("#oldContNo").val());		// 기존계약
				contData.cntrctMth				= Number(${contractType[1].codeNo});
			}
			contData.contTitle 					= $("#contTitle").val(); 		// 계약명
			if($("#userName").val() != "")			contData.userNo		 	= Number($("#userNo").val());			// 담당사원
			var net_profit = Number($("#net_profit").val().replace(/[\D\s\._\-]+/g, "")); // 매출이익
			if (net_profit >= 0){
				contData.net_profit = net_profit;
			} else {
				contData.net_profit = 0;
			}
			if($("#custName").val() != "")			contData.custNo 		= Number($("#custNo").val());			// 거래처
			if($("#custmemberName").val() != "")	contData.custmemberNo	= Number($("#custmemberNo").val());		// 거래처 담당자
			if($("#endCustName").val() != "") 		contData.buyrNo			= Number($("#endCustNo").val());		// 엔드유저
			if($("#endCustmemberName").val() != "") contData.buyrMemberNo	= Number($("#endCustmemberNo").val());	// 엔드유저 담당자
			if($("#contOrddate").val() != "")		contData.contOrddate 	= $("#contOrddate").val();				// 발주일자
			if($("#supplyDate").val() != "") 		contData.supplyDate 	= $("#supplyDate").val();				// 공급일자
			if($("#delivDate").val() != "")  		contData.delivDate	 	= $("#delivDate").val();				// 검수일자

			var contAmt = Number($("#contAmt").val().replace(/[\D\s\._\-]+/g, ""));									// 계약금액
			if (contAmt >= 0){
				contData.contAmt = contAmt;
			} else {
				contData.contAmt = 0;
			}
			if($("#freemaintSdate").val() != "") contData.freemaintSdate 	= $("#freemaintSdate").val();		// 무상유지보수 시작일자
			if($("#freemaintEdate").val() != "") contData.freemaintEdate 	= $("#freemaintEdate").val();		// 무상유지보수 마감일자
			if($("#paymaintSdate").val() != "") contData.paymaintSdate 		= $("#paymaintSdate").val();		// 유상유지보수 시작일자
			if($("#paymaintEdate").val() != "") contData.paymaintEdate 		= $("#paymaintEdate").val();		// 유상유지보수 마감일자
			if($("#vatYn").val() != "")			contData.vatYn				= $("#vatYn").val();				// VAT 포함여부 (기본값 : Y)
			if($("#contArea").val() != "") 		contData.contArea 			= $("#contArea").val();				// 지역
			if($("#contType").val() != "")		contData.contType 			= $("#contType").val();				// 판매방식
			if(tinyMCE.get("contDesc").getContent() != "")		contData.contDesc			= tinyMCE.get("contDesc").getContent();				// 계약내용

			if (!contData.contTitle) {
				alert("계약명 제목을 입력하십시오.");
				return;
			} else if(!contData.userNo){
				alert("담당자를 입력하십시오.");
				return;
			} else if (!contData.custNo){
				alert("매출처를 입력하십시오.");
				return;
			} else if(!contData.contType){
				alert("판매방식을 선택해주십시오.");
				return;
			} else if(!contData.buyrNo){
				alert("엔드유저를 선택해주십시오.");
				return;
			} else if (!contData.cntrctMth){
				alert("영업기회(신규 영업지원) 및 계약을 입력하십시오.");
				return;
			} else if(contractType != undefined) {
				if(contractType == 'NEW'){
					if ($("#soppTitle").val() == "" || $("#soppTitle").val() == "0"){
						alert("영업기회을 입력하십시오.");
						return;
					}
				} else if (contractType == 'OLD'){
					if ($("#oldContTitle").val() == "" || $("#oldContTitle").val() == "0"){
						alert("계약을 입력하십시오.");
						return;
					}
				}
			}

			$.ajax({
				url: "${path}/cont/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: contData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							var url = '${path}/cont/list.do';
							location.href = url;
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
		}

		function fn_DeleteCont(){
			var contData = {};
			contData.contNo 					= $("#contNo").val();
			$.ajax({
				url: "${path}/cont/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: contData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					var url = '${path}/cont/list.do';
					location.href = url;
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		}

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

		/* function fn_data01Insert() {
			var data01Data = {};
			data01Data.soppNo 		= $("#soppNo").val();
			data01Data.catNo	 	= '100001';
			var productNo			= $("#productNo1").val();
			if(productNo != ""){
				data01Data.productNo	= productNo;
			} else {
				data01Data.productNo	= 0;
			}
			data01Data.dataTitle 	= $("#data01Title").val();
			data01Data.dataType		= $("#data01Type").val();
			data01Data.dataNetprice	= $("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "");
			data01Data.dataQuanty	= $("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "");
			data01Data.dataAmt 		= $("#data01Amt").val().replace(/[\D\s\._\-]+/g, "");
			data01Data.dataRemark 	= $("#data01Remark").val();

			if(!data01Data.dataQuanty){
				alert("단가를 입력해주십시오.");
				return;
			} else if(!data01Data.dataAmt){
				alert("수량을 입력해주십시오.");
				return;
			}

			$.ajax({ url: "${path}/sopp/insertdata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: data01Data , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							var url="${path}/sopp/inoutlist/"+$("#soppNo").val();
							fn_Reloaddata01(url);
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
		}

		function fn_data02Insert() {
			var data02Data = {};
			data02Data.soppNo 		= $("#soppNo").val();
			data02Data.catNo	 	= '100004';
			var productNo			= $("#productNo2").val();
			if(productNo != ""){
				data02Data.productNo	= productNo;
			} else {
				data02Data.productNo	= 0;
			}
			data02Data.dataTitle 	= $("#data02Title").val();
			data02Data.dataType		= $("#data02Type").val();
			data02Data.dataNetprice	= $("#data02Netprice").val().replace(/[\D\s\._\-]+/g, "");
			data02Data.dataQuanty	= $("#data02Qty").val().replace(/[\D\s\._\-]+/g, "");
			data02Data.dataAmt 		= $("#data02Amt").val().replace(/[\D\s\._\-]+/g, "");
			data02Data.dataRemark 	= $("#data02Remark").val();

			if(!data02Data.dataQuanty){
				alert("단가를 입력해주십시오.");
				return;
			} else if(!data02Data.dataAmt){
				alert("수량을 입력해주십시오.");
				return;
			}

			$.ajax({ url: "${path}/sopp/insertdata02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: data02Data , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							var url="${path}/sopp/qutylist/"+$("#soppNo").val();
							fn_Reloaddata02(url);
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
		}




		function fn_data01delete(soppdataNo) {
			var msg = "선택한 건을 삭제하시겠습니까?";
			if( confirm(msg) ){
				$.ajax({ url: "${path}/sopp/deletedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: {soppdataNo : soppdataNo}, // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
						.done(function(data) {
							if(data.code == 10001){
								alert("삭제 성공");
								var url="${path}/sopp/inoutlist/"+$("#soppNo").val();
								fn_Reloaddata01(url);
							}else{
								alert("삭제 실패");
							}
						}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
						.fail(function(xhr, status, errorThrown) {
							alert("통신 실패");
						});
			}
		}

		function fn_data02delete(soppdataNo) {
			var msg = "선택한 건을 삭제하시겠습니까?";
			if( confirm(msg) ){
				$.ajax({ url: "${path}/sopp/deletedata02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
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
		} */

		$(document).ready(function() {
			$("#delivDate").change(function(){
				var contractType = $("input[name='contractType']:checked").val();
				var date = new Date($(this).val());
				var month = date.getMonth() + 1;
				var day = date.getDate();
				
				date.setFullYear(date.getFullYear() + 1);
				
				if(month < 10){
					month = "0" + month;
				}
				
				if(day < 10){
					day = "0" + day;
				}
				
				var fullDate = date.getFullYear() + "-" + month + "-" + day;
				
				if(contractType === 'NEW'){
					$("#freemaintSdate").val($(this).val());
					$("#freemaintEdate").val(fullDate);
				}else{
					$("#paymaintSdate").val($(this).val());
					$("#paymaintEdate").val(fullDate);
				}
			});
			
			var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
			if(contractType == 'NEW'){
				$(".contDetailCont").hide();
			} else if(contractType == 'OLD'){
				$(".contDetailSopp").hide();
			}

			$('input[name=contractType]').on('change', function() {
				var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
				if(contractType == 'NEW'){
					$(".contDetailSopp").show();
					$(".contDetailCont").hide();
				} else if(contractType == 'OLD'){
					$(".contDetailSopp").hide();
					$(".contDetailCont").show();
				}
			});

			/* var $input = $("#contAmt, #soppTargetAmt");

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
			 */
			
			$("#vatIstype, #vatIsday").change(function(){
				if($("#paymaintSdate").val() === "" || $("#paymaintEdate").val() === ""){
					alert("유상 유지보수일자를 선택해주십시오.");
					$("#vatIstype").val("OT");
					$("#vatIsday").val("01");
					return false;
				}else{
					var contAmt = $("#contAmt").val().replace(/[\D\s\._\-]+/g, "");
					var vatIsday = $("#vatIsday").val();
					$("#vatsched").html("");
					
					if($("#vatIstype").val() === "EM"){
						var avg = parseInt(contAmt/12);
						$("#vatsched").append("<option value=''>연-월-일 금액</option>");
				
						for(var i = 1; i <= 12; i++){
							if(vatIsday === "31"){
								if(i < 10){
									if(i == 2){
										$("#vatsched").append("<option value='"+i+"'>2022-0" + i + "-28 " + avg.toLocaleString("en-US") + "</option>");
									}else if(i == 4 || i == 6 || i == 9){
										$("#vatsched").append("<option value='"+i+"'>2022-0" + i + "-30 " + avg.toLocaleString("en-US") + "</option>");
									}else{
										$("#vatsched").append("<option value='"+i+"'>2022-0" + i + "-" + vatIsday + " " + avg.toLocaleString("en-US") + "</option>");
									}
								}else{
									if(i == 11){
										$("#vatsched").append("<option value='"+i+"'>2022-" + i + "-30 " + avg.toLocaleString("en-US") + "</option>");
									}else{
										$("#vatsched").append("<option value='"+i+"'>2022-" + i + "-" + vatIsday + " " + avg.toLocaleString("en-US") + "</option>");
									}
								}
							}else{
								if(i < 10){
									$("#vatsched").append("<option value='"+i+"'>2022-0" + i + "-" + vatIsday + " " + avg.toLocaleString("en-US") + "</option>");
								}else{
									$("#vatsched").append("<option value='"+i+"'>2022-" + i + "-" + vatIsday + " " + avg.toLocaleString("en-US") + "</option>");
								}
							}
						}
					}else if($("#vatIstype").val() === "QY"){
						var avg = parseInt(contAmt/4);
						$("#vatsched").append("<option value=''>연-월-일 금액</option>");
						if(vatIsday === "31"){
							$("#vatsched").append("<option value='03'>2022-03-31 " + avg.toLocaleString("en-US") + "</option>");
							$("#vatsched").append("<option value='06'>2022-06-30 " + avg.toLocaleString("en-US") + "</option>");
							$("#vatsched").append("<option value='09'>2022-09-30 " + avg.toLocaleString("en-US") + "</option>");
							$("#vatsched").append("<option value='12'>2022-12-31 " + avg.toLocaleString("en-US") + "</option>");
						}else{
							$("#vatsched").append("<option value='03'>2022-03-" + vatIsday + " " + avg.toLocaleString("en-US") + "</option>");
							$("#vatsched").append("<option value='06'>2022-06-" + vatIsday + " " + avg.toLocaleString("en-US") + "</option>");
							$("#vatsched").append("<option value='09'>2022-09-" + vatIsday + " " + avg.toLocaleString("en-US") + "</option>");
							$("#vatsched").append("<option value='12'>2022-12-" + vatIsday + " " + avg.toLocaleString("en-US") + "</option>");
						}
					}else if($("#vatIstype").val() === "HY"){
						var avg = parseInt(contAmt/2);
						$("#vatsched").append("<option value=''>연-월-일 금액</option>");
						
						if(vatIsday === "31"){
							$("#vatsched").append("<option value='06'>2022-06-30 " + avg.toLocaleString("en-US") + "</option>");
							$("#vatsched").append("<option value='12'>2022-12-31 " + avg.toLocaleString("en-US") + "</option>");	
						}else{
							$("#vatsched").append("<option value='06'>2022-06-" + vatIsday + " " + avg.toLocaleString("en-US") + "</option>");
							$("#vatsched").append("<option value='12'>2022-12-" + vatIsday + " " + avg.toLocaleString("en-US") + "</option>");
						}
					}else{
						$("#vatsched").append("<option value=''>연-월-일 금액</option>");
					}
				}
			});
			
			$("#tab_common_bottom").hide();
			
			var lastTab = localStorage.getItem('lastTab');
			
			if (lastTab) {
			  	$('[href="' + lastTab + '"]').tab('show');
			  	localStorage.clear();
			}
		});

		$("#paymaintSdate").change(function(){
			var dateValue = $(this).val();
			var dateValueArr = dateValue.split("-");
			var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
			var EdateValue = $("#paymaintEdate").val();
			var EdateDateArr = EdateValue.split("-")
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
			
			console.log(month);
			if(day < 10){
				day = "0" + day;
			}
			
			$("#paymaintEdate").val(year + "-" + month + "-" + day);
		});
		
		$("#paymaintEdate").change(function(){
			var SdateValue = $("#paymaintSdate").val();
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
			
			$("#paymaintSdate").val(year + "-" + month + "-" + day);
		});
		
		
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>