<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>
<link href='${path}/assets/css/font-awesome.min.css' rel="stylesheet" type="text/css">
<link href="${path}/fancytree/skin-win8/ui.fancytree.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src='${path}/fancytree/jquery.fancytree-all-deps.js'></script>
<script src='${path}/fancytree/jquery.fancytree-all.js'></script>
<link href='${path}/assets/css/font-awesome.min.css' rel="stylesheet" type="text/css">
<link href="${path}/fancytree/skin-win8/ui.fancytree.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src='${path}/fancytree/jquery.fancytree-all-deps.js'></script>
<script src='${path}/fancytree/jquery.fancytree-all.js'></script>

<div id="main_content">
	<style>
		#organizationChartView {
			display: block;
			min-width: 200px;
			background-color: #fff;
			position: absolute;
			z-index: 9999;
			padding: 5px 5px 10px 5px;
			border : 2px solid #efefef;
		}
		
		input[type=checkbox] {
		    margin: 4px 0 0 0;
		}
		
		.fa-caret-down, .fa-caret-right {
    		cursor: pointer;
		}

		.fancytree-container {
			outline: none;
		}

		#selectedPerson > div > button {
			margin-top: 2px;
			margin-right: 4px;
		}

		#selectedPerson > div > button > span {
			font-size: 22px;
			color: #f00;
		}
		
	</style>
 <div>
 <div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						조직관리
					</div>
				</div>
			</div>
		</div>
	</div>
 	<div style="text-align:right; margin:5px;"><button class="btn btn-sm btn-inverse" onclick="$('.orgModifyDiv').show();">선택 부서 편집</button>
 	<button class="btn btn-sm btn-inverse" onclick="javascript:location='${path}/organiz/write.do'">부서 생성</button></div>
	<div style="display:grid;grid-template-columns:20% 80%;column-gap: 10px;">
		<div id="tree" style="display: inline-block;">
			<ul>
				<li class="folder expanded topElement" data-json='{"icon": "${path}/images/tree-icon1.png"}'>${organizationArrList[0].title}
					<ul>
						<c:forEach var="i" begin="0" end="${fn:length(organizationArrList[0].children)-1}" varStatus="status" step="1">
							<c:set var="item" value="${organizationArrList[0].children[i]}"/>
							<li class="folder">${status.current}.${item.title}(${item.code})
								<ul>
									<c:forEach var="user" items="${item.children}">
										<li data-json='{"icon": "${path}/images/personIcon1.png"}' id="li_${user.userNo}">${user.title}</li>
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
								<col width="20%"/>
								<col width="80%"/>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">부서명</th>
									<td>
										<input name="org_title" id="org_title" class="form-control form-control-sm"  ><input type="hidden" id="hiddenCode" >
									</td>
								</tr>
								<tr>
									<th scope="row">부서 코드</th>
									<td>
										<input name="org_code" id="org_code" class="form-control form-control-sm" >
									</td>
								</tr>
								<tr>
									<th scope="row">부서 레벨</th>
									<td>
									<input name="org_level" id="org_level" class="form-control form-control-sm" >
									</td>
								</tr>
								<tr>
									<td>영업목표 설정 여부</td>
									<td><select class="form-control" id="org_salesTarget" >
										<option value="0">Y</option>
										<option value="1">N</option>
										</select></td>
								</tr>
								<tr>
									<td>부서색상</td>
									<td><input type="text" class="form-control form-control-sm" id="org_color"></input>
									</td>
								</tr>
								<tr>
									<td>비고</td>
									<td><input type="text" class="form-control form-control-sm" id="org_desc"></input>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div style="text-align:right; margin:5px;display:none;" class="orgModifyDiv">
		<button class="btn btn-sm btn-inverse" onclick="toModifyOrg()">수정</button>
        <button class="btn btn-sm btn-inverse" onclick="$(this.parentElement).hide()">취소</button></div>
	</div>
		
	</div>
</div>
<jsp:include page="../body-bottom.jsp"/>
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

		$('#soppModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		$('#contModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		
		function fnOrganizationCheck(companyCheckbox) {
			var organizations = $('.organization-checkbox');
			$('.organization-checkbox').each(function(index, item){
				item.checked = companyCheckbox.checked;
			});
		}

		function userNoSelected_Delete(userNo){
			$("#tree").fancytree("getTree").visit(function(node) {
				if(node.key == ("li_"+userNo)){
					node.setSelected(false);
				}
			});
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
		var calYear = "";
		var calDate = "";
		$(document).ready(function() {
			// setOrganizationList();
			//setOrganizationTree();
			$('#organizationChartOpen').on('click', function() {
				if ($('#organizationChartView').is(":visible")) {
					$('#organizationChartView').hide();
				} else {
					$('#organizationChartView').show();
				}
			});
			
			
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
				
				click : function(event, data) {
					//부서가 클릭된 경우의 이벤트 처리 
					if(data.node.isFolder()) {
					let org_code = data.node.title;
					org_code = org_code.split("(")[1].split(")")[0];
					
					console.log(org_code);
					
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
						}
						
					}); 
					}
				},
				 extensions: ["dnd"], // 필요한 확장 요소들

				dnd: {  //드래그앤드롭
				     preventVoidMoves: true,
				      preventRecursiveMoves: true,
				      autoExpandMS: 400,
				      dragStart: function(node, data) {
				    	  // 폴더는 이동 안 되게 
				    	  if(node.isFolder()) {
				    		  return false;
				    	  }
				      return true; // 자식 노드는 드래그 가능
				     },
				     dragEnter: function(node, data) {
				        //return ["before", "after"]; // 다른 노드의 앞,뒤에만 가능
				       return true; // 자식노드로도 옮겨 넣을 수 있다.
				      },
				     dragDrop: function(node, data) {
				       data.otherNode.moveTo(node, data.hitMode);
				     }
				    },
			});
			

			$("#tree").fancytree("getTree").visit(function(node) {
				node.setExpanded(true);
			});

			
		});
		
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
		
		}
		
		
		
		
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
						var url = '${path}/organiz/list.do';
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
</html>