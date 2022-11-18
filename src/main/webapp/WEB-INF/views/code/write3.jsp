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
					기초코드 작성
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
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#tab01" role="tab">Level01 코드</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#tab02" role="tab">Level02 코드</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#tab03" role="tab">Level03 코드</a>
				</li>
				<li class="nav-item">
			</ul>
			<!-- Tab panes -->
			<div class="tab-content tabs m-t-20">
				<div class="tab-pane" id="tab01" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name="form1" method="post">
								<table class="table table-sm bst02">
									<colgroup>
										<col width="25%" />
										<col width="75%"/>
									</colgroup>				
									<tbody>
										<tr>
										<th scope="row">기초코드 01</th>
											<td>
												<input name="code01" id ="code01" value="" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">기초코드 표시명</th>
											<td>
												<input name="desc01" id ="desc01" value="" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">기초코드 값</th>
											<td>
												<input name="value01" id ="value01" value="" class="form-control form-control-sm">
											</td>
										</tr>
									</tbody>
								</table>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/code/list.do'">목록</button>
								<button class="btn btn-md btn-primary" value="수정" id="btnUpdate" onClick= "fn_codeInsert01()">등록</button>
							</div>
							<table id="codeTable" class="table table-striped table-bordered nowrap ">
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
									<th>코드번호</th>
									<th>Lv1 코드</th>
									<th>Lv1 코드명</th>
									<th>Lv1 코드값</th>									
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${list1}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td><a href="javascript:location.herf='${path}/code/detail/${row.codeNo}'">${row.codeNo}</a></td>
									<td>${row.code01}</td> 
									<td>${row.desc01}</td>
									<td>${row.value01}</td>
								</tr>
							</c:forEach>								
							</tbody>
						</table>
						</div>	
					</div>
				</div>
				<div class="tab-pane " id="tab02" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name = "form2" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<colgroup>
										<col width="25%" />
										<col width="75%"/>
									</colgroup>				
									<tbody>
										<tr>
										<th scope="row">상위코드 01</th>
											<td>
												<div class="input-group input-group-sm mb-0">
													<input type="text" class="form-control" name="desc21"
														id="desc21" value="" /> <input type="hidden"
														name="code21" id="code21" value="" /> <span
														class="input-group-btn">
														<button class="btn btn-primary sch-partner"
															data-remote="${path}/modal/popup.do?popId=code01"
															type="button" data-toggle="modal"
															data-target="#code01Modal">
															<i class="icofont icofont-search"></i>
														</button>
													</span>
													<div class="modal fade " id="code01Modal" tabindex="-1"
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
										</tr>
										<tr>
											<th scope="row">기초코드02</th>
											<td>
												<input name="code02" id ="code02" value="" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">기초코드 표시명</th>
											<td>
												<input name="desc02" id ="desc02" value="" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">기초코드 값</th>
											<td>
												<input name="value02" id ="value02" value="" class="form-control form-control-sm">
											</td>
										</tr>
									</tbody>
								</table>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/code/list.do'">목록</button>
								<button class="btn btn-md btn-primary" value="수정" id="btnUpdate" onClick= "fn_codeInsert02()" >등록</button>
							</div>
							<table id="codeTable" class="table table-striped table-bordered nowrap ">
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
									<th>코드번호</th>
									<th>Lv2 코드</th>
									<th>Lv2 코드명</th>
									<th>Lv2 코드값</th>									
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${list2}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td><a href="javascript:location.herf='${path}/code/detail/${row.codeNo}'">${row.codeNo}</a></td>
									<td>${row.code02}</td> 
									<td>${row.desc02}</td>
									<td>${row.value02}</td>
								</tr>
							</c:forEach>								
							</tbody>
						</table>
						</div>	
					</div>
				</div>
				<div class="tab-pane active" id="tab03" role="tabpanel">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<form name = "form3" method="post" onsubmit="return false;">
								<table class="table table-sm bst02">
									<colgroup>
										<col width="25%" />
										<col width="75%"/>
									</colgroup>				
									<tbody>
										<tr>
											<th scope="row">상위코드 02</th>
											<td>
												<div class="input-group input-group-sm mb-0">
													<input type="text" class="form-control" name="desc32"
														id="desc32" value="" /> <input type="hidden"
														name="code32" id="code32" value="" /> <span
														class="input-group-btn">
														<button class="btn btn-primary sch-partner"
															data-remote="${path}/modal/popup.do?popId=code02"
															type="button" data-toggle="modal"
															data-target="#code02Modal">
															<i class="icofont icofont-search"></i>
														</button>
													</span>
													<div class="modal fade " id="code02Modal" tabindex="-1"
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
										</tr>
										<tr>
											<th scope="row">기초코드03</th>
											<td>
												<input name="code03" id ="code03" value="" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">기초코드 표시명</th>
											<td>
												<input name="desc03" id ="desc03" value="" class="form-control form-control-sm">
											</td>
										</tr>
										<tr>
											<th scope="row">기초코드 값</th>
											<td>
												<input name="value03" id ="value03" value="" class="form-control form-control-sm">
											</td>
										</tr>
									</tbody>
								</table>
							</form>
							<div class="btn_wr text-right mt-3">
								<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/code/list.do'">목록</button>
								<button class="btn btn-md btn-primary" value="수정" id="btnUpdate" onClick= "fn_codeInsert03()" >등록</button>
							</div>
							<table id="codeTable" class="table table-striped table-bordered nowrap ">
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
									<th>코드번호</th>
									<th>Lv3 코드</th>
									<th>Lv3 코드명</th>
									<th>Lv3 코드값</th>									
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${list3}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td><a href="javascript:location.herf='${path}/code/detail/${row.codeNo}'">${row.codeNo}</a></td>
									<td>${row.code03}</td> 
									<td>${row.desc03}</td>
									<td>${row.value03}</td>
								</tr>
							</c:forEach>								
							</tbody>
						</table>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Row end -->
