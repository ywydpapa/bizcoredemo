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
						매입/매출 자료등록
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<!--계약등록-->
	<div class="cnt_wr">
		<h5 class="cont_title"><i class="icofont icofont-square-right"></i>매입매출자료정보</h5>
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
									<th scope="row" class="text-center">영업기회/계약</th>
									<td colspan="3">
										<div class="form-radio">
											<form>
												<div class="radio radio-inline">
													<label style="margin-top:10px;"> <input type="radio" name="contractType" value="NEW" checked="checked"> <i class="helper"></i>영업기회</label>
												</div>
												<div class="radio radio-inline">
													<label> <input type="radio" name="contractType" value="OLD"> <i class="helper"></i>계약</label>
												</div>
											</form>
										</div>
									</td>
								</tr>
								<tr>
									<th class="contDetailSopp requiredTextCss text-center">영업기회</th>
									<td class="contDetailSopp">
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="soppDTO" id="soppTitle" value="" readonly/>
											<input type="hidden" class="form-control" name="soppDTO" id="soppNo" value="" />
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
									<th class="contDetailCont requiredTextCss text-center">계약</th>
									<td class="contDetailCont">
										<div class="input-group input-group-sm mb-0">
											<input type="text" class="form-control" name="oldContTitle" id="oldContTitle" readonly />
											<input type="hidden" name="oldContNo" id="oldContNo" value="" />
											<input type="hidden" name="oldSoppNo" id="oldSoppNo" value="" />
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
									<th class="text-center">첨부파일</th>
									<td>
										<input class="form-control" type="file" id="addFile">
									</td>
									<th class="text-center">과세/비과세</th>
									<td>
										 <select name="vatYn" id="vatYn" class="form-control form-control-sm">
											<option value="Y" selected>과세</option>
											<option value="N" >비과세</option>
										</select>
									</td>
									<th class="text-center">계산서 발행일자</th>
									<td>
										<input type="date" max="9999-12-30" id="vatDate" name="vatDate" class="form-control" style="text-align: right;" value="">
									</td>
								</tr>
							</tbody>
						</table>
						<div class="table-responsive" style="overflow-x: hidden;">
							<jsp:include page="/WEB-INF/views/module/inputSet/inputSetProductSalesInOut4.jsp"/>
							<jsp:include page="/WEB-INF/views/sopp/inoutlist4.jsp"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="btn_wr text-right mt-3">
		<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cont/iolist.do'">자료목록</button>
		<button class="btn btn-md btn-primary" onClick="fn_SaveContIO()">자료등록</button>
		<button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/cont/iolist.do'">취소</button>
	</div>
	<!--//계약등록-->

	<script>
		var soppParam = "${soppParam}";
		
		if(soppParam > 0){
			$("#soppNo").val(soppParam);
			$("#soppTitle").val($("#hideSoppTitle").val());
			
			if(localStorage.getItem("reloadSet") === "1t"){
				setTimeout(() => {
					$("[name='contractType'][value='NEW']").trigger("click");
				}, 300);
			}else if(localStorage.getItem("reloadSet") === "2t"){
				$("#oldContNo").val(localStorage.getItem("oldContNo"));
				$("#oldContTitle").val(localStorage.getItem("oldContTitle"));
				setTimeout(() => {
					$("[name='contractType'][value='OLD']").trigger("click");
				}, 300);
			}else{
				setTimeout(() => {
					$("[name='contractType'][value='NEW']").trigger("click");
				}, 300);
			}
			
			localStorage.clear();
		}
		
		
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
		
		function fnSetproductdata(a,b){
			$("#productNo1").val(a);
			$("#data01Title").val(b);
			//$(".modal-backdrop").remove();
			//$("#productdataModal").modal("hide");
			// 모달이 정상적으로 제거되지않아 close 버튼 트리거로 구성함
			$("#productdataModal1").find(".modal-footer button").trigger('click');
		}
		
		function fnSetSoppData(a, b) {
			localStorage.setItem("reloadSet", "1t");
			$("#soppNo").val(b);
			$("#soppTitle").val(a);
			$("#soppModal").modal("hide");
			location.href = "${path}/cont/iowrite.do/" + b;
		}

		function fnSetContData(a,b,c,d,e){
			localStorage.setItem("oldContNo", b);
			localStorage.setItem("oldContTitle", a);
			localStorage.setItem("reloadSet", "2t");
			localStorage.setItem("soppNo", e);
			$("#oldContTitle").val(a);
			$("#oldContNo").val(b);
			$("#soppNo").val(e);
			$(".modal-backdrop").remove();
			$("#contModal").modal("hide");
			location.href = "${path}/cont/iowrite.do/" + e;
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
