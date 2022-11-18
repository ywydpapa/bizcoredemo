<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2022-02-04
  Time: 오후 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
 <!--계약조회-->
        <div class="cnt_wr">
            <div class="row">
            	<div class="col-sm-12">
					<div class="btn_wr" style="float:right;" >
		                <button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search" id="search"></i>검색</button>
					</div>
				</div>
                <div class="col-sm-12">
                    <div class="card_box sch_it">
                        <div class="form-group row" style="clear:both;">
                            <div class="col-sm-12 col-xl-6">
                                <label class="col-form-label">기간 검색</label>
                                <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="vatSdate"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="vatEdate"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!--//계약조회-->
<div class="dt-responsive table-responsive">
  <table id="cardlistTable" class="table table-striped table-bordered nowrap" style="width:100%; overflow:hidden;">
    <thead>
    <tr>
    	<td align="center" style="vertical-align:middle; width:5%;"><input type="checkbox" class="form-control" id="cardAllCheck" name="cardAllCheck" onclick="allCheck(this);"></td>
    	<th>일자</th>
      	<th>승인번호</th>
      	<th>카드번호</th>
      	<th>가맹점</th>
      	<th>승인금액</th>
      	<th>환율</th>
      	<th>적요</th>
    </tr>
    </thead>
    <tbody>
	    <c:forEach var="row" items="${list}">
	    	<c:if test="${row.appAmount ne 0}">
		      	<tr>
		      		<td align="center" style="vertical-align:middle;"><input type="checkbox" class="form-control" id="cardCheckSerial" name="cardCheckSerial" data-id="${row.appSerial}" style="margin-top:3px;width:30px;"></td>
		        	<td align="center" style="vertical-align:middle;"><input type="date" class="form-control" value="${row.appDate}" max="9999-12-31" id="cardDate" style="width:auto;"></td>
		        	<td align="center" style="vertical-align:middle;">${row.appSerial}</td>
		        	<td align="center" style="vertical-align:middle;">${row.cardSerial}</td>
		        	<td align="left" style="vertical-align:middle;">${row.appContents}</td>
		        	<td align="right" style="vertical-align:middle;"><fmt:formatNumber value="${row.appAmount}" pattern="#,###" /></td>
		        	<td align="right" style="vertical-align:middle;">${row.appExchange}</td>
		        	<td align="center"><input type="text" class="form-control" id="cardRemarks" style="width:auto;"></td>
		      	</tr>
	      	</c:if>
	    </c:forEach>
    </tbody>
  </table>
</div>

