<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!-- listusercontribution -->
<form name="form2" method="post" onsubmit="return false;">
	<div>
		<div>
			<span style="font-weight: 600;">기여도 설정</span>
			<div class="btn_wr text-right mt-3" id="insert_contribution_percent">
				<span style="color : red; font-weight: bold; line-height: 45px;">기여도는 최초 1회만 설정이 가능합니다.&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
				<button class="btn btn-md btn-primary f-right" id="insert_contribution_percent_button" onClick="insert_contribution_percent()">기여도 등록</button>
			</div>
			<input type="hidden" id="sessionCustNo" value="${sessionCust.custNo}" />
			<input type="hidden" id="listusercontributionCnt" value="${listusercontributionCnt}" />
			
			<table class="table table-sm bst02" id="billProTable">
				<thead>
					<tr>
						<th class="text-center">사원 이름</th>
						<th class="text-center">퍼센트</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${listusercontribution}"  varStatus="c">
						<tr style="text-align: center;">
							<td><input type="text" style="text-align: center;" class="form-control" id="sessionVatNo" value="${row.userName}" readonly>
							<td>
								<c:choose>
									<c:when test="${row.contribution_percent eq 0}">
										<c:if test="${row.userNo eq 0}">
											<input type="hidden" value="${row.main_userNo}">
											<input type="number" class="form-control-sm" style="border: 1px solid #ccc; text-align: right;" id="${c.count}" value="0">&nbsp%
										</c:if>
										<c:if test="${row.userNo ne 0}">
											<input type="hidden" value="${row.main_userNo}">
											<input type="number" class="form-control-sm" style="border: 1px solid #ccc; text-align: right;" id="${c.count}" value="100">&nbsp%
										</c:if>
									</c:when>
									<c:when test="${row.contribution_percent ne 0}">
										<c:if test="${row.userNo eq 0}">
											<input type="hidden" value="${row.main_userNo}">
											<input type="number" class="form-control-sm" style="border: 1px solid #ccc; text-align: right;" id="${c.count}" value="${row.contribution_percent}" readonly>&nbsp%
										</c:if>
										<c:if test="${row.userNo ne 0}">
											<input type="hidden" value="${row.main_userNo}">
											<input type="number" class="form-control-sm" style="border: 1px solid #ccc; text-align: right;" id="${c.count}" value="${row.contribution_percent}" readonly>&nbsp%
										</c:if>
									</c:when>
								</c:choose>
							</td>
						</tr>			
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</form>
<script>
	$(document).ready(function(){
		var listusercontributionCnt = $('#listusercontributionCnt').val();
		var arr = new Array();
		
		for(var i = 0; i < listusercontributionCnt; i++){
			if($("#"+ i +"").val() != 'NaN' && $("#"+ i +"").val() != null && $("#"+ i +"").val() != ''){
				arr.push(parseInt($("#"+ i +"").val()));
			}
		}
		if(arr.includes(100) == false){
			$('#insert_contribution_percent_button').hide();
		}
	});
	
	function insert_contribution_percent(){
		var listusercontributionCnt = $('#listusercontributionCnt').val();
		var selectData = {};
		var sum = 0;
		selectData.contNo = $('#contNo').val(); 
		for(var i = 0; i < listusercontributionCnt; i++){
			if($("#"+ i +"").val() != 'NaN' && $("#"+ i +"").val() != null && $("#"+ i +"").val() != ''){
				sum += parseInt($("#"+ i +"").val());
			}
		}
		
		for(var i = 0; i < listusercontributionCnt; i++){
			if($("#"+ i +"").val() != 'NaN' && $("#"+ i +"").val() != null && $("#"+ i +"").val() != ''){
				if(parseInt($("#"+ i +"").val()) >= 91 && parseInt($("#"+ i +"").val()) <= 100){
					alert("한 인원의 최대 퍼센테이지는 90%입니다.");
					return false;
				}
			}
		}
		
		if(sum > 100){
			alert("총 합이 100% 초과입니다.");
		}else if(sum < 100){
			alert("총 합이 100% 미만입니다.");
		}else{
			for(var i = 0; i < listusercontributionCnt; i++){
				if($("#"+ i +"").val() != 'NaN' && $("#"+ i +"").val() != null && $("#"+ i +"").val() != ''){
					var userName = $("#"+ i +"").parent().prev().children().val();
					var contribution_percent = $("#"+ i +"").val();
					var userNo = $("#"+ i +"").prev().val();
					
					selectData.userName = userName;
					selectData.userNo = userNo
					selectData.contribution_percent = contribution_percent;

					   $.ajax({
			  			 url: "${path}/cont/insert_contribution_percent.do",
			  			 method: "post",
			  			 data: selectData,
			  			 dataType: "json"
			  		  });  
				}
			} 	
			localStorage.setItem('lastTab', '#tab08');
			location.reload();
		}
	}
	
</script>