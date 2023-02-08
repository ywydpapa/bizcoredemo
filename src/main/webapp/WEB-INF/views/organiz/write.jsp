<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp" />
<jsp:include page="../body-top.jsp" />

<div id="main_content">
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">부서 추가</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->
	<!--Page-header end 페이지 타이틀 -->
	<div class="cnt_wr">
		<!-- Row start -->
		<div class="row">
			<div class="col-lg-12 col-xl-12">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs  tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#tab01" role="tab">기본정보</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="cnt_wr">
					<div class="row">
						<div class="col-sm-12">
							<div class="card-block table-border-style">
								<div class="table-responsive">
									<table class="table table-sm bst02">
										<colgroup>
											<col width="20%" />
											<col width="80%" />
										</colgroup>
										<tbody>
											<tr>	
											<td>부서명</td>
												<td><input type="text" id="org_title" class="form-control form-control-sm" ></td>
													
											</tr>
											<tr>
											<td>부서 코드</td>
												<td><input type="text" id="org_code"  class="form-control form-control-sm"></td>
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
												<td style="display:flex;"><input type="text" id="org_color" disabled></input><input type="color" style="width:3% "class="form-control" onchange="colorChange(this)"></input>
													</td>
											</tr>
											<tr>
												<td>비고</td>
												<td><input type="text" class="form-control form-control-sm" id="org_desc"></input></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="btn_wr text-right mt-3">
					<button class="btn btn-md btn-success f-left"
						onClick="javascript:location='${path}/organiz/list.do'">목록</button>
					<button class="btn btn-md btn-primary" onclick="fn_orgInsert()">등록</button>
					<button class="btn btn-md btn-inverse"
						onClick="javascript:location='${path}/organiz/list.do'">취소</button>
				</div>
			</div>
		</div>
		<!-- Row end -->
	</div>
	<!--영업기회등록-->
	<script>
	
	function colorChange(obj){
		let color = obj.value; 
	let target = obj.previousElementSibling;
	 target.value = color;
	}
	
	function fn_orgInsert() {
		var orgData = {};
		orgData.compNo = ${compNo};
		orgData.org_code          		 =   $("#org_code").val();
		orgData.org_title         		 =   $("#org_title").val();
		orgData.org_level				 =   $("#org_level").val();
		orgData.org_parentLv          	 =   $("#org_parentLv").val();
		orgData.org_mcode        		 =   $("#org_mcode").val();
		orgData.org_salesTarget          =   $("#org_salesTarget").val();
		orgData.org_desc         		 =   $("#org_desc").val();
		orgData.org_color                =   $("#org_color").val();
		
		
		$.ajax({ url: "${path}/organiz/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
					data: orgData , // HTTP 요청과 함께 서버로 보낼 데이터
					method: "POST", // HTTP 요청 메소드(GET, POST 등)
					dataType: "json" // 서버에서 보내줄 데이터의 타입
				}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
				.done(function(data) {
					if(data.code == 10001){
						alert("저장 성공");
						var url = '${path}/organiz/list.do';
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
<jsp:include page="../body-bottom.jsp" />