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
<jsp:include page="../body-top.jsp"/>

<style>
	#vatTable tbody tr td{
		vertical-align: middle;
	}
</style>

<div id="main_content">
    <c:if test="${preserveSearchCondition != 'Y'}">
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">조달 계약 관리 </h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cnt_wr" id="acordian" style="display:none;">
            <div class="row">
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
                                     <option value="">선택</option>
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
            </div>
        </div>
    </c:if>

    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="vatTable" class="table table-striped table-bordered nowrap ">
                            <thead>
	                            <tr>
	                                <th class="text-center">납품요구번호</th>
	                                <th class="text-center">수요기관명</th>
                                    <th class="text-center">납품요구일자</th>
                                    <th class="text-center">납품기한</th>
                                    <th class="text-center">제품명</th>
                                    <th class="text-center">수량</th>
                                    <th class="text-center">수주액</th>
                                    <th class="text-center">매입가</th>
                                    <th class="text-center">발주</th>
                                    <th class="text-center">제조사</th>
                                    <th class="text-center">발주처</th>
                                    <th class="text-center">발주일</th>
                                    <th class="text-center">검수요청일</th>
                                    <th class="text-center">세금계산서</th>
                                    <th class="text-center">대금청구서</th>
                                    <th class="text-center">조달입금</th>
                                    <th class="text-center">매입일자</th>
                                    <th class="text-center">매입결제</th>
                                    <th class="text-center">수수료</th>
                                    <th class="text-center">저장</th>
	                            </tr>
                            </thead>
                            <tbody>
	                            <c:forEach items="${ppsList}" var="vlist">
	                                <tr>
	                                    <td class="text-center " id="reqNo">${vlist.reqNo}</td>
	                                    <td class="text-center " id="buyerName">${vlist.buyerName}</td>
	                                    <td class="text-center " id="contractDate">${vlist.contractDate}</td>
	                                    <td class="text-center " id="deliveryDate">${vlist.deliveryDate}</td>
	                                    <td class="text-center " id="reqNo">${vlist.reqNo}</td>
	                                    <td class="text-center " id="itemQty">${vlist.itemQty}</td>
	                                    <td class="text-right moneyTdHtml" id="itemAmount">${vlist.itemAmount}</td>
	                                    <td><input type="text" id="storeAmount" onkeyup="moneyFormatInput(this);" style="border: 0px;text-align: right" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.storeAmount}" />" /></td>
	                                    <td class="text-right "><input type="text" onkeyup="moneyFormatInput(this);" id="ordAmount" style="border: 0px;text-align: right" value="<fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.ordAmount}" />" /></td>
	                                    <td class="text-center "><input type="text" id="makerName" style="border: 0px;text-align: center" value="${vlist.makerName}" /></td>
	                                    <td class="text-center "><input type="text" id="sellerName" style="border: 0px;text-align: center" value="${vlist.sellerName}" /></td>
	                                    <td class="text-center "><input type="date" id="ordDate" value="${vlist.ordDate}" /></td>
	                                    <td class="text-center "><input type="date" id="confDate" value="${vlist.confDate}" /></td>
	                                    <td class="text-center "><input type="date" id="vatDate" value="${vlist.vatDate}" /></td>
	                                    <td class="text-center "><input type="date" id="billingDate" value="${vlist.billingDate}" /></td>
	                                    <td class="text-center "><input type="date" id="ppsincomeDate" value="${vlist.ppsincomeDate}" /></td>
	                                    <td class="text-center "><input type="date" id="storeDate" value="${vlist.storeDate}" /></td>
	                                    <td class="text-center "><input type="date" id="payDate" value="${vlist.payDate}"  /></td>
	                                    <td class="text-center"><button class="form-control-sm" >수수료</button></td>
	                                    <td class="text-center"><button type="button" class="btn btn-sm btn-primary" data-id="${vlist.ppsId}" onClick="ppsDetailSave(this);">저장</button></td>
	                                </tr>
	                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../body-bottom.jsp"/>

<script>
	function ppsDetailSave(e){
		if(confirm("저장하시겠습니까??")){
			var pathName = $(location).attr("pathname");
			var saveData = {};
			
			saveData.ppsId = $(e).attr("data-id");
			saveData.compNo = "${sessionScope.compNo}";
			saveData.storeAmount = $(e).parents("tr").find("td #storeAmount").val().replaceAll(",", "");
			saveData.ordAmount = $(e).parents("tr").find("td #ordAmount").val().replaceAll(",", "");
			saveData.makerName = $(e).parents("tr").find("td #makerName").val();
			saveData.sellerName = $(e).parents("tr").find("td #sellerName").val();
			saveData.ordDate = $(e).parents("tr").find("td #ordDate").val() !== "" ? $(e).parents("tr").find("td #ordDate").val() : "0000-00-00";
			saveData.confDate = $(e).parents("tr").find("td #confDate").val() !== "" ? $(e).parents("tr").find("td #confDate").val() : "0000-00-00";
			saveData.vatDate = $(e).parents("tr").find("td #vatDate").val() !== "" ? $(e).parents("tr").find("td #vatDate").val() : "0000-00-00";
			saveData.billingDate = $(e).parents("tr").find("td #billingDate").val() !== "" ? $(e).parents("tr").find("td #billingDate").val() : "0000-00-00";
			saveData.ppsincomeDate = $(e).parents("tr").find("td #ppsincomeDate").val() !== "" ? $(e).parents("tr").find("td #ppsincomeDate").val() : "0000-00-00";
			saveData.storeDate = $(e).parents("tr").find("td #storeDate").val() !== "" ? $(e).parents("tr").find("td #storeDate").val() : "0000-00-00";
			saveData.payDate = $(e).parents("tr").find("td #payDate").val() !== "" ? $(e).parents("tr").find("td #payDate").val() : "0000-00-00";
			
			$.ajax({
				url: "${path}/pps/mppsUpdate.do",
				method: "post",
				data: saveData,
				dataType: "json",
				success:function(){
					$.ajax({
						url: "${path}/pps/mppsInsert.do",
						method: "post",
						data: saveData,
						dataType: "json",
						success:function(){
							alert("등록되었습니다.");
							location.href = pathName;
						},
						error:function(){
							alert("등록에 실패하였습니다.\n다시 시도해주십시오.");
							return false;
						}
					});
				},
				error:function(){
					alert("업데이트 하지 못하였습니다.\n다시 시도해주십시오.");
					return false;
				}
			});
		}else{
			return false;
		}
	}	
</script>