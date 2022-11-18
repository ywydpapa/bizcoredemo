<%--
  Created by IntelliJ IDEA.
  User: djkim
  Date: 2021-12-29
  Time: 오전 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<table class="table table-sm bst02" id="qutylist">
    <colgroup>
        <col width="20%" />
        <col width="20%" />
        <col width="20%" />
        <col width="20%" />
        <col width="20%" />
    </colgroup>
    <thead>
    <tr>
        <th class="text-center">구분</th>
        <th class="text-center">신청자</th>
        <th class="text-center">시작일자</th>
        <th class="text-center">종료일자</th>
        <th class="text-center">비고</th>
    </tr>
    </thead>
    <tbody>
	    	<tr>
	            <td class="text-center" id='hrType'><c:if test="${list.attType eq 1}">월차</c:if><c:if test="${list.attType eq 2}">연차</c:if><c:if test="${list.attType eq 3}">연장근무</c:if><c:if test="${list.attType eq 4}">휴일근무</c:if><c:if test="${list.attType eq 5}">경조휴가</c:if></td>
                <td class="text-center" id='hrUser'>${list.userName}</td>
                <td class="text-center" id='hrStart'>${list.attStart}</td>
	            <td class="text-center" id='hrEnd'>${list.attEnd}</td>
	            <td class="text-center" id='hrDesc'>${list.attDesc}</td>
	    	</tr>
    </tbody>
</table>
<input type="hidden" id="attendId" value="${list.attendId}">
<br/>
<script>
    function fn_AttApp(){
        var msg = "근태 신청을 승인하시겠습니까?";
        if( confirm(msg) ){
            var attData={};
            attData.attendId = $("#attendId").val();
            $.ajax({
                url: "${path}/gw/attallow.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
                data: attData, // HTTP 요청과 함께 서버로 보낼 데이터
                method: "POST", // HTTP 요청 메소드(GET, POST 등)
            }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
                .done(function(data) {
                    if(data.code == 10001){
                        var msg2 = "승인된 근태를 일정표에 반영하시겠습니까?";
                        if (confirm(msg2)){
                            fn_SaveSched();
                        }
                         location.href="${path}/gw/attlist.do";
                        }else{
                        alert("저장 실패");
                    }
                }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
                .fail(function(xhr, status, errorThrown) {
                    alert("통신 실패");
                });
        }
    }

    function fn_AttRtn(){
        var msg = "근태 신청을 반려 하시겠습니까?";
        var attDesc = $("#hrDesc").html();
        
        if( confirm(msg) ){
            var rej = prompt("반려사유를 입력해 주십시오.");
            var attData={};
            attData.attendId = $("#attendId").val();
            var addDesc = attDesc + " : "+ "<span style='color:red'>"+rej+"</span>";
            attData.attDesc = addDesc;
            console.log(attData);
            $.ajax({
                url: "${path}/gw/attreject.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
                data: attData, // HTTP 요청과 함께 서버로 보낼 데이터
                method: "POST", // HTTP 요청 메소드(GET, POST 등)
            }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
                .done(function(data) {
                    if(data.code == 10001){
                        alert("저장 성공");
                        location.href="${path}/gw/attlist.do";
                    }else{
                        alert("저장 실패");
                    }
                }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
                .fail(function(xhr, status, errorThrown) {
                    alert("통신 실패");
                });
        }else{
        	return false;	
        }
    }

    function fn_SaveSched() {
        var schedData = {};
        var attDesc = $("#hrDesc").html();
        schedData.schedFrom = "${list.attStart}";
        schedData.schedTo = "${list.attEnd}";
        var typ = ${list.attType};
        if ( typ ==1){
            schedData.schedTitle = "근태 (월차)자동등록";
        }else if (typ == 2) {
            schedData.schedTitle = "근태 (연차)자동등록";
        }else if (typ == 3) {
            schedData.schedTitle = "근태 (연장근무)자동등록";
        }else if (typ == 4) {
            schedData.schedTitle = "근태 (휴일근무)자동등록";
        }else if (typ == 5) {
            schedData.schedTitle = "근태 (경조휴가)자동등록";
        }else {
            schedData.schedTitle = "근태 자동등록";
        }
        schedData.schedDesc 		= attDesc;
        schedData.userNo 		= "${list.userNo}";
        schedData.schedType 		= '10262';
        schedData.schedCat 		= '11111';
        schedData.compNo 		= ${sessionScope.compNo};
        console.log(schedData);
        $.ajax({ url: "${path}/sched/insertauto.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: schedData , // HTTP 요청과 함께 서버로 보낼 데이터
            method: "POST", // HTTP 요청 메소드(GET, POST 등)
            dataType: "json" // 서버에서 보내줄 데이터의 타입
        }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
            .done(function(data) {
                if(data.code == 10001){
                    }else {
                    }
                }
            ) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                alert("통신 실패");
            });
    }

    $(document).ready(function(){
    });
</script>