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
	<h2>회원등록</h2>
		<form class="form-control" name="form1" method="post"
			onsubmit="return false;">
			<table class="table table-sm bst02">
				<tr>
					<td>아이디</td>
					<td><input class="form-control" name="userId" id="userId"
						required>
					<button onclick="fn_IdCheck();">중복확인</button>
						<div id="idCheckText">ID 중복확인 필수체크</div></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input class="form-control" type="password"
						name="userPasswd" id="userPasswd" value="" required placeholder="기본 비밀번호 입력" autocomplete="new-password"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input class="form-control" name="userName" id="userName"
						value="" required placeholder="사용자 실명 입력" autocomplete="off"></td>
				</tr>
				<tr>
					<td>사용자 권한</td>
					<td><select class="form-control" name="userRole" id="userRole">
							<option value="CUSER">일반사용자</option>
							<option value="PUSER">부서관리자</option>
							<option value="ADMIN">시스템관리자</option>
					</select></td>
				</tr>
				<tr>
					<td>회사코드</td>
					<td><select class="form-control" name="compId" id="compId">
							<c:forEach var="listComp" items="${listComp}">
								<c:if test="${listComp.compNo eq compNo}">
								<option value="${listComp.compNo}">${listComp.compName}</option>
								</c:if>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>직위</td>
					<td><select class="form-control" name="userRank" id="userRank">
							<c:forEach var="listRank" items="${listRank}">
								<option value="${listRank.code03}">${listRank.desc03}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>부서</td>
					<td><select class="form-control" name="userDept" id="userDept">
							<c:forEach var="listDept" items="${listDept}">
								<option value="${listDept.org_id}">${listDept.org_title}</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="저장"
						id="btnSave" onclick="fn_userInsert();" disabled=false></td>
				</tr>

			</table>

		</form>

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
					$("#btnSave").removeAttr("disabled");
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

	function fn_userInsert() {
		var userData = {};
		userData.userId 		= $("#userId").val();
		userData.userPasswd 	= $("#userPasswd").val();
		userData.userName 		= $("#userName").val();
		userData.compId		 	= $("#compId").val();
		userData.userRole		= $("#userRole").val();
		userData.userRank		= $("#userRank").val();
		userData.org_id 		= $("#userDept").val();
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

	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>