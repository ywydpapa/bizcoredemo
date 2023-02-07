<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
	<script type="text/javascript">
	<c:if test="${userInfo.userNo == sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
		function fn_userUpdate(obj) {
			
			var userData = {};
			//전화번도 유효성 검사
			var regExp = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
			var userTel		= $("#userTel").val();
			
			if( !regExp.test(userTel)) {
			     alert("전화번호를 다시 입력해주세요.");
			     return;
			};
			//전화번도 유효성 검사
			userData.userNo 		= $("#userNo").val();
			userData.userId 		= $("#userId").val();
			//이메일, 전화번호
			userData.userEmail		= $("#userEmail").val();
			userData.userTel		= $("#userTel").val();
			
			if($("[name='userPasswd']").attr("data-number") == 1){
				userData.userPasswd 	= 1;s
			}else{
				userData.userPasswd		= 0;
			}
			userData.userName 		= $("#userName").val();
			userData.userRole 		= $("#userRole").val();
			userData.org_id 		= $("#userDept").val();
			userData.attrib 		= obj.className == "btn btn-md btn-danger" ? "XXXXX" : $("#userAttrib").val();
			userData.userOtp		= $("#userOtp").val();
			userData.userKey 		= $("#userRoleAA").val()+$("#userRoleBB").val()+$("#userRoleCC").val()+$("#userRoleDD").val()+$("#userRoleEE").val()+$("#userRoleFF").val()+$("#userRoleGG").val()+$("#userRoleHH").val()+$("#userRoleII").val()+$("#userRoleJJ").val()+$("#userRoleKK").val()+$("#userRoleLL").val()+$("#userRoleMM").val()+$("#userRoleNN").val();
			
			
			if (obj.className == "btn btn-md btn-danger"){
				let answer = confirm( $("#userName").val() +"을(를) 퇴사 처리 하시겠습니까?"); 
				if(answer == true) {
					$.ajax({ url: "${path}/user/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
						data: userData , // HTTP 요청과 함께 서버로 보낼 데이터
						method: "POST", // HTTP 요청 메소드(GET, POST 등)
						dataType: "json" // 서버에서 보내줄 데이터의 타입
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
					.done(function(data) {
						if(data.code == 10001){
							alert("저장 성공");
							var url = '${path}/user/list.do';
							location.href = url;
						}else{
							alert("저장 실패");
						}
					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
					.fail(function(xhr, status, errorThrown) {
						alert("통신 실패");
					});
				}
			} else {
				$.ajax({ url: "${path}/user/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: userData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("저장 성공");
						var url = '${path}/user/list.do';
						location.href = url;
					}else{
						alert("저장 실패");
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신 실패");
				});
			}
			
			}
	</c:if>
	</script>

	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						사용자 수정
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst02">
							<colgroup>
								<col width="25%"/>
								<col width="25%"/>
								<col width="13%"/>
								<col width="12%"/>
								<col width="13%"/>
								<col width="12%"/>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td>
										<input name="userId" id="userId" value="${userInfo.userId}" class="form-control form-control-sm" readonly ><input type="hidden" id="userNo" value="${userInfo.userNo}" readonly >
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td>
										<label><input type="checkbox" name="userPasswd" id="userPasswd" data-number="0" class="form-control">암호 초기화</label>
									</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td>
										<input name="userName" id="userName"  value="${userInfo.userName}" class="form-control form-control-sm">
									</td>
								</tr>
								<tr>
									<th scope="row">사용자 권한</th>
									<td>
										<select name="userRole" id="userRole"  class="form-control form-control-sm">
										<option value="CUSER" <c:if test="${userInfo.userRole eq 'CUSER'}">selected</c:if>>일반사용자</option>
										<option value="PUSER" <c:if test="${userInfo.userRole eq 'PUSER'}">selected</c:if>>조직관리자</option>
										<option value="ADMIN" <c:if test="${userInfo.userRole eq 'ADMIN'}">selected</c:if>>시스템관리자</option>
										<option value="DUSER" <c:if test="${userInfo.userRole eq 'DUSER'}">selected</c:if>>데모사용자</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>부서</td>
									<td><select class="form-control" name="userDept" id="userDept">
										<c:forEach var="listDept" items="${listDept}">
										<option value="${listDept.org_id}" <c:if test="${listDept.org_id eq userInfo.org_id}">selected</c:if>>${listDept.org_title}</option>
										</c:forEach>
										</select></td>
								</tr>
						 
								<!-- tel -->
								<tr>
									<td>전화번호</td>
									<td><input type="text" class="form-control form-control-sm" id="userTel" name="userTel" value="${userInfo.userTel}" placeholder="000-0000-0000">
									</td>
								</tr>
								<!-- tel value="${userInfo.userTel}"-->
								<!-- e-mail -->
								<tr>
									<td>이메일</td>
									<td><input type="text" class="form-control form-control-sm" id="userEmail" name="userEmail" value="${userInfo.userEmail}">
									</td>
								</tr>
								<tr>
									<td>등록 일자</td>
									<td>
										<input type="text" name="userAttStart" id="userAttStart" value="${userInfo.regDateTime}" disabled>  
									</td>
								</tr>
						<!--  	<tr>
									<td>퇴사일자</td>
									<td>
										<input type="text" name="userAttEnd" id="userAttEnd" <c:if test="${userInfo.attrib eq 'XXXXX'}" >value="${userInfo.modDateTime}"</c:if> disabled>  
									</td>
								</tr>-->	
								<tr>
									<td>로그인 설정</td>
									<td><select class="form-control" id="userAttrib">
										<option value="10000">로그인 가능</option>
										<option value="XXXXX">로그인 금지</option>
										</select></td>
								</tr>
								<!-- e-mail value="${userInfo.userEmail}"-->
								<tr>
									<td>표시 순서</td>
									<td>
										<input type="text" name="userOtp" id="userOtp" value="${userInfo.userOtp}"></input>
									</td>
								</tr>
								<tr align="center">
									<td rowspan="10">화면권한 설정</td>
									<td> 화면 구분 </td>
									<td> 화면코드 </td>
									<td> 권한설정 </td>
									<td> 화면코드 </td>
									<td> 권한설정 </td>
								</tr>
								<tr>
									<td> 일정관리 </td>
									<td> AA </td>
									<td><select class="form-control" id="userRoleAA">
										<option value="AA0">권한없음</option>
										<option value="AA5">읽기전용</option>
										<option value="AA7">읽기쓰기</option>
										</select>
									</td>
									<td> BB </td>
									<td><select class="form-control" id="userRoleBB">
										<option value="BB0">권한없음</option>
										<option value="BB5">읽기전용</option>
										<option value="BB7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 영업활동관리 </td>
									<td> CC </td>
									<td><select class="form-control" id="userRoleCC">
										<option value="CC0">권한없음</option>
										<option value="CC5">읽기전용</option>
										<option value="CC7">읽기쓰기</option>
										</select>
									</td>
									<td> DD </td>
									<td><select class="form-control" id="userRoleDD">
										<option value="DD0">권한없음</option>
										<option value="DD5">읽기전용</option>
										<option value="DD7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 영업기회관리 </td>
									<td> EE </td>
									<td><select class="form-control" id="userRoleEE">
										<option value="EE0">권한없음</option>
										<option value="EE5">읽기전용</option>
										<option value="EE7">읽기쓰기</option>
										</select>
									</td>
									<td> FF </td>
									<td><select class="form-control" id="userRoleFF">
										<option value="FF0">권한없음</option>
										<option value="FF5">읽기전용</option>
										<option value="FF7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 수주판매보고 관리 </td>
									<td> GG </td>
									<td><select class="form-control" id="userRoleGG">
										<option value="GG0">권한없음</option>
										<option value="GG5">읽기전용</option>
										<option value="GG7">읽기쓰기</option>
										</select>
									</td>
									<td> HH </td>
									<td><select class="form-control" id="userRoleHH">
										<option value="HH0">권한없음</option>
										<option value="HH5">읽기전용</option>
										<option value="HH7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 계약관리 </td>
									<td> II </td>
									<td><select class="form-control" id="userRoleII">
										<option value="II0">권한없음</option>
										<option value="II5">읽기전용</option>
										<option value="II7">읽기쓰기</option>
										</select>
									</td>
									<td> JJ </td>
									<td><select class="form-control" id="userRoleJJ">
										<option value="JJ0">권한없음</option>
										<option value="JJ5">읽기전용</option>
										<option value="JJ7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 기술지원 관리 </td>
									<td> KK </td>
									<td><select class="form-control" id="userRoleKK">
										<option value="KK0">권한없음</option>
										<option value="KK5">읽기전용</option>
										<option value="KK7">읽기쓰기</option>
										</select>
									</td>
									<td> LL </td>
									<td><select class="form-control" id="userRoleLL">
										<option value="LL0">권한없음</option>
										<option value="LL5">읽기전용</option>
										<option value="LL7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 설정 관리 </td>
									<td> MM </td>
									<td><select class="form-control" id="userRoleMM">
										<option value="MM0">권한없음</option>
										<option value="MM5">읽기전용</option>
										<option value="MM7">읽기쓰기</option>
										</select>
									</td>
									<td> NN </td>
									<td><select class="form-control" id="userRoleNN">
										<option value="NN0">권한없음</option>
										<option value="NN5">읽기전용</option>
										<option value="NN7">읽기쓰기</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wr text-right mt-3">
						<button class="btn btn-md btn-success f-left" onClick="javascript:location='${path}/user/list.do'">목록</button>
						<c:if test="${userInfo.userNo == sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
								<button class="btn btn-md btn-primary" onClick= "fn_userUpdate(this)">수정</button>
								<button class="btn btn-md btn-danger" onClick= "fn_userUpdate(this)">퇴사처리</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../body-bottom.jsp"/>
<script>
	$("[name='userPasswd']").change(function(){
		if($(this).attr("data-number") == 0){
			$(this).attr("data-number", 1);
		}else{
			$(this).attr("data-number", 0);
		}
	});

	$("[id^='userRole']").find("option").each(function(index, item){
		var userKey = "${userInfo.userKey}";
		
		if(userKey.indexOf(item.value) != -1){
			$(this).attr("selected", true);
		}
	})
	
	
	function now() {
    let d = new Date();
    return (
        (d.getFullYear() % 100) +
        "-" +
        (d.getMonth() + 1 > 9
            ? (d.getMonth() + 1).toString()
            : "0" + (d.getMonth() + 1)) +
        "-" +
        (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString()) +
        " " +
        (d.getHours() > 9
            ? d.getHours().toString()
            : "0" + d.getHours().toString()) +
        ":" +
        (d.getMinutes() > 9
            ? d.getMinutes().toString()
            : "0" + d.getMinutes().toString()) +
        ":" +
        (d.getSeconds() > 9
            ? d.getSeconds().toString()
            : "0" + d.getSeconds().toString())
    );
}
	
	function getYmd(date) {
	    let d = new Date(date);
	    return (
	        d.getFullYear() +
	        "-" +
	        (d.getMonth() + 1 > 9
	            ? (d.getMonth() + 1).toString()
	            : "0" + (d.getMonth() + 1)) +
	        "-" +
	        (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString())
	    );
	}
	
	
	
	
	
	
	
	
	
</script>