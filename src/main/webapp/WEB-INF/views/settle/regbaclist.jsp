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
                            <h6 style="font-weight:600;">계좌 등록 관리 </h6>
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
                            <td class="text-left align-middle" colspan="5"><h5>계좌 등록</h5></td>
                            <td class="text-right"><button class="btn btn-danger" onclick="javascript:fnregBac();">등록</button></td>
                        </tr>
                        <tr>
                            <th class="text-center">은행</th>
                            <td>
                                <select id="selbank" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach var="row" items="${bnkcd}">
                                        <option value="${row.code03}">${row.desc03}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <th class="text-center">계좌종류</th>
                            <td><select id="SelbacType" class = "form-control">
                                <option value="">선택</option>
                                <c:forEach var="row" items="${baccd}">
                                    <option value="${row.code03}">${row.desc03}</option>
                                </c:forEach>
                            </select></td>
                            <th class="text-center">개설일</th>
                            <td><input type="date" id="bacissueDate" class="form-control"></td>
                        </tr>
                        <tr>
                            <th class="text-center">계좌번호</th>
                            <td>
                                <input type="text" id="bacNo" class="form-control">
                            </td>
                            <th class="text-center">예금주</th>
                            <td>
                                <input type="text" id="bacowner" class="form-control">
                            </td>
                            <th class="text-center">이체한도</th>
                            <td><input type="text" id="baclimit" class="form-control"></td>
                        </tr>
                        <tr>
                            <th class="text-center">개설지점명</th>
                            <td><input type="text" id="bacbranch" class="form-control"></td>
                            <th class="text-center">메모</th>
                            <td colspan="3"><input id="bacmemo" class="form-control"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
            <div class="col-sm-12">
                <h5> 계좌 목록</h5>
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
                                <th class="text-center">은행</th>
                                <th class="text-center">계좌종류</th>
                                <th class="text-center">계좌번호</th>
                                <th class="text-center">최종확인 일자</th>
                                <th class="text-center">잔고</th>
                                <th class="text-center">상태</th>
                                <th class="text-center">메모</th>
                            </tr>
                            </thead>
                            <c:forEach items="${vatList}" var="vlist">
                                <tr>
                                    <td class="text-center">${vlist.bankCodeN}</td>
                                    <td class="text-center">${vlist.bacTypeN}</td>
                                    <td class="text-center">${vlist.bacNo}</td>
                                    <td class="text-right">${vlist.lastUpdTime}</td>
                                    <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vlist.bacBalance}" /></td>
                                    <td class="text-center"><c:if test="${empty vlist.bacStatus}">정상</c:if><c:if test="${not empty vlist.bacStatus}">제한</c:if></td>
                                    <td class="text-left">${vlist.bacMemo}</td>
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

        function fnregBac(){
            bacData = {};
            bacData.bankCode = $("#selbank").val();
            bacData.compNo = "${sessionScope.compNo}";
            bacData.bacNo = $("#bacNo").val();
            bacData.bacSerial = reverseStr($("#bacNo").val().replace(/[\D\s\._\-]+/g, ""));
            bacData.bacMemo = $("#bacmemo").val();
            bacData.bacOwner = $("#bacowner").val();
            bacData.bacLimit = $("#baclimit").val();
            bacData.bacIssueDate = $("#bacissueDate").val();
            bacData.bacBranch = $("#bacbranch").val();
            bacData.bacType = $("#SelbacType").val();
            bacData.bacBalance = '0';

            if (!bacData.bankCode) {
                alert("은행코드를 선택 하십시오.");
                return;
            }
            if (!bacData.bacNo) {
                alert("계좌번호를 입력 하십시오.");
                return;
            }
            if (!bacData.bacOwner) {
                alert("예금주명을 입력 하십시오.");
                return;
            }
            if (!bacData.bacType) {
                alert("계좌종류를 선택 하십시오.");
                return;
            }
            console.log(bacData);
            $.ajax({ url: "${path}/acc/insertbac.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
                data: bacData , // HTTP 요청과 함께 서버로 보낼 데이터
                method: "POST", // HTTP 요청 메소드(GET, POST 등)
                dataType: "json" // 서버에서 보내줄 데이터의 타입
            }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
                .done(function(data) {
                    if(data.code == 10001){
                        alert("저장 성공");
                        var url = '${path}/acc/regbac.do';
                        location.href = url;
                    }else{
                        alert("저장 실패");
                    }
                }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
                .fail(function(xhr, status, errorThrown) {
                    alert("통신 실패");
                });
        }

        function fnChgStatus(){
            alert("기능 미구현 상태 입니다.")
        }

    </script>
</div>
<jsp:include page="../body-bottom.jsp"/>