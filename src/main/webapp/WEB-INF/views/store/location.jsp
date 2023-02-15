<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp" />
<jsp:include page="../body-top5.jsp" />
<style>
.storeList:hover {
	font-weight: 600;
	cursor: pointer;
}
</style>
<div id="main_content">

	<%
	String userRole = "";
	if ((String) session.getAttribute("userRole") != null) {
		userRole = (String) session.getAttribute("userRole");
	}
	%>
	<!-- Page-header start 페이지 타이틀-->
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">위치 등록</div>
				</div>
			</div>
		</div>
	</div>
	<!--Page-header end 페이지 타이틀 -->

	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="dt-responsive table-responsive"
						style="display: grid; grid-template-columns: 50% 50%;">
						<div style="padding: 0 10px;">
							<div class="input-group input-group-sm mb-0">
								<input type="text" placeholder="추가할 위치명을 입력하세요"
									class="form-control" name="product" data-flag="true" value="">
								<span class="input-group-btn">
									<button class="btn btn-primary sch-company"
										onclick="insertCode02(this)" type="button">
										<i class="icofont icofont-plus"></i>
									</button>
								</span>
							</div>
							<table id="productTable"
								class="table table-striped table-bordered nowrap dataTable">
								<colgroup>
									<col width="30%" />
									<col width="70%" />
								</colgroup>
								<thead>
									<tr>
										<th class="text-center">위치 번호</th>
										<th class="text-center">위치명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${listLoc}">
										<c:if test="${item.desc02 != null}">
											<tr data-code02="${item.code02}" align="center"
												onclick="showDetailLoc3(this)">
												<td>${item.codeNo}</td>
												<td>${item.desc02}</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div style="padding: 0 10px;">
							<div class="input-group input-group-sm mb-0">
								<input type="hidden" class="selectedCode02"></input> 
								<input
									type="text" placeholder="추가할 세부 위치명을 입력하세요"
									class="form-control"  value="" disabled>
								<span class="input-group-btn">
									<button class="btn btn-primary sch-company"
										onclick="insertCode03(this)" type="button" disabled>
										<i class="icofont icofont-plus"></i>
									</button>
								</span>
							</div>
							<table id="productTable"
								class="table table-striped table-bordered nowrap dataTable">
								<colgroup>
									<col width="30%" />
									<col width="70%" />
								</colgroup>
								<thead>
									<tr>
										<th class="text-center">세부 위치 번호</th>
										<th class="text-center">세부 위치명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${listLoc}">
										<c:if test="${item.desc03 != null}">
											<tr data-code02="${item.code02}" align="center"
												class="code03List" style="display: none;">
												<td>${item.codeNo}</td>
												<td>${item.desc03}</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function showDetailLoc3(obj) {
		let code02 = obj.getAttribute("data-code02");
		let sibling = obj.parentElement.children;
		for (let i = 0; i < sibling.length; i++) {
			   if ((i+1)%2 == 0) {
	                  sibling[i].setAttribute("style","background-color:white;cursor:pointer");
	        } else {
	             sibling[i].setAttribute("style","background-color:rgba(0,0,0,.05);;cursor:pointer");
	        }
		}
		obj.setAttribute("style", "background-color:wheat;")
		$(".selectedCode02").val(code02);
		let code3list = $(".code03List");
		$(".code03List").hide();
		$(".selectedCode02").next().prop("disabled",false);
		$(".selectedCode02").next().next().children().prop("disabled",false);
		for (let i = 0; i < code3list.length; i++) {
			if (code3list[i].getAttribute("data-code02") == code02) {
				$(code3list[i]).show();
			}
		}
	}

	function insertCode02(obj) {
		let desc02 = obj.parentElement.previousElementSibling.value;
		if (desc02 == "") {
			alert("위치명을 입력하세요") ;
		} else {
			let codeData = {}

		codeData.desc02 = desc02;
		$.ajax({
			url : '${path}/code/codeAutoInsert.do',
			data : codeData, // HTTP 요청과 함께 서버로 보낼 데이터
			method : "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType : "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
		.done(function(data) {
			if (data.code == 10001) {
				alert("저장 성공");
				var url = '${path}/code/writeLoc.do';
				location.href = url;
			} else {
				if (data.msg != '') {
					alert("등록 실패 \n 사유 : " + data.msg);
				} else {
					alert("등록 실패");
				}
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
		}
		
	}

	function insertCode03(obj) {
		let desc03 = obj.parentElement.previousElementSibling.value;
		if(desc03 == "") {
			alert("세부 위치명을 입력하세요")
		} else {
			let codeData = {}
		codeData.code02 = $(".selectedCode02").val();
		codeData.desc03 = desc03;
		$.ajax({
			url : '${path}/code/codeAutoInsert.do',
			data : codeData, // HTTP 요청과 함께 서버로 보낼 데이터
			method : "POST", // HTTP 요청 메소드(GET, POST 등)
			dataType : "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨..
		.done(function(data) {
			if (data.code == 10001) {
				alert("저장 성공");
				var url = '${path}/code/writeLoc.do';
				location.href = url;
			} else {
				if (data.msg != '') {
					alert("등록 실패 \n 사유 : " + data.msg);
				} else {
					alert("등록 실패");
				}
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
		}
		
	}
</script>


<jsp:include page="../body-bottom.jsp" />