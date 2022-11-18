<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<style>
.title{
    margin-bottom: 10px;
    font-size: 16px;
    font-weight: 700;
    color: #3f51b5;
}

.board_list td{
    border: 1px solid #000;
}

.list_title{
	font-weight:700;
	border-bottom:1px solid #000;
	text-align: center;
	background-color: #eee;
	padding : 10px 0px; 
}

.board_name{
	height: 160px;
	padding: 10px 20px;
	line-height: 2;
}

.board_nameOne{
	position: relative;
}

.board_nameOne span{
	position: absolute;
	top: -8%;
	left: 10%;
}

.board_nameOne span i{
	font-size : 12px;
	color: #505050;
}
.boardBtn_wrap{ 
	line-height: 35px;
}
.upBtn{
	margin-right: 5px;
	height: 35px;
	width : 40px;
	font-size: 30px;
	color: #3f51b5;
	cursor: pointer;
	border:1px solid #3f51b5;
	border-radius: 2px;
	text-align: center;
	position: relative;
}
.upBtn i{
	display: inline;
	position: absolute;
	top:3%;
	right: 15%;
}
.downBtn{
	margin-right: 5px;
	height: 35px;
	width : 40px;
	font-size: 30px;
	color: #3f51b5;
	cursor: pointer;
	border:1px solid #3f51b5;
	border-radius: 2px;
	text-align: center;
	position: relative;
}
.downBtn i{
	display: inline;
	position: absolute;
	top: 5%;
	right: 15%;
}
</style>

<div class="page_wrap bg_white noto font_14" >
	<div class="main_right bg_white" style="width: 100%;" >
				<div class="page-header-title">
					<div class="d-inline">
						게시판 관리 (생성)
					</div>
				</div>
				<hr>
                <div class="main_right_info " style="padding: 30px 20px;">
                        <div class="list_comment font_14 m_tb10" style="padding: 10px 20px; background-color: #f9f9f9;">
                            	<strong>최대 5개</strong>의 게시판을 생성할 수 있습니다.
                        </div>
                        <div class="board_maker">
                                <table class="table table-striped table-bordered nowrap input_list">
                                    <tr class="center">
                                        <td>게시판그룹</td>
                                        <td>
                                            <select class="form-control" name="boardDept" id="boardDept">
                                                <c:forEach items="${boardtype}" var="list">
                                                    <option value="${list.code03}">${list.desc03}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td>게시판코드</td>
                                        <td>
                                            <input name="boardCode" id="boardCode" type="text" class="form-control" placeholder="영어로 입력" maxlength="20"/>
                                        </td>
                                        <td>게시판공개</td>
                                        <td>
                                            <select class="form-control" name="boardOpen" id="boardOpen">
                                                <option value="0">공개</option>
                                                <option value="1">비공개</option>
                                            </select>
                                        </td>
                                        <td>게시판 관리자</td>
                                        <td>
                                            <select class="form-control" name="boardAdmin" id="boardAdmin">
                                                <c:forEach items="${userlist}" var="list">
                                                    <option value="${list.userNo}">${list.userName}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr class="center">
                                        <td>게시판제목</td>
                                        <td colspan="5">
                                            <input type="text" name="boardTitle" id="boardTitle" required class="form-control" maxlength="20" placeholder="게시판제목 입력시, 제목만 입력해주세요. ex)자유게시판 -> 자유" />
                                        </td>
                                        <td>게시판타입</td>
                                        <td>
                                            <select class="form-control" name="boardType" id="boardType">
                                                <option value="CONY">일반 게시판</option>
                                                <option value="ADDY">첨부가능 게시판</option>
                                                <option value="NOTI">공지사항 게시판</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>읽기권한</td>
                                        <td>
                                            <select class="form-control" id="boardRead" name="boardRead">
                                                <option value="Y">전체 직원</option>
                                                <option value="N">해당부서원</option>
                                            </select>
                                        </td>
                                        <td>쓰기권한</td>
                                        <td>
                                            <select class="form-control" id="boardWrite" name="boardWrite">
                                                <option value="Y">전체 직원</option>
                                                <option value="N">해당부서원</option>
                                            </select>
                                        </td>
                                        <td>댓글권한</td>
                                        <td>
                                            <select class="form-control" id="boardReply" name="boardReply">
                                                <option value="Y">전체 직원</option>
                                                <option value="N">해당부서원</option>
                                            </select>
                                        </td>
                                        <td>다운로드권한</td>
                                        <td>
                                            <select class="form-control" id="boardDownyn" name="boardDownyn">
                                                <option value="Y">전체 직원</option>
                                                <option value="N">해당부서원</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                                <div class="btn_wr text-right mt-3">
                                    <button class="btn btn-md btn-success f-left" type="button" id="boardlist">게시판목록</button>
                                    <button class="btn btn-md btn-primary" type="button" id="boardReg">생성하기</button>
                                </div>
                            <hr>
                            <div class="dt-responsive table-responsive" style="overflow-x: hidden;">
                            <table id="boardTable" class="table table-striped table-bordered nowrap ">
							<colgroup>
								<col width="5%"/>
								<col width="15%"/>
								<col width="20%"/>
								<col width="20%"/>
								<col width="20%"/>
								<col width="20%"/>
							</colgroup>							
							<thead>
								<tr>
									<th>게시판번호</th>
									<th>게시판 종류</th>
									<th>게시판명</th>
									<th>게시판 관리자</th>
									<th>게시판 설명</th>
									<th>게시판 공개여부</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${listboard}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td>${row.boardNo}</td>							
									<td>${row.boardType}</td> 
									<td>${row.boardTitle}</td>
									<td>${row.boardAdmin}</td>
									<td>${row.boardDesc}</td>
									<td>${row.boardOpen}</td>
								</tr>
							</c:forEach>								
							</tbody>
						</table>
						</div>
                        </div>
                    </div>
                </div>
       		</div>	
