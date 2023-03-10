<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp" />
<jsp:include page="../body-top.jsp" />


<div id="main_content">
	<link href="${path}/fancytree/skin-win8/ui.fancytree.css"
		rel="stylesheet">
	<script src='${path}/fancytree/jquery.fancytree-all-deps.js'></script>
	<script src='${path}/fancytree/jquery.fancytree-all.js'></script>


	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">조직도 설정</div>
				</div>
				<c:if
					test="${userInfo.userNo == sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
					<div class="btn_wr" style="float: right;">
						<button class="btn btn-sm btn-inverse insertMemBtn">사용자 생성</button>
						<button class="btn btn-sm btn-inverse" onclick="javascript:location='${path}/organiz/write.do'">부서 생성</button></div>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<!--회원리스트 Tree -->
	<div class="cnt_wr orgContainer"
		style="display: flex; column-gap: 10px;flex-wrap:wrap;" >
		<div id="tree" style="display: inline-block;">
			<ul>
				<li class="folder expanded topElement"
					data-json='{"icon": "${path}/images/tree-icon1.png"}'>${organizationArrList[0].title}
					<ul>
						<c:forEach var="i" begin="0"
							end="${fn:length(organizationArrList[0].children)-1}"
							varStatus="status" step="1">
							<c:set var="item" value="${organizationArrList[0].children[i]}" />
							<li class="folder">${status.current}.${item.title}(${item.code})
								<ul>
									<c:forEach var="user" items="${item.children}">
										<li data-json='{"icon": "${path}/images/personIcon1.png"}'
											id="li_${user.userNo}">${user.title}(${user.userNo})</li>
									</c:forEach>
								</ul>
							</li>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</div>

		<div class="cnt_wr ">
			<div class="row userDetailDiv" style="display: none">
				<div class="col-sm-12 userCnt">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table class="table table-sm bst02">
								<colgroup>
									<col width="25%" />
									<col width="25%" />
									<col width="13%" />
									<col width="12%" />
									<col width="13%" />
									<col width="12%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">아이디</th>
										<td><input name="userId" id="userId"
											value="${userInfo.userId}"
											class="form-control form-control-sm" readonly><input
											type="hidden" id="userNo" value="${userInfo.userNo}" readonly>
										</td>
									</tr>
									<tr>
										<th scope="row">이름</th>
										<td><input name="userName" id="userName"
											value="${userInfo.userName}"
											class="form-control form-control-sm"></td>
									</tr>
									<tr>
										<th scope="row">사용자 권한</th>
										<td><select name="userRole" id="userRole"
											class="form-control form-control-sm">
												<option value="CUSER">일반사용자</option>
												<option value="PUSER">조직관리자</option>
												<option value="ADMIN">시스템관리자</option>
												<option value="DUSER">데모사용자</option>
										</select></td>
									</tr>
									<tr>
										<td>부서</td>
										<td><select class="form-control" name="userDept"
											id="userDept">
												<c:forEach var="listDept" items="${listDept}">
													<option value="${listDept.org_id}"
														<c:if test="${listDept.org_id eq userInfo.org_id}">selected</c:if>>${listDept.org_title}</option>
												</c:forEach>
										</select></td>
									</tr>

									<!-- tel -->
									<tr>
										<td>전화번호</td>
										<td><input type="text"
											class="form-control form-control-sm" id="userTel"
											name="userTel" value="${userInfo.userTel}"
											placeholder="000-0000-0000"></td>
									</tr>
									<!-- tel value="${userInfo.userTel}"-->
									<!-- e-mail -->
									<tr>
										<td>이메일</td>
										<td><input type="text"
											class="form-control form-control-sm" id="userEmail"
											name="userEmail" value="${userInfo.userEmail}"></td>
									</tr>
									<tr>
										<td>등록 일자</td>
										<td><input type="text" name="userAttStart"
											id="userAttStart" value="${userInfo.regDateTime}" disabled>
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

									<tr align="center">
										<td rowspan="10">화면권한 설정</td>
										<td>화면 구분</td>
										<td>화면코드</td>
										<td>권한설정</td>
										<td>화면코드</td>
										<td>권한설정</td>
									</tr>
									<tr>
										<td>일정관리</td>
										<td>AA</td>
										<td><select class="form-control form-right"
											id="userRoleAA">
												<option value="AA0">권한없음</option>
												<option value="AA5">읽기전용</option>
												<option value="AA7">읽기쓰기</option>
										</select></td>
										<td>BB</td>
										<td><select class="form-control form-right"
											id="userRoleBB">
												<option value="BB0">권한없음</option>
												<option value="BB5">읽기전용</option>
												<option value="BB7">읽기쓰기</option>
										</select></td>
									</tr>
									<tr>
										<td>영업활동관리</td>
										<td>CC</td>
										<td><select class="form-control form-right"
											id="userRoleCC">
												<option value="CC0">권한없음</option>
												<option value="CC5">읽기전용</option>
												<option value="CC7">읽기쓰기</option>
										</select></td>
										<td>DD</td>
										<td><select class="form-control form-right"
											id="userRoleDD">
												<option value="DD0">권한없음</option>
												<option value="DD5">읽기전용</option>
												<option value="DD7">읽기쓰기</option>
										</select></td>
									</tr>
									<tr>
										<td>영업기회관리</td>
										<td>EE</td>
										<td><select class="form-control form-right"
											id="userRoleEE">
												<option value="EE0">권한없음</option>
												<option value="EE5">읽기전용</option>
												<option value="EE7">읽기쓰기</option>
										</select></td>
										<td>FF</td>
										<td><select class="form-control form-right"
											id="userRoleFF">
												<option value="FF0">권한없음</option>
												<option value="FF5">읽기전용</option>
												<option value="FF7">읽기쓰기</option>
										</select></td>
									</tr>
									<tr>
										<td>수주판매보고 관리</td>
										<td>GG</td>
										<td><select class="form-control form-right"
											id="userRoleGG">
												<option value="GG0">권한없음</option>
												<option value="GG5">읽기전용</option>
												<option value="GG7">읽기쓰기</option>
										</select></td>
										<td>HH</td>
										<td><select class="form-control form-right"
											id="userRoleHH">
												<option value="HH0">권한없음</option>
												<option value="HH5">읽기전용</option>
												<option value="HH7">읽기쓰기</option>
										</select></td>
									</tr>
									<tr>
										<td>계약관리</td>
										<td>II</td>
										<td><select class="form-control form-right"
											id="userRoleII">
												<option value="II0">권한없음</option>
												<option value="II5">읽기전용</option>
												<option value="II7">읽기쓰기</option>
										</select></td>
										<td>JJ</td>
										<td><select class="form-control form-right"
											id="userRoleJJ">
												<option value="JJ0">권한없음</option>
												<option value="JJ5">읽기전용</option>
												<option value="JJ7">읽기쓰기</option>
										</select></td>
									</tr>
									<tr>
										<td>기술지원 관리</td>
										<td>KK</td>
										<td><select class="form-control form-right"
											id="userRoleKK">
												<option value="KK0">권한없음</option>
												<option value="KK5">읽기전용</option>
												<option value="KK7">읽기쓰기</option>
										</select></td>
										<td>LL</td>
										<td><select class="form-control form-right"
											id="userRoleLL">
												<option value="LL0">권한없음</option>
												<option value="LL5">읽기전용</option>
												<option value="LL7">읽기쓰기</option>
										</select></td>
									</tr>
									<tr>
										<td>설정 관리</td>
										<td>MM</td>
										<td><select class="form-control form-right"
											id="userRoleMM">
												<option value="MM0">권한없음</option>
												<option value="MM5">읽기전용</option>
												<option value="MM7">읽기쓰기</option>
										</select></td>
										<td>NN</td>
										<td><select class="form-control form-right"
											id="userRoleNN">
												<option value="NN0">권한없음</option>
												<option value="NN5">읽기전용</option>
												<option value="NN7">읽기쓰기</option>
										</select></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btn_wr text-right mt-3">
							<c:if
								test="${userInfo.userNo == sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
								<button class="btn btn-md btn-primary"  onclick="fn_userUpdate(this)">수정</button>
								<button class="btn btn-md btn-danger" onClick= "fn_userUpdate(this)">삭제</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<div class="row orgDetailDiv">
				<div class="col-sm-12 userCnt">
					<div class="card-block table-border-style">
						<div class="table-responsive">
							<table class="table table-sm bst02">
								<colgroup>
									<col width="20%" />
									<col width="80%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">부서명</th>
										<td><input name="org_title" id="org_title"
											class="form-control form-control-sm"><input
											type="hidden" id="hiddenCode"></td>
									</tr>
									<tr>
										<th scope="row">부서 코드</th>
										<td><input name="org_code" id="org_code"
											class="form-control form-control-sm"></td>
									</tr>
									<tr>
										<th scope="row">부서 레벨</th>
										<td><input name="org_level" id="org_level"
											class="form-control form-control-sm"></td>
									</tr>
									<tr>
										<td>영업목표 설정 여부</td>
										<td><select class="form-control" id="org_salesTarget">
												<option value="0">Y</option>
												<option value="1">N</option>
										</select></td>
									</tr>
									<tr>
										<td>부서색상</td>
										<td><input type="text"
											class="form-control form-control-sm" id="org_color"></input>
										</td>
									</tr>
									<tr>
										<td>비고</td>
										<td><input type="text"
											class="form-control form-control-sm" id="org_desc"></input></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="text-align: right; margin: 5px; display:none;" class="orgModifyDiv">
					    <c:if test="${userInfo.userNo == sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
						<button class="btn btn-md btn-primary" onclick="toModifyOrg()">수정</button>
						<button class="btn btn-md btn-danger" onclick="todeleteOrg()">삭제</button>
						</c:if>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<!--//table-->
