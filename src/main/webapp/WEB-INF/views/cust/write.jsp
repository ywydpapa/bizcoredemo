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
	<h2>거래처등록</h2>

	<div class="cnt_wr">
		<!-- Row start -->
		<div class="row">
			<div class="col-lg-12 col-xl-12">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs  tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#tab01" role="tab">기본정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tab02" role="tab">주소/연락처</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tab03" role="tab">담당자 정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tab04" role="tab">세무/거래관련 정보</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content tabs m-t-20">
					<div class="tab-pane active" id="tab01" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<form name="form1" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="25%" />
											<col width="75%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">거래처번호</th>
												<td><input name="custNo" id="custNo"
													value="" readonly placeholder="기본정보 등록 후 거래처 번호가 생성되며, 다른 탭 정보 등록이 가능합니다. "
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">거래처명</th>
												<td><input type="text" name="custName" id="custName" required
													value="" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th scope="row">대표자명</th>
												<td><input type="text" name="custBossname"
													id="custBossname" value="" required
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">사업자번호</th>
												<td><input type="text" name="custVatno" id="custVatno"
													value="" maxlength="12" placeholder = "사업자번호 10자리를 - 없이 입력 후 중복체크 해주십시오."
													class="form-control form-control-sm">
													<div id="vatnoCheckText"> !! 사업자 번호 중복체크 필요</div>
													 <button onclick="fn_custCheck();" class="btn btn-sm btn-primary f-right">중복체크</button></td>
											</tr>
											<tr>
												<th scope="row">거래처이메일</th>
												<td><input name="custEmail" id="custEmail" type="email" value=""
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">계산서이메일</th>
												<td><input name="custVatemail" id="custVatemail" type="email"
													value=""
													class="form-control form-control-sm"></td>
											</tr>
										</tbody>
									</table>
								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cust/list.do'">목록</button>
									<button class="btn btn-md btn-primary" value="" id="btnInsert01" onClick="fn_custInsert01();" >등록</button>
									<button class="btn btn-md btn-inverse" value="" id="btnDelete" 	onClick="javascript:location='${path}/cust/list.do'">취소</button>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab02" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<form name="form2" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="25%" />
											<col width="75%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">주소</th>
												<td><input name="custAddr" id="custAddr"
													value="${dto.dataStr}" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th scope="row">상세주소</th>
												<td><input name="custAddr2" id="custAddr2"
													value="${dto.dataStr}" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th scope="row">전화번호</th>
												<td><input name="custTel" id="custTel" placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"
													value="${dto.dataStr}" class="form-control form-control-sm">
												</td>
											</tr>
										</tbody>
									</table>
								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left">목록</button>
									<button class="btn btn-md btn-primary" value="" id="btnUpdate"
										onClick="fn_custDetail1()">등록</button>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab03" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<form name="form3" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="25%" />
											<col width="75%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">담당자</th>
												<td><input name="custEmail" id="custEmail"
													value="${dto.custEmail}"
													class="form-control form-control-sm"></td>
											</tr>
										</tbody>
									</table>
								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left">목록</button>
									<button class="btn btn-md btn-primary" value="" id="btnUpdate"
										onClick="fn_custDetail2()">등록</button>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab04" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<form name="form4" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="25%" />
											<col width="75%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">계산서 이메일</th>
												<td><input name="custVatemail" id="custVatemail"
													value="${dto.custVatemail}"
													class="form-control form-control-sm"></td>
											</tr>
										</tbody>
									</table>
								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left">목록</button>
									<button class="btn btn-md btn-primary" value="" id="btnUpdate"
										onClick="fn_custDetail3()">등록</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Row end -->
	</div>

	<script>

	$(document).ready(function () {
		   $(function () {
					$('#custVatno').keydown(function (event) {
					 var key = event.charCode || event.keyCode || 0;
					 $text = $(this);
					 if (key !== 8 && key !== 9) {
						 if ($text.val().length === 3) {
							 $text.val($text.val() + '-');
						 }
						 if ($text.val().length === 6) {
							 $text.val($text.val() + '-');
						 }
					 }
					 return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
				 })
		   });
		});

	function fn_custInsert01() {
		var custData = {};
		custData.custName 		= $("#custName").val();
		custData.custBossname 	= $("#custBossname").val();
		custData.custVatno 		= $("#custVatno").val();
		custData.custEmail 		= $("#custEmail").val();
		custData.custVatemail 	= $("#custVatemail").val();
		var compNu = '<%=(String)session.getAttribute("compNo")%>';
		custData.compNo 		= compNu;
		console.log(custData);
		$.ajax({ url: "${path}/cust/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: custData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("저장 성공");
						var url = '${path}/cust/list.do';
						location.href = url;
					}else{
						alert("저장 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
		}

	function fn_custCheck() {
		var custcheckData = {};
		custcheckData.custVatno = $("#custVatno").val();
		console.log(custcheckData.custVatno);
		if (custcheckData.custVatno.length != 12){
			alert("사업자 번호가 정확하지 않습니다.");
			return;
		}
		if (custcheckData.custVatno == ''){
			alert("사업자 번호를 입력해 중복체크를 해주세요.");
			return;
		}
		$.ajax({ url: "${path}/cust/custCheck.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data:custcheckData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data == 0){
					$("#vatnoCheckText").html("사업자번호 사용가능<br>");
					$("#custVatno").attr("readonly",true);
					$("#btnInsert01").removeAttr("disabled");
					alert("중복된 사업자 번호가 없습니다.");}
					else {
						alert("중복된 사업자 번호가 있습니다.");
						$("#custVatno").val('');
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신실패");
				});
		}
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>