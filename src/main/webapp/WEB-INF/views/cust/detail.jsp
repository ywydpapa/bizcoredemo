<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
						거래처 정보
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
				<ul class="nav nav-tabs tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tab01" role="tab">기본정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab02" role="tab">주소/연락처</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab03" role="tab">담당자 정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab04" role="tab">세무/거래관련 정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab05" role="tab">업체 업종 정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab06" role="tab">영업 정보(${fn:length(saleslist)})</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab07" role="tab">업체 계약 정보(${fn:length(contlist)})</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tab08" role="tab">기술지원 정보(${fn:length(techdlist)})</a></li>
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
													value="${dto.custNo}" readonly
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">거래처명</th>
												<td><input type="text" name="custName" id="custName"
													value="${dto.custName}" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th scope="row">대표자명</th>
												<td><input type="text" name="custBossname"
													id="custBossname" value="${dto.custBossname}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">사업자번호</th>
												<td><input name="custVatno" id="custVatno"
													value="${dto.custVatno}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">거래처이메일</th>
												<td><input name="custEmail" id="custEmail"
													value="${dto.custEmail}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">계산서이메일</th>
												<td><input name="custVatemail" id="custVatemail"
													value="${dto.custVatemail}"
													class="form-control form-control-sm"></td>
											</tr>
										</tbody>
									</table>
								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cust/list.do'">목록</button>
									<button class="btn btn-md btn-primary" onClick="fn_custDelete01();">삭제</button>
									<button class="btn btn-md btn-primary" onClick="fn_custUpdate01();">수정</button>
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
												<th scope="row">우편번호</th>
												<td onClick="execDaumPostcode();">
												<input name="custPostno" id="custPostno" type="text"
													value="${dto02.custPostno}" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th scope="row">주소</th>
												<td><input name="custAddr" id="custAddr" type="text"
													value="${dto02.custAddr}" class="form-control form-control-sm" placeholder="우편번호를 등록하시면 자동등록 됩니다..." readonly>
												</td>
											</tr>
											<tr>
												<th scope="row">상세주소</th>
												<td><input name="custAddr2" id="custAddr2" type="text"
													value="${dto02.custAddr2}" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th scope="row">대표전화</th>
												<td><input name="custTel" id="custTel" type="tel"
													value="${dto02.custTel}" class="form-control form-control-sm">
												</td>
											</tr>
												<tr>
												<th scope="row">FAX</th>
												<td><input name="custFax" id="custFax" type="tel"
													value="${dto02.custFax}" class="form-control form-control-sm">
												</td>
											</tr>
											<tr>
												<th scope="row">메모</th>
												<td><textarea name="custMemo" id="custMemo" cols="30" rows="20"
													value="${dto02.custMemo}" class="form-control form-control-sm">${dto02.custMemo}</textarea>
												</td>
											</tr>

										</tbody>
									</table>
								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cust/list.do'">목록</button>
									<button class="btn btn-md btn-primary" onClick="fn_custUpdate02();">수정</button>
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
												<th scope="row">담당자 성명</th>
												<td><input name="custMname" id="custMname" type="text"
													value="${dto03.custMname}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">담당자 직급</th>
												<td><input name="custMrank" id="custMrank" type="text"
													value="${dto03.custMrank}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">담당자 연락처</th>
												<td><input name="custMtel" id="custMtel" type="tel"
												placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"
													value="${dto03.custMtel}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">담당자 핸드폰</th>
												<td><input name="custMmobile" id="custMmobile" type="tel"
												placeholder="00*-000*-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"
													value="${dto03.custMmobile}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">담당자 이메일</th>
												<td><input name="custMemail" id="custMemail" type="email"
													value="${dto03.custMemail}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">담당자 메모</th>
												<td><textarea name="custMmemo" id="custMmemo" cols="30" rows="15"
													class="form-control form-control-sm">${dto03.custMmemo}</textarea></td>
											</tr>
										</tbody>
									</table>
								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cust/list.do'">목록</button>
									<button class="btn btn-md btn-primary" onClick="fn_custUpdate03();">추가</button>
								</div>
								<div id="custMemberlist" class="col-sm-12">
									<table id="custmemberTable"
										class="table table-striped table-bordered nowrap">
										<colgroup>
											<col width="5%" />
											<col width="12%" />
											<col width="11%" />
											<col width="15%" />
											<col width="15%" />
											<col width="15%" />
											<col width="20%" />
										</colgroup>
										<thead>
											<tr>
												<th class="text-center">고객 담당자 번호</th>
												<th class="text-center">고객성명</th>
												<th class="text-center">직급</th>
												<th class="text-center">연락처(휴대폰)</th>
												<th class="text-center">연락처(사무실)</th>
												<th class="text-center">연락처(이메일)</th>
												<th class="text-center">메모</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="memberlist" items="${memberlist}">
												<tr align="center">
													<td>${memberlist.custData03no}</td>
													<td>${memberlist.custMname}</td>
													<td>${memberlist.custMrank}</td>
													<td>${memberlist.custMmobile}</td>
													<td>${memberlist.custMtel}</td>
													<td>${memberlist.custMemail}</td>
													<td>${memberlist.custMmemo}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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
												<th scope="row">사업자 번호</th>
												<td><input name="custVatno1" id="custVatno1" type="text"
													value="${dto.custVatno}" readonly
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">기준연도</th>
												<td><input name="custByear" id="custByear" type="text" placeholder="년도만 입력해주십시오.(ex:2022)" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4"
													value="${dto04.custByear}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">줄돈</th>
												<td><input name="custBBalance" id="custDRbalance" placeholder="숫자만 입력해주십시오." oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" maxlength="15"
													value="${dto04.custDRbalance}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">받을돈</th>
												<td><input name="custBBalance" id="custCRbalance" placeholder="숫자만 입력해주십시오." oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" maxlength="15"
													value="${dto04.custCRbalance}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">계산서 이메일</th>
												<td><input name="custVatemail1" id="custVatemail1" type="email"
													value="${dto04.custVatemail}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">업종</th>
												<td><input name="custVattype" id="custVattype"
													value="${dto04.custVattype}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">업태</th>
												<td><input name="custVatbiz" id="custVatbiz"
													value="${dto04.custVatbiz}"
													class="form-control form-control-sm"></td>
											</tr>
											<tr>
												<th scope="row">세무관련 메모</th>
												<td><textarea name="custVatmemo" id="custVatmemo"
													value="${dto04.custVatmemo}" cols="30" rows="15"
													class="form-control form-control-sm">${dto04.custVatmemo}</textarea></td>
											</tr>
										</tbody>
									</table>
								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cust/list.do'">목록</button>
									<c:if test="${userRole =='ADMIN'}">
										<button class="btn btn-md btn-primary" onClick="fn_custUpdate04();">수정</button>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab05" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<form name="form5" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="25%" />
											<col width="75%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">업체분류</th>
												<td><select name="compType" id="compType">
													<c:forEach var="comptype" items="${comptype}">
													<option value="${comptype.code03}">${comptype.desc03}</option>
													</c:forEach>
												</select></td>
											</tr>
											<tr>
												<th scope="row">판매분류</th>
												<td><select name="saleType" id="saleType">
													<c:forEach var="saletype" items="${saletype}">
													<option value="${saletype.code03}">${saletype.desc03}</option>
													</c:forEach>
												</select></td>
											</tr>
											<tr>
												<th scope="row">영업협력사 여부</th>
												<td><select name="ptncYn" id="ptncYn">
												<option value="YY" <c:if test="${dto.ptncYn eq 'YY'}">selected</c:if>>예</option>
												<option value="" <c:if test="${dto.ptncYn eq ''}">selected</c:if>>아니오</option>
												</select></td>
											</tr>
											<tr>
												<th scope="row">고객사 여부</th>
												<td><select name="custYn" id="custYn">
												<option value="YY" <c:if test="${dto.custYn eq 'YY'}">selected</c:if>>예</option>
												<option value="" <c:if test="${dto.custYn eq ''}">selected</c:if>>아니오</option>
												</select></td>
											</tr>
											<tr>
												<th scope="row">공급사 여부</th>
												<td><select name="suppYn" id="suppYn">
												<option value="YY"<c:if test="${dto.suppYn eq 'YY'}">selected</c:if>>예</option>
												<option value="" <c:if test="${dto.suppYn eq ''}">selected</c:if>>아니오</option>
												</select></td>
											</tr>
											<tr>
												<th scope="row">거래처 여부</th>
												<td><select name="buyrYn" id="buyrYn">
												<option value="YY"<c:if test="${dto.buyrYn eq 'YY'}">selected</c:if>>예</option>
												<option value=""<c:if test="${dto.buyrYn eq ''}">selected</c:if>>아니오</option>
												</select></td>
											</tr>
										</tbody>
									</table>
								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cust/list.do'">목록</button>
									<button class="btn btn-md btn-primary" value="수정" id="btnUpdate"
										onClick="fn_custUpdate05()">수정</button>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab06" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<form name="form6" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="25%" />
											<col width="25%" />
											<col width="25%" />
											<col width="25%" />
										</colgroup>
										<tbody>
										<tr>
											<th class="text-center">영업일자</th>
											<th class="text-center">영업명</th>
											<th class="text-center">담당자</th>
											<th class="text-center">계약상세</th>
										</tr>
										<c:forEach var="slist" items="${saleslist}">
											<tr>
												<td class="text-center">${fn:substring(slist.regDatetime, 0, 10)}</td>
												<td>${slist.salesTitle}</td>
												<td class="text-center">${slist.userName}</td>
												<td>${slist.salesDesc}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cust/list.do'">목록</button>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab07" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<form name="form7" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="25%" />
											<col width="25%" />
											<col width="25%" />
											<col width="25%" />
										</colgroup>
										<tbody>
										<tr>
											<th class="text-center">계약일자</th>
											<th class="text-center">계약명</th>
											<th class="text-center">계약금액</th>
											<th class="text-center">계약상세</th>
										</tr>
                                  <c:forEach var="clist" items="${contlist}">
										<tr>
											<td class="text-center">${clist.paymaintSdate}~${clist.paymaintEdate}</td>
											<td>${clist.contTitle}</td>
											<td class="text-right"><fmt:formatNumber value="${clist.contAmt}" pattern="#,###"/></td>
											<td>${clist.contDesc}</td>
										</tr>
								  </c:forEach>
										</tbody>
									</table>

								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cust/list.do'">목록</button>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane " id="tab08" role="tabpanel">
						<div class="card-block table-border-style">
							<div class="table-responsive">
								<form name="form8" method="post" onsubmit="return false;">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="10%" />
											<col width="25%" />
											<col width="50%" />
											<col width="15%" />
										</colgroup>
										<tbody>
										<tr>
											<th class="text-center">지원일자</th>
											<th class="text-center">기술지원명</th>
											<th class="text-center">요청내용</th>
											<th class="text-center">담당자</th>
										</tr>
										<c:forEach var="tlist" items="${techdlist}">
											<tr>
												<td>${tlist.techdFrom}</td>
												<td>${tlist.techdTitle}</td>
												<td>${tlist.techdDesc}</td>
												<td class="text-center">${tlist.userName}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>

								</form>
								<div class="btn_wr text-right mt-3">
									<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/cust/list.do'">목록</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Row end -->
	</div>
	<!-- Bootstrap tab card end -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

	function fn_Reloaddata01(url, data){
		$("#custmemberTable").empty();
		$("#custmemberTable").load(url, data, function(){
			setTimeout(function(){
			}, 500);
	});
	}

		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
					   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if(extraRoadAddr !== ''){
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if(fullRoadAddr !== ''){
						fullRoadAddr += extraRoadAddr;
					}
					document.getElementById('custPostno').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('custAddr').value = fullRoadAddr;
					document.getElementById('custAddr2').focus();
				}
			}).open({
				autoClose:true
			});
		}

		function fn_custUpdate01(){
			var custData = {};
			custData.custNo 		= $("#custNo").val();
			custData.custName 		= $("#custName").val();
			custData.custBossname 	= $("#custBossname").val();
			custData.custVatno 		= $("#custVatno").val();
			custData.custEmail 		= $("#custEmail").val();
			custData.custVatemail 	= $("#custVatemail").val();

			$.ajax({ url: "${path}/cust/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
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

		function fn_custUpdate02(){
			var custData2 = {};
			custData2.custNo 		= $("#custNo").val();
			custData2.custPostno 	= $("#custPostno").val();
			custData2.custAddr 		= $("#custAddr").val();
			custData2.custAddr2 	= $("#custAddr2").val();
			custData2.custTel 		= $("#custTel").val();
			custData2.custFax 		= $("#custFax").val();
			
			if($("textarea[id='custMemo']").attr("style") === "display: none;"){
				custData2.custMemo 		= tinyMCE.get("custMemo").getContent();
			}else{
				custData2.custMemo 		= $("#custMemo").val();
			}
			

			$.ajax({ url: "${path}/cust/insert02.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
						data: custData2 , // HTTP 요청과 함께 서버로 보낼 데이터
						method: "POST", // HTTP 요청 메소드(GET, POST 등)
						dataType: "json" // 서버에서 보내줄 데이터의 타입
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
			}

		function fn_custUpdate03(){
			var custData3 = {};
			custData3.custNo 	  		= $("#custNo").val();
			custData3.custMname 		= $("#custMname").val();
			custData3.custMrank			= $("#custMrank").val();
			custData3.custMtel 			= $("#custMtel").val();
			custData3.custMmobile 		= $("#custMmobile").val();
			custData3.custMemail		= $("#custMemail").val();
			custData3.custMmemo			= $("#custMmemo").val();

			$.ajax({ url: "${path}/cust/insert03.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
						data: custData3 , // HTTP 요청과 함께 서버로 보낼 데이터
						method: "POST", // HTTP 요청 메소드(GET, POST 등)
						dataType: "json" // 서버에서 보내줄 데이터의 타입
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							var url ="${path}/cust/listcustM/"+$("#custNo").val();
							fn_Reloaddata01(url);
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
			}

		function fn_custUpdate04(){
			var compNo = "${sessionScope.compNo}";
			var custData4 = {};
			custData4.custNo 		= $("#custNo").val();
			custData4.compNo		= compNo;
			custData4.custByear	= $("#custByear").val();
			custData4.custCRbalance	= $("#custCRbalance").val();
			custData4.custDRbalance	= $("#custDRbalance").val();
			custData4.custVatemail	= $("#custVatemail").val();
			custData4.custVatno		= $("#custVatno1").val();
			custData4.custVattype 	= $("#custVattype").val();
			custData4.custVatbiz	= $("#custVatbiz").val();
			
			if($("#custVatmemo").attr("style") === "display: none;"){
				custData4.custVatmemo 	= tinyMCE.get("custVatmemo").getContent();
			}else{
				custData4.custVatmemo 	= $("#custVatmemo").val();
			}

			$.ajax({ url: "${path}/cust/insert04.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
						data: custData4 , // HTTP 요청과 함께 서버로 보낼 데이터
						method: "POST", // HTTP 요청 메소드(GET, POST 등)
						dataType: "json" // 서버에서 보내줄 데이터의 타입
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
			}

		function fn_custUpdate05(){
			var custData5 = {};
			custData5.compType 		= $("#compType").val();
			custData5.saleType 		= $("#saleType").val();
			custData5.custNo 		= $("#custNo").val();
			custData5.custYn		= $("#custYn").val();
			custData5.ptncYn 		= $("#ptncYn").val();
			custData5.buyrYn		= $("#buyrYn").val();
			custData5.suppYn	 	= $("#suppYn").val();

			$.ajax({ url: "${path}/cust/update05.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
						data: custData5 , // HTTP 요청과 함께 서버로 보낼 데이터
						method: "POST", // HTTP 요청 메소드(GET, POST 등)
						dataType: "json" // 서버에서 보내줄 데이터의 타입
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
			}


	/*
	function fn_custUpdate() {

		var custData = {};

		custData.custNo 			= $("#custNo").val();
		custData.custName 		= $("#custName").val();
		custData.custBossname = $("#custBossname").val();
		custData.custVatno 		= $("#custVatno").val();
		custData.custEmail 		= $("#custEmail").val();
		custData.custVatemail 	= $("#custVatemail").val();

		$.ajax({ url: "${path}/cust/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: custData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("저장 성공");
					}else{
						alert("저장 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
		}
	*/

	function fn_custDelete01() {

		var custData = {};
		custData.custNo 			= $("#custNo").val();

		$.ajax({ url: "${path}/cust/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: custData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("삭제 성공");
						var url = '${path}/cust/list.do';
						location.href = url;
					}else{
						alert("삭제 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
		}
	function fn_custDetail1() {
		var custData = {};
		custData.custNo 		    	= $("#custNo").val();
		custData.custAddr 			= $("#custAddr").val();
		custData.custAddr2	    	= $("#custAddr2").val();
		custData.custTel             = $("#custTel").val();

		var custSendData = {};
		custSendData.custNo 		    	= $("#custNo").val();

		console.log(custData);
		$.ajax({ url: "${path}/cust/updateCD.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: custData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("저장 성공");
						fnSetPage('${path}/cust/detail.do',custSendData); // TODO : fnSetPage
					}else{
						alert("저장 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
		}

	$(document).ready(function(){
		$('#saleType').val('${dto.saleType}').prop("selected",true);
		$('#compType').val('${dto.compType}').prop("selected",true);
	});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>