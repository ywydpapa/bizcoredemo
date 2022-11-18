<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2022-01-20
  Time: 오전 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${requestScope['javax.servlet.forward.servlet_path']}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top3.jsp"/>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<div id="main_content">
	<style>
	.select2-container {
		width: 13%!important;
	}

	.select2-container--default .select2-selection--single .select2-selection__rendered {
		background-color: white;
		line-height: 10px!important;
	}
	</style>
    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">카드 상세 내역</h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                        <!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold" onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2" onclick="acordian_action1()" style="display:none;">접기</button>
                        <button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
                        <button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>
                        <button class="btn btn-sm btn-outline"onClick="javascript:location='${path}/acc/cardUpload.do'"><i class="icofont icofont-pencil-alt-2"></i>내역 등록</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="cnt_wr" id="acordian" style="display:none;">
            <div class="row">
                <form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
                    <div class="col-sm-12">
                        <div class="card_box sch_it">
                            <div class="form-group row">
	                            <div class="col-sm-12 col-xl-3">
	                                <label class="col-form-label">일자별</label>
	                                <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="appDateFrom"> ~ <input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="appDateTo"></p>
	                            </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">가맹점명/국가명</label>
                                    <input type="text" class="form-control" id="appContents">
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">승인번호</label>
                                    <input type="text" class="form-control" id="appSerial">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </c:if>
	<div class="row" style="margin-bottom: 10px;">
		<div class="col-sm-12">
            <label for="cardlist">카드번호</label>
			<select class="form-control-sm" id="cardlist">
				<option value="">선택</option>
				<c:forEach var="row" items="${cardList}">
					<option value="${row.cardDisNum}">${row.cardSerial}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="cardTable" class="table table-striped table-bordered nowrap ">
                            <colgroup>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="15%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="5%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">일자</th>
                                <th class="text-center">카드번호</th>
                                <th class="text-center">가맹점명/국가명</th>
                                <th class="text-center">승인번호</th>
                                <th class="text-center">사용구분</th>
                                <th class="text-center">매출종류</th>
                                <th class="text-center">할부기간</th>
                                <th class="text-center">승인금액</th>
                                <th class="text-center">환율</th>
                            </tr>
                            </thead>
                            <tbody>
