<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%-- <form name="form2" method="post" onsubmit="return false;">
    <table class="table table-sm bst02">
        <tbody>
        <tr>
            <th scope="row">매입/매출 목록</th>
        </tr>
        </tbody>
    </table>
    <table class="table table-sm bst02" id="addinout">
        <colgroup>
            <col width="3%" />
            <col width="4%" />
            <col width="10%" />
            <col width="20%" />
            <col width="10%" />
            <col width="3%" />
            <col width="10%" />
            <col width="10%" />
            <col width="10%" />
            <col width="15%" />
            <col width="7%" />
            <col width="5%" />
        </colgroup>
        <thead>
        <tr>
            <th class="text-center">구분<br/>(매입/매출)</th>
            <th class="text-center">거래일자</th>
            <th class="text-center">거래처<br/>(매입/매출처)</th>
            <th class="text-center">항목</th>
            <th class="text-center">단가</th>
            <th class="text-center">수량</th>
            <th class="text-center">공급가</th>
            <th class="text-center">부가세</th>
            <th class="text-center">합계금액</th>
            <th class="text-center">승인번호</th>
            <th class="text-center">적요</th>
            <th class="text-center">기능</th>
        </tr>
        </thead>
        <tbody>
            <tr class="item1">
                <td>
                    <select id="data01Type" name="data01Type">
                        <option value="1101">매입</option>
                        <option value="1102">매출</option>
                    </select>
                </td>
                <td>
                    <input type="date" id="ioDate" name="inDate">
                </td>
                <td>
                    <div class="input-group input-group-sm mb-0">
                        <input type="text" class="form-control" name="product" id="productSalesInOutCustName" value="" readonly>
                        <input type="hidden" id="productSalesInOutCustNo" value="" />
                        <input type="hidden" id="soppdataNo" value="">
                        <input type="hidden" id="soppNo"value="${dto.soppNo}">
                        <span class="input-group-btn">
                            <button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=productdataListSalesInOutCust" type="button" data-toggle="modal" data-target="#productCustModal2">
                                <i class="icofont icofont-search"></i>
                            </button>
                        </span>
                        <!--modal-->
                        <div class="modal fade " id="productCustModal2" tabindex="-1" role="dialog">
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
                                        <button type="button" class="btn btn-success waves-effect" id="custRegSimple1">간편추가</button>
                                    </div>
                                    <div style="display: none; border: solid; width: 80%; margin: auto; margin-bottom: 5px;" id="custRegSimple_div1">
                                        <table>
                                            <colgroup>
                                                <col width="10%">
                                                <col width="75%">
                                                <col width="15%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th>매출처명*</th>
                                                <td><input type="text" value="" id="custRegSimple_custName1" style="width: 100%;"> </td>
                                                <td><button type="button" class="btn-sm btn-dark" id="custRegSimple_custName_check1">중복확인</button></td>
                                            </tr>
                                            <tr>
                                                <th>담당자</th>
                                                <td><input type="text" value="" id="custRegSimple_custMemerName1" style="width: 100%;" placeholder="미입력시 미정으로 세팅됩니다."></td>
                                                <td><button type="button" class="btn-sm btn-success" id="custRegSimple_custName_register1">등록</button></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--//modal-->
                    </div>
                </td>
                <td>
                	<div class="input-group" style="margin:0;">
                		<div class="input-group-prepend">
					    	<select class="form-control" id="productSelect" style="width:130px; height: 31px;">
                				<option value="selectOn">항목 선택</option>
                				<option value="selectOff">직접 입력</option>
                			</select>
					  	</div>
					  	<div id="select1" >
		                    <div class="input-group input-group-sm mb-0">
		                        <input type="hidden" id="productNo1" value="" />
		                        <input type="text" class="form-control" name="product" id="data01Title" data-flag="true" value="" readonly>
		                        <span class="input-group-btn">
		                            <button class="btn btn-primary sch-company" onclick="fn_productdataTableReload()" type="button" data-toggle="modal" data-target="#productdataModal1">
		                                <i class="icofont icofont-search"></i>
		                            </button>
		                        </span>
		                    </div>
		                    <!--모달 팝업-->
		                    <div class="modal fade" id="productdataModal1" tabindex="-1" role="dialog">
		                        <div class="modal-dialog modal-80size" role="document">
		                            <div class="modal-content modal-80size">
		                                <div class="modal-header">
		                                    <h4 class="modal-title">상품목록</h4>
		                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                        <span aria-hidden="true">&times;</span>
		                                    </button>
		                                </div>
		                                <div class="modal-body">
		                                    <jsp:include page="/WEB-INF/views/modal/productdataListSalesInOut.jsp" />
		                                </div>
		                                <div class="modal-footer">
		                                    <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
		                                   <button type="button" class="btn btn-success waves-effect" id="productReg">상품추가</button>
		                                   <button type="button" class="btn btn-success waves-effect" id="productRegSimple1">직접기입</button>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
	                    </div>
	                    <div id="select2" style="width:100%;">
                			<div class="input-group input-group-sm mb-0">
	                			<input type="text" class="form-control" name="product" id="data01Title" data-flag="false">
                			</div>
                		</div>
                    </div>
                    <!--//모달 팝업-->
                    <!--모달 팝업-->
                   <div class="modal fade" id="productRegModal1" tabindex="-1" role="dialog">
                       <div class="modal-dialog modal-80size" role="document">
                           <div class="modal-content modal-80size">
                               <div class="modal-header">
                                   <h4 class="modal-title">상품등록</h4>
                                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                   </button>
                               </div>
                               <div class="modal-body">

                               </div>
                               <div class="modal-footer">
                                   <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
                               </div>
                           </div>
                       </div>
                   </div>
                    <!--//모달 팝업-->
                </td>
                <td><input type="text" id="data01Netprice" required class="form-control form-control-sm" style="min-width: 80px;" /></td>
                <td><input type="text" id="data01Quanty" required class="form-control form-control-sm" style="min-width: 80px;" value="1" min="1" /></td>
                <td><input type="text" id="data01Amt" class="form-control form-control-sm" readonly placeholder="자동계산됩니다." style="min-width: 80px;" /></td>
				<td><input type="text" id="data01Vat" required class="form-control form-control-sm" style="min-width: 80px;" /></td>
				<td><input type="text" id="data01Total" class="form-control form-control-sm" placeholder="부가세 포함 금액 자동계산." style="min-width: 80px;" /></td>
				<td>
					<div id="vatBdiv">
	                    <div class="input-group input-group-sm mb-0">
	                        <input type="text" class="form-control" name="vatSerial" id="vatSerial" value="" readonly>
	                        <input type="hidden" id="vatSellerCustNo" value="" />
	                        <input type="hidden" id="vatAmount" value="">
	                        <span class="input-group-btn">
	                            <button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=vatB" type="button" data-toggle="modal" data-target="#vatBModal">
	                                <i class="icofont icofont-search"></i>
	                            </button>
	                        </span>
	                        <!--modal-->
	                        <div class="modal fade " id="vatBModal" tabindex="-1" role="dialog">
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
	                        <!--//modal-->
	                    </div>
					</div>
					<div id="vatSdiv">
	                    <div class="input-group input-group-sm mb-0">
	                        <input type="text" class="form-control" name="vatSerial" id="vatSerial" value="" readonly>
	                        <input type="hidden" id="vatSellerCustNo" value="" />
	                        <input type="hidden" id="vatAmount" value="">
	                        <span class="input-group-btn">
	                            <button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=vatS" type="button" data-toggle="modal" data-target="#vatSModal">
	                                <i class="icofont icofont-search"></i>
	                            </button>
	                        </span>
	                        <!--modal-->
	                        <div class="modal fade " id="vatSModal" tabindex="-1" role="dialog">
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
	                        <!--//modal-->
	                    </div>
					</div>
                </td>
                <td><input type="text" id="data01Remark" class="form-control form-control-sm" /></td>
                <td>
                    <button id="data01Addbtn" class="btn btn-success btn-sm" onClick="javascript:fn_data01Insert()">추가</button>
                    <button id="data01Modbtn" class="btn btn-instagram btn-sm" onClick="javascript:fn_data01Update()">수정</button>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <details>
                        <summary><span style="color: red">등록시 주의사항</span></summary>
                        <p>매입/매출처(거래처)는 모달창을 통해 추가하셔야 됩니다. 삭제는 직접 지우시면 됩니다.</p>
                    </details>
                </td>
            </tr>
        </tbody>
    </table>
