<%@ page language="java" sreportentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pagesreportext.request.sreportextPath}"/>

<script>
$(function(){
    $('#sreportTable').DataTable({
    	info:false
    });
});
</script>

<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					수주현황 리스트
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

	<!--수주현황 조회-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card_box sch_it">
					<div class="btn_wr text-right">
						<button class="btn btn-sm btn-inverse"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
						<button class="btn btn-sm btn-primary"><i class="icofont icofont-search"></i>검색</button>
						<button class="btn btn-sm btn-outline" onClick="javascript:location='${path}/sreport/write.do'"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
					</div>
					<div class="form-group row">
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">거래처(고객)</label>
		<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-sreportrol" name="custName"
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
																	<div class="modal-sreportent modal-80size">
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
						</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">유지보수업체</label>
												<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-sreportrol" name="custName"
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
																	<div class="modal-sreportent modal-80size">
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
														</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">공급업체</label>
							<div class="input-group input-group-sm">
								<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-sreportrol" name="supplyName"
																id="supplyName" value="" readonly /> <input
																type="hidden" name="supplyNo" id="supplyNo"
																value="" /> <span class="input-group-btn">
																<button class="btn btn-primary sch-company"
																	data-remote="${path}/modal/popup.do?popId=cust"
																	type="button" data-toggle="modal"
																	data-target="#supplyModal">
																	<i class="icofont icofont-search"></i>
																</button>
															</span>
															<div class="modal fade " id="supplyModal" tabindex="-1"
																role="dialog">
																<div class="modal-dialog modal-80size" role="document">
																	<div class="modal-sreportent modal-80size">
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
							</div>
						</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">계약업체</label>
							<div class="input-group input-group-sm mb-0">
															<input type="text" class="form-sreportrol" name="custName"
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
																	<div class="modal-sreportent modal-80size">
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
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">계약명</label>
							<input type="text" class="form-sreportrol form-sreportrol-sm" id="" name="" placeholder="">
						</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">구분</label>
							<select name="select" class="form-sreportrol form-sreportrol-sm">
								<option value="opt1">선택해주세요</option>
								<option value="opt2">판매계약</option>
								<option value="opt3">유지보수</option>
							</select>
						</div>
						<div class="col-sm-12 col-xl-6">
							<label class="col-form-label" for="co_name">매출일자</label>
							<div class="ms-selectable sales_date">
							<p class="input_inline"><input class="form-sreportrol form-sreportrol-sm col-xl-6" type="date"> ~ <input class="form-sreportrol form-sreportrol-sm col-xl-6" type="date">
							</div>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">담당자</label>
							<input type="text" class="form-sreportrol form-sreportrol-sm" id="" name="" placeholder="">
						</div>
						<div class="col-sm-12 col-xl-3">
							<label class="col-form-label" for="co_name">영업타입</label>
							<select name="select" class="form-sreportrol form-sreportrol-sm">
								<option value="01">신규</option>			
								<option value="02">노후화교체</option>			
								<option value="03">윈백</option>			
								<option value="04">증설</option>			
								<option value="05">이중화</option>			
								<option value="06">조달구매</option>			
								<option value="99">기타</option>	
							</select>
						</div>
						<div class="col-sm-12 col-xl-6">
							<label class="col-form-label" for="co_name">유지보수 만료일</label>
							<p class="input_inline"><input class="form-sreportrol form-sreportrol-sm col-xl-6" type="date"> ~ <input class="form-sreportrol form-sreportrol-sm col-xl-6" type="date">
							</p>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
	<!--//계약조회-->
	 	 <!--리스트 table-->
	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="sreportTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="1%"/>
								<col width="5%"/>
								<col width="16%"/>
								<col width="12%"/>
								<col width="12%"/>
								<col width="7%"/>
								<col width="10%"/>
								<col width="10%"/>
								<col width="7%"/>
								<col width="5%"/>
								<col width="10%"/>
							</colgroup>							
							<thead>
								<tr>
									<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<th>계약명</th>
									<th>고객명</th>
									<th>계약방식</th>
									<th>계약금액</th>
									<th>담당자</th>
									<th>무상유지보수 시작일</th>
									<th>무상유지보수 만료일</th>
									<th>계산서 발행일</th>
									<th>판매일</th>
									<th>상세정보</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${list}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td><a href="javascript:location.herf='${path}/sreport/detail/${row.sreportNo}'">${row.sreportTitle}</a></td>
									<td>${row.custName}</td>
									<td>${row.sreportType}</td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.sreportAmt}" /></td>
									<td>${row.userName}</td>
									<td>${row.freemaintSdate}</td>
									<td>${row.freemaintEdate}</td>
									<td>-</td>
									<td>${row.delivDate}</td>
									<td><a href="javascript:location.herf='${path}/sreport/detail/${row.sreportNo}'">상세정보</a></td>
								</tr>
							</c:forEach>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//리스트 table-->
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
	</script>
