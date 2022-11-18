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
    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
        <input id="compNo_hidden" type="hidden" value="${sessionScope.compNo}">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">계좌 계산서 연결 확인</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Page-header end 페이지 타이틀 -->
    </c:if>
	
	<!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div id="testcreatebactable" class="table-responsive">
                    <input id="reloadpage_num" type="hidden" value="0">
                        <table id="bacTable" class="table table-striped table-bordered nowrap">
                            <thead>
                            <tr>
                                <th class="text-center">계좌번호</th>
                                <th class="text-center">계산서 항목</th>
                                <th class="text-center">계산서 받은금액</th>
                                <th class="text-center">계산서 남은금액</th>
                                <th class="text-center">연결날짜</th>
                                <th class="text-center">계산서 승인번호</th>
                                <th class="text-center">계산서 비고</th>
                            </tr>
                            </thead>
                            
                            <tbody> 	                         
                          	</tbody>
                        
                        </table>
                        <div id="pageDiv" style="float: right;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 <script>
	    <!--//리스트 table-->
		$(document).ready(function(){
			const BAC_TABLE = $("#bacTable tbody");
			const DEFAULT_NUM = 15;
			
			BAC_TABLE.empty();
			$("#pageDiv").empty();
			
			pageNation(1, DEFAULT_NUM, null);
		});
		
		function pageNation(page, DEFAULT_NUM, reData){
			var bacTable = $("#bacTable tbody");
			var compNo = "${sessionScope.compNo}";
			var countData = {};
			var selectData = {};
			var tableHtml = "";
			var pageHtml = "";
			
			bacTable.empty();
			
			selectData.compNo = compNo;
			
			$.ajax({
				url: "${path}/acc/check_link_vatandbacCnt.do",
				method: "get",
				data: selectData,
				dataType: "json",
				success:function(countResult){
					var count = countResult.resultCount;
					var start = (page - 1) * DEFAULT_NUM;
					var last = DEFAULT_NUM;
					var lastPage = count % DEFAULT_NUM;
					var pageNum = Math.floor(count / DEFAULT_NUM);
					var lastPageNum = (lastPage > 0) ? pageNum + 1 : pageNum;
					var activePage = localStorage.getItem("activePage");
					
					if(localStorage.getItem("setFirstPage") != null){
						var setFirstPage = localStorage.getItem("setFirstPage");
						localStorage.removeItem("setFirstPage");
					}else{
						var setFirstPage = 1;
					}
					
					var setLastPage = parseInt(setFirstPage) + 9;
					
					if(setLastPage > lastPageNum){
						setLastPage = lastPageNum;
					}
					
					selectData.betFirstNum = isNaN(start) ? 0 : start;
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
						url:"${path}/acc/check_link_vatandbac.do",
						method: "get",
						data: selectData,
						dataType: "json",
						success:function(data){
							if(data.length > 0){
								for(var i = 0; i < data.length; i++){
									tableHtml += "<tr>"
									if(data[i].bacNo != null && data[i].bacNo != ''){
										tableHtml += "<td style='text-align:center;vertical-align:middle;'>"+data[i].bacNo+"</td><td style='text-align:center;vertical-align:middle;'>"
									}else if(data[i].bacNo == null || data[i].bacNo == ''){
										tableHtml += "<td style='text-align:center;vertical-align:middle;'>미연결</td><td style='text-align:center;vertical-align:middle;'>"
									}
									if(data[i].vatProductName != null && data[i].vatProductName != ''){
										tableHtml += ""+data[i].vatProductName+"</td><td style='text-align:right;vertical-align:middle;'>"
									}else if(data[i].vatProductName == null || data[i].vatProductName == ''){
										tableHtml += "</td><td style='text-align:right;vertical-align:middle;'>"
									}
									tableHtml += ""+data[i].modal_receive_data.toLocaleString("en-US")+"</td><td style='text-align:right;vertical-align:middle;'>"
								 	+ ""+data[i].modal_vatmemo+"</td><td style='text-align:right;vertical-align:middle;'>"
								 	if(data[i].regDate != null && data[i].regDate != ''){
								 		tableHtml += ""+data[i].regDate+"</td><td style='text-align:center;vertical-align:middle;'>"
								 	}else if(data[i].regDate == null || data[i].regDate == ''){
								 		tableHtml += "</td><td style='text-align:center;vertical-align:middle;'>"
								 	}
								 	tableHtml += ""+data[i].vatSerial+"</td><td style='text-align:center;vertical-align:middle;'>"
								 	+ ""+data[i].vatRemark+"</td>";
								}
								bacTable.html(tableHtml);
							}else{
								bacTable.html("");
							}
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
			
			pageNation(page, DEFAULT_NUM, null);
		}
    </script>
<jsp:include page="../body-bottom.jsp"/>