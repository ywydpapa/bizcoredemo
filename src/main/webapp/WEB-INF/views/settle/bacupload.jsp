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
<script src="${path}/js/jquery.table2excel.js"></script>
<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>

<div id="main_content">

    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">계좌내역 읽어오기 </h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                    	<%--<button class="btn btn-sm btn-danger" onClick="downloadCSV();">내보내기</button>--%>
                    	<button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#fileUploadModal">읽어오기</button>
						<div class="modal fade " id="fileUploadModal" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-80size" role="document">
								<div class="modal-content modal-80size">
									<div class="modal-header">
										<h4 class="modal-title">EXCEL 파일 등록</h4>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form id="uploadForm">
											<input type="file" name="file" id="fileUpload" />
										</form>
										<br> 파일 설명<input type="text" class="form-control" id="fileDesc" />
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default waves-effect" onclick="uploadFile()">등록</button>
										<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
                        <!-- hide and show -->
                        <button id="chkBtn" class="btn btn-sm btn-secondary" onClick="javascript:fnCheckBaclist()" disabled>내역 검토</button>
                        <button style="display:none;" id="regBtn" class="btn btn-sm btn-primary" onClick="javascript:fnRegBaclist()">계좌내역 등록</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- <div id="dvCSV">
		</div> -->
        <!--Page-header end 페이지 타이틀 -->
        <!--영업활동조회-->
        <div class="cnt_wr" id="acordian" style="display:none;">
            <div class="row">
                <form id="searchForm" method="post" onsubmit="return false;" class="col-sm-12">
                    <div class="col-sm-12">
                        <div class="card_box sch_it">
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="userName">담당사원</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="userName"
                                               id="userName" value="" readonly /> <input type="hidden"
                                                                                         name="userNo" id="userNo" value="" /> <span
                                            class="input-group-btn">
										<button class="btn btn-primary sch-company"
                                                data-remote="${path}/modal/popup.do?popId=user" type="button"
                                                data-toggle="modal" data-target="#userModal">
											<i class="icofont icofont-search"></i>
										</button>
									</span>
                                        <div class="modal fade " id="userModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title"></h4>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>사용자목록</h5>
                                                        <p>Loading!!!</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default waves-effect "
                                                                data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="soppTitle">영업기회</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="soppTitle"
                                               id="soppTitle" value="" readonly /> <input
                                            type="hidden" name="soppNo" id="soppNo"
                                            value="" /> <span class="input-group-btn">
											<button class="btn btn-primary sch-company"
                                                    data-remote="${path}/modal/popup.do?popId=sopp"
                                                    type="button" data-toggle="modal"
                                                    data-target="#soppModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
                                        <div class="modal fade " id="soppModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">영업기회 검색</h4>
                                                        <button type="button" class="close"
                                                                data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>영업기회 목록</h5>
                                                        <p>Loading!!!</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button"
                                                                class="btn btn-default waves-effect "
                                                                data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="custName">매출처</label>
                                    <div class="input-group input-group-sm mb-0">
                                        <input type="text" class="form-control" name="custName"
                                               id="custName" value="" readonly /> <input
                                            type="hidden" name="custNo" id="custNo"
                                            value="" /> <span class="input-group-btn">
												<button class="btn btn-primary sch-company"
                                                        data-remote="${path}/modal/popup.do?popId=cust"
                                                        type="button" data-toggle="modal"
                                                        data-target="#custModal">
													<i class="icofont icofont-search"></i>
												</button>
											</span>
                                        <div class="modal fade " id="custModal" tabindex="-1"
                                             role="dialog">
                                            <div class="modal-dialog modal-80size" role="document">
                                                <div class="modal-content modal-80size">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">매출처검색</h4>
                                                        <button type="button" class="close"
                                                                data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <h5>매출처목록</h5>
                                                        <p>Loading!!!</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button"
                                                                class="btn btn-default waves-effect "
                                                                data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label" for="salesType">처리 상태</label>
                                    <select name="select" class="form-control form-control-sm" id="salesType">
                                        <option value>선택</option>
                                        <c:forEach var = "acttype" items="${acttype}">
                                            <option value="${acttype.codeNo}">${acttype.desc03}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">발행일</label>
                                    <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="salesFrdatetime"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="salesTodatetime">
                                    </p>
                                </div>
                                <div class="col-sm-12 col-xl-3">
                                    <label class="col-form-label">거래일</label>
                                    <p class="input_inline"><input class="form-control form-control-sm col-xl-6" type="date" id="regSDate"> ~ <input class="form-control form-control-sm col-xl-6" type="date" id="regEDate">
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

    <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive" id="excel_data">
                        <!-- <table id="bacTable" class="table table-striped table-bordered nowrap ">
                        </table> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//리스트 table-->

    <!-- hide and show -->
    <script>
	    function reverse(str) {
	        var reverse = str.split('');
	        reverse = reverse.reverse();
	     
	        return reverse.join('')
	    }
    
	    function uploadFile(){
	    	const excel_file = document.getElementById("fileUpload");
	    	
    		var reader = new FileReader();
			    		
    		reader.readAsArrayBuffer(excel_file.files[0]);
    		
    		reader.onload = function(){
    			var data = new Uint8Array(reader.result);
    			var work_book = XLSX.read(data, {type: 'array'});
    			var sheet_name = work_book.SheetNames;
    			var sheet_data = XLSX.utils.sheet_to_json(work_book.Sheets[sheet_name[0]], {header:1});
    			
    			if(sheet_data.length > 0){
    				var table_output = '<table id="bacTable" class="table table-striped table-bordered" style="text-align:center;">';
    				
    				for(var row = 0; row < sheet_data.length-1; row++){
    					if(row < 5){
    						table_output += "<tr id='trHide'>";
    					}else if(row == 5){
	    					table_output += "<tr style='font-weight:600;'>";
    					}else{
    						table_output += "<tr>";
    					}
    					for(var cell = 0; cell < sheet_data[row].length; cell++){
                            if (cell == 0){
                                if(row == 5){
                                    table_output += '<td>검토</td><td>' + sheet_data[row][cell] + '</td>';
                                }else{
                                    table_output += '<td><input type="checkbox" class="bacchecked" onClick="return false;"></td><td class="baclst'+cell+'">' + sheet_data[row][cell] + '</td>';
                                }
                            } else if(cell == 1){
                            	table_output += '<td id="tdHide">' + sheet_data[row][cell] + '</td>';
                            } else {
                                if (row == 5){
                                    table_output += '<td>' + sheet_data[row][cell] + '</td>';
                                }else{
                                    table_output += '<td class="baclst'+cell+'">' + sheet_data[row][cell] + '</td>';
                                }
                            }
    					}
    					table_output += '</tr>';
    				}
    				
    				table_output += '</table>';
    				
    				document.getElementById("excel_data").innerHTML = table_output;
    				var bacNo = $("#trHide").eq(0).find("#tdHide").html();
    				var bacSerial = reverse(bacNo).replaceAll("-", "");
    				localStorage.setItem("bacNo", bacNo);
    				localStorage.setItem("bacSerial", bacSerial);
    				
    				$("#bacTable tbody #trHide").each(function(index, item){
    					$(item).hide();
    				});
    				
    				$("#bacTable tbody tr #tdHide").each(function(index, item){
    					$(item).prev().hide();
    					$(item).hide();
    				});
    			}
    		}

    		$(".modal-backdrop").remove();
   	      	$("#fileUploadModal").modal("hide");

   	      	$("#chkBtn").removeClass();
   	      	$("#chkBtn").removeAttr("disabled");
   	      	$("#chkBtn").attr("class", "btn btn-sm btn-success");
            $("#regBBtn").attr("disabled");
            $("#regSBtn").attr("disabled");
	    }
	    
	    function downloadCSV() {
	    	var getDate = new Date();
	    	var compNo = "${sessionScope.compNo}";
	    	var year = getDate.getFullYear();
	    	var month = getDate.getMonth()+1;
	    	var day = getDate.getDate();
	    	var fileName = "";
	    	
	    	if(month < 10){
		    	month = "0" + month;
	    	}
	    	
	    	if(day < 10){
	    		day = "0" + day;	
	    	}
	    	
	    	var now = year + "-" + month + "-" + day;
	    	
	    	if(compNo === "100002"){
	    		fileName = "VTEK" + "(" + now + ")";	
	    	}
	    	
    	    $("#bacTable").table2excel({
    	        exclude: ".excludeThisClass",
    	        name: "sheet",
    	        filename: fileName + ".xls", // do include extension
    	        preserveColors: false // set to true if you want background colors and font colors preserved
    	    });
	    }

        function fnCheckBaclist(){
        	if($(this).attr("data-value") == 0){
        		$(this).attr("data-value", 1);	
        	}
            var chk = $(".bacchecked");
            var chkLength = $(".bacchecked").length;
       		
            $.LoadingOverlay("show", true);
            
            setTimeout(() => {
	        	chk.each(function(index, item){
		        	var bacData = {};
		        	bacData.bacSerial = localStorage.getItem("bacSerial");
		        	bacData.baclogTime = $(item).parent().next().next().next().html();
	                
	                $.ajax({
	                    url : "${path}/acc/baccheck.do",
	                    data : bacData,
	                    method : "post",
	                    async: false,
	                    dataType : "json",
	                    success:function(data){
	                    	if(data.resultCount > 0){
	                    		$(item).prop("checked", false);
	                    	}else{
	                    		$(item).prop("checked", true);
	                    	}
	                   	 	
	                        $("#regBBtn").removeAttr("disabled");
	                        $("#regSBtn").removeAttr("disabled");
	                    },
	                    complete:function(){
			                $.LoadingOverlay("hide", true);
	                    }
	                });
	            });
	        	
		        alert("내역 검토가 완료되었습니다.");
			}, 500);
            
        	$('#regBtn').show();
        }

        function fnRegBaclist(){
        	$.LoadingOverlay("show", true);
            var $Chkarr = $(".bacchecked");  //체크여부
            var $Aarr = $(".baclst5");         // 입금액
            var $Barr = $(".baclst6");           // 출금금액
            var $Carr = $(".baclst2");          // 거래시간
            var $Darr = $(".baclst3");           // 거래종류
            var $Earr = $(".baclst9");           // 적요
            var $Farr = $(".baclst7");           // 잔액
            var $Garr = $(".baclst8");           // 거래점
            var $Harr = $(".baclst4");			// 내용
            var compNo = "${sessionScope.compNo}";
            var bacSerial = localStorage.getItem("bacSerial");
			
            for (var i=0; i<$Aarr.length; i++){
                if ($($Chkarr[i+4]).is(":checked")==true){
                    var bacData = {};
                    bacData.compNo = compNo;
                    bacData.bacSerial = bacSerial;
                    bacData.bacDesc = $Harr[i].innerText;
                    bacData.inAmt = Number($Aarr[i].innerText);
                    bacData.outAmt = Number($Barr[i].innerText);
                    bacData.baclogTime = $Carr[i+2].innerText;
                    bacData.logType = $Darr[i].innerText;
                    bacData.logRemark = $Earr[i].innerText;
                    bacData.balanceAmt = Number($Farr[i].innerText);
                    bacData.branchCode = $Garr[i].innerText;
                    bacData.linkDoc = "n";
                    
                    if (Number($Aarr[i].innerText) == 0){
                    	bacData.difference_price = Number($Barr[i].innerText);
                    }else{
                    	bacData.difference_price = Number($Aarr[i].innerText);
                    }
                    
                    console.log(bacData);
                    
                    $.ajax({
                        url : "${path}/acc/insertbacledger.do",
                        data : bacData,
                        method : "POST",
                        async: false,
                        dataType: "json"
                    });
                }
            }
            
            var updateData = {};
        	updateData.bacSerial = bacSerial;
        	
        	$.ajax({
        		url: "${path}/acc/lastUpdate.do",
        		method: "post",
        		async: false,
        		data: updateData,
        		dataType: "json",
        	});
            setTimeout(function(){
				$.LoadingOverlay("hide", true);
			}, 1000);
            alert("계좌 등록 완료");
            location.reload();
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
    </script>
    <!-- hide and show -->
</div>
<jsp:include page="../body-bottom.jsp"/>