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
                            <h6 style="font-weight:600;">계산서 읽어오기 </h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                    	<button class="btn btn-sm btn-danger" onClick="downloadCSV();">내보내기</button>
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
                        <button id="chkBtn" class="btn btn-sm btn-secondary" onClick="javascript:fnCheckVatlist()" disabled>계산서 검토</button>
                        
                        <!-- 항목 업데이트 하기 위한 버튼 -->
                        <!-- <button style="display: none;" id="regBBtn" class="btn btn-sm btn-primary" onClick="javascript:productUpdate()">매입계산서 등록</button>
                        <button style="display: none;" id="regSBtn" class="btn btn-sm btn-primary" onClick="javascript:productUpdate()">매출계산서 등록</button> -->
                        
                        <!-- 매입거래처 검토 후 insert -->
                        <!-- <button id="tempCustBBtn" class="btn btn-sm btn-primary" onClick="javascript:tempCustInsertB()">매입거래처 등록</button> -->
                        
                        <!-- 매출거래처 검토 후 insert -->
                        <!-- <button id="tempCustSBtn" class="btn btn-sm btn-primary" onClick="javascript:tempCustInsertS()">매출거래처 등록</button> -->
                        
                        <button style="display: none;" id="regBBtn" class="btn btn-sm btn-primary" onClick="javascript:fnRegBVatlist()">매입계산서 등록</button>
                        <button style="display: none;" id="regSBtn" class="btn btn-sm btn-primary" onClick="javascript:fnRegSVatlist()">매출계산서 등록</button>
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
                        <!-- <table id="vatTable" class="table table-striped table-bordered nowrap ">
                        </table> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//리스트 table-->

    <!-- hide and show -->
    <script>
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
    				var table_output = '<table id="vatTable" class="table table-striped table-bordered" style="text-align:center;">';
    				
    				for(var row = 5; row < sheet_data.length; row++){
    					if(row == 5){
	    					table_output += "<tr style='font-weight:600;'>";
    					}else{
    						table_output += "<tr>";
    					}
    					for(var cell = 0; cell < sheet_data[row].length; cell++){
                            if (cell == 0){
                                if(row == 5){
                                    table_output += '<td>검토</td><td>' + sheet_data[row][cell] + '</td>';
                                }else{
                                    table_output += '<td><input type="checkbox" class="vatchecked" onClick="return false;"></td><td class="vatlst'+cell+'">' + sheet_data[row][cell] + '</td>';
                                }
                            } else {
                                if (row == 5){
                                    table_output += '<td>' + sheet_data[row][cell] + '</td>';
                                }else{
                                    table_output += '<td class="vatlst'+cell+'">' + sheet_data[row][cell] + '</td>';
                                }
                                }
    					}
    					table_output += '</tr>';
    				}
    				
    				table_output += '</table>';
    				
    				document.getElementById("excel_data").innerHTML = table_output;
    			}
    		}
    		
    		//csv 주석
	        /* var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;
	        if (regex.test($("#fileUpload").val().toLowerCase())) {
	            if (typeof (FileReader) != "undefined") {
	                var reader = new FileReader();
	                reader.onload = function (e) {
	                    var table = $("<table class='table table-striped table-bordered nowrap' />");
	                    var rows = e.target.result.split("\n");
	                    for (var i = 5; i < rows.length; i++) {
	                        var row = $("<tr />");
	                        var cells = rows[i].split(",");
	                        if (cells.length > 1) {
	                            for (var j = 0; j < cells.length; j++) {
	                                var cell = $("<td />");
	                                cell.html(cells[j]);
	                                row.append(cell);
	                            }
	                            table.append(row);
	                        }
	                    }
	                    $("#vatTable").html('');
	                    $("#vatTable").append(table);
	                }
	                reader.readAsText($("#fileUpload")[0].files[0]);
	            }
	        } else {
	            alert("파일명이 영어로 된 csv 파일만 등록가능합니다.");
	        } */
	        
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
	    	
    	    $("#vatTable").table2excel({
    	        exclude: ".excludeThisClass",
    	        name: "sheet",
    	        filename: fileName + ".xls", // do include extension
    	        preserveColors: false // set to true if you want background colors and font colors preserved
    	    });
	    }

        function fnCheckVatlist(){
        	if($(this).attr("data-value") == 0){
        		$(this).attr("data-value", 1);	
        	}
        	
            var chk = $(".vatchecked");
            var chkLength = $(".vatchecked").length;
            
            $.LoadingOverlay("show", true);
            
            setTimeout(() => {
	            chk.each(function(index, item){
	            	var vatdata = {};
	                vatdata.vatSerial = $(item).parent().next().next().html();
	            	
	                $.ajax({
	                    url : "${path}/acc/vatcheck.do",
	                    data : vatdata,
	                    method : "POST",
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
            
            $("#regBBtn").show();
            $("#regSBtn").show();
        }

        function fnRegBVatlist(){
        	if(confirm("매입계산서를 등록하시겠습니까??")){
        		$.LoadingOverlay("show", true);
        		var $Chkarr = $(".vatchecked");  //체크여부
                var $Aarr = $(".vatlst0");         // 작성일
                var $Barr = $(".vatlst1");           // 승인번호
                var $Carr = $(".vatlst2");          //발급일자
                var $Darr = $(".vatlst3");           // 전송일자
                var $Earr = $(".vatlst4");           // 사업자 번호
                var $Farr = $(".vatlst15");           // 공급금액
                var $Garr = $(".vatlst31");           // 세액
                var $Harr = $(".vatlst18");           // 세금계산서 종류
                var $Iarr = $(".vatlst19");           // 발급유형
                var $Jarr = $(".vatlst20");           // 비고
                var $Karr = $(".vatlst22");           // 공급자 이메일
                var $Larr = $(".vatlst9");			  // 사업자번호
                var $Marr = $(".vatlst26");			  // 품목명
                //추가 컬럼.
                var $Narr = $(".vatlst27"); 			  //규격
                var $Oarr = $(".vatlst28"); 			  //수량
                var $Parr = $(".vatlst29"); 			  //단가
                var $Qarr = $(".vatlst18"); 			  //전자세금계산서종류
                var $Rarr = $(".vatlst21"); 			  //영수/청구 구분
                var $Sarr =  $(".vatlst16"); //test 
                var $Tarr = $(".vatlst32");                
                
                for (var i=0; i<$Barr.length; i++){
                    if ($($Chkarr[i]).is(":checked")==true){
                        var vatData = {};
                        vatData.vatStatus = 'B1';
                        vatData.vatType = 'B';
                        vatData.compNo = ${compNo};
                        vatData.vatNo = $Earr[i].innerText;
                        vatData.vatSerial = $Barr[i].innerText;
                        vatData.vatIssueDate = $Aarr[i].innerText;
                        vatData.vatTradeDate = $Carr[i].innerText;
                        vatData.vatTransDate = $Darr[i].innerText;
                        
                        if(isNaN($Sarr[i].innerText)){
                        	vatData.vatTax = 0;
                        	vatData.vatProductName = $(".vatlst25")[i].innerText;
	                        vatData.vatEmail = $(".vatlst21")[i].innerText;
	                        vatData.vatRemark = $(".vatlst19")[i].innerText;
	                        vatData.vatIssueType = $(".vatlst18")[i].innerText;
	                        if($(".vatlst17")[i].innerText == '일반' || $(".vatlst17")[i].innerText == '일반(수정)'){
	                        	vatData.vatBillType = '01';
	                        }else if($(".vatlst17")[i].innerText == '영세율'){
	                        	vatData.vatBillType = '02';
	                        }
	                        
	                        if($(".vatlst20")[i].innerText == '영수'){
	                        	vatData.vatRecType = '01';
	                        }else if($(".vatlst20")[i].innerText == '청구'){
	                        	vatData.vatRecType = '02';
	                        }
	                        vatData.vatAmount = Number($(".vatlst14")[i].innerText);
	                        vatData.vatStandard = $(".vatlst26")[i].innerText;
	                        vatData.vatQuan = Number($(".vatlst27")[i].innerText.replace(/[\D\s\._\-]+/g, ""));
	                        vatData.vatNet = isNaN(Number($(".vatlst28")[i].innerText)) ? 0 : Number($(".vatlst28")[i].innerText);
	                        vatData.modal_vatmemo = parseInt($(".vatlst29")[i].innerText).toLocaleString("en-US");
	                        vatData.test = parseInt($(".vatlst29")[i].innerText);
	                        vatData.vatMemo = $(".vatlst30")[i].innerText;
	                        
                    	}else {
                    		vatData.vatTax = isNaN(Number($Sarr[i].innerText)) ? 0 : Number($Sarr[i].innerText);
                    		vatData.vatProductName = $Marr[i].innerText;
	                        vatData.vatEmail = $Karr[i].innerText;
	                        vatData.vatRemark = $Jarr[i].innerText;
	                        vatData.vatIssueType = $Iarr[i].innerText;
	                        
	                        if($Qarr[i].innerText == '일반' || $Qarr[i].innerText == '일반(수정)'){
	                        	vatData.vatBillType = '01';
	                        }else if($Qarr[i].innerText == '영세율'){
	                        	vatData.vatBillType = '02';
	                        }
	                        if($Rarr[i].innerText == '영수'){
	                        	vatData.vatRecType = '01';
	                        }else if($Rarr[i].innerText == '청구'){
	                        	vatData.vatRecType = '02';
	                        }
	                        vatData.vatAmount = Number($Farr[i].innerText);
	                        vatData.vatStandard = $Narr[i].innerText;
	                        vatData.vatQuan = Number($Oarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
	                        vatData.vatNet = isNaN(Number($Parr[i].innerText)) ? 0 : Number($Parr[i].innerText);
	                        vatData.modal_vatmemo = parseInt(vatData.vatAmount + vatData.vatTax).toLocaleString("en-US");
	                        vatData.test = parseInt(vatData.vatAmount + vatData.vatTax);
	                        vatData.vatMemo = $(".vatlst32")[i].innerText;
                    	}
                        
                        /* if(isNaN(Number($Garr[i].innerText))){
							vatData.vatProductName = $(".vatlst25")[i].innerText;
	                        vatData.vatEmail = $(".vatlst21")[i].innerText;
	                        vatData.vatRemark = $(".vatlst19")[i].innerText;
	                        vatData.vatIssueType = $(".vatlst18")[i].innerText;
						}else{
	                        vatData.vatProductName = $Marr[i].innerText;
	                        vatData.vatEmail = $Karr[i].innerText;
	                        vatData.vatRemark = $Jarr[i].innerText;
	                        vatData.vatIssueType = $Iarr[i].innerText;
						}       */
                        /* if($Qarr[i].innerText == '일반' || $Qarr[i].innerText == '일반(수정)'){
                        	vatData.vatBillType = '01';
                        }else if($Qarr[i].innerText == '영세율'){
                        	vatData.vatBillType = '02';
                        } */
                        
                        /* if($Rarr[i].innerText == '영수'){
                        	vatData.vatRecType = '01';
                        }else if($Rarr[i].innerText == '청구'){
                        	vatData.vatRecType = '02';
                        } */
                        
                        $.ajax({
                        	url: "${path}/acc/selectVatCust/" + vatData.vatNo,
                        	method: "post",
                        	async: false,
                        	dataType: "json",
                        	success:function(data){
                        		if(data.count > 0){
    	                    		vatData.vatSellerCustNo = data.getNo;
                        		}else{
                        			alert("사업자번호 : " + vatData.vatNo + "\n거래처를 등록해주세요.");
                        			return false;
                        		}
                        	}
                        });
                 		$.ajax({
                         	url: "${path}/acc/selectVatCust/" + $Larr[i].innerText,
                         	method: "post",
                         	async: false,
                         	dataType: "json",
                         	success:function(result){
                         		if(result.count > 0){
     	                    		vatData.vatBuyerCustNo = result.getNo;
                         		}else{
                         			alert("사업자번호 : " + $Larr[i].innerText + "\n거래처를 등록해주세요.");
                        			return false;
                         		}
                         		
			                    $.ajax({
			                        url : "${path}/acc/insertvat.do",
			                        data : vatData,
			                        method : "POST",
			                        async: false,
			                        dataType: "json"
			                    });
                         	}
                       });
                    }
                }
                alert("매입자료 등록 완료");
                setTimeout(function(){
    				$.LoadingOverlay("hide", true);
    				fnCheckVatlist();
    			}, 1000);
        	}else{
        		return false;
        	}
        }

        function fnRegSVatlist(){
        	if(confirm("매출계산서를 등록하시겠습니까??")){
        		$.LoadingOverlay("show", true);
        		var $Chkarr = $(".vatchecked");  //체크여부
                var $Aarr = $(".vatlst0");         // 작성일
                var $Barr = $(".vatlst1");           // 승인번호
                var $Carr = $(".vatlst2");          //발급일자
                var $Darr = $(".vatlst3");           // 전송일자
                var $Earr = $(".vatlst4");           // 사업자 번호
                var $Farr = $(".vatlst15");           // 공급금액
                var $Garr = $(".vatlst31");           // 세액
                var $Harr = $(".vatlst18");           // 세금계산서 종류
                var $Iarr = $(".vatlst19");           // 발급유형
                var $Jarr = $(".vatlst20");           // 비고
                var $Karr = $(".vatlst23");           // 공급자 이메일
                var $Larr = $(".vatlst9");			  // 사업자번호
                var $Marr = $(".vatlst26");			  // 품목명
                var $Narr = $(".vatlst27"); 			  //규격
                var $Oarr = $(".vatlst28"); 			  //수량
                var $Parr = $(".vatlst29"); 			  //단가
                var $Qarr = $(".vatlst18"); 			  //전자세금계산서종류
                var $Rarr = $(".vatlst21"); 			  //영수/청구 구분
                var $Sarr =  $(".vatlst16");
                var $Tarr = $(".vatlst32");

                for (var i=0; i<$Barr.length; i++){
                    if ($($Chkarr[i]).is(":checked")==true){
                        var vatData = {};
                        vatData.vatStatus = 'S1';
                        vatData.vatType = 'S';
                        vatData.compNo = ${compNo};
                        vatData.vatNo = $Larr[i].innerText;
                        vatData.vatSerial = $Barr[i].innerText;
                        vatData.vatIssueDate = $Aarr[i].innerText;
                        vatData.vatTradeDate = $Carr[i].innerText;
                        vatData.vatTransDate = $Darr[i].innerText;
                        
                        if(isNaN($Sarr[i].innerText)){
                        	vatData.vatTax = 0;
                        	vatData.vatProductName = $(".vatlst25")[i].innerText;
	                        vatData.vatEmail = $(".vatlst22")[i].innerText;
	                        vatData.vatRemark = $(".vatlst19")[i].innerText;
	                        vatData.vatIssueType = $(".vatlst18")[i].innerText;
	                        
	                        if($(".vatlst17")[i].innerText == '일반' || $(".vatlst17")[i].innerText == '일반(수정)'){
	                        	vatData.vatBillType = '01';
	                        }else if($(".vatlst17")[i].innerText == '영세율'){
	                        	vatData.vatBillType = '02';
	                        }
	                        
	                        if($(".vatlst20")[i].innerText == '영수'){
	                        	vatData.vatRecType = '01';
	                        }else if($(".vatlst20")[i].innerText == '청구'){
	                        	vatData.vatRecType = '02';
	                        }
	                        vatData.vatAmount = Number($(".vatlst14")[i].innerText);
	                        vatData.vatStandard = $(".vatlst26")[i].innerText;
	                        vatData.vatQuan = Number($(".vatlst27")[i].innerText.replace(/[\D\s\._\-]+/g, ""));
	                        vatData.vatNet = isNaN(Number($(".vatlst28")[i].innerText)) ? 0 : Number($(".vatlst28")[i].innerText);
	                        vatData.modal_vatmemo = parseInt($(".vatlst14")[i].innerText).toLocaleString("en-US");
	                        vatData.test = parseInt($(".vatlst14")[i].innerText);
	                        vatData.vatMemo = $(".vatlst30")[i].innerText;
	                        
                    	}else {
                    		vatData.vatTax = isNaN(Number($Sarr[i].innerText)) ? 0 : Number($Sarr[i].innerText);
                    		vatData.vatProductName = $Marr[i].innerText;
	                        vatData.vatEmail = $Karr[i].innerText;
	                        vatData.vatRemark = $Jarr[i].innerText;
	                        vatData.vatIssueType = $Iarr[i].innerText;
	                        
	                        if($Qarr[i].innerText == '일반' || $Qarr[i].innerText == '일반(수정)'){
	                        	vatData.vatBillType = '01';
	                        }else if($Qarr[i].innerText == '영세율'){
	                        	vatData.vatBillType = '02';
	                        }
	                        if($Rarr[i].innerText == '영수'){
	                        	vatData.vatRecType = '01';
	                        }else if($Rarr[i].innerText == '청구'){
	                        	vatData.vatRecType = '02';
	                        }
	                        vatData.vatAmount = Number($Farr[i].innerText);
	                        vatData.vatStandard = $Narr[i].innerText;
	                        vatData.vatQuan = Number($Oarr[i].innerText.replace(/[\D\s\._\-]+/g, ""));
	                        vatData.vatNet = isNaN(Number($Parr[i].innerText)) ? 0 : Number($Parr[i].innerText);
	                        vatData.modal_vatmemo = parseInt(vatData.vatAmount + vatData.vatTax).toLocaleString("en-US");
	                        vatData.test =  parseInt(vatData.vatAmount + vatData.vatTax);
	                        vatData.vatMemo = $(".vatlst32")[i].innerText;
                    	}
                        
                        
						/* if(isNaN(Number($Garr[i].innerText))){
							vatData.vatProductName = $(".vatlst25")[i].innerText;
	                        vatData.vatEmail = $(".vatlst22")[i].innerText;
	                        vatData.vatRemark = $(".vatlst19")[i].innerText;
	                        vatData.vatIssueType = $(".vatlst17")[i].innerText;
						}else{
	                        vatData.vatProductName = $Marr[i].innerText;
	                        vatData.vatEmail = $Karr[i].innerText;
	                        vatData.vatRemark = $Jarr[i].innerText;
	                        vatData.vatIssueType = $Iarr[i].innerText;
						}        */                 
						/* if($Qarr[i].innerText == '일반' || $Qarr[i].innerText == '일반(수정)'){
                        	vatData.vatBillType = '01';
                        }else if($Qarr[i].innerText == '영세율'){
                        	vatData.vatBillType = '02';
                        }
                        
                        if($Rarr[i].innerText == '영수'){
                        	vatData.vatRecType = '01';
                        }else if($Rarr[i].innerText == '청구'){
                        	vatData.vatRecType = '02';
                        } */
                        
                       /*  vatData.modal_vatmemo = parseInt(vatData.vatAmount + vatData.vatTax).toLocaleString("en-US");     */
                        
                        $.ajax({
                        	url: "${path}/acc/selectVatCust/" + $Earr[i].innerText,
                        	method: "post",
                        	dataType: "json",
                        	async: false,
                        	success:function(data){
                        		if(data.count > 0){
    	                    		vatData.vatSellerCustNo = data.getNo;
                        		}else{
                        			alert("사업자번호 : " + vatData.vatNo + "\n거래처를 등록해주세요.");
                        			return false;
                        		}
                        	}
                        });
                       
                   		$.ajax({
                           	url: "${path}/acc/selectVatCust/" + $Larr[i].innerText,
                           	method: "post",
                           	dataType: "json",
                           	async: false,
                           	success:function(result){
                           		if(result.count > 0){
       	                    		vatData.vatBuyerCustNo = result.getNo;
                           		}else{
                           			alert("사업자번호 : " + $Larr[i].innerText + "\n거래처를 등록해주세요.");
                        			return false;
                           		}
                           		
			                    $.ajax({
			                        url : "${path}/acc/insertvat.do",
			                        data : vatData,
			                        method : "POST",
			                        async: false,
			                        dataType: "json"
			                    });
                           	}
                        });
                    }
                }
                alert("매출자료 등록 완료");
                setTimeout(function(){
    				$.LoadingOverlay("hide", true);
    				fnCheckVatlist();
    			}, 1000);
        	}else{
        		return false;
        	}
        }
        
        //vatProductName 업데이트를 위한 임시 함수
        /* function productUpdate(){
        	var compNo = "${sessionScope.compNo}";
        	var $Chkarr = $(".vatchecked");  //체크여부
        	var $Barr = $(".vatlst1");           // 승인번호
        	var $Marr = $(".vatlst26");			  // 품목명
        	
        	for (var i=0; i<$Barr.length; i++){
        		if ($($Chkarr[i]).is(":checked")==true){
		        	var updateData = {};
		        	updateData.compNo = compNo;
		        	updateData.vatSerial = $Barr[i].innerText;
		        	updateData.vatProductName = $Marr[i].innerText; 
		        	
		        	$.ajax({
		        		url: "${path}/acc/productUpdate.do",
		        		method: "post",
		        		data: updateData,
		        		async: false,
		        		dataType: "json"
		        	});
        		}
        	}
        } */
        
        
        /* 계산서 검토 후 등록시 거래처가 없을 경우에 거래처를 insert하기위한 함수 */
        /* function tempCustInsertB(){
        	var $Chkarr = $(".vatchecked");  //체크여부
        	var $Aarr = $(".vatlst6");		//상호명
        	var $Barr = $(".vatlst1");       // 승인번호
        	var $Carr = $(".vatlst7");		//대표자명
        	var $Earr = $(".vatlst4");       // 사업자 번호
        	var compNo = "${sessionScope.compNo}";
        	
        	for (var i = 0; i < $Barr.length; i++){
                if ($($Chkarr[i]).is(":checked")==true){
		        	var insertData = {};
		        	insertData.compNo = compNo;
		        	insertData.custName = $Aarr[i].innerText;
		        	insertData.custVatno = $Earr[i].innerText;
		        	insertData.custBossname = $Carr[i].innerText;
		        	
		        	$.ajax({
                    	url: "${path}/acc/selectVatCust/" + $Earr[i].innerText,
                    	method: "post",
                    	dataType: "json",
                    	async: false,
                    	success:function(data){
                    		if(data.count < 1){
                    			$.ajax({
                                	url: "${path}/cust/tempSelectCustInsert.do",
                                	method: "post",
                                	async: false,
                                	data: insertData,
                                	dataType: "json"
                            	});
                    		}
                    	}
                    });
                }
        	}
        }
        
        function tempCustInsertS(){
        	var $Chkarr = $(".vatchecked");  //체크여부
        	var $Aarr = $(".vatlst11");		//상호명
        	var $Barr = $(".vatlst1");       // 승인번호
        	var $Carr = $(".vatlst12");		//대표자명
        	var $Earr = $(".vatlst9");       // 사업자 번호
        	var compNo = "${sessionScope.compNo}";
        	
        	for (var i = 0; i < $Barr.length; i++){
                if ($($Chkarr[i]).is(":checked")==true){
		        	var insertData = {};
		        	insertData.compNo = compNo;
		        	insertData.custName = $Aarr[i].innerText;
		        	insertData.custVatno = $Earr[i].innerText;
		        	insertData.custBossname = $Carr[i].innerText;
		        	
		        	$.ajax({
                    	url: "${path}/acc/selectVatCust/" + $Earr[i].innerText,
                    	method: "post",
                    	dataType: "json",
                    	async: false,
                    	success:function(data){
                    		if(data.count < 1){
                    			$.ajax({
                                	url: "${path}/cust/tempSelectCustInsert.do",
                                	method: "post",
                                	async: false,
                                	data: insertData,
                                	dataType: "json"
                            	});
                    		}
                    	}
                    });
                }
        	}
        } */

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