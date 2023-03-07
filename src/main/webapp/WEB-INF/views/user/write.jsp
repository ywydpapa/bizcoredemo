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
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">사용자 등록</div>
				</div>
			</div>
		</div>
	</div>
		<form class="form-control" name="form1" method="post" onsubmit="return false;">
			<table class="table table-sm bst02">
				<tr>
					<td>아이디</td>
					<td style="display:flex;">
						<input class="form-control" style="width: 80%;" name="userId" id="userId" required>
						<button onclick="fn_IdCheck();">중복확인</button>
						<div id="idCheckText" style="line-height: 28px; margin-left : 5px;">ID 중복확인 필수체크</div>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input class="form-control" style="width: 80%;" type="password" name="userPasswd1" id="userPasswd1" value="" required placeholder="비밀번호 입력" onkeyup="modPw(this)"autocomplete="new-password">
					</td>
				</tr>
					<tr >
					<td>비밀번호 확인</td>
					<td style="display:flex;">
						<input class="form-control" style="width: 80%;"type="password" name="userPasswd2" id="userPasswd2" value="" required placeholder="비밀번호 확인" onkeyup="checkPw(this)"autocomplete="new-password">
						<div style="color:red" class="pwCheck"></div>
					</td>
					
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input class="form-control" style="width: 80%;"name="userName" id="userName" value="" required autocomplete="off">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="email" class="form-control" style="width: 80%;"name="userEmail" id="userEmail" value="" required autocomplete="off">
					</td>
				</tr>
				<tr>
					<td>사용자 권한</td>
					<td>
						<select class="form-control" style="width: 80%;" name="userRole" id="userRole">
							<option value="CUSER">일반사용자</option>
							<option value="PUSER">부서관리자</option>
							<option value="ADMIN">시스템관리자</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>회사코드</td>
					<td>
						<select class="form-control" style="width: 80%;" name="compId" id="compId">
							<c:forEach var="listComp" items="${listComp}">
								<c:if test="${listComp.compNo eq compNo}">
									<option value="${listComp.compNo}">${listComp.compName}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>직위</td>
					<td>
						<select class="form-control"  style="width: 80%;" name="userRank" id="userRank">
							<c:forEach var="listRank" items="${listRank}">
								<option value="${listRank.code03}">${listRank.desc03}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>
						<select class="form-control" style="width: 80%;" name="userDept" id="userDept">
							<c:forEach var="listDept" items="${listDept}">
								<option value="${listDept.org_id}">${listDept.org_title}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>

		</form>
		<div class="btn_wr text-right mt-3">
						<button class="btn btn-md btn-danger" onclick="javascript:location='${path}/user/list.do'">취소 </button>
						<button class="btn btn-md btn-primary" onclick="fn_userInsert()">저장</button>
					</div>

		<script>
	function fn_IdCheck() {
		var usercheckData ={};
		usercheckData.userId   = $("#userId").val();
		if (usercheckData.userId == ''){
			alert("아이디를 입력해 중복체크를 해주세요.");
			return;
		}
		$.ajax({ url: "${path}/user/userCheck.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data:usercheckData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data == 0){
					$("#idCheckText").html("아이디 사용가능<br>");
					$("#userId").attr("readonly",true);
					//$("#btnSave").removeAttr("disabled");
					alert("중복된 아이디가 없습니다.");}
					else {
						alert("중복된 아이디가 있습니다. 다른 아이디를 선택해 주십시오.");
						$("#userId").val('');
					}
				}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
				.fail(function(xhr, status, errorThrown) {
					alert("통신실패");
				});
		} 
	
	
	
	function checkPw(obj) {
		if($("#userPasswd1").val() != $("#userPasswd2").val()) {
			$(".pwCheck").html("&nbsp"+"&nbsp"+"비밀번호가 맞지 않습니다");
			$(".pwCheck").css("color","red");
		} else {
			$(".pwCheck").html("확인");
			$(".pwCheck").css("color","blue");
		}
		
	} 
	
   function modPw(obj) {
	   $("#userPasswd2").val("");
	   $(".pwCheck").html("&nbsp"+"&nbsp"+"비밀번호가 맞지 않습니다");
	   $(".pwCheck").css("color","red");
	   
   }

	function fn_userInsert() {
		let emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if ($("#userId").val() == "") {
			alert("아이디를 입력해주세요"); 
		} else if (	$("#idCheckText").html() != "아이디 사용가능<br>") {
			alert("아이디 중복 확인을 해주세요"); 
		}
		else if ($(".pwCheck").html() !="확인") {
				alert("비밀번호를 확인해주세요.");
		}else if ($("#userName").val() == ""){
			alert("이름을 입력하세요");
		}else if($("#userEmail").val() !="" && !emailRule.test($("#userEmail").val())){
			alert("이메일 형식을 확인하세요")
		} else {
		var userData = {};
		userData.userId 		= $("#userId").val();
		userData.userPasswd 	= $("#userPasswd1").val();
		userData.userName 		= $("#userName").val();
		userData.compId		 	= $("#compId").val();
		userData.userRole		= $("#userRole").val();
		userData.userRank		= $("#userRank").val();
		userData.org_id 		= $("#userDept").val();
		userData.userKey = "AA7BB7CC7DD7EE7FF7GG7HH7II7JJ7KK7LL7MM7NN7"; 
		$.ajax({ url: "${path}/user/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
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

	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>