<%-- 	                            <c:forEach items="${vatList}" var="vlist">
	                                <tr>
	                                    <td class="text-center">${vlist.baclogTime}</td>
	                                    <td class="text-center">${vlist.logRemark}</td>
	                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.inAmt}" /></td>
	                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.outAmt}" /></td>
	                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.balanceAmt}" /></td>
	                                    <td>${vlist.branchCode}</td>
	                                    <td>${vlist.linkDoc}</td>
	                                </tr>
	                            </c:forEach> --%>
                          	</tbody>
                        </table>
                        
                        <div id="pageDiv" style="float: right;"></div>
                        
                        <div class="modal fade " id="bacVatSModal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-80size" role="document">
                                <div class="modal-content modal-80size">
                                    <div class="modal-header">
                                        <h4 class="modal-title">매입/매출 거래처 선택</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade " id="bacVatBModal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-80size" role="document">
                                <div class="modal-content modal-80size">
                                    <div class="modal-header">
                                        <h4 class="modal-title">매입/매출 거래처 선택</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
	    <!--//리스트 table-->
		<!-- hide and show -->
		$(document).ready(function(){
			const CLICK_PAGE_NUM = 10;
			const CARD_TABLE = $("#cardTable tbody");
			const DEFAULT_NUM = 15;
			$("#cardlist").select2(); 
			
			$("#cardlist").change(function(){
				var page = 1;
				
				localStorage.setItem("cardDisNum", $(this).val());
				
				pageNation(page, DEFAULT_NUM, localStorage.getItem("cardDisNum"));
			});
			
			$("#appDateFrom").change(function(){
				var dateValue = $(this).val();
				var dateValueArr = dateValue.split("-");
				var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
				var EdateValue = $("#appDateTo").val();
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
				
				if(month < 10){
					month = "0" + month;
				}
				
				if(day < 10){
					day = "0" + day;
				}
				
				$("#appDateTo").val(year + "-" + month + "-" + day);
			});
			
			$("#appDateTo").change(function(){
				var SdateValue = $("#appDateFrom").val();
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
				
				if(month < 10){
					month = "0" + month;
				}
				
				if(day < 10){
					day = "0" + day;
				}
				
				$("#appDateFrom").val(year + "-" + month + "-" + day);
			});
		});	
		
		function pageNation(page, DEFAULT_NUM, reData){
			var cardTable = $("#cardTable tbody");
			var compNo = "${sessionScope.compNo}";
			var selectData = {};
			var tableHtml = "";
			var pageHtml = "";
			
			if(reData.cardDisNum != null){
				selectData.cardDisNum = reData.cardDisNum;
			}else{
				selectData.cardDisNum = reData;
			}
			
			cardTable.empty();
			
			selectData.compNo = compNo;
			selectData.appContents = $("#appContents").val() ? $("#appContents").val() : "";
			selectData.appDateFrom = $("#appDateFrom").val() ? $("#appDateFrom").val() : "";
			selectData.appDateTo = $("#appDateTo").val() ? $("#appDateTo").val() : "";
			selectData.appSerial = $("#appSerial").val() ? $("#appSerial").val() : "";
			
			$.ajax({
				url: "${path}/acc/cardSelectListCount.do",
				method: "post",
				data: selectData,
				dataType: "json",
				success:function(countResult){
					var count = countResult.resultCount;
					var start = (page - 1) * DEFAULT_NUM;
					var last = DEFAULT_NUM;
					var lastPage = count % DEFAULT_NUM;
					var pageNum = Math.floor(count / DEFAULT_NUM);
					var lastPageNum = (lastPage > 0) ? pageNum + 1 : pageNum;
					var setFirstPage = 0;
					var setLastPage = setFirstPage + 9;
					var activePage = localStorage.getItem("activePage");
					
					if(localStorage.getItem("setFirstPage") != null){
						setFirstPage = localStorage.getItem("setFirstPage");
					}else{
						setFirstPage = page;
					}
					
					if(setLastPage > lastPageNum){
						setLastPage = lastPageNum;
					}
					
					selectData.betFirstNum = start;
					selectData.betLastNum = last;
					
					pageHtml += "<ul class='pagination'><li class='page-item'><a class='page-link' href='#' onClick='pagePrevious(this);'>Previous</a></li>";
					
					for(var i = setFirstPage; i <= setLastPage; i++){
						if(i == activePage){
							pageHtml += "<li class='page-item active' id='page_"+ i +"'><a class='page-link' href='#' data-number='"+ i +"' onClick='pageClick(this);'>" + i + "</a></li>"
						}else{
							pageHtml += "<li class='page-item' id='page_"+ i +"'><a class='page-link' href='#' data-number='"+ i +"' onClick='pageClick(this);'>" + i + "</a></li>"
						}
					}
					
					pageHtml += "<li class='page-item'><a class='page-link' id='pageNextBtn' href='#' onClick='pageNext(this);'>Next</a></li></ul>";
					
					$("#pageDiv").html(pageHtml);
					
					localStorage.setItem("lastPageNum", lastPageNum);
					localStorage.removeItem("activePage");
					
					$.ajax({
						url:"${path}/acc/cardSelectList.do",
						method: "get",
						data: selectData,
						dataType: "json",
						success:function(data){
							for(var i = 0; i < data.length; i++){
								tableHtml += "<tr><td style='text-align:center;'>" + data[i].appDate + "</td>"
								+ "<td style='text-align:center;'>" + data[i].cardSerial + "</td>"
								+ "<td style='text-align:center;'>" + data[i].appContents + "</td>"
								+ "<td style='text-align:center;'>" + data[i].appSerial + "</td>"
								+ "<td style='text-align:center;'>" + data[i].useDivision + "</td>"
								+ "<td style='text-align:center;'>" + data[i].salesType + "</td>"
								+ "<td style='text-align:center;'>" + data[i].instPeriod + "</td>"
								+ "<td style='text-align:right;'>" + parseInt(data[i].appAmount).toLocaleString("en-US") + "</td>"
								+ "<td style='text-align:center;'>" + data[i].appExchange + "</td></tr>";
							}
							
							cardTable.html(tableHtml);
						},
						error:function(){
							alert("데이터가 없습니다.");
							return false;
						}
					});
				},
				error:function(){
					alert("카운트에 실패했습니다.");
					return false;
				}
			});
		}
		
		function pageClick(e){
			var page = $(e).attr("data-number");
			var setFirstPage = $(e).parents("ul").find("li:first").next().children().attr("data-number");
			
			localStorage.setItem("activePage", page);
			localStorage.setItem("setFirstPage", setFirstPage);
			pageNation(page, DEFAULT_NUM, localStorage.getItem("cardDisNum"));
		}
		
		function fnListcon(){
			var selectData = {};
			var cardTable = $("#cardTable tbody");
			var cardDisNum = localStorage.getItem("cardDisNum");
			cardTable.empty();
			$("#pageDiv").empty();

			selectData.cardDisNum = cardDisNum;
			
			pageNation(1, DEFAULT_NUM, selectData);
		}
		
		function acordian_action(){
			if($("#acordian").css("display") == "none"){
			    $("#acordian").show();
			    $("#fold").hide();
			    $("#fold2").show();
	
			} else {
			    $("#acordian").hide();
			    $("#fold").show();
			}
		}
		
		function acordian_action1(){
			if($("#acordian").css("display") != "none"){
			    $("#acordian").hide();
			    $("#fold").show();
			    $("#fold2").hide();
	
			} else {
			    $("#acordian").show();
			    $("#fold").hide();
			}
		}
		<!-- hide and show -->
		
        $('#custModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        $('#userModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
        $('#soppModal').on('show.bs.modal', function(e) {
            var button = $(e.relatedTarget);
            var modal = $(this);
            modal.find('.modal-body').load(button.data("remote"));
        });
		
        $('#bacVatBModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			localStorage.setItem("thisId", button.attr("data-id"));
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		$('#bacVatSModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			localStorage.setItem("thisId", button.attr("data-id"));
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		$('#bacVatBModal').on('hidden.bs.modal', function(e) {
			localStorage.setItem("thisId", $(e).attr("data-id"));
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').html("");
		});
		
		$('#bacVatSModal').on('hidden.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			var modal = $(this);
			modal.find('.modal-body').html("");
		});
        
        function fnSetCustData(a, b) {
            $("#custNo").val(b);
            $("#custName").val(a);
            $(".modal-backdrop").remove();
            $("#custModal").modal("hide");
        }

        function fnSetUserData(a, b) {
            $("#userName").val(b);
            $("#userNo").val(a);
            $(".modal-backdrop").remove();
            $("#userModal").modal("hide");
        }

        function fnSetSoppData(a, b) {
            $("#soppNo").val(b);
            $("#soppTitle").val(a);
            $(".modal-backdrop").remove();
            $("#soppModal").modal("hide");
        }

        function fnChgStatus(){
            $Aarr=$(".vatSno");
            $Barr=$(".vatStchg");
            $Carr=$(".vatTyp");
            for (var i=0; i<$Barr.length; i++) {
                if ($($Barr[i]).is(":checked") == true) {
                    var vatData = {};
                    vatData.vatSerial = $Aarr[i].innerText;
                    if ($Carr[i].innerText == '매입'){
                        vatData.vatStatus = 'B5';
                    }else{
                        vatData.vatStatus = 'S5';
                    }
                    $.ajax({
                        url : "${path}/acc/vatStatuschg.do",
                        data : vatData,
                        method : "POST",
                        dataType: "json"
                    })
                        .done(function(){
                        });
                }
                alert("변경 처리 완료");
            }

        }
    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>