</form> --%>
<form name="form2" method="post" onsubmit="return false;">
	<div style="width:100%;">
		<div style="float:left; margin-top: 10px;">
			<p style="font-weight: 600; color: red;">※ 추가는 분할횟수 및 계약금액에 상관없이 원래 방식대로 추가되고, 분할추가는 분할횟수 및 계약금액에 맞춰 다중으로 추가됩니다.</p>
			<p style="font-weight: 600; color: red;">해당 계약에서 최종으로 발행 될 총 계산서 갯수를 "분할횟수"에 추가하여 주십시오.</p>
			<p style="font-weight: 600; color: red;">단위는 몇개월 단위로 계산서를 발행 할것인가에 대한 항목입니다.</p>
			<p style="font-weight: 600; color: red;">ex) 계약금액이 2,000,000원이고 해당 계약에 대해 발행 될 매출계산서가 최종적으로 2개가 나오고 6개월 마다 한번씩 계산서를 발행한다 하면 "분할횟수"에 2를 기입, "단위"에 6를 기입 후 "분할추가" 버튼을 클릭.</p>
		</div>
		<div id="contAmtUpBtn" style="float:right; margin-bottom: 15px;">
			<button type="button" class="btn btn-success" onclick="contAmtUpdate();">계약금액 업데이트</button>
		</div>
	</div>
    <table class="table table-sm bst02">
        <tbody>
	        <tr>
	            <th scope="row">매입/매출 목록</th>
	        </tr>
        </tbody>
    </table>
    <table class="table table-sm bst02" id="addinout">
    	<tr>
    		<th class="text-center">구분(매입/매출)</th>
            <th class="text-center">거래일자</th>
            <th class="text-center">분할횟수</th>
            <th class="text-center">단위(개월)</th>
            <th class="text-center" colspan="2">계약금액</th>
            <!-- <th class="text-center">계약금액</th> -->
            <th class="text-center">거래처(매입/매출처)</th>
            <th class="text-center">항목</th>
            <td class="text-center" rowspan="2">
              	<button id="dataDivisionbtn" class="btn btn-primary btn-sm" onClick="javascript:fn_dataDivisionInsert()">분할추가</button>
      		</td>
    	</tr>
    	<tr>
    		<td>
                <select class="form-control" id="data01Type" name="data01Type">
                    <option value="1101">매입</option>
                    <option value="1102">매출</option>
                </select>
            </td>
            <td>
                <input type="date" class="form-control" max="9999-12-30" id="ioDate" name="inDate">
            </td>
            <td>
            	<input type="text" class="form-control" id="divisionNum" maxlength="2" value="1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
            </td>
            <td>
				<input type="text" class="form-control" id="divisionMonth" maxlength="2" value="1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
            </td>
            <!-- <td>
            	<div class="input-group" style="margin:0;">
	           		<div class="input-group input-group-sm mb-0">
	    				<input type="date" class="form-control" max="9999-12-30" id="mainDateFrom" name="mainDateFrom">
				  	</div>
				  	&nbsp;~&nbsp;
				  	<div class="input-group input-group-sm mb-0">
           				<input type="date" class="form-control" max="9999-12-30" id="mainDateTo" name="mainDateTo">
           			</div>
                </div>
            </td> -->
            <td colspan="2">
            	<c:choose>
	            	<c:when test="${contDto.contAmt > 0}">
		            	<input type="text" class="form-control" id="divisionContAmt" value="${contDto.contAmt}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	            	</c:when>
	            	<c:otherwise>
	            		<input type="text" class="form-control" id="divisioncount" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	            	</c:otherwise>
            	</c:choose>
           	</td>
            <td>
                <div class="input-group input-group-sm mb-0">
                    <input type="text" class="form-control" name="product" id="productSalesInOutCustName" value="" readonly>
                    <input type="hidden" id="productSalesInOutCustNo" value="" />
                    <input type="hidden" id="soppdataNo" value="">
                    <input type="hidden" id="soppNo"value="${dto.soppNo}">
                    <span class="input-group-btn">
                        <button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=productdataListSalesInOutCust" type="button" data-toggle="modal" data-target="#productCustModal2">
                            <i class="icofont icofont-search"></i>
                        </button>
                    </span>
                    <!--modal-->
                    <div class="modal fade " id="productCustModal2" tabindex="-1" role="dialog">
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
                                    <button type="button" class="btn btn-success waves-effect" id="custRegSimple1">간편추가</button>
                                </div>
                                <div style="display: none; border: solid; width: 80%; margin: auto; margin-bottom: 5px;" id="custRegSimple_div1">
                                    <table>
                                        <colgroup>
                                            <col width="10%">
                                            <col width="75%">
                                            <col width="15%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>매출처명*</th>
                                            <td><input type="text" value="" id="custRegSimple_custName1" style="width: 100%;"> </td>
                                            <td><button type="button" class="btn-sm btn-dark" id="custRegSimple_custName_check1">중복확인</button></td>
                                        </tr>
                                        <tr>
                                            <th>담당자</th>
                                            <td><input type="text" value="" id="custRegSimple_custMemerName1" style="width: 100%;" placeholder="미입력시 미정으로 세팅됩니다."></td>
                                            <td><button type="button" class="btn-sm btn-success" id="custRegSimple_custName_register1">등록</button></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--//modal-->
                </div>
            </td>
            <td>
           		<div class="input-group" style="margin:0;">
               		<div class="input-group-prepend">
				    	<select class="form-control" id="productSelect" style="width:130px; height: 31px;">
               				<option value="selectOn">항목 선택</option>
               				<option value="selectOff">직접 입력</option>
               			</select>
				  	</div>
				  	<div id="select1" >
	                    <div class="input-group input-group-sm mb-0">
	                        <input type="hidden" id="productNo1" value="" />
	                        <input type="text" class="form-control" name="product" id="data01Title" data-flag="true" value="" readonly>
	                        <span class="input-group-btn">
	                            <button class="btn btn-primary sch-company" onclick="fn_productdataTableReload()" type="button" data-toggle="modal" data-target="#productdataModal1">
	                                <i class="icofont icofont-search"></i>
	                            </button>
	                        </span>
	                    </div>
	                    <!--모달 팝업-->
	                    <div class="modal fade" id="productdataModal1" tabindex="-1" role="dialog">
	                        <div class="modal-dialog modal-80size" role="document">
	                            <div class="modal-content modal-80size">
	                                <div class="modal-header">
	                                    <h4 class="modal-title">상품목록</h4>
	                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                        <span aria-hidden="true">&times;</span>
	                                    </button>
	                                </div>
	                                <div class="modal-body">
	                                    <jsp:include page="/WEB-INF/views/modal/productdataListSalesInOut.jsp" />
	                                </div>
	                                <div class="modal-footer">
	                                    <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
	                                   <button type="button" class="btn btn-success waves-effect" id="productReg">상품추가</button>
	                                   <button type="button" class="btn btn-success waves-effect" id="productRegSimple1">직접기입</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </div>
                    <div id="select2" style="width:100%;">
               			<div class="input-group input-group-sm mb-0">
                			<input type="text" class="form-control" name="product" id="data01Title" data-flag="false">
               			</div>
               		</div>
                   </div>
                   <!--//모달 팝업-->
                   <!--모달 팝업-->
                  <!-- <div class="modal fade" id="productRegModal1" tabindex="-1" role="dialog">
                      <div class="modal-dialog modal-80size" role="document">
                          <div class="modal-content modal-80size">
                              <div class="modal-header">
                                  <h4 class="modal-title">상품등록</h4>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                  </button>
                              </div>
                              <div class="modal-body">

                              </div>
                              <div class="modal-footer">
                                  <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
                              </div>
                          </div>
                      </div>
                  </div>