<script>
  $(function(){
    $('#cardlistTable').DataTable({
      info:false,
      searching: true
    });
  });
  
  function fnvatListB(a, b, c) {
	  $("#vatBdiv").find("#vatSerial").val(a);
	  $("#vatBdiv").find("#vatSellerCustNo").val(b);
	  $("#vatBdiv").find("#vatAmount").val(c);      
      $(".modal-backdrop").remove();
      $("#vatBModal").modal("hide");
  }
  
  function allCheck(e){
	  if($(e).is(":checked") === true){
		  $("#cardlistTable tbody tr td").find("#cardCheckSerial").each(function(index, item){
			  $(item).prop("checked", true);
		  });
	  }else{
		  $("#cardlistTable tbody tr td").find("#cardCheckSerial").each(function(index, item){
			  $(item).prop("checked", false);
		  });
	  }
  }
  
  //날짜 관련 자동
	$("#vatSdate").change(function(){
			var dateValue = $(this).val();
            var dateValueArr = dateValue.split("-");
            var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
            var EdateValue = $("#vatEdate").val();
            var EdateDateArr = EdateValue.split("-");
            var EdateDateCom = new Date(EdateDateArr[0], parseInt(EdateDateArr[1])-1, EdateDateArr[2]);

            if(EdateValue == ""){
                dateValueCom.setDate(dateValueCom.getDate()+1);
            }else if(dateValueCom.getTime() > EdateDateCom.getTime()){
                alert("시작일이 종료일보다 클 수 없습니다.");
                dateValueCom.setDate(dateValueCom.getDate()+1);
            }else{
                return null;
            }

            var year = dateValueCom.getFullYear();
            var month = dateValueCom.getMonth()+1;
            var day = dateValueCom.getDate();

            if(day < 10){
                day = "0" + day;
            }

            $("#vatEdate").val(year + "-" + month + "-" + day);
	});

	$("#vatEdate").change(function(){
            var SdateValue = $("#vatSdate").val();
            var SdateValueArr = SdateValue.split("-");
            var SdateValueCom = new Date(SdateValueArr[0], parseInt(SdateValueArr[1])-1, SdateValueArr[2]);
            var thisDateValue = $(this).val();
            var thisDateArr = thisDateValue.split("-");
            var thisDateCom = new Date(thisDateArr[0], parseInt(thisDateArr[1])-1, thisDateArr[2]);

            if(SdateValue == ""){
                thisDateCom.setDate(thisDateCom.getDate()-1);
            }else if(SdateValueCom.getTime() > thisDateCom.getTime()){
                alert("종료일이 시작일보다 작을 수 없습니다.");
                thisDateCom.setDate(thisDateCom.getDate()-1);
            }else{
                return null;
            }

            var year = thisDateCom.getFullYear();
            var month = thisDateCom.getMonth()+1;
            var day = thisDateCom.getDate();

            if(day < 10){
                day = "0" + day;
            }

            $("#vatSdate").val(year + "-" + month + "-" + day);
	});
	//날짜 관련 자동
	
	//검색 기능
	function fnListcon() {
		if($("#vatSdate").val() != null && $("#vatSdate").val() != ''){
			if($("#vatEdate").val() != null && $("#vatEdate").val() != ''){
				var tableHtml = "";
	            var searchData = {};
	            var cardlistTable = $("#cardlistTable tbody");
	            var table = $("#cardlistTable").DataTable();
	            
	            searchData.vatSdate = $("#vatSdate").val();
	            searchData.vatEdate = $("#vatEdate").val();
	            searchData.compNo = $('#compNo').val();
	            searchData.docUserNo = $('#docUserNo').val();
	            
	            cardlistTable.empty();
	           	table.clear().draw();
	           	
	              $.ajax({
					url: "${path}/acc/Search_treqCardList.do",
					method: "post",
					data: searchData,
					dataType: "json",
				})
				.done(function(result){
					if(result.data.length > 0){
						for(var i = 0; i < result.data.length; i++){
							if(result.data[i].appAmount != 0){
								tableHtml += "<tr><td style='text-align:center;vertical-align:middle;'><input type='checkbox' style='margin-top: 3px; width: 45px'  class='form-control' id='cardCheckSerial' name='cardCheckSerial' data-id='" + result.data[i].appSerial + "'></td><td style='text-align:center;vertical-align:middle;'>" 
								+ "<input type='date' class='form-control' value='" + result.data[i].appDate + "' max='9999-12-31' id='cardDate' style='width: auto;'></td>"
								+ "<td style='text-align: center; vertical-align: middle;'>"
							 	+ result.data[i].appSerial + "</td><td style='text-align: center; vertical-align: middle;'>"
							 	+ result.data[i].cardSerial + "</td><td style='text-align: center; vertical-align: middle;'>"
							 	+ result.data[i].appContents + "</td><td style='text-align: center; vertical-align: middle;'>"
							 	+ result.data[i].appAmount.toLocaleString("en-US") + "</td><td style='text-align: center;'>"
							 	+ result.data[i].appExchange + "</td><td style='text-align: center; vertical-align: middle;'><input type='text' class='form-control' id='cardRemarks' style='width: auto;'></td>";	
							}
						}
						cardlistTable.html(tableHtml);
					}
					$('#cardlistTable_length').hide();
					$('#cardlistTable_filter').hide();
					$('#cardlistTable_previous').hide();
					$('#cardlistTable_next').hide();
				});  
			}else{
				alert('검색 일자 중 마감일을 확인하세요.');
				return false;
			}
		}else{
			alert('검색 일자 중 시작일을 확인하세요.');
			return false;
		}
	}
	//검색 기능
</script>