</div>
<script>
function fn_codeInsert01() {
	var codeData = {};
	codeData.code01 			= $("#code01").val();
	codeData.desc01 			= $("#desc01").val();
	codeData.value01 			= $("#value01").val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					location.herf='${path}/code/write1.do';
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
	}
	
function fn_codeInsert02() {
	var codeData = {};
	codeData.code01 			= $("#code21").val();
	codeData.code02 			= $("#code02").val();
	codeData.desc02 			= $("#desc02").val();
	codeData.value02 			= $("#value02").val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					location.herf='${path}/code/write2.do';
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
	}
	
function fn_codeInsert03() {
	var codeData = {};
	codeData.code02 			= $("#code32").val();
	codeData.code03 			= $("#code03").val();
	codeData.desc03 			= $("#desc03").val();
	codeData.value03 			= $("#value03").val();
	console.log(codeData);
	$.ajax({ url: "${path}/code/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
				data: codeData , // HTTP 요청과 함께 서버로 보낼 데이터 
				method: "POST", // HTTP 요청 메소드(GET, POST 등) 
				dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("저장 성공");
					location.herf='${path}/code/write3.do';
				}else{
					alert("저장 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("통신 실패");
			});
	}

$('#code01Modal').on('show.bs.modal', function(e) {
	var button = $(e.relatedTarget);
	var modal = $(this);
	modal.find('.modal-body').load(button.data("remote"));
});
$('#code02Modal').on('show.bs.modal', function(e) {
	var button = $(e.relatedTarget);
	var modal = $(this);
	modal.find('.modal-body').load(button.data("remote"));
});

function fnSetCode01Data(a, b) {
	$("#code21").val(a);
	$("#desc21").val(b);
	$(".modal-backdrop").remove();
	$("#code01Modal").modal("hide");
}
function fnSetCode02Data(a, b) {
	$("#code32").val(a);
	$("#desc32").val(b);
	$(".modal-backdrop").remove();
	$("#code02Modal").modal("hide");
}

</script>

                                                