-->                    <!--//모달 팝업-->
               </td>
    	</tr>
    	<tr>
    		<th class="text-center">단가</th>
            <th class="text-center">수량</th>
            <th class="text-center">공급가</th>
            <th class="text-center">부가세</th>
            <th class="text-center">합계금액</th>
            <th class="text-center">승인번호</th>
            <th class="text-center" colspan="2">적요</th>
            <td class="text-center" rowspan="3" colspan="1">
                <button id="data01Addbtn" class="btn btn-success btn-sm" onClick="javascript:fn_data01Insert()">추가</button>
                <button id="data01Modbtn" class="btn btn-instagram btn-sm" onClick="javascript:fn_data01Update()">수정</button>
            </td>
    	</tr>
    	<tr>
    		<td><input type="text" id="data01Netprice" class="form-control form-control-sm" style="min-width: 80px;" /></td>
                <td><input type="text" id="data01Quanty" class="form-control form-control-sm" style="min-width: 80px;" value="1" min="1" /></td>
                <td><input type="text" id="data01Amt" class="form-control form-control-sm" readonly placeholder="자동계산됩니다." style="min-width: 80px;" /></td>
				<td><input type="text" id="data01Vat" class="form-control form-control-sm" style="min-width: 80px;" /></td>
				<td><input type="text" id="data01Total" class="form-control form-control-sm" placeholder="부가세 포함 금액 자동계산." style="min-width: 80px;" /></td>
				<td>
					<div id="vatBdiv">
	                    <div class="input-group input-group-sm mb-0">
	                        <input type="text" class="form-control" name="vatSerial" id="vatSerial" value="" readonly>
	                        <input type="hidden" id="vatSellerCustNo" value="" />
	                        <input type="hidden" id="vatAmount" value="">
	                        <span class="input-group-btn">
	                            <button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=vatB" type="button" data-toggle="modal" data-target="#vatBModal">
	                                <i class="icofont icofont-search"></i>
	                            </button>
	                        </span>
	                        <!--modal-->
	                        <div class="modal fade " id="vatBModal" tabindex="-1" role="dialog">
	                            <div class="modal-dialog modal-80size" role="document">
	                                <div class="modal-content modal-80size">
	                                    <div class="modal-header">
	                                        <h4 class="modal-title">승인번호</h4>
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
	                        <!--//modal-->
	                    </div>
					</div>
					<div id="vatSdiv">
	                    <div class="input-group input-group-sm mb-0">
	                        <input type="text" class="form-control" name="vatSerial" id="vatSerial" value="" readonly>
	                        <input type="hidden" id="vatSellerCustNo" value="" />
	                        <input type="hidden" id="vatAmount" value="">
	                        <span class="input-group-btn">
	                            <button class="btn btn-primary sch-company" data-remote="${path}/modal/popup.do?popId=vatS" type="button" data-toggle="modal" data-target="#vatSModal">
	                                <i class="icofont icofont-search"></i>
	                            </button>
	                        </span>
	                        <!--modal-->
	                        <div class="modal fade " id="vatSModal" tabindex="-1" role="dialog">
	                            <div class="modal-dialog modal-80size" role="document">
	                                <div class="modal-content modal-80size">
	                                    <div class="modal-header">
	                                        <h4 class="modal-title">승인번호</h4>
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
	                        <!--//modal-->
	                    </div>
					</div>
                </td>
                <td colspan="2"><input type="text" id="data01Remark" class="form-control form-control-sm" /></td>
	    	</tr>
	    	<!-- <tr>
	            <td colspan="8">
	                <details open>
	                    <summary><span style="color: red">등록시 주의사항</span></summary>
	                    <p>추가는 분할횟수 및 기간에 상관없이 원래 방식대로 추가되고, 분할추가는 분할횟수와 기간에 맞춰 추가됩니다.</p>
	                </details>
	            </td>
	        </tr> -->
    </table>
</form>

