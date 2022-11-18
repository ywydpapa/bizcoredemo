<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top.jsp"/>

<div id="main_content">
	<c:set var="targetTypeValue" value="${tableData[0].targetType}"/>
	<c:set var="targetYearValue" value="${tableData[0].targetYear}"/>
	<c:set var="orgIdValue" value="${tableData[0].orgId}"/>

	<div id="popup" style="background-color:#fff">
		<form name="frm" method="post">
			<div class="form-row align-items-center">
				<div class="col-auto my-1">
					<label class="mr-sm-2" for="inlineFormCustomSelect">년도</label>
					<select class="custom-select mr-sm-2" name="targetYear" id="targetYear">
						<option value="">선택</option>
						<c:forEach var="i" begin="2020" end="2031">
							<option value="${i}" <c:if test="${i eq targetYearValue}">selected</c:if>>${i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-auto my-1">
					<label class="mr-sm-2" for="inlineFormCustomSelect">부서</label>
					<select class="custom-select mr-sm-2" name="targetDepartment" id="targetDepartment">
						<option value = "all" selected>전체부서</option>
						<c:forEach var ="row" items="${listDept}">
							<option value = "${row.org_id}" <c:if test="${orgIdValue == row.org_id}">selected</c:if> >${row.org_title}</option>
						</c:forEach>
					</select>
				</div>

				<div class="col-auto my-1">
					<label class="mr-sm-2" for="inlineFormCustomSelect">설정</label>
					<select class="custom-select mr-sm-2" name="planType" id="planType">
						<option value="PROFIT" <c:if test="${targetTypeValue eq 'PROFIT'}">selected</c:if> >목표금액</option>
						<option value="SALES" <c:if test="${targetTypeValue eq 'SALES'}">selected</c:if> >매출금액</option>
					</select>
				</div>
				<c:if test="${targetTypeValue eq 'SALES'}">
					<div class="col-auto my-1">
						<label class="mr-sm-2" for="inlineFormCustomSelect">마진율</label>
						<input type="number" id="marginRate" step="0.00001" value="0.0"/>
						<button class="btn btn-success btn-sm" type="button" onclick="fn_marginRateCal();" style="float:right;">마진전체 계산</button>
					</div>
				</c:if>
			</div>

			<table class="table plan-table table-bordered">
				<tr>
					<th rowspan="2" style="vertical-align: middle;">담당사원</th>
					<th colspan="12">
						<c:if test="${targetTypeValue eq 'PROFIT'}">월별(목표금액)</c:if>
						<c:if test="${targetTypeValue eq 'SALES'}">월별(매출금액)</c:if>
					</th>
					<th rowspan="2" style="vertical-align: middle;">합계</th>
				</tr>
				<tr>
					<th width="120px">1</th>
					<th width="120px">2</th>
					<th width="120px">3</th>
					<th width="120px">4</th>
					<th width="120px">5</th>
					<th width="120px">6</th>
					<th width="120px">7</th>
					<th width="120px">8</th>
					<th width="120px">9</th>
					<th width="120px">10</th>
					<th width="120px">11</th>
					<th width="120px">12</th>
				</tr>
				<tbody id="plan_list">
					<c:forEach var="item" items="${tableData}" begin="1">
						<tr class="dept">
							<td colspan="14">${item.deptData.org_title}</td>
						</tr>
						<c:forEach var="itemSemi" items="${item.salesTargetData}">
							<tr class="dataList" id="${itemSemi.userNo}" data-deptno="${itemSemi.deptNo}">
								<td>${itemSemi.userName}</td>
								<td><input type="text" value="${itemSemi.mm01}"/></td>
								<td><input type="text" value="${itemSemi.mm02}"/></td>
								<td><input type="text" value="${itemSemi.mm03}"/></td>
								<td><input type="text" value="${itemSemi.mm04}"/></td>
								<td><input type="text" value="${itemSemi.mm05}"/></td>
								<td><input type="text" value="${itemSemi.mm06}"/></td>
								<td><input type="text" value="${itemSemi.mm07}"/></td>
								<td><input type="text" value="${itemSemi.mm08}"/></td>
								<td><input type="text" value="${itemSemi.mm09}"/></td>
								<td><input type="text" value="${itemSemi.mm10}"/></td>
								<td><input type="text" value="${itemSemi.mm11}"/></td>
								<td><input type="text" value="${itemSemi.mm12}"/></td>
								<td><input type="text" value="0" readonly="readonly" class="yearSum inputRead"/></td>
							</tr>
						</c:forEach>
						<tr class="monthSum">
							<td>소계</td>
							<c:forEach begin="0" end="11">
								<td><input type="text" value="0" readonly="readonly" class="inputRead"/></td>
							</c:forEach>
							<td><input type="text" value="0" readonly="readonly" class="inputRead"/></td>
						</tr>
					</c:forEach>
						<tr class="totalSum" style="border-top: 2px solid;">
							<td>합계</td>
							<c:forEach begin="0" end="11">
								<td><input type="text" value="0" readonly="readonly" class="inputRead"/></td>
							</c:forEach>
							<td><input type="text" value="0" readonly="readonly" class="inputRead"/></td>
						</tr>
				</tbody>
			</table>

			<div class="col-lg-12 pull-right" style="margin-bottom:15px;margin-top:5px">
				<c:if test="${userRole =='PUSER'}">
				<button class="btn btn-success config-save" type="button" onclick="fn_update();" style="float:right;">저장</button>
				</c:if>
				<!-- <button class="btn btn-primary pop-close" type="button">닫기</button> -->
			</div>
		</form>
	</div>
	<style>
	tr, th, td{
		text-align: center;
		vertical-align: middle;
	}
	td > input {
		text-align: right;
	}
	td:last-child > input {
		width: 100%;
		text-align: right;
	}
	input[type=text] {
		width : 100%;
	}
	.inputRead {
		border: 0;
	}
	.dept > td{
		text-align: left;
		padding-left: 15px !important;
		background-color: #e6e6e6;
	}
	</style>
	<script>
	function fn_update(){
		var $beforeData = $(".dataList");
		var targetYear = $("#targetYear option:selected").val();
		var targetType = $("#planType option:selected").val();

		var salesTargetlist = new Object();
		var dataList = new Array();

		$beforeData.each(function(){
			var userNo = $(this).attr('id');	// userNo
			var deptNo = $(this).data('deptno');// deptNo
			// 테이블 구조변경시 수정할 코드 .splice(시작,끝)
			var $detail = $(this).find("input[type=text]").splice(0,12);
			var mArr = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			for(var i=0; i<12; i++){
				mArr[i] = Number($detail[i].value.replace(/[\D\s\._\-]+/g, ""));
			}

			var data = new Object();
			data['userNo'] = userNo;
			data['deptNo'] = deptNo;
			data['targetYear'] = targetYear;
			data['targetType'] = targetType;
			data['mm01'] = mArr[0];
			data['mm02'] = mArr[1];
			data['mm03'] = mArr[2];
			data['mm04'] = mArr[3];
			data['mm05'] = mArr[4];
			data['mm06'] = mArr[5];
			data['mm07'] = mArr[6];
			data['mm08'] = mArr[7];
			data['mm09'] = mArr[8];
			data['mm10'] = mArr[9];
			data['mm11'] = mArr[10];
			data['mm12'] = mArr[11];
			dataList.push(data);
		});

		salesTargetlist["salesTargetlist"] = dataList;

		$.ajax({
			url: "${path}/salesTarget/update.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			data: JSON.stringify(salesTargetlist) , // HTTP 요청과 함께 서버로 보낼 데이터
			method: "POST", // HTTP 요청 메소드(GET, POST 등)
			contentType:"application/json",
			dataType: "json" // 서버에서 보내줄 데이터의 타입
		}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
		.done(function(data) {
			if(data.code == 10001){
				alert("저장 성공");
				fn_PreReload();
			}else{
				alert("저장 실패");
			}
		}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
		.fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}

	function fn_PreReload(){
		var url="${path}/sales/setTarget.do";
		var salesTargetDTO = new Object();
		var targetYear = $("#targetYear option:selected").val();
		var targetDepartment = $("#targetDepartment option:selected").val();
		if(targetDepartment == undefined || targetDepartment == '' || targetDepartment == 'all'){
			// empty
		} else {
			salesTargetDTO.deptNo = targetDepartment;
			salesTargetDTO.orgId = targetDepartment;
		}

		var planType = $("#planType").val();
		salesTargetDTO.targetYear = targetYear;
		salesTargetDTO.targetType = planType;

		//fn_Reload01(url, salesTargetDTO);
	}

	$("#targetDepartment").on("change",function(){
		fn_PreReload();
	});

	$("#planType").on("change",function(){
		fn_PreReload();
	});

	$("#targetYear").on("change",function(){
		fn_PreReload();
	});

	function fn_Reload01(url, data){
		$("#main_content").empty();
		$("#main_content").load(url, data, function(){
			setTimeout(function(){
			}, 500);
		});
	}

	// 인원 체크후 목표금액 데이터 불러와서 마진 계산후 다시 값 세팅
	// 추후에 다시 개발
	function fn_marginRateCal(){

	}

	$(document).ready(function() {
		var $form = $("#plan_list");
		var $input = $form.find("input");

		// 이벤트 시작 ====================================================
		// 이벤트시 동작
		$input.on("keyup", function(event) {
			// 긁어와서 이벤트 체크
			var selection = window.getSelection().toString();
			if(selection !== '' ) return;
			if($.inArray(event.keyCode, [38,40,37,39] ) !== -1 ) return;

			// 긁어오는값을 콤마를 제거해서 숫자변환
			var $this = $(this);
			var input = $this.val();
			var input = input.replace(/[\D\s\._\-]+/g, "");
			input = input ? parseInt(input, 10) : 0;
			var ti = input;

			// 데이터 반환
			$this.val( function() {
				return ( input === 0 ) ? "0" : input.toLocaleString("en-US");
			});

			// 1월~12월 연간합산
			// 부모 노드 찾기 -> yaerSum 클래스가 없는 input value 값 가져오기 -> 합산후 yearSum 넣기
			$dataList = $(this).parent().parent().find("input[type=text]").not(".yearSum");
			var sum = 0;
			$dataList.each(function(i,v){
				var temp = Number((v.value).replace(/[\D\s\._\-]+/g, ""));
				sum = sum + temp;
			});

			// 숫자를 콤마형식으로 변경
			$(this).parent().parent().find("input[type=text].yearSum").val(sum.toLocaleString("en-US"));

			var tdNum = $(this).parent().parent().find("td").index($(this).parent());
			tdNum = tdNum + 1;

			// 월별합산
			var qi = 0;
			$q = $(this).parent().parent().prev();
			while($q.hasClass("dataList")) {
				var temp = ($q.find("td:nth-child("+tdNum+") > input[type=text]").val()).replace(/[\D\s\._\-]+/g, "");
				temp = Number(temp);
				qi = qi + temp;
				$q = $q.prev();
			}

			var pi = 0;
			$p = $(this).parent().parent().next();
			while($p.hasClass("dataList")) {
				var temp = ($p.find("td:nth-child("+tdNum+") > input[type=text]").val()).replace(/[\D\s\._\-]+/g, "");
				temp = Number(temp);
				pi = pi + temp;
				$p = $p.next();
			}

			var pqtsum = qi + pi + ti;

			$t = $(this).parent().parent().next();
			while(!$t.hasClass("monthSum")){
				$t = $t.next();
			}

			$t.find("td:nth-child("+tdNum+") > input[type=text]").val(pqtsum.toLocaleString("en-US"));

			// 부서합산
			var mArrSum = 0;
			// 테이블 구조변경시 수정할 코드 .splice(시작,끝)
			$k = $t.find("td").splice(1,13);
			for(var i=0; i<12; i++){
				mArrSum = mArrSum + Number(($k[i].firstElementChild.value).replace(/[\D\s\._\-]+/g, ""));
			}
			$t.find("input[type=text]").last().val(mArrSum.toLocaleString("en-US"));

			// 총합산
			var $total = $(".monthSum");
			var totalMonthSumArr = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			for(var i=0; i<$total.length; i++){
				for(var j=1; j<13; j++){
					totalMonthSumArr[j-1] = totalMonthSumArr[j-1] + Number(($total[i].children[j].firstElementChild.value).replace(/[\D\s\._\-]+/g, ""));
				}
			}

			var totalSum = 0;
			var $element  = $(".totalSum");
			var $totalSumInput = $element.find("input[type=text]");
			for(var i=0; i<$totalSumInput.length-1; i++){
				totalSum = totalSum + totalMonthSumArr[i];
				$totalSumInput[i].value = totalMonthSumArr[i].toLocaleString("en-US");
			}

			$totalSumInput.last().val(totalSum.toLocaleString("en-US"));


		});
		// 이벤트 끝 ============================================================

		// 1월~12월 연간합산
		var $year = $form.find("input[type=text].yearSum");
		$year.each(function(){
			var $yearPrevInit = $(this).parent();
			var yearSumInit = 0;
			for(var i=0; i<12; i++){
				$yearPrevInit = $yearPrevInit.prev();
				yearSumInit = yearSumInit + Number(($yearPrevInit.find("input[type=text]").val()).replace(/[\D\s\._\-]+/g, ""));
			}
			$(this).val(yearSumInit.toLocaleString("en-US"));
		});

		var totalSumArr = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

		var $month = $form.find(".monthSum");
		$month.each(function(){
			// 월별합산
			var mArr = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			var $t = $(this).prev();
			while($t.hasClass("dataList")){
				// 테이블 구조변경시 수정할 코드 .splice(시작,끝)
				var $u = $t.find("td").splice(1,13);
				for(var i=0; i<12; i++){
					mArr[i] = mArr[i] + Number(($u[i].firstElementChild.value).replace(/[\D\s\._\-]+/g, ""));
				}
				$t = $t.prev();
			}
			// 테이블 구조변경시 수정할 코드 .splice(시작,끝)
			var $g = $(this).find("td").splice(1,13);
			for(var i=0; i<12; i++){
				totalSumArr[i] = totalSumArr[i] + mArr[i];
				$g[i].firstElementChild.value = mArr[i].toLocaleString("en-US");
			}

			// 부서합산
			var mArrSum = 0;
			for(var i=0; i<12; i++){
				mArrSum = mArrSum + mArr[i];
			}
			$(this).find("input[type=text]").last().val(mArrSum.toLocaleString("en-US"));


		});

		// 총 합산
		var $total = $form.find(".totalSum").find("td");
		var $totalSub = $total.splice(1,12);
		for(var i=0; i<12; i++){
			$totalSub[i].firstElementChild.value = totalSumArr[i].toLocaleString("en-US");
		}

		var totalYearSum = 0;
		for(var i=0; i<12; i++){
			totalYearSum = totalYearSum + totalSumArr[i];
		}
		// 테이블 구조변경시 수정할 코드
		$total[1].firstElementChild.value = totalYearSum.toLocaleString("en-US");

		// 초기 데이터 input창 콤마 생성
		$input.each(function(){
			var $this = $(this);
			var input = $this.val();
			var input = input.replace(/[\D\s\._\-]+/g, "");
			input = input ? parseInt(input, 10) : 0;
			$this.val( function() {
				return ( input === 0 ) ? "0" : input.toLocaleString("en-US");
			});
		});

	});
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>