<script>


$(document).ready(()=>{
	// width 설정 
	setSize(); 
	// 최초에 첫번째 부서 정보 선택되어 보여지게 함  
	let org_code = $(".fancytree-title")[1].innerHTML; 
		org_code = org_code.split("(")[1].split(")")[0];
		let url; 
		if (location.href.includes("local")) {
			url = "/sderp/api/organiz/"+org_code;
		} else {
			url = "/api/organiz/"+org_code;
		}
		$.ajax({
			url : url ,
			method : "get",
			dataType : "json",
			success : (result) => {
				setOrgData(result); 
				$(".orgModifyDiv").children()[1].style = "display:none";
			}
		}); 
		
		
		
});



$(window).resize(function (){  

	if(window.innerWidth > 995 ) { 
		let tree = $("#tree").css("width"); 
		let width = (window.innerWidth*1 - tree.split("px")[0]*1 - 260) + "px"; 
		document.getElementsByClassName("userCnt")[1].style.width=width;
		document.getElementsByClassName("userCnt")[0].style.width=width;
	} else { 
		let width = window.innerWidth*1 - 10 + "px";
		document.getElementsByClassName("userCnt")[1].style.width=width;
		document.getElementsByClassName("userCnt")[0].style.width=width;
	}         
	
	});
	
	
	function setSize() { 
	if(window.innerWidth > 995 ) { 
		let tree = $("#tree").css("width"); 
		let width = (window.innerWidth*1 - tree.split("px")[0]*1 - 260) + "px"; 
		document.getElementsByClassName("userCnt")[1].style.width=width;
		document.getElementsByClassName("userCnt")[0].style.width=width;
	} else { 
		let width = (window.innerWidth*1 - 10) + "px";
		document.getElementsByClassName("userCnt")[1].style.width=width;
		document.getElementsByClassName("userCnt")[0].style.width=width;
	}

}



	var userNoSelected = {
			<c:forEach var="i" begin="0" end="${fn:length(organizationArrList[0].children)-1}" varStatus="status" step="1">
				<c:set var="item" value="${organizationArrList[0].children[i]}"/>
					<c:forEach var="user" items="${item.children}">
						${user.userNo} : false,
					</c:forEach>
			</c:forEach>
		}
	
	var userNoMatchName = {
			<c:forEach var="i" begin="0" end="${fn:length(organizationArrList[0].children)-1}" varStatus="status" step="1">
				<c:set var="item" value="${organizationArrList[0].children[i]}"/>
				<c:forEach var="user" items="${item.children}">
					${user.userNo} : '${user.title}',
				</c:forEach>
			</c:forEach>
		}
	
	
	function userNoSelected_ElementCreate(){
		var html = "";
		for (const key in userNoSelected){
			var userNo = key;
			var usrName = userNoMatchName[key];
			var bool = userNoSelected[key];
			if(bool){
				html = html + '<div style="display: inline-block;border: solid 0.5px #ffb64d; margin-right:5px;">' +
						'<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="" onclick="userNoSelected_Delete('+userNo+');">' +
						'<span aria-hidden="true" style="">×</span>' +
						'</button>' +
						'<strong style=" padding: 5px; font-size: 1.2em;">' + usrName + '</strong>' +
						'</div>';
			}
		}
		$("#selectedPerson").empty();
		$("#selectedPerson").append(html);
	}
	
	
	$("#tree").fancytree({
		quicksearch: true,
		selectMode: 3,
		select: function(event, data) {
			var html = "";
			
			if(data.node.children == null) {
				var userNo = data.node.key.split("_")[1];
				if(data.node.isSelected()) userNoSelected[userNo] = true;
				else userNoSelected[userNo] = false;
			} else {
				if(data.node.extraClasses == "topElement"){
					data = data.node.children;
					for(var i=0; i<data.length; i++){
						var data2 = data[i];
						for(var j=0; j<data2.children.length; j++) {
							var t = data2.children[j];
							var userNo = t.key.split("_")[1];
							if (t.isSelected()) userNoSelected[userNo] = true;
							else userNoSelected[userNo] = false;
						}
					}
				} else {
					for(var i=0; i<data.node.children.length; i++){
						var t = data.node.children[i];
						var userNo = t.key.split("_")[1];
						if(t.isSelected()) userNoSelected[userNo] = true;
						else userNoSelected[userNo] = false;
					}
				}
			}
			userNoSelected_ElementCreate();
		},
		
		click : function(event, data) {
			// 사용자가 선택된 경우의 이벤트 처리 
			if(!data.node.isFolder()) {
			let userNo = data.node.title;
			userNo = userNo.split("("); 
			if(userNo.length > 1) {
				userNo = userNo[1]; 
				userNo = userNo.split(")")[0]; 
				if (location.href.includes("local")) {
					url = "/sderp/api/user/"+userNo;
				} else {
					url = "/api/user/"+userNo;
				}
			$.ajax({
				url : url,
				method : "get",
				dataType: "json",
				success: (result) => {
					setEachData(result);
					$(".userDetailDiv").show();
					$(".orgDetailDiv").hide();
				    }
			}); 
			}
			// 부서가 선택된 경우의 이벤트 처리 
			} else {
				let org_code = data.node.title;
			data.node.children != null
				org_code = org_code.split("(")[1].split(")")[0];
				let url; 
				if (location.href.includes("local")) {
					url = "/sderp/api/organiz/"+org_code;
				} else {
					url = "/api/organiz/"+org_code;
				}
				$.ajax({
					url : url ,
					method : "get",
					dataType : "json",
					success : (result) => {
						setOrgData(result); 
						$(".userDetailDiv").hide();
						$(".orgDetailDiv").show();
						if(data.node.children != null) {
							$(".orgModifyDiv")[0].children[1].setAttribute("style","display:none;");
						} else {
							$(".orgModifyDiv")[0].children[1].setAttribute("style","display:inline;");
						}
					}
					
				}); 
			}
		}
	});
	
	
	
	$("#tree").fancytree("getTree").visit(function(node) {
		node.setExpanded(true);
		//node.setSelected(true);
	});
	
	// 사용자 추가 하기 버튼 클릭 이벤트 
	$(".insertMemBtn").click(function(){
		let url; 
		if (location.href.includes("local")) {
			url = "/sderp/user/write.do";
		} else {
			url = "/user/write.do"; 
		} 
		 location.href = url;
	})
	
	$(function(){
		$('#userTable').DataTable({
			info:false,
			searching: true,
			pageLength: 10 // 한 페이지에 기본으로 보열줄 항목 수
		});
	});
	
	
	// 선택된 사용자 데이터 
	function setEachData(user){
		let userId, userName, org_id, userTel,userRole, userEmail, regDateTime, userKey, attrib; 
		userNo = user.userNo;
		userId = user.userId; 
		userName = user.userName;
		org_id = user.org_id;
		userTel = user.userTel; 
		userEmail = user.userEmail;
		regDatTime = user.regDateTime;
		attrib = user.attrib; 
		userRole = user.userRole; 
		$("#userNo").val(userNo);
		$("#userId").val(userId);
		$("#userName").val(userName);
		$("#userDept").val(org_id);
		$("#userTel").val(userTel);
		$("#userEmail").val(userEmail);
		$("#userAttStart").val(regDatTime);
		$("#userAttrib").val(attrib);
		$("#userRole").val(userRole);
		
		userKey = user.userKey; 
		console.log(userKey);
		let rights = $(".form-right") ; 
		for(let i = 0 ; i < rights.length; i ++) {
			rights[i].value = userKey.substring(i*3, (i*3)+3); 
		}
		
		// 수정하기 버튼 클릭 이벤트 
		$(".doremote").click(function() {
			location.href = "${path}/user/view.do?userNo="+user.userNo;
		})
		
		
	}
	
	// 선택된 부서 데이터 
	function setOrgData(org){
		  let org_title, org_code, org_level, org_salesTarget, org_color, org_desc;  
		  org_title = org.org_title ; 
		  org_code = org.org_code;
		  org_level = org.org_level;
	      org_salesTarget = org.org_salesTarget;
		  org_color = org.org_color;
		  org_desc  = org.org_desc; 
		  $("#org_title").val(org_title); 
		  $("#org_code").val(org_code); 
		  $("#org_level").val(org.org_level); 
		  $("#org_salesTarget").val(org.org_salesTarget); 
		  $("#org_color").val(org_color);
		  $("#org_desc").val(org_desc); 
		  $("#hiddenCode").val(org.org_id); 
		  $(".orgModifyDiv").show();

		}
		
	
	//부서 수정 함수 
	function toModifyOrg(){
		 let orgData = {};
		 orgData.org_id = $("#hiddenCode").val();
		 orgData.org_title = $("#org_title").val(); 
		 orgData.org_code = $("#org_code").val(); 
		 orgData.org_level = $("#org_level").val(); 
		 orgData.org_salesTarget =  $("#org_salesTarget").val(); 
		 orgData.org_color = $("#org_color").val();
		 orgData.org_desc = $("#org_desc").val(); 
		
		 $.ajax({ url: "${path}/organiz/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: orgData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("수정 성공");
					var url = '${path}/user/list.do';
					location.href = url;
				}else{
					alert("수정 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		
	}
	
	
	// 사용자 수정 함수 
	function fn_userUpdate(obj) {
		
		var userData = {};
		//전화번도 유효성 검사
		userData.userNo 		= $("#userNo").val();
		userData.userId 		= $("#userId").val();
		//이메일, 전화번호
		userData.userEmail		= $("#userEmail").val();
		userData.userTel		= $("#userTel").val();
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
	
	
    // 부서 삭제 함수 
	function todeleteOrg(){
		 let orgData = {};
		 orgData.org_id = $("#hiddenCode").val();
		 $.ajax({ url: "${path}/organiz/delete.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: orgData , // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
				dataType: "json" // 서버에서 보내줄 데이터의 타입
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					var url = '${path}/user/list.do';
					location.href = url;
				}else{
					alert("수정 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		
	}
	
	

	</script>
</div>
<jsp:include page="../body-bottom.jsp" />