<script>
	$("#select2").hide();

	$("#productSelect").change(function(){
    	if($(this).val() === "selectOn"){
    		$("#select1").show();
    		$("#select1").find("#data01Title").attr("data-flag", true);
    		$("#select2").hide();
    		$("#select2").find("#data01Title").attr("data-flag", false);
    		$("#select2").find("#data01Title").val("");
    	}else{
    		$("#select1").hide();
    		$("#select1").find("#data01Title").attr("data-flag", false);
    		$("#select1").find("#data01Title").val("");
    		$("#select2").show();
    		$("#select2").find("#data01Title").attr("data-flag", true);
    	}
    });
	
    $('#productCustModal2').on('show.bs.modal', function(e) {
        var button = $(e.relatedTarget);
        var modal = $(this);
        modal.find('.modal-body').load(button.data("remote"));
    });

    $("#custRegSimple1").on("click",function (event) {
        if($("#custRegSimple_div1").is(':visible') == false){
            $("#custRegSimple_div1").show();
            $("#custRegSimple1").html("간편등록 취소");
        } else {
            $("#custRegSimple_div1").hide();
            $("#custRegSimple1").html("간편등록");
        }
    });

    $("#custRegSimple_custName_check1").on("click", function (event) {
        var custRegSimple_custName = $("#custRegSimple_custName1").val();
        var obj = new Object();
        obj.custName = custRegSimple_custName;
        $.ajax({
            url: "${path}/cust/custNameCheck", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
            .done(function(data) {
                console.dir(data);
                if(data.code == 10001){
                    console.log("응답 성공");
                    var html= "";
                    if(data.result1.length > 0){
                        var tempArr = data.result1;
                        html += "같은 결과) \n";
                        for(var i=0; i<tempArr.length; i++){
                            html += "번호 : " + tempArr[i].custNo + " / 매출처 : " + tempArr[i].custName + "\n";
                        }
                    }

                    if(data.result2.length > 0){
                        var tempArr = data.result2;
                        html += "\n유사 결과) \n";
                        for(var i=0; i<tempArr.length; i++){
                            html += "번호 : " + tempArr[i].custNo + " / 매출처 : " + tempArr[i].custName + "\n";
                        }
                    }

                    if(data.result1.length == 0 && data.result2.length == 0){
                        html += "일치검색, 유사검색결과가 존재하지 않습니다.\n";
                    }

                    html += "\n등록하시겠습니까?";
                    var result = confirm(html);

                    if(result){
                        console.log("등록진행");
                    } else {
                        console.log("등록거부");
                    }
                }else{
                    alert("응답 실패");
                }
            }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                alert("통신 실패");
            });
    });

    $("#custRegSimple_custName_register1").on("click", function (event) {
        var custRegSimple_custName = $("#custRegSimple_custName1").val();
        var custRegSimple_custMemerName = $("#custRegSimple_custMemerName1").val();

        var obj = new Object();
        obj.custName = custRegSimple_custName;
        obj.custMemberName = custRegSimple_custMemerName;

        $.ajax({
            url: "${path}/cust/simpleRegister", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: obj , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
            .done(function(result) {
                console.dir(result);
                if(result.code == 10001){
                    alert("저장 성공");
                    $('#productCustModal2').modal('hide');
                    $("#productSalesInOutCustName").val(result.data.custName);
                    $("#productSalesInOutCustNo").val(result.data.custNo);
                }else{
                    alert("저장 실패");
                }
            }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                alert("통신 실패");
            });
    });
    
    $('#vatBModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});
    
	$('#vatSModal').on('show.bs.modal', function(e) {
		var button = $(e.relatedTarget);
		var modal = $(this);
		modal.find('.modal-body').load(button.data("remote"));
	});

    function fn_Reloaddata01(url, data){
		$("#inoutlist").empty();
		$("#inoutlistSum").remove();
		$("#inoutlist").load(url, data, function(){
			setTimeout(function(){
			}, 500);
		});
	}
    
    function calDate(fromDate, toDate){
    	var subFromDateYear = fromDate.substring(0,4);
    	var subToDateYear = toDate.substring(0,4);
    	var subFromDateMonth = fromDate.substring(5,7);
    	var subFromToMonth = toDate.substring(5,7);
    	
    	return (subToDateYear - subFromDateYear) * 12 + (subFromToMonth - subFromDateMonth);
    }
    
    function fn_dataDivisionInsert() {
    	if(confirm("분할추가 하시겠습니까??")){
	   	 	var pathname = $(location).attr('pathname');
	   	 	var updateData = {};
    		var divisionNum = $("#divisionNum").val();
    		var divisionMonth = $("#divisionMonth").val();
        	var divisionContAmt = $("#divisionContAmt").val().replace(/[\D\s\._\-]+/g, "");
        	var path = $(location).attr("pathname");
        	var divisionTotal = 0;
        	var divisionAmt = 0;
        	var divisionVat = 0;
        	var divisionNet = 0;
        	var calYear = 0;
    		
        	divisionTotal = Math.round(divisionContAmt/divisionNum);
        	divisionAmt = Math.round(divisionTotal / 11 * 10);
        	divisionVat = Math.round(divisionTotal / 11);
        	divisionNet = Math.round(divisionTotal / 11 * 10 / 1);
        	
        	if($("[name='contractType']:checked").val() === "NEW"){
    			localStorage.setItem("reloadSet", "1t");
        	}else{
        		localStorage.setItem("oldContNo", $("#oldContNo").val());
    			localStorage.setItem("oldContTitle", $("#oldContTitle").val());
    			localStorage.setItem("reloadSet", "2t");
        	}
        	
        	for(var i = 0; i < divisionNum; i++){
    	        var data01Data = {};
    	        data01Data.soppNo 		= $("#soppNo").val();
    	        data01Data.catNo	 	= '100001';
    	        if($("#productSalesInOutCustName").val() != "") data01Data.salesCustNo = Number($("#productSalesInOutCustNo").val());
    	        if($("#data01Title[data-flag='true']").val() != "") {
    	            if($("#productNo1").val() != "") data01Data.productNo	= $("#productNo1").val();
    	            data01Data.dataTitle 	= $("#data01Title[data-flag='true']").val();
    	        }
    	        
    	        if($("#data01Type").val() === "1101"){
    				data01Data.vatSerial = $("#vatBdiv").find("#vatSerial").val();
    			}else{
    				data01Data.vatSerial = $("#vatSdiv").find("#vatSerial").val();
    			}
    	        
    	        data01Data.dataType		= $("#data01Type").val();
    	        data01Data.dataNetprice	= divisionNet;
    	        data01Data.dataQuanty	= $("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "");
    	        data01Data.dataAmt 		= divisionAmt;
    	        data01Data.dataVat 		= divisionVat;
    	        data01Data.dataTotal 		= divisionTotal;
    	        data01Data.dataRemark 	= $("#data01Remark").val();
    	        data01Data.divisionMonth = divisionMonth;
    	        
    	    	// 단위 월 추가 데이터
    	        if(i == 0){
    	        	data01Data.vatDate = $("#ioDate").val();
    	        }else{
    	        	const stair_data = $("#ioDate").val().split('-');
    	        	const stair_data_array = new Date(stair_data[0], stair_data[1], stair_data[2]);
    	        	
    	        	const year = stair_data_array.getFullYear();
    	        	const month = stair_data_array.getMonth() + parseInt(parseInt(i) * parseInt(divisionMonth));
    	        	const day = stair_data_array.getDate();
    	        	
    	        	if(month > 12){
    	        		const remain_month = ((stair_data_array.getMonth() + parseInt(parseInt(i) * parseInt(divisionMonth))) % 12);
    	        		const remain_year = Math.floor(parseInt((stair_data_array.getMonth() + parseInt(parseInt(i) * parseInt(divisionMonth))) / 12));
    	        		const year2 = parseInt(stair_data_array.getFullYear()) + parseInt(remain_year);
    	        		const month2 = remain_month;
    	        		if(remain_month < 10){
    	        			data01Data.vatDate = year2 + "-" + "0" + month2 + "-" + stair_data_array.getDate();
    	        		}else{
    	        			data01Data.vatDate = year2 + "-" + month2 + "-" + stair_data_array.getDate();
    	        		}
    	        	}else{
    	        		if(stair_data_array.getMonth() + parseInt(parseInt(i) * parseInt(divisionMonth)) < 10){
        	        		data01Data.vatDate = stair_data_array.getFullYear() + "-" + "0" + month + "-" + stair_data_array.getDate();
        	        	}else{
        	        		data01Data.vatDate = stair_data_array.getFullYear() + "-" + month + "-" + stair_data_array.getDate();
        	        	}	
    	        	}
    	        }
    	     	// 단위 월 추가 데이터
    	     	
    	        updateData.vatSerial = data01Data.vatSerial !== "" ? data01Data.vatSerial : 0;
    	        updateData.contNo = $("#contNo").val();
    	        updateData.compNo = "${sessionScope.compNo}";
    	
    	       	if (!data01Data.dataTitle){
    	            alert("상품명을 입력해주십시오.");
    	            return;
    	        }
    	       	
    	       	if(data01Data.vatSerial !== "" && data01Data.vatSerial !== null){
    		        $.ajax({
    		        	url: "${path}/acc/vatContUpdate.do",
    		        	method: "post",
    		        	data: updateData,
    		        	dataType: "json",
    		        });
    	        }
    	
    	        $.ajax({
    	            url: "${path}/sopp/insertdata01.do",
    	            data: data01Data,
    	            method: "POST",
    	            dataType: "json"
    	        });
        	}
        	localStorage.setItem('lastTab', "#tab02");
            alert("저장 성공");
            /* location.href="${path}/sopp/detail/"+$("#soppNo").val(); */
            location.href = pathname;
    	}else{
    		return false;
    	} 
    }
    
    function fn_data01Insert() {
    	var pathname = $(location).attr('pathname');
    	var updateData = {};
    	 
    	if($("[name='contractType']:checked").val() === "NEW"){
			localStorage.setItem("reloadSet", "1t");
    	}else{
    		localStorage.setItem("oldContNo", $("#oldContNo").val());
			localStorage.setItem("oldContTitle", $("#oldContTitle").val());
			localStorage.setItem("reloadSet", "2t");
    	}
    	
        var data01Data = {};
        data01Data.soppNo 		= $("#soppNo").val();
        data01Data.catNo	 	= '100001';
        if($("#productSalesInOutCustName").val() != "") data01Data.salesCustNo = Number($("#productSalesInOutCustNo").val());
        if($("#data01Title[data-flag='true']").val() != "") {
            if($("#productNo1").val() != "") data01Data.productNo	= $("#productNo1").val();
            data01Data.dataTitle 	= $("#data01Title[data-flag='true']").val();
        }
        
        if($("#data01Type").val() === "1101"){
			data01Data.vatSerial = $("#vatBdiv").find("#vatSerial").val();
		}else{
			data01Data.vatSerial = $("#vatSdiv").find("#vatSerial").val();
		}
        
        data01Data.dataType		= $("#data01Type").val();
        data01Data.dataNetprice	= $("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataQuanty	= $("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataAmt 		= $("#data01Amt").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataVat 		= $("#data01Vat").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataTotal 		= $("#data01Total").val().replace(/[\D\s\._\-]+/g, "");
        data01Data.dataRemark 	= $("#data01Remark").val();
        data01Data.vatDate = $("#ioDate").val();
        
        updateData.vatSerial = data01Data.vatSerial !== "" ? data01Data.vatSerial : 0;
        updateData.contNo = $("#contNo").val();
        updateData.compNo = "${sessionScope.compNo}";

        if(!data01Data.dataQuanty){
            alert("단가를 입력해주십시오.");
            return;
        } else if(!data01Data.dataAmt){
            alert("수량을 입력해주십시오.");
            return;
        } else if (!data01Data.dataTitle){
            alert("상품명을 입력해주십시오.");
            return;
        }
        
        if(data01Data.vatSerial !== "" && data01Data.vatSerial !== null){
	        $.ajax({
	        	url: "${path}/acc/vatContUpdate.do",
	        	method: "post",
	        	data: updateData,
	        	dataType: "json",
	        });
        }

        $.ajax({
            url: "${path}/sopp/insertdata01_defalut.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: data01Data , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
        .done(function(data) {
            if(data.code == 10001){
                alert("저장 성공");

                $("#data01Type option:eq(0)").attr("selected","selected");
                $("#soppdataNo").val("");
                $("#productSalesInOutCustName").val("");
                $("#productSalesInOutCustNo").val("");
                $("#productNo1").val("");
                $("#data01Title[data-flag='true']").val("");
                $("#data01Netprice").val("");
                $("#data01Quanty").val("");
                $("#data01Amt").val("");
                $("#data01Remark").val("");
                $("#vatBdiv").find("#vatSerial").val("");
                $("#vatSdiv").find("#vatSerial").val("");
                
                localStorage.setItem('lastTab', "#tab02");
                
               	/* location.href="${path}/cont/detail/"+$("#soppNo").val() +"/"+ $("#contNo").val(); */
                location.href = pathname;
                
            }else{
                alert("저장 실패");
            }
        }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
        .fail(function(xhr, status, errorThrown) {
            alert("통신 실패");
        });
    }

    function fn_data01Update() {
    	if($("#data01Type").val() == "1101"){
    		var path = $(location).attr("pathname");	
	   	 	var updateData = {};
	   	 	
	    	if($("[name='contractType']:checked").val() === "NEW"){
				localStorage.setItem("reloadSet", "1t");
	    	}else{
	    		localStorage.setItem("oldContNo", $("#oldContNo").val());
				localStorage.setItem("oldContTitle", $("#oldContTitle").val());
				localStorage.setItem("reloadSet", "2t");
	    	}
	    	
	        var data01Data = {};
	        data01Data.soppNo 		= $("#soppNo").val();
	        data01Data.catNo	 	= '100001';
	        data01Data.soppdataNo   = $("#soppdataNo").val();
	        if($("#productSalesInOutCustName").val() != "") data01Data.salesCustNo = Number($("#productSalesInOutCustNo").val());
	        if($("#data01Title[data-flag='true']").val() != "") {
	            if($("#productNo1").val() != "") data01Data.productNo	= $("#productNo1").val();
	            data01Data.dataTitle 	= $("#data01Title[data-flag='true']").val();
	        }
	        
	        if($("#data01Type").val() === "1101"){
				data01Data.vatSerial = $("#vatBdiv").find("#vatSerial").val();
			}else{
				data01Data.vatSerial = $("#vatSdiv").find("#vatSerial").val();
			}
	        
	        data01Data.dataType		= $("#data01Type").val();
	        data01Data.dataNetprice	= $("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "");
	        data01Data.dataQuanty	= $("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "");
	        data01Data.dataAmt 		= $("#data01Amt").val().replace(/[\D\s\._\-]+/g, "");
	        data01Data.dataVat 		= $("#data01Vat").val().replace(/[\D\s\._\-]+/g, "");
	        data01Data.dataTotal 	= $("#data01Total").val().replace(/[\D\s\._\-]+/g, "");
	        data01Data.dataRemark 	= $("#data01Remark").val();
	        data01Data.vatDate = $("#ioDate").val();
	        
	        updateData.vatSerial = data01Data.vatSerial !== "" ? data01Data.vatSerial : 0;
	        updateData.contNo = $("#contNo").val();
	        updateData.compNo = "${sessionScope.compNo}";
			
	        if(!data01Data.dataQuanty){
	            alert("단가를 입력해주십시오.");
	            return;
	        } else if(!data01Data.dataAmt){
	            alert("수량을 입력해주십시오.");
	            return;
	        } else if (!data01Data.dataTitle){
	            alert("상품명을 입력해주십시오.");
	            return;
	        }
	        
	        if(data01Data.vatSerial !== "" && data01Data.vatSerial !== null){
		        $.ajax({
		        	url: "${path}/acc/vatContUpdate.do",
		        	method: "post",
		        	data: {
		        		vatSerial: localStorage.getItem("setSerial"),
		        		contNo: 0,
		        		compNo: updateData.compNo
		        	},
		        	dataType: "json",
		        	success:function(){
		        		$.ajax({
		        			url: "${path}/acc/vatContUpdate.do",
		        			method: "post",
		        			data: updateData,
		        			dataType: "json",
		        			success:function(){
		        				localStorage.removeItem("setSerial");
		        			},
		        			error:function(){
		        				alert("데이터가 맞지 않습니다.\n다시 시도해주십시오.");
		        				return false;
		        			}
		        		});
		        	},
		        	error:function(){
		        		alert("업데이트에 실패했습니다.\n다시 시도해주십시오.");
		        		return false;
		        	}
		        });
        }

        $.ajax({ url: "${path}/sopp/updatedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: data01Data , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
        .done(function(data) {
            if(data.code == 10001){
                alert("저장 성공");
                $("#data01Type option:eq(0)").attr("selected","selected");
                $("#soppdataNo").val("");
                $("#productSalesInOutCustName").val("");
                $("#productSalesInOutCustNo").val("");
                $("#productNo1").val("");
                $("#data01Title[data-flag='true']").val("");
                $("#data01Netprice").val("");
                $("#data01Quanty").val("");
                $("#data01Amt").val("");
                $("#data01Remark").val("");

                $("#data01Addbtn").show();
                $("#data01Modbtn").hide();
                
                localStorage.setItem('lastTab', "#tab02");
                //var url="${path}/sopp/detail/"+$("#soppNo").val() + "/#tab02";
				//fn_Reloaddata01(url);
                location.href = path;
            }else{
                alert("저장 실패");
            }
        }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
        .fail(function(xhr, status, errorThrown) {
            $(e).addClass("btn-dark");
            $(e).removeClass("btn-warning");
            $(e).html('수정');
            $("#data01Addbtn").show();
            $("#data01Modbtn").hide();
            alert("통신 실패");
        });
    	}else{
    		if(confirm("유지보수 매출건에 대한 수정입니까?")){
    			if(confirm("거래 일자 = " + $('#ioDate').val() + "," + " 단위 = " + $('#divisionMonth').val() + '개월. 입력하신 것이 맞습니까?')){
        	   	 	var path = $(location).attr("pathname");	
        	   	 	var updateData = {};
        	   	 	
        	    	if($("[name='contractType']:checked").val() === "NEW"){
        				localStorage.setItem("reloadSet", "1t");
        	    	}else{
        	    		localStorage.setItem("oldContNo", $("#oldContNo").val());
        				localStorage.setItem("oldContTitle", $("#oldContTitle").val());
        				localStorage.setItem("reloadSet", "2t");
        	    	}
        	    	
        	        var data01Data = {};
        	        data01Data.soppNo 		= $("#soppNo").val();
        	        data01Data.catNo	 	= '100001';
        	        data01Data.soppdataNo   = $("#soppdataNo").val();
        	        data01Data.divisionMonth = $('#divisionMonth').val();
        	        if($("#productSalesInOutCustName").val() != "") data01Data.salesCustNo = Number($("#productSalesInOutCustNo").val());
        	        if($("#data01Title[data-flag='true']").val() != "") {
        	            if($("#productNo1").val() != "") data01Data.productNo	= $("#productNo1").val();
        	            data01Data.dataTitle 	= $("#data01Title[data-flag='true']").val();
        	        }
        	        
        	        if($("#data01Type").val() === "1101"){
        				data01Data.vatSerial = $("#vatBdiv").find("#vatSerial").val();
        			}else{
        				data01Data.vatSerial = $("#vatSdiv").find("#vatSerial").val();
        			}
        	        
        	        data01Data.dataType		= $("#data01Type").val();
        	        data01Data.dataNetprice	= $("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "");
        	        data01Data.dataQuanty	= $("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "");
        	        data01Data.dataAmt 		= $("#data01Amt").val().replace(/[\D\s\._\-]+/g, "");
        	        data01Data.dataVat 		= $("#data01Vat").val().replace(/[\D\s\._\-]+/g, "");
        	        data01Data.dataTotal 	= $("#data01Total").val().replace(/[\D\s\._\-]+/g, "");
        	        data01Data.dataRemark 	= $("#data01Remark").val();
        	        data01Data.vatDate = $("#ioDate").val();
        	        
        	        updateData.vatSerial = data01Data.vatSerial !== "" ? data01Data.vatSerial : 0;
        	        updateData.contNo = $("#contNo").val();
        	        updateData.compNo = "${sessionScope.compNo}";
        			
        	        if(!data01Data.dataQuanty){
        	            alert("단가를 입력해주십시오.");
        	            return;
        	        } else if(!data01Data.dataAmt){
        	            alert("수량을 입력해주십시오.");
        	            return;
        	        } else if (!data01Data.dataTitle){
        	            alert("상품명을 입력해주십시오.");
        	            return;
        	        }
        	        
        	        if(data01Data.vatSerial !== "" && data01Data.vatSerial !== null){
        		        $.ajax({
        		        	url: "${path}/acc/vatContUpdate.do",
        		        	method: "post",
        		        	data: {
        		        		vatSerial: localStorage.getItem("setSerial"),
        		        		contNo: 0,
        		        		compNo: updateData.compNo
        		        	},
        		        	dataType: "json",
        		        	success:function(){
        		        		$.ajax({
        		        			url: "${path}/acc/vatContUpdate.do",
        		        			method: "post",
        		        			data: updateData,
        		        			dataType: "json",
        		        			success:function(){
        		        				localStorage.removeItem("setSerial");
        		        			},
        		        			error:function(){
        		        				alert("데이터가 맞지 않습니다.\n다시 시도해주십시오.");
        		        				return false;
        		        			}
        		        		});
        		        	},
        		        	error:function(){
        		        		alert("업데이트에 실패했습니다.\n다시 시도해주십시오.");
        		        		return false;
        		        	}
        		        });
                }

                $.ajax({ url: "${path}/sopp/updatedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
                    data: data01Data , // HTTP 요청과 함께 서버로 보낼 데이터
                    method: "POST", // HTTP 요청 메소드(GET, POST 등)
                    dataType: "json" // 서버에서 보내줄 데이터의 타입
                }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
                .done(function(data) {
                    if(data.code == 10001){
                        alert("저장 성공");
                        $("#data01Type option:eq(0)").attr("selected","selected");
                        $("#soppdataNo").val("");
                        $("#productSalesInOutCustName").val("");
                        $("#productSalesInOutCustNo").val("");
                        $("#productNo1").val("");
                        $("#data01Title[data-flag='true']").val("");
                        $("#data01Netprice").val("");
                        $("#data01Quanty").val("");
                        $("#data01Amt").val("");
                        $("#data01Remark").val("");

                        $("#data01Addbtn").show();
                        $("#data01Modbtn").hide();
                        
                        localStorage.setItem('lastTab', "#tab02");
                        //var url="${path}/sopp/detail/"+$("#soppNo").val() + "/#tab02";
        				//fn_Reloaddata01(url);
                        location.href = path;
                    }else{
                        alert("저장 실패");
                    }
                }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
                .fail(function(xhr, status, errorThrown) {
                    $(e).addClass("btn-dark");
                    $(e).removeClass("btn-warning");
                    $(e).html('수정');
                    $("#data01Addbtn").show();
                    $("#data01Modbtn").hide();
                    alert("통신 실패");
                });
            	}else{
                	return false;
                }	
    		}else {
    			if(confirm("일반 매출건에 대한 수정입니까?")){
    				var path = $(location).attr("pathname");	
    		   	 	var updateData = {};
    		   	 	
    		    	if($("[name='contractType']:checked").val() === "NEW"){
    					localStorage.setItem("reloadSet", "1t");
    		    	}else{
    		    		localStorage.setItem("oldContNo", $("#oldContNo").val());
    					localStorage.setItem("oldContTitle", $("#oldContTitle").val());
    					localStorage.setItem("reloadSet", "2t");
    		    	}
    		    	
    		        var data01Data = {};
    		        data01Data.soppNo 		= $("#soppNo").val();
    		        data01Data.catNo	 	= '100001';
    		        data01Data.soppdataNo   = $("#soppdataNo").val();
    		        if($("#productSalesInOutCustName").val() != "") data01Data.salesCustNo = Number($("#productSalesInOutCustNo").val());
    		        if($("#data01Title[data-flag='true']").val() != "") {
    		            if($("#productNo1").val() != "") data01Data.productNo	= $("#productNo1").val();
    		            data01Data.dataTitle 	= $("#data01Title[data-flag='true']").val();
    		        }
    		        
    		        if($("#data01Type").val() === "1101"){
    					data01Data.vatSerial = $("#vatBdiv").find("#vatSerial").val();
    				}else{
    					data01Data.vatSerial = $("#vatSdiv").find("#vatSerial").val();
    				}
    		        
    		        data01Data.dataType		= $("#data01Type").val();
    		        data01Data.dataNetprice	= $("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "");
    		        data01Data.dataQuanty	= $("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "");
    		        data01Data.dataAmt 		= $("#data01Amt").val().replace(/[\D\s\._\-]+/g, "");
    		        data01Data.dataVat 		= $("#data01Vat").val().replace(/[\D\s\._\-]+/g, "");
    		        data01Data.dataTotal 	= $("#data01Total").val().replace(/[\D\s\._\-]+/g, "");
    		        data01Data.dataRemark 	= $("#data01Remark").val();
    		        data01Data.vatDate = $("#ioDate").val();
    		        
    		        updateData.vatSerial = data01Data.vatSerial !== "" ? data01Data.vatSerial : 0;
    		        updateData.contNo = $("#contNo").val();
    		        updateData.compNo = "${sessionScope.compNo}";
    				
    		        if(!data01Data.dataQuanty){
    		            alert("단가를 입력해주십시오.");
    		            return;
    		        } else if(!data01Data.dataAmt){
    		            alert("수량을 입력해주십시오.");
    		            return;
    		        } else if (!data01Data.dataTitle){
    		            alert("상품명을 입력해주십시오.");
    		            return;
    		        }
    		        
    		        if(data01Data.vatSerial !== "" && data01Data.vatSerial !== null){
    			        $.ajax({
    			        	url: "${path}/acc/vatContUpdate.do",
    			        	method: "post",
    			        	data: {
    			        		vatSerial: localStorage.getItem("setSerial"),
    			        		contNo: 0,
    			        		compNo: updateData.compNo
    			        	},
    			        	dataType: "json",
    			        	success:function(){
    			        		$.ajax({
    			        			url: "${path}/acc/vatContUpdate.do",
    			        			method: "post",
    			        			data: updateData,
    			        			dataType: "json",
    			        			success:function(){
    			        				localStorage.removeItem("setSerial");
    			        			},
    			        			error:function(){
    			        				alert("데이터가 맞지 않습니다.\n다시 시도해주십시오.");
    			        				return false;
    			        			}
    			        		});
    			        	},
    			        	error:function(){
    			        		alert("업데이트에 실패했습니다.\n다시 시도해주십시오.");
    			        		return false;
    			        	}
    			        });
    	        }

    	        $.ajax({ url: "${path}/sopp/insertdata01_defalut.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
    	            data: data01Data , // HTTP 요청과 함께 서버로 보낼 데이터
    	            method: "POST", // HTTP 요청 메소드(GET, POST 등)
    	            dataType: "json" // 서버에서 보내줄 데이터의 타입
    	        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
    	        .done(function(data) {
    	            if(data.code == 10001){
    	                alert("저장 성공");
    	                $("#data01Type option:eq(0)").attr("selected","selected");
    	                $("#soppdataNo").val("");
    	                $("#productSalesInOutCustName").val("");
    	                $("#productSalesInOutCustNo").val("");
    	                $("#productNo1").val("");
    	                $("#data01Title[data-flag='true']").val("");
    	                $("#data01Netprice").val("");
    	                $("#data01Quanty").val("");
    	                $("#data01Amt").val("");
    	                $("#data01Remark").val("");

    	                $("#data01Addbtn").show();
    	                $("#data01Modbtn").hide();
    	                
    	                localStorage.setItem('lastTab', "#tab02");
    	                //var url="${path}/sopp/detail/"+$("#soppNo").val() + "/#tab02";
    					//fn_Reloaddata01(url);
    	                location.href = path;
    	            }else{
    	                alert("저장 실패");
    	            }
    	        }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
    	        .fail(function(xhr, status, errorThrown) {
    	            $(e).addClass("btn-dark");
    	            $(e).removeClass("btn-warning");
    	            $(e).html('수정');
    	            $("#data01Addbtn").show();
    	            $("#data01Modbtn").hide();
    	            alert("통신 실패");
    	        });
        		}else {
        			return false;
        		}
    		}	
    	} 
    }

    function fn_data01delete(soppdataNo) {
    	var path = $(location).attr("pathname");
    	console.log(path);
		/* var msg = "선택한 건을 삭제하시겠습니까?";
		
		if($("[name='contractType']:checked").val() === "NEW"){
			localStorage.setItem("reloadSet", "1t");
    	}else{
    		localStorage.setItem("oldContNo", $("#oldContNo").val());
			localStorage.setItem("oldContTitle", $("#oldContTitle").val());
			localStorage.setItem("reloadSet", "2t");
    	}
		
		if( confirm(msg) ){
			$.ajax({
				url: "${path}/sopp/deletedata01.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				data: {soppdataNo : soppdataNo}, // HTTP 요청과 함께 서버로 보낼 데이터
				method: "POST", // HTTP 요청 메소드(GET, POST 등)
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
			.done(function(data) {
				if(data.code == 10001){
					alert("삭제 성공");
					
					location.href = path;
				}else{
					alert("삭제 실패");
				}
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
			.fail(function(xhr, status, errorThrown) {
				alert("통신 실패");
			});
		} */
	}

    $('#vatYn, #data01Vat').change(function(){
       recall();
    });

    function recall(){
        var sum1 = parseInt($("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum2 = parseInt($("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum3 = parseInt($("#data01Vat").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum = Math.round(sum1 * sum2);
        var sumv = Math.round(sum * 0.1);
        var sumt = Math.round(sum + sumv);
        $("#data01Netprice").val(sum1.toLocaleString("en-US"));
        $("#data01Quanty").val(sum2.toLocaleString("en-US"));
        $("#data01Amt").val(sum.toLocaleString("en-US"));
        $("#data01Vat").val(sumv.toLocaleString("en-US"));
        $("#data01Total").val(sumt.toLocaleString("en-US"));
    }

    function recall2(){
        var sum1 = parseInt($("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum2 = parseInt($("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum3 = parseInt($("#data01Vat").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var Total = parseInt($("#data01Total").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sumv = Math.round(Total / 11);
        var suma = Math.round(Total / 11 * 10);
        var sumn = Math.round(Total/11*10/sum2);
        $("#data01Netprice").val(sumn.toLocaleString("en-US"));
        $("#data01Quanty").val(sum2.toLocaleString("en-US"));
        $("#data01Amt").val(suma.toLocaleString("en-US"));
        $("#data01Vat").val(sumv.toLocaleString("en-US"));
        $("#data01Total").val(Total.toLocaleString("en-US"));
    }

    function recall3(){
        var sum1 = parseInt($("#data01Netprice").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum2 = parseInt($("#data01Quanty").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        var sum3 = parseInt($("#data01Vat").val().replace(/[\D\s\._\-]+/g, "") || 0 );
        if (sum3 == 0){
            var sumt = sum1 * sum2;
            $("#data01Netprice").val(sum1.toLocaleString("en-US"));
            $("#data01Quanty").val(sum2.toLocaleString("en-US"));
            $("#data01Amt").val(sumt.toLocaleString("en-US"));
            $("#data01Vat").val(sum3.toLocaleString("en-US"));
            $("#data01Total").val(sumt.toLocaleString("en-US"));
        }else{
            var sumt = (sum1 * sum2) + sum3;
            var suma = (sum1 * sum2);
            $("#data01Netprice").val(sum1.toLocaleString("en-US"));
            $("#data01Quanty").val(sum2.toLocaleString("en-US"));
            $("#data01Amt").val(suma.toLocaleString("en-US"));
            $("#data01Vat").val(sum3.toLocaleString("en-US"));
            $("#data01Total").val(sumt.toLocaleString("en-US"));
        }
    }
    
    function contAmtUpdate(){
    	if(confirm("매출합계를 계약금액으로 업데이트 하시겠습니까??")){
    		var path = $(location).attr("pathname");
    		var compNo = "${sessionScope.compNo}";
    		var updateData = {};
    		
    		updateData.compNo = compNo;
    		updateData.contNo = $("#contNo").val();
    		updateData.contAmt = $("#product01OutSum").html().replace(/[\D\s\._\-]+/g, "");
    		updateData.net_profit = $('#product01DiffSum').html().replace(/[\D\s\._\-]+/g, "");
    		
    		$.ajax({
    			url: "${path}/cont/contAmtUpdate.do",
    			method: "post",
    			data: updateData,
    			dataType: "json",
    			success:function(){
    				alert("업데이트 되었습니다.");
    				location.href = path;
    			},
    			error:function(){
    				alert("업데이트 하지 못했습니다.\n확인 후 다시 시도해주십시오.");
    				return false;
    			}
    		});
    	}else{
			return false;    		
    	}
    }

    $(document).ready(function(){
    	var pathName = $(location).attr("pathname");
    	
    	$("#vatSdiv").hide();
    	
    	$("#data01Type").change(function(){
    		if($(this).val() === "1101"){
    			$("#vatBdiv").show();
    			$("#vatSdiv").hide();
    		}else{
    			$("#vatBdiv").hide();
    			$("#vatSdiv").show();
    		}
    	});
    	
        $('#data01Netprice,#data01Quanty').on('keyup',function(){
            recall();
        });

        $('#data01Total').on('keyup',function(){
            recall2();
        });

        $('#data01Vat').on('keyup',function(){
            recall3();
        });
        
		$("#divisionContAmt").on('keyup', function(){
			$("#divisionContAmt").val(parseInt($("#divisionContAmt").val()).toLocaleString("en-US"));
		});

        $("#data01Modbtn").hide();
        var nowDate = new Date();      
        //$("#ioDate").val(nowDate.getFullYear() + "-" + parseInt(nowDate.getMonth()+1) + "-" + nowDate.getDate());
        var calDate = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate());
        calDate.setFullYear(calDate.getFullYear()+1);
        
        nowDate = nowDate.toISOString().slice(0, 10);
        calDate = calDate.toISOString().slice(0, 10);
		bir = document.getElementById("ioDate");
		bir.value = nowDate;
		
		$("#divisionNum").change(function(){
			if($(this).val() < 1){
				alert("분할횟수는 1보다 작을 수 없습니다.");
				$(this).val(1);
			}
		});
		
		if(pathName.includes("/cont/detail/") || pathName.includes("/techd/contextdetail/")){
			$("#contAmtUpBtn").show();
		}else{
			$("#contAmtUpBtn").hide();
		}
		
		$("#mainDateFrom").val(nowDate);
		$("#mainDateTo").val(calDate);
		
		$("#divisionContAmt").val(parseInt($("#divisionContAmt").val()).toLocaleString("en-US"));
        
    });
</script>
<style>

    #ioDate{
    	border:1px solid #ccc;
    }
    #data01Type {
    	border:1px solid #ccc;
    }
</style>
