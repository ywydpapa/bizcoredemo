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
					판매보고 상세
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

<!--계약등록-->
<div class="cnt_wr">
	<h5 class="cont_title"><i class="icofont icofont-square-right"></i>계약정보</h5>
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table class="table table-sm bst02">
						<colgroup>
							<col width="15%" />
							<col width="35%"/>
							<col width="15%"/>
							<col width="35%"/>
						</colgroup>				
						<tbody>
							<tr>
								<th scope="row">계약명</th>
								<td colspan="3">
									<input type="text" class="form-control form-control-sm" id="contTitle" name="contTitle" value="${dto.contTitle }">
								</td>
							</tr>
							<tr>
								<th scope="row">계약번호</th>
								<td>
									<input type="text" id="contNo" name="contNo" class="form-control " readonly value="${dto.contNo}">
								</td>
								<th>영업기회</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="soppTitle" id="soppTitle" value="${dto.soppTitle}" />
										<input type="hidden" class="form-control" name="soppNo" id="soppNo" value="${dto.soppNo}" />
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
							</tr>
							<tr>
								<th scope="row">담당사원</th>
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
								<th>거래처</th>
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
														<h4 class="modal-title">거래처검색</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
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
								<th scope="row">영업 타입</th>
								<td>
									<select name="salesType" id="salesType" class="form-control form-control-sm col-md-12">
										<option value="">선택</option>			
										<option value="101">신규</option>			
										<option value="102">노후화교체</option>			
										<option value="103">윈백</option>			
										<option value="104">증설</option>			
										<option value="105">이중화</option>			
										<option value="106">조달구매</option>			
										<option value="199">기타</option>							
									</select>
								</td>
								<th>거래처 담당자</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" id="custmemberName" name="custmemberName" class="form-control " readonly value="${dto.custmemberName}">
										<input type="hidden" id="custmemberNo" name="custmemberNo" class="form-control " value="${dto.custmemberNo}">
										<span class="input-group-btn">
											<button class="btn btn-primary sch-company btn-sm" type="button"><i class="icofont icofont-search"></i></button>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">유지보수업체</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="ptncName" id="ptncName" value="${dto.ptncName}" />
										 <input type="hidden" name="ptncNo" id="ptncNo" value="${dto.ptncNo}" />
										  <span class="input-group-btn">
											<button class="btn btn-primary sch-partner"
												data-remote="${path}/modal/popup.do?popId=ptnc"
												type="button" data-toggle="modal" data-target="#ptncModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="ptncModal" tabindex="-1"
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
														<h5>유지보수업체 목록</h5>
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
								<th>공급업체</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="supplyName" id="supplyName" value="${dto.supplyName}" />
										 <input type="hidden" name="supplyNo" id="supplyNo" value="${dto.supplyNo}" />
										  <span class="input-group-btn">
											<button class="btn btn-primary sch-partner"
												data-remote="${path}/modal/popup.do?popId=supply"
												type="button" data-toggle="modal" data-target="#supplyModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="supplyModal" tabindex="-1"
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
								<th scope="row">발주일자</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-12" type="date" id="contOrddate" name="contOrddate" value="${dto.contOrddate}">
									</div>
								</td>
								<th>공급일</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-12" type="date" id="supplyDate" name="supplyDate" value="${dto.supplyDate}" >
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">검수일</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-12" type="date" id="delivDate" name="delivDate" value="${dto.delivDate}">
									</div>
								</td>
								<th >계약금액</th>
								<td>
									<input type="text" id="contAmt" name="contAmt" class="form-control " value="${dto.contAmt}">
								</td>
							</tr>
							<tr>
								<th scope="row">무상유지보수</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-6 m-r-5" type="date" id="freemaintSdate" value="${dto.freemaintSdate}"> ~ <input class="form-control form-control-sm col-sm-6 m-l-5" type="date" id="freemaintEdate" value="${dto.freemaintEdate}">
									</div>
								</td>
								<th >VAT 포함여부</th>
								<td>
									 <select name="vatYn" id="vatYn" class="form-control form-control-sm">
									 	<option value="" >선택</option>
										<option value="Y" >Yes</option>
										<option value="N" >No</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">지역</th>
								<td>
									<select name="contArea" id="contArea" class="form-control form-control-sm">
										<option value="">선택</option>			
										<option value="701">서울</option>			
										<option value="703">인천, 경기</option>			
										<option value="704">충북</option>			
										<option value="705">충남</option>			
										<option value="706">강원도</option>			
										<option value="707">경북</option>			
										<option value="708">경남</option>			
										<option value="709">전북</option>			
										<option value="710">전남</option>			
										<option value="711">제주</option>			
										<option value="712">해외</option>			
										<option value="713">기타</option>			
										<option value="714">세종</option>	    
									</select>
								</td>
								<th>판매방법</th>
								<td>
									<select name="contType" id="contType" class="form-control form-control-sm">
										<option value="">선택</option>			
										<option value="801">조달</option>			
										<option value="802">수의</option>			
										<option value="803">입찰</option>			
										<option value="804">기타</option>	    
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="3">
									<textarea name="contDesc" id="contDesc" rows="8" class="form-control">${dto.contDesc}</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/sreport/list.do'">목록</button>
				<button class="btn btn-md btn-primary" onClick="fn_SaveCont()">계약등록</button>
				<button class="btn btn-md btn-inverse" onClick="javascript:location='${path}/sreport/list.do'">취소</button>
			</div>
<!--//계약등록-->

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
		$('#supplyModal').on('show.bs.modal', function(e) {
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

		function fnSetSupplyData(a, b) {
			$("#supplyNo").val(b);
			$("#supplyName").val(a);
			$(".modal-backdrop").remove();
			$("#supplyModal").modal("hide");
		}

		function fn_SaveCont() {
			var contData = {};
			contData.contNo 					= $("#contNo").val();
			contData.contTitle 				= $("#contTitle").val(); 
			contData.contDesc			 	= $("#contDesc").val();
			contData.userNo		 			= $("#userNo").val();
			contData.soppNo					= $("#soppNo").val();
			contData.custNo 					= $("#custNo").val();
			contData.soppNo 				= $("#soppNo").val();
			contData.ptncNo 					= $("#ptncNo").val();
			contData.supplyNo 				= $("#supplyNo").val();
			contData.contType 				= $("#contType").val();
			contData.contAmt 				= $("#contAmt").val();
			contData.contArea 				= $("#contArea").val();
			contData.contOrddate 			= $("#contOrddate").val();
			contData.freemaintSdate 		= $("#freemaintSdate").val();
			contData.freemaintEdate 		= $("#freemaintEdate").val();
			console.log(contData);
			

			$.ajax({ url: "${path}/cont/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
						data: contData , // HTTP 요청과 함께 서버로 보낼 데이터 
						method: "POST", // HTTP 요청 메소드(GET, POST 등) 
						dataType: "json" // 서버에서 보내줄 데이터의 타입 
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							javascript:location.herf='${path}/cont/list.do';
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
					.fail(function(xhr, status, errorThrown) { 
						alert("통신 실패");
					});
			}
	</script>