<script>

$("#boardReg").click(function(){
	boardReg();
});


function boardReg() {
	if(($("#boardCode").val()) == '' ) {
		alert("게시판 코드를 입력하세요.");
		$("#boardCode").focus();
		return false;
	}
	else if(($("#boardTitle").val()) == '' ) {
		alert("게시판 제목을 입력하세요.");
		$("#boardTitle").focus();
		return false;
	}
	var boardData = {};
	boardData.boardDept			= $("#boardDept").val();	// 게시판 그룹
	boardData.boardCode			= $('#boardCode').val();	// 게시판 코드
	boardData.boardNum			= $('#boardNum').val();		
	boardData.boardOpen			= $('#boardOpen').val();	// 게시판 공개
	boardData.boardAdmin		= $('#boardAdmin').val();	// 게시판 관리자
	boardData.boardTitle		= $('#boardTitle').val();	// 게시판 제목
	boardData.boardType			= $('#boardType').val();	// 게시판 타입
	boardData.boardRead			= $('#boardRead').val();	// 읽기 권한
	boardData.boardWrite		= $('#boardWrite').val();	// 쓰기 권한
	boardData.boardReply		= $('#boardReply').val();	// 댓글 권한
	boardData.boardDownyn		= $('#boardDownyn').val();	// 다운로드 권한
    if (!boardData.boardCode) {
        alert("코드를 입력하십시오.");
        return;
    }
    if (!boardData.boardTitle) {
        alert("코드를 입력하십시오.");
        return;
    }
    $.ajax({ url: "${path}/board/insert.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
                data: boardData , // HTTP 요청과 함께 서버로 보낼 데이터
                method: "POST", // HTTP 요청 메소드(GET, POST 등)
                dataType: "json" // 서버에서 보내줄 데이터의 타입
            }) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨. .
            .done(function(data) {
                if(data.code == 10001){
                    alert("저장 성공");
                    location.href ='${path}/board/regboard.do';
                }else{
                    alert("저장 실패");
                }
            }) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
            .fail(function(xhr, status, errorThrown) {
                alert("통신 실패");
            });
		}

$(function(){
    $('#boardTable').DataTable({
    	info:false
    });
});

</script>