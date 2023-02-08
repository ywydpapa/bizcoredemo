<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">

<link href='${path}/assets/css/font-awesome.min.css' rel="stylesheet" type="text/css">
<link href="${path}/fancytree/skin-win8/ui.fancytree.css" rel="stylesheet">
<script src='${path}/fancytree/jquery.fancytree-all-deps.js'></script>
<script src='${path}/fancytree/jquery.fancytree-all.js'></script>


	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						사용자 조회
					</div>
				</div>
				<c:if test="${userInfo.userNo == sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
				<div class="btn_wr" style="float:right;">
						<button class="btn btn-sm btn-outline insertMemBtn"><i class="icofont icofont-pencil-alt-2"></i>사용자 추가</button>
					</div> 
				</c:if>
			</div>
		</div>
	</div>

	<!--회원리스트 Tree -->
	<div class="cnt_wr" style="display:grid;grid-template-columns: 20% 80%;column-gap: 10px;">
		<div id="tree" style="display: inline-block;">
					<ul>
						<li class="folder expanded topElement" data-json='{"icon": "${path}/images/tree-icon1.png"}'>${organizationArrList[0].title}
							<ul>
								<c:forEach var="i" begin="0" end="${fn:length(organizationArrList[0].children)-1}" varStatus="status" step="1">
									<c:set var="item" value="${organizationArrList[0].children[i]}"/>
									<li class="folder">${status.current}.${item.title}
										<ul>
											<c:forEach var="user" items="${item.children}">
												<li data-json='{"icon": "${path}/images/personIcon1.png"}' id="li_${user.userNo}">${user.title}(${user.userNo})</li>
											</c:forEach>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</li>
					</ul>
	</div> 
		
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
									<th scope="row">이름</th>
									<td>
										<input name="userName" id="userName"  value="${userInfo.userName}" class="form-control form-control-sm">
									</td>
								</tr>
								<tr>
									<th scope="row">사용자 권한</th>
									<td>
										<select name="userRole" id="userRole"  class="form-control form-control-sm">
										<option value="CUSER">일반사용자</option>
										<option value="PUSER">조직관리자</option>
										<option value="ADMIN">시스템관리자</option>
										<option value="DUSER">데모사용자</option>
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
									<td><select class="form-control form-right" id="userRoleAA">
										<option value="AA0">권한없음</option>
										<option value="AA5">읽기전용</option>
										<option value="AA7">읽기쓰기</option>
										</select>
									</td>
									<td> BB </td>
									<td><select class="form-control form-right"  id="userRoleBB">
										<option value="BB0">권한없음</option>
										<option value="BB5">읽기전용</option>
										<option value="BB7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 영업활동관리 </td>
									<td> CC </td>
									<td><select class="form-control form-right"  id="userRoleCC">
										<option value="CC0">권한없음</option>
										<option value="CC5">읽기전용</option>
										<option value="CC7">읽기쓰기</option>
										</select>
									</td>
									<td> DD </td>
									<td><select class="form-control form-right"  id="userRoleDD">
										<option value="DD0">권한없음</option>
										<option value="DD5">읽기전용</option>
										<option value="DD7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 영업기회관리 </td>
									<td> EE </td>
									<td><select class="form-control form-right"  id="userRoleEE">
										<option value="EE0">권한없음</option>
										<option value="EE5">읽기전용</option>
										<option value="EE7">읽기쓰기</option>
										</select>
									</td>
									<td> FF </td>
									<td><select class="form-control form-right"  id="userRoleFF">
										<option value="FF0">권한없음</option>
										<option value="FF5">읽기전용</option>
										<option value="FF7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 수주판매보고 관리 </td>
									<td> GG </td>
									<td><select class="form-control form-right"  id="userRoleGG">
										<option value="GG0">권한없음</option>
										<option value="GG5">읽기전용</option>
										<option value="GG7">읽기쓰기</option>
										</select>
									</td>
									<td> HH </td>
									<td><select class="form-control form-right"  id="userRoleHH">
										<option value="HH0">권한없음</option>
										<option value="HH5">읽기전용</option>
										<option value="HH7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 계약관리 </td>
									<td> II </td>
									<td><select class="form-control form-right"  id="userRoleII">
										<option value="II0">권한없음</option>
										<option value="II5">읽기전용</option>
										<option value="II7">읽기쓰기</option>
										</select>
									</td>
									<td> JJ </td>
									<td><select class="form-control form-right"  id="userRoleJJ">
										<option value="JJ0">권한없음</option>
										<option value="JJ5">읽기전용</option>
										<option value="JJ7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 기술지원 관리 </td>
									<td> KK </td>
									<td><select class="form-control form-right"  id="userRoleKK">
										<option value="KK0">권한없음</option>
										<option value="KK5">읽기전용</option>
										<option value="KK7">읽기쓰기</option>
										</select>
									</td>
									<td> LL </td>
									<td><select class="form-control form-right"  id="userRoleLL">
										<option value="LL0">권한없음</option>
										<option value="LL5">읽기전용</option>
										<option value="LL7">읽기쓰기</option>
										</select>
									</td>
								</tr>
								<tr>
									<td> 설정 관리 </td>
									<td> MM </td>
									<td><select class="form-control form-right"  id="userRoleMM">
										<option value="MM0">권한없음</option>
										<option value="MM5">읽기전용</option>
										<option value="MM7">읽기쓰기</option>
										</select>
									</td>
									<td> NN </td>
									<td><select class="form-control form-right"  id="userRoleNN">
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
						<c:if test="${userInfo.userNo == sessionScope.userNo || sessionScope.userRole eq 'ADMIN'}">
								<button class="btn btn-md btn-primary doremote" >수정</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<!--  <div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table id="userTable" class="table table-striped table-bordered nowrap">
							<colgroup>
								<col width="25%"/>
								<col width="25%"/>
								<col width="25%"/>
								<col width="25%"/>
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">아이디</th>
									<th class="text-center">이름</th>
									<th class="text-center">소속 부서</th>
									<th class="text-center">권한</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="row" items="${list}">
									<tr align="center">
										<td>${row.userId}</td>
										<td><a href="javascript:location='${path}/user/view.do?userNo=${row.userNo}'">${row.userName}</a></td>
										<td><c:if test ="${row.org_id eq '15'}">개발팀</c:if><c:if test ="${row.org_id eq '22'}">영업팀</c:if></td>
										<td><c:if test="${row.userRole eq 'CUSER'}">일반사용자</c:if><c:if test="${row.userRole eq 'ADMIN'}">시스템관리자</c:if><c:if test="${row.userRole eq 'PUSER'}">업무관리자</c:if><c:if test="${row.userRole eq 'DUSER'}">데모사용자</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>  -->
	</div>
	<!--//table-->
	<script>
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
		//checkbox: true,
		quicksearch: true,
		selectMode: 3,
		select: function(event, data) {
			// console.dir(data.node);
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
		 //extensions: [ "edit", "dnd"], // 필요한 확장 요소들

		// dnd: {  //드래그앤드롭
		    //  preventVoidMoves: true,
		    //  preventRecursiveMoves: true,
		    //  autoExpandMS: 400,
		    //  dragStart: function(node, data) {
		    	  // 폴더는 이동 안 되게 
		    //	  if(node.isFolder()) {
		    //		  return false;
		    //	  }
		    //    return true; // 자식 노드는 드래그 가능
		    //  },
		    //  dragEnter: function(node, data) {
		        // return ["before", "after"]; // 다른 노드의 앞,뒤에만 가능
		   //     return true; // 자식노드로도 옮겨 넣을 수 있다.
		   //   },
		    //  dragDrop: function(node, data) {
		   //     data.otherNode.moveTo(node, data.hitMode);
		  //    }
		  //  },
		  //  edit: { // title 수정
		   //     triggerStart: ["f2", "dblclick", "shift+click", "mac+enter"], // 수정전환 키 조합
		     //   close: function(event, data) {
		      //    if( data.save && data.isNew ){
		            // Quick-enter: add new nodes until we hit [enter] on an empty title
		       //     $("#tree").trigger("nodeCommand", {cmd: "addSibling"});
		       //   }
		     //   }
		    //  },
	});
	
	
	
	$("#tree").fancytree("getTree").visit(function(node) {
		node.setExpanded(true);
		//node.setSelected(true);
	});
	
	
	$(function(){
		$('#userTable').DataTable({
			info:false,
			searching: true,
			pageLength: 10 // 한 페이지에 기본으로 보열줄 항목 수
		});
	});
	

	$('.fancytree-title').click(function(){
		let url; 
		let userNo = $(this).html();
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
			    }
		}); 
	}})
	
	
	
	function setEachData(user){
		let userId, userName, org_id, userTel,userRole, userEmail, regDateTime, userKey, attrib; 
		
		userId = user.userId; 
		userName = user.userName;
		org_id = user.org_id;
		userTel = user.userTel; 
		userEmail = user.userEmail;
		regDatTime = user.regDateTime;
		attrib = user.attrib; 
		userRole = user.userRole; 
		
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
	}

	
	

	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>