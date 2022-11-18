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

<div id="main_content">
	
    <c:if test="${preserveSearchCondition != 'Y'}">
        <!-- Page-header start 페이지 타이틀-->
        <div class="page-header2">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="page-header-title" style="float:left;">
                        <div style="margin-top:15px;">
                            <h6 style="font-weight:600;">카드 등록 관리 </h6>
                        </div>
                    </div>
                    <div class="btn_wr" style="float:right;">
                        <!-- hide and show -->
<%--
						<button class="btn btn-sm btn-success" id="fold" onclick="acordian_action()">펼치기</button>
						<button class="btn btn-sm btn-success" id="fold2" onclick="acordian_action1()" style="display:none;">접기</button>
--%>
						<!-- hide and show -->
                        <button class="btn btn-sm btn-danger" onClick="javascript:fnChgStatus()">상태변경</button>
                        <%--<button class="btn btn-sm btn-outline"onClick="javascript:location='${path}/acc/bacupdate.do'"><i class="icofont icofont-pencil-alt-2"></i>계좌내역 등록</button>--%>
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
    <div class="row">
        <div class="col-sm-12">
            <div class="card-block table-border-style">
                <div class="table-responsive">
                    <table id="bacregTable" class="table table-striped table-bordered nowrap ">
                        <colgroup>
                            <col width="15%"/>
                            <col width="15%"/>
                            <col width="15%"/>
                            <col width="15%"/>
                            <col width="15%"/>
                            <col width="15%"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <td class="text-left align-middle" colspan="5"><h5>카드 등록</h5></td>
                            <td class="text-right"><button class="btn btn-danger" onclick="javascript:fnregCard();">등록</button></td>
                        </tr>
                        <tr>
                            <th class="text-center">은행</th>
                            <td>
                                <select id="cardBank" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach var="row" items="${bnkcd}">
                                        <option value="${row.code03}">${row.desc03}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <th class="text-center">카드구분</th>
                            <td><select id="cardDivision" class = "form-control">
                                <option value="">선택</option>
                                <option value="공용">공용</option>
                            </select></td>
                            <th class="text-center">발급일</th>
                            <td><input type="date" id="cardIssueDate" class="form-control"></td>
                        </tr>
                        <tr>
                            <th class="text-center">카드번호</th>
                            <td>
                                <input type="text" id="cardSerial" class="form-control">
                            </td>
                            <th class="text-center">카드구별번호</th>
                            <td>
                                <input type="text" id="cardDisNum" class="form-control" readonly>
                            </td>
                            <th class="text-center">메모</th>
                            <td colspan="2"><input id="cardMemo" class="form-control"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <h5> 카드 목록</h5>
        </div>
    </div>
    <!--리스트 table-->
    <div class="cnt_wr" id="list-container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-block table-border-style">
                    <div class="table-responsive">
                        <table id="vatTable" class="table table-striped table-bordered nowrap ">
                            <colgroup>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="15%"/>
                                <col width="15%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th class="text-center">발급일자</th>
                                <th class="text-center">카드구분</th>
                                <th class="text-center">카드번호</th>
                                <th class="text-center">최종확인 일자</th>
                                <th class="text-center">은행</th>
                                <th class="text-center">상태</th>
                                <th class="text-center">현재 사용인원</th>
                                <th class="text-center">메모</th>
                                <th class="text-center">수정</th>
                            </tr>
                            </thead>
                            <c:forEach items="${cardList}" var="cardList">
                                <tr>
                                    <td class="text-center">${cardList.cardIssueDate}</td>
                                    <td class="text-center">${cardList.cardDivision}</td>
                                    <td class="text-center">${cardList.cardSerial}</td>
                                    <td class="text-right">${cardList.lastUpdTime}</td>
                                    <td class="text-center">${cardList.bankCodeN}</td>
                                    <td class="text-center">${cardList.cardStatus}</td>
                                    <td class="text-center">
                                    	<c:if test="${cardList.user_card ne 0}">
                                    		<select id="select_user_card" class="form-control">
                                    			<option value="${cardList.user_card}">${cardList.userName}</option>
                                    			<c:forEach items="${userList}" var="var">
	                                    			<option value="${var.userNo}">${var.userName}</option>
    	                                		</c:forEach>
    	                                		<option value="0">=========초기화=========</option>
                                    		</select>
                                    	</c:if>
                                    	
                                    	<c:if test="${cardList.user_card eq 0}">
                                    		<select id="select_user_card" class="form-control">
                                    		<option value="0">선택해주세요</option>
	                                    		<c:forEach items="${userList}" var="var">
		                                    		<option value="${var.userNo}">${var.userName}</option>
	    	                                	</c:forEach>
                                    		</select>
                                    	</c:if>
                                    </td>
                                    <td class="text-left">${cardList.cardMemo}</td>
                                    <td class="text-center"><button class="btn btn-primary btn-sm" onClick="update_card_data(this)" data-id="${cardList.cardSerial}" >수정</button></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--//리스트 table-->

	<!-- hide and show -->
	<script>
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

    <script>
    	$(document).ready(function(){
    		$("#cardSerial").change(function(){
    			var cardSerial = $(this).val().replaceAll("-", "");
    			
    			$("#cardDisNum").val(cardSerial.substring(cardSerial.length-6, cardSerial.length));
    		});
    	})
    
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

        function reverseStr(str) {
            let result = '';
            for(let i = str.length - 1; i >= 0; i--) {
                result = result + str[i];
            }
            return result;
        }

        function fnregCard(){
            cardData = {};
            cardData.compNo = "${sessionScope.compNo}";
            cardData.cardSerial = $("#cardSerial").val();
            cardData.cardDivision = $("#cardDivision").val();
            cardData.cardBank = $("#cardBank").val();
            cardData.cardStatus = "정상";
            cardData.cardMemo = $("#cardMemo").val();
            cardData.cardIssueDate = $("#cardIssueDate").val();
            cardData.cardDisNum = $("#cardDisNum").val();

            if (!cardData.cardBank) {
                alert("은행코드를 선택 하십시오.");
                return;
            }
            if (!cardData.cardSerial) {
                alert("카드 번호를 입력 하십시오.");
                return;
            }
            if (!cardData.cardDivision) {
                alert("카드 구분을 선택 하십시오.");
                return;
            }
            if (!cardData.cardIssueDate) {
                alert("카드 발급일을 선택 하십시오.");
                return;
            }
            
            $.ajax({ 
            	url: "${path}/acc/insertCard.do",
                data: cardData,
                method: "POST",
                dataType: "json",
                success:function(){
                	alert("저장 성공");
                	var url = '${path}/acc/regCard.do';
                    location.href = url;
                }
            });
        }

        function fnChgStatus(){
            alert("기능 미구현 상태 입니다.");
        }
        
        function update_card_data(e){
        	if(confirm("업데이트 하시겠습니까??")){
        		var selectData = {};
        		var user_card = $(e).parent().prev().prev().children().val();
        		var cardSerial = $(e).attr("data-id");
        		
        		selectData.cardSerial = cardSerial;
        		selectData.user_card = user_card;
        		
        		 $.ajax({
                 	url: "${path}/acc/update_card_data.do",
                     data: selectData,
                     method: "POST",
                     dataType: "json",
                     success:function(){
                     	alert("저장 성공");
                     	var url = '${path}/acc/regCard.do';
                         location.href = url;
                     } 
                 })
        	}else{
        		return false;
        	}
        }

    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>