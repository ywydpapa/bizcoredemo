<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top3.jsp"/>

<div id="main_content">
	<script type="text/javascript">
		$(function () {
			$('.contDetailCont').hide();
		});
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
						회계전표 등록
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<!--계약등록-->
	<div class="cnt_wr">
		<h5 class="cont_title"><i class="icofont icofont-square-right"></i>전표내용</h5>
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
									<th scope="row" class="text-center">전표종류</th>
									<td colspan="3">
										<div class="form-radio">
											<form>
												<div class="radio radio-inline">
													<label style="margin-top: 10px;"> <input type="radio" name="slipType" value="IN" checked="checked"> <i class="helper"></i>입금전표</label>
												</div>
												<div class="radio radio-inline">
													<label> <input type="radio" name="slipType" value="OUT"> <i class="helper"></i>출금전표</label>
												</div>
												<div class="radio radio-inline">
													<label> <input type="radio" name="slipType" value="CHG"> <i class="helper"></i>대체전표</label>
												</div>
											</form>
										</div>
									</td>
								</tr>
								<tr>
									<th class="accCode requiredTextCss text-center">대표계정과목</th>
									<td class="accCode">
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="accTitle" id="accTitle" value="" />
											<input type="hidden" class="form-control" name="accCode" id="accCode" value="" />
											<span class="input-group-btn">
												<button class="btn btn-primary sch-opportunity2"
													data-remote="${path}/modal/popup.do?popId=acccd"
													type="button" data-toggle="modal" data-target="#acccdModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
											<div class="modal fade " id="acccdModal" tabindex="-1"
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
															<h5>계정과목</h5>
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
									<th class="requiredTextCss text-center">대표적요</th>
									<td>
										<input class="form-control" type="text" id="slipremark">
									</td>
									<th class="requiredTextCss text-center">거래업체</th>
									<td>
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="custName" id="custName" value="" />
											<input type="hidden" name="custNo" id="custNo" value="" /> <span class="input-group-btn">
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
									<th class="text-center">거래처 담당자</th>
									<td>
									</td>
								</tr>
								<tr>
									<th class="text-center">차변금액</th>
									<td>
										<input type="text" id="contAmt" name="crAmt" class="form-control" style="text-align: right;" value="0">
									</td>
									<th class="text-center">대변금액</th>
									<td>
										<input type="text" id="contAmt" name="drAmt" class="form-control" style="text-align: right;" value="0">
									</td>
									<th class="text-center">금액차</th>
									<td>
										<input type="text" id="contAmt" name="ioAmt" class="form-control" style="text-align: right;" value="0">
									</td>
									<th class="text-center">증빙종류</th>
									<td>
										 <select name="eviType" id="eviType" class="form-control form-control-sm">
											<option value="" selected>선택</option>
											<option value="" >세금계산서</option>
											<option value="" >계산서</option>
											<option value="" >현금영수증</option>
											<option value="" >간이영수증</option>
											<option value="" >카드전표</option>
											<option value="" >개인카드</option>
											<option value="" >개인현금영수증</option>
											<option value="" >기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<th class="text-center">거래일자</th>
									<td>
										<input type="date" max="9999-12-31" id="ioDate" name="ioDate" class="form-control" style="text-align: right;" value="">
									</td>
									<th class="text-center">계산서 발행일자</th>
									<td>
										<input type="date" max="9999-12-31" id="vatDate" name="vatDate" class="form-control" style="text-align: right;" value="">
									</td>
									<!-- 빈박스 -->
									<th></th>
									<td></td>
									<th></th>
									<td></td>
									<!-- 빈박스 -->
								</tr>
							</tbody>
						</table>
						<table class="table table-sm bst02">
							<colgroup>
								<col width="5%"/>
								<col width="10%"/>
								<col width="15%"/>
								<col width="15%"/>
								<col width="25%"/>
								<col width="10%"/>
								<col width="10%"/>
								<col width="20%"/>
								<col width="5%"/>	
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">번호</th>
									<th class="text-center">구분</th>
									<th class="text-center">계정과목</th>
									<th class="text-center">거래처</th>
									<th class="text-center">적요</th>
									<th class="text-center">차변금액</th>
									<th class="text-center">대변금액</th>
									<th class="text-center">증빙구분</th>
									<th class="text-center">기능</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td><select type="text" id="slineType" class="form-control">
									<option value="1">입금</option>
									<option value="2">출금</option>
									<option value="3">차변</option>
									<option value="4">대변</option>
									<option value="5">결산차변</option>
									<option value="6">결산대변</option>
									</select></td>
									<td><input type="text" id="slineAcccd" class="form-control"></td>
									<td><input type="text" id="slineCust" class="form-control"></td>
									<td><input type="text" id="slineDesc" class="form-control"></td>
									<td><input type="text" id="slineCR" class="form-control"></td>
									<td><input type="text" id="slineDR" class="form-control"></td>
									<td><select type="text" id="slineEvi" class="form-control">
									        <option value="" selected>무증빙</option>
											<option value="" >세금계산서</option>
											<option value="" >계산서</option>
											<option value="" >현금영수증</option>
											<option value="" >간이영수증</option>
											<option value="" >카드전표</option>
											<option value="" >개인카드</option>
											<option value="" >개인현금영수증</option>
											<option value="" >기타</option>
									</select></td>
									<td><button class="form-control" class="form-control" onClick="addSlipline()">추가</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="btn_wr text-right mt-3">
		<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cont/sliplist.do'">전표목록</button>
		<button class="btn btn-md btn-primary" onClick="fn_SaveSlip()">전표등록</button>
		<button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/cont/sliplist.do'">취소</button>
	</div>
	<!--//계약등록-->

	<script>
		$('#custModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#custmemberModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget);
			var recipient = button.data('whatever');
			var url = '${path}/modal/popup.do?popId=custmem&compNo=' + recipient;
			button.data("remote",url);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});

		$('#endCustModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#endCustmemberModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var recipient = button.data('whatever');
			console.log("endCustmemberModal -> : "+recipient);
			var url = '${path}/modal/popup.do?popId=endCustmem&compNo=' + recipient;
			button.data("remote",url);
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

		function fnSetCustData(a, b) {
			$("#custName").val(a);
			$("#custNo").val(b);
			$("#custmemberModalbtn").data('whatever', b);
			$(".modal-backdrop").remove();
			$("#custModal").modal("hide");
		}

		function fnSetEndCustData(a, b) {
			$("#endCustNo").val(b);
			$("#endCustName").val(a);
			$("#endCustmemberModalbtn").data('whatever', b);
			$(".modal-backdrop").remove();
			$("#endCustModal").modal("hide");
		}

		function fnSetEndCustmereData(a,b){
			$("#endCustmemberNo").val(a);
			$("#endCustmemberName").val(b);
			$(".modal-backdrop").remove();
			$("#endCustmemberModal").modal("hide");
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
		
		function fnSetSoppData(a, b, c, d) {
			// '${row.soppTitle}','${row.soppNo}','${row.userNo}','${row.custNo}'
			$("#soppTitle").val(a);
			$("#soppNo").val(b);
			$(".modal-backdrop").remove();
			$("#soppModal").modal("hide");
		}
		
		function fnSetCustmereData(a,b){
			// '${row.custData03no}','${row.custMname}'
			// 고객담당자번호, 고객성명
			$("#custmemberNo").val(a);
			$("#custmemberName").val(b);
			$(".modal-backdrop").remove();
			$("#custmemberModal").modal("hide");
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

		function fn_SaveContIO() {
			var contData = {};
			var contractType					= $("input[name='contractType']:checked").val();	// 신규 영업지원 or 기존계약
			if(contractType == 'NEW'){
				contData.soppNo					= $("#soppNo").val();			// 영업기회
				contData.exContNo				= 0;							// 기존계약
				contData.cntrctMth				= ${contractType[0].codeNo};
				if($("#freemaintSdate").val() != "") contData.freemaintSdate = $("#freemaintSdate").val();	// 무상유지보수 시작일자
				if($("#freemaintEdate").val() != "") contData.freemaintEdate = $("#freemaintEdate").val();	// 무상유지보수 마감일자
				if(!contData.soppNo){
					alert("영업기회명을 입력하십시오.");
					return;
				}
			} else {
				contData.soppNo					= 0;							// 영업기회
				contData.exContNo				= $("#oldContNo").val();		// 기존계약
				contData.cntrctMth				= ${contractType[1].codeNo};
				if($("#paymaintSdate").val() != "") contData.paymaintSdate = $("#paymaintSdate").val();		// 유상유지보수 시작일자
				if($("#paymaintEdate").val() != "") contData.paymaintEdate = $("#paymaintEdate").val();		// 유상유지보수 마감일자
				if(!contData.exContNo){
					alert("기존계약을 입력하십시오.");
					return;
				}
			}
			contData.contTitle 				= $("#contTitle").val(); 		// 계약명
			if($("#userName").val() != "")			contData.userNo		 	= Number($("#userNo").val());			// 담당사원
			var net_profit = Number($("#netprofit").val().replace(/[\D\s\._\-]+/g, "")); // 매출이익
			if (net_profit >= 0){
				contData.net_profit = net_profit;
			} else {
				contData.net_profit = 0;
			}
			if($("#custName").val() != "")			contData.custNo 		= Number($("#custNo").val());			// 거래처
			if($("#custmemberName").val() != "")	contData.custmemberNo	= Number($("#custmemberNo").val());		// 거래처 담당자
			if($("#endCustName").val() != "") 		contData.buyrNo			= Number($("#endCustNo").val());		// 엔드유저
			if($("#endCustmemberName").val() != "") contData.buyrMemberNo	= Number($("#endCustmemberNo").val());	// 엔드유저 담당자
			if($("#contOrddate").val() != "")		contData.contOrddate 			= $("#contOrddate").val();		// 발주일자
			if($("#supplyDate").val() != "") 		contData.supplyDate = $("#supplyDate").val();		// 공급일자
			if($("#delivDate").val() != "")  		contData.delivDate	 = $("#delivDate").val();		// 검수일자

			var contAmt = Number($("#contAmt").val().replace(/[\D\s\._\-]+/g, ""));			// 계약금액
			if (contAmt >= 0){
				contData.contAmt = contAmt;
			} else {
				contData.contAmt = 0;
			}
			if($("#vatYn").val() != "")		contData.vatYn					= $("#vatYn").val();			// VAT 포함여부 (기본값 : Y)
			if($("#contArea").val() != "") 		contData.contArea 				= $("#contArea").val();			// 지역
			if($("#contType").val() != "")		contData.contType 				= $("#contType").val();			// 판매방식
			if($("#contDesc").val() != "")		contData.contDesc			 	= $("#contDesc").val();			// 계약내용

			if (!contData.contTitle) {
				alert("계약명 제목을 입력하십시오.");		
				return;
			} else if(!contData.userNo){
				alert("담당자를 입력하십시오.");
				return;
			} else if (!contData.custNo){
				alert("매출처를 입력하십시오.");
				return;
			}

			$.ajax({ url: "${path}/cont/ioinsert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
						data: contData , // HTTP 요청과 함께 서버로 보낼 데이터 
						method: "POST", // HTTP 요청 메소드(GET, POST 등) 
						dataType: "json" // 서버에서 보내줄 데이터의 타입 
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							var url = '${path}/cont/iolist.do';
							location.href = url;
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
					.fail(function(xhr, status, errorThrown) { 
						alert("통신 실패");
					});
		}

		$(document).ready(function() {
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

			var $input = $("#contAmt,#netprofit");
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
		});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>

