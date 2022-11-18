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
                            <h6 style="font-weight:600;">계좌상세내역 </h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                        <!-- hide and show -->
						<button class="btn btn-sm btn-success" id="fold" onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2" onclick="acordian_action1()" style="display:none;">접기</button>
                        <button class="btn btn-sm btn-inverse" onClick="javascript:fnClearall()"><i class="icofont icofont-spinner-alt-3"></i>초기화</button>
                        <button class="btn btn-sm btn-primary" onClick="javascript:fnListcon()"><i class="icofont icofont-search"></i>검색</button>
                        <!-- <button class="btn btn-sm btn-danger" onClick="javascript:fnChgStatus()">상태변경</button> -->
                        <button class="btn btn-sm btn-outline"onClick="javascript:location='${path}/acc/bacupdate.do'"><i class="icofont icofont-pencil-alt-2"></i>내역 등록</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Page-header end 페이지 타이틀 -->
        <!--영업활동조회-->
        <div class="cnt_wr" id="acordian" style="display:none;">
            <div class="row">
                <form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
                    <div class="col-sm-12">
                        <div class="card_box sch_it">
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">기재내용</label>
                                    <input type="text" class="form-control" id="bacDesc">
                                </div>
	                            <div class="col-sm-12 col-xl-3">
	                                <label class="col-form-label">일자별</label>
	                                <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-30" id="baclogTimeFrom"> ~ <input class="form-control form-control-sm col-xl-6" type="date" max="9999-12-31" id="baclogTimeTo">
	                                </p>
	                            </div>
	                            <div class="col-sm-12 col-xl-3">
	                                <label class="col-form-label">연결여부</label>
	                                <p class="input_inline">
	                                	<select id="linkDoc" class="form-control">
	                                		<option value="">선택</option>
	                                		<option value="y">Y</option>
	                                		<option value="n">N</option>
	                                	</select>
	                                </p>
	                            </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--//영업활동조회-->
    </c:if>
	<div class="row" style="margin-bottom: 10px;">
		<div class="col-sm-12">
            <label for="baclist">계좌번호</label>
			<select class="form-control-sm" id="baclist" name="baclist">
				<option value="">선택</option>
				<c:forEach var="row" items="${bacList}">
					<option value="${row.bacSerial}">${row.bacNo}(${row.bacMemo})</option>
				</c:forEach>
			</select>
			<input id="reloadpage_num" type="hidden" value="0">
			<input id="baclist_num" type="hidden" value="">
		</div>
	</div>
	
	<table id="bacCalTable" class="table table-striped table-bordered nowrap">
		<thead>
			<tr>
				<th style='text-align:center;'>입금 총합</th>
				<th style='text-align:center;'>출금 총합</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style='text-align:center;'>0</td>
				<td style='text-align:center;'>0</td>
			</tr>
		</tbody>
	</table>
	
	<!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div id="testcreatebactable" class="table-responsive">
                        <table id="bacTable" class="table table-striped table-bordered nowrap">
                            <colgroup>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="7%"/>
                                <col width="7%"/>
                                <col width="8%"/>
                                <col width="5%"/>
                                <col width="10%"/>
                                <col width="23%"/>
                                <col width="5%"/>
                                <col width="5%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">일자</th>
                                <th class="text-center">기재내용</th>
                                <th class="text-center">입금</th>
                                <th class="text-center">출금</th>
                                <th class="text-center">잔액</th>
                                <th class="text-center">거래점</th>
                                <th class="text-center">통장메모내역</th>
                                <th class="text-center">메모</th>
                                <th class="text-center">승인연결</th>
                                <th class="text-center">연결</th>
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
                                        <button type="button" class="btn btn-success waves-effect" data-dismiss="modal" id="checkConnect" onclick="checkConnect();">선택연결</button>
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
                                        <button type="button" class="btn btn-success waves-effect" data-dismiss="modal" id="checkConnect" onclick="checkConnect();">선택연결</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                         <div class="modal fade " id="bac_connect_listModal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-80size" role="document">
                                <div class="modal-content modal-80size">
                                    <div class="modal-header">
                                        <h4 class="modal-title">연결 계산서</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                         <button type="button" class="btn btn-success waves-effect" data-dismiss="modal" onclick="cancelconnect();">선택취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--  -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
		$(document).ready(function(){
			const BAC_TABLE = $("#bacTable tbody");
			const DEFAULT_NUM = 15;
			
			BAC_TABLE.empty();
			$("#pageDiv").empty();
			$("#baclist").select2(); 
			
			if(localStorage.getItem("searchDesc") != null){
				$("#bacDesc").val(localStorage.getItem("searchDesc"));
				localStorage.removeItem("searchDesc");
			}else if(localStorage.getItem("searchLogTimeFrom") != null){
				$("#baclogTimeFrom").val(localStorage.getItem("searchLogTimeFrom"));
				$("#baclogTimeTo").val(localStorage.getItem("searchLogTimeTo"));
				localStorage.removeItem("searchLogTimeFrom");
				localStorage.removeItem("searchLogTimeTo");
			}else if(localStorage.getItem("searchLinkDoc") != null){
				$("#linkDoc").val(localStorage.getItem("searchLinkDoc"));
				localStorage.removeItem("searchLinkDoc");
			}
			
			if(localStorage.getItem("activePage") !== null){
				var page = localStorage.getItem("activePage");
				
				pageNation(page, DEFAULT_NUM, localStorage.getItem("bacSerial"));
				$("#baclist").val(localStorage.getItem("bacSerial")).trigger("change");
			}
			
			$("#baclist").change(function(){
				var page = 1;
				
				localStorage.setItem("bacSerial", $(this).val());
				
				pageNation(page, DEFAULT_NUM, localStorage.getItem("bacSerial"));
			});
			
			$("#baclogTimeFrom").change(function(){
				var dateValue = $(this).val();
				var dateValueArr = dateValue.split("-");
				var dateValueCom = new Date(dateValueArr[0], parseInt(dateValueArr[1])-1, dateValueArr[2]);
				var EdateValue = $("#baclogTimeTo").val();
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
				
				$("#baclogTimeTo").val(year + "-" + month + "-" + day);
			});
			
			$("#baclogTimeTo").change(function(){
				var SdateValue = $("#baclogTimeFrom").val();
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
				
				$("#baclogTimeFrom").val(year + "-" + month + "-" + day);
			});
		});
		
		function pageNation(page, DEFAULT_NUM, reData){
			var bacTable = $("#bacTable tbody");
			var compNo = "${sessionScope.compNo}";
			var countData = {};
			var selectData = {};
			var tableHtml = "";
			var pageHtml = "";
			
			bacTable.empty();
			
			if(reData.bacSerial != null){
				selectData.bacSerial = reData.bacSerial;
			}else{
				selectData.bacSerial = reData;
			}
			
			selectData.bacDesc = $("#bacDesc").val() ? $("#bacDesc").val() : "";
			selectData.baclogTimeFrom = $("#baclogTimeFrom").val() ? $("#baclogTimeFrom").val() : "";
			selectData.baclogTimeTo = $("#baclogTimeTo").val() ? $("#baclogTimeTo").val() : "";
			selectData.linkDoc = $("#linkDoc").val() ? $("#linkDoc").val() : "";
			
			$.ajax({
				url: "${path}/acc/bacSelectListCnt.do",
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
						url:"${path}/acc/bacSelectList.do",
						method: "get",
						data: selectData,
						dataType: "json",
						success:function(data){
							if(data.length > 0){
								for(var i = 0; i < data.length; i++){
									if(data[i].bacUpdateMemo === null){
										data[i].bacUpdateMemo = "";
									}
									
									tableHtml += "<tr><td style='text-align:center;vertical-align:middle;'>" + data[i].baclogTime + "</td><td style='text-align:center;vertical-align:middle;'>" 
									+ data[i].bacDesc + "</td><td style='text-align:right;vertical-align:middle;'>" 
									+ parseInt(data[i].inAmt).toLocaleString("en-US") + "</td><td style='text-align:right;vertical-align:middle;'>"
								 	+ parseInt(data[i].outAmt).toLocaleString("en-US") + "</td><td style='text-align:right;vertical-align:middle;'>"
								 	+ parseInt(data[i].balanceAmt).toLocaleString("en-US") + "</td><td style='text-align:center;vertical-align:middle;'>"
								 	+ data[i].branchCode + "</td><td style='text-align:center;vertical-align:middle;'>"
								 	+ data[i].logRemark + "</td><td style='text-align:center;vertical-align:middle;'>"
								 	+ "<input type='text' class='form-control' id='bacUpdateMemo_"+i+"' value='"+data[i].bacUpdateMemo+"'></td>";
									
									if(data[i].linkDoc != 'n' && data[i].linkDoc != null){
								 		if(data[i].linkDoc == 'y'){
								 			tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' type='button' data-remote='${path}/modal/popup2.do?popId="+data[i].baclogId+"' id='bac_connect_list' data-toggle='modal' data-target='#bac_connect_listModal' data-id='"+data[i].baclogId+"'>Y</a></td>";
								 		}else{    
								 			tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-secondary sch-company' type='button' data-remote='${path}/modal/popup2.do?popId="+data[i].linkDoc+"' id='bac_connect_list' data-toggle='modal' data-target='#bac_connect_listModal' data-id='"+data[i].baclogId+"'>Y</a></td>"; 
								 		}
								 	}else{
								 		tableHtml += "<td style='text-align:center;'></td>";
								 	}
								 	
									 if(parseInt(data[i].inAmt) > parseInt(data[i].outAmt)){
				                        	if(data[i].linkDoc != 'n' && data[i].linkDoc != null){
				                            	tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-danger' type='button' id='bacMemoUpBtn' data-index='"+i+"' data-id='"+data[i].baclogId+"' onClick='bacUpdateMemo(this);' style='margin-right:5px;'>메모업데이트</button><button class='btn btn-sm btn-success sch-company' data-remote='${path}/modal/popup.do?popId=bacVatS&baclogId="+data[i].baclogId+"' type='button' id='bacVatSBtn' data-toggle='modal' data-target='#bacVatSModal' data-id='"+data[i].baclogId+"'>추가</button></td>"
				                            }else{
				                                tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-danger' type='button' id='bacMemoUpBtn' data-index='"+i+"' data-id='"+data[i].baclogId+"' onClick='bacUpdateMemo(this);' style='margin-right:5px;'>메모업데이트</button><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatS&baclogId="+data[i].baclogId+"' type='button' id='bacVatSBtn' data-toggle='modal' data-target='#bacVatSModal' data-id='"+data[i].baclogId+"'>연결</button></td>";    
				                            }
				                     }else{
				                             if(data[i].linkDoc != 'n' && data[i].linkDoc != null){
				                             	tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-danger' type='button' id='bacMemoUpBtn' data-index='"+i+"' data-id='"+data[i].baclogId+"' onClick='bacUpdateMemo(this);' style='margin-right:5px;'>메모업데이트</button><button class='btn btn-sm btn-success sch-company' data-remote='${path}/modal/popup.do?popId=bacVatB&baclogId="+data[i].baclogId+"' type='button' id='bacVatBBtn' data-toggle='modal' data-target='#bacVatSModal' data-id='"+data[i].baclogId+"'>추가</button></td>"
				                             }else{
				                                tableHtml += "<td style='text-align:center;'><button class='btn btn-sm btn-danger' type='button' id='bacMemoUpBtn' data-index='"+i+"' data-id='"+data[i].baclogId+"' onClick='bacUpdateMemo(this);' style='margin-right:5px;'>메모업데이트</button><button class='btn btn-sm btn-primary sch-company' data-remote='${path}/modal/popup.do?popId=bacVatB&baclogId="+data[i].baclogId+"' type='button' id='bacVatBBtn' data-toggle='modal' data-target='#bacVatBModal' data-id='"+data[i].baclogId+"'>연결</button></td>";
				                             }
				                     }		
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
			
			pageNation(page, DEFAULT_NUM, localStorage.getItem("bacSerial"));
		}
		
		function bacUpdateMemo(e){
			if(confirm("업데이트 하시겠습니까??")){
				updateData = {};
				var indexNum = $(e).attr("data-index");
				var baclogId = $(e).attr("data-id");
				var compNo = "${sessionScope.compNo}";
				var path = $(location).attr("pathname");
				
				updateData.compNo = compNo;
				updateData.baclogId = baclogId;
				updateData.bacUpdateMemo = $("#bacUpdateMemo_" + indexNum).val();
				
				$.ajax({
					url: "${path}/acc/bacUpdateMemo.do",
					method: "post",
					data: updateData,
					dataType: "json",
					success: function(){
						alert("업데이트 되었습니다.");
						openModalLocalStorage();
						location.href = path;
						return false;
					},
					
					error: function(){
						alert("업데이트 하지 못했습니다.\n다시 시도해주십시오.");
						return false;
					}
				});
			}else{
				return false;
			}
		}
		
		function fnListcon(){
			var selectData = {};
			var bacTable = $("#bacTable tbody");
			var bacList = $("#baclist").val().replaceAll("-", "");
			bacTable.empty();
			$("#pageDiv").empty();

			selectData.bacSerial = bacList;
			selectData.betFirstNum = 0;
			selectData.betLastNum = DEFAULT_NUM;
			selectData.bacDesc = $("#bacDesc").val();
			selectData.baclogTimeFrom = $("#baclogTimeFrom").val();
			selectData.baclogTimeTo = $("#baclogTimeTo").val();
			selectData.linkDoc = $("#linkDoc").val();
			
			$.ajax({
				url: "${path}/acc/bacCalSelect.do",
				method: "post",
				data: selectData,
				dataType: "json",
				success:function(data){
					$("#bacCalTable tbody").html("");
					$("#bacCalTable tbody").html("<tr style='text-align:center;'><td>" + parseInt(data.inAmt).toLocaleString("en-US") + "</td><td>" + parseInt(data.outAmt).toLocaleString("en-US") + "</td></tr>");
				},
				error:function(){
					alert("데이터가 없습니다.");
					return false;
				}
			});
			
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
		
		function openModalLocalStorage(){
			var page = $("#pageDiv ul").find(".active a").html();
			var setFirstPage = $("#pageDiv ul").find("li:first").next().children().attr("data-number");
			
			localStorage.setItem("activePage", page);
			localStorage.setItem("setFirstPage", setFirstPage);
			localStorage.setItem("searchDesc", $("#bacDesc").val());
			localStorage.setItem("searchLogTimeFrom", $("#baclogTimeFrom").val());
			localStorage.setItem("searchLogTimeTo", $("#baclogTimeTo").val());
			localStorage.setItem("searchLinkDoc", $("#linkDoc").val());
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
			openModalLocalStorage();
			
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		$('#bacVatSModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			
			localStorage.setItem("thisId", button.attr("data-id"));
			openModalLocalStorage();
			
			var modal = $(this);
			modal.find('.modal-body').load(button.data("remote"));
		});
		
		$('#bac_connect_listModal').on('show.bs.modal', function(e) {
			var button = $(e.relatedTarget);
			
			localStorage.setItem("thisId", button.attr("data-id"));
			openModalLocalStorage();
			
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