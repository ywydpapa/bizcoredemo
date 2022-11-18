<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<script>
$(function(){
    $('#quoteTable').DataTable({
    	info:false
    });
});
</script>
<style>
	a {
		text-decoration:underline;
	}
</style>
	<c:if test="${preserveSearchCondition != 'Y'}">
		<!-- DB TABLE 실행 -->
		<!--영업기회조회-->
		<!-- Page-header start 페이지 타이틀-->
		<div class="page-header2">
			<div class="row align-items-end">
				<div class="col-lg-12">
					<div class="page-header-title">
						<div class="d-inline">
							견적 내역 조회 
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Page-header end 페이지 타이틀 -->
		
		<!--영업기회조회-->
		<div class="cnt_wr">
			<div class="row">
				<form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
					<div class="col-sm-12">
						<div class="card_box sch_it">
							<div class="btn_wr text-right">
								<button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
								<button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>
								<button class="btn btn-sm btn-outline" onClick="javascript:location='${path}/sopp/write.do'"><i class="icofont icofont-pencil-alt-2"></i>등록</button>
							</div>
							<!--row-->
							<div class="form-group row">
								<!--담당자-->
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label" for="userName">담당자</label>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="userName" id="userName" value=""  readonly />
										 <input type="hidden" name="userNo" 	id="userNo" value="" /> 
										 <span class="input-group-btn">
											<button class="btn btn-primary sch-company"
												data-remote="${path}/modal/popup.do?popId=user"
												type="button" data-toggle="modal" data-target="#userModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<!--modal-->
										<div class="modal fade " id="userModal" tabindex="-1" role="dialog">
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
										<!--//modal-->
									</div>
								</div>
								<!--//담당자-->
								<!--거래처-->
								<div class="col-sm-12 col-xl-3">
									<label class="col-form-label" for="custName">매출처</label>
									<div class="input-group input-group-sm">
										<input type="text" class="form-control" name="custName" id="custName" value="" readonly/>
										<input type="hidden" name="custNo" id="custNo" value="" /> 
										<span class="input-group-btn">
											<button class="btn btn-primary sch-company"
												data-remote="${path}/modal/popup.do?popId=cust"
												type="button" data-toggle="modal" data-target="#custModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<!--modal-->
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
										<!--//modal-->
									</div>	
								</div>
								<!--//거래처-->
								<!--매출예정일-->
								<div class="col-sm-12 col-xl-6">
									<label class="col-form-label" for="targetDate">매출예정일</label>
									<p class="input_inline mb-0"><input class="form-control form-control-sm col-xl-6" type="date" id="targetDatefrom" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val(), this)"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="targetDateto" onChange="javascript:inputDate($('#targetDatefrom').val(), $('#targetDateto').val(), this)">
									</p>
								</div>
								<!--//매출예정일-->
							</div>
							<!--//row-->
							<div class="form-group row">
								<div class="col-sm-12 col-xl-4">
									<label class="col-form-label" for="soppType">판매방식</label>
									<select class="form-control form-control-sm" name="soppType" id="soppType" title="선택">
										<option value>선택</option>
										<c:forEach var = "saleslist" items="${saleslist}">	
										<option value="${saleslist.codeNo}">${saleslist.desc03}</option>			
										</c:forEach>
									</select>
								</div>
								<%--<div class="col-sm-12 col-xl-4">
									<label class="col-form-label" for="soppType">영업타입</label>
									<select name="select" class="form-control form-control-sm" id="businessType">
										<option value></option>
										<c:forEach var ="businessType" items="${businessType}">
											<option value = "${businessType.codeNo}">${businessType.desc03}</option>
										</c:forEach>
									</select>
								</div>--%>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--//영업기회조회-->
	</c:if>
	 <!--리스트 table-->
	<div class="cnt_wr" id="list-container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="quoteTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="1%"/>
								<col width="5%"/>
								<col width="36%"/>
								<col width="28%"/>
								<col width="5%"/>
								<col width="15%"/>
								<col width="5%"/>
								<col width="5%"/>
							</colgroup>							
							<thead>
								<tr>
									<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<th>판매방식</th>
									<th>영업기회</th>
									<th>거래처</th>
									<th>담당사원</th>
									<th>예상매출액</th>
									<th>진행단계</th>
									<th>매출예정일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${list}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td>${row.soppTypeN}</td>
									<td><a href="javascript:location.herf='${path}/sopp/detail2/${row.soppNo}'">${row.soppTitle}<span class="sales_n"></span></td>
									<td>${row.custName}</td>
									<td>${row.userName}</td>
									<td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.soppTargetAmt}" /></td>
									<td>${row.soppStatusN}</td>
									<td class="text-right">${row.soppTargetDate}</td>
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
    		
    	function fnListcon() {
    		var soppData = {};
    		soppData.userNo = $("#userNo").val() ? $("#userNo").val() : 0;
    		soppData.custNo = $("#custNo").val() ? $("#custNo").val() : 0;
    		soppData.targetDatefrom = $("#targetDatefrom").val() ? $("#targetDatefrom").val() : null;
    		soppData.targetDateto = $("#targetDateto").val() ? $("#targetDateto").val() : null;
    		soppData.soppType = $("#soppType").val() ? $("#soppType").val() : null;
    		/*soppData.businessType = $("#businessType").val() ? $("#businessType").val() : null;*/
    		
    		fnSetList('${path}/sopp/list2con.do', soppData);
   		}
</script>

