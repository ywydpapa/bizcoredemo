<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp" />
<jsp:include page="../body-top.jsp" />

<div id="main_content">
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						자료실 상세
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="cnt_wr">
		<div class="row">
			<div class="col-sm-12">
				<div class="card-block table-border-style">
					<div class="table-responsive">
						<table class="table table-sm bst02">
							<colgroup>
								<col width="15%" />
								<col width="35%" />
								<col width="15%" />
								<col width="35%" />
							</colgroup>

							<tbody>
								<tr>
									<th>작성자</th>
									<td colspan="3">
										<input type="text" class="form-control form-control-sm" id="userName" name="userName" value="${board_file_detail[0].userName}" readonly>
										<input type="hidden" class="form-control" name="userNo" id="userNo" value="${board_file_detail[0].userNo}" />
									</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3">
										<input type="text" class="form-control form-control-sm" id="userName" name="bf_Title" value="${board_file_detail[0].bf_Title}" readonly>
									</td>
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td colspan="3">
										<textarea name="bf_Contents" id="notiContents" rows="8" class="form-control" readonly>${board_file_detail[0].bf_Contents}</textarea>
									</td>
								</tr>
								<tr>
									<th scope="row">등록일</th>
									<td colspan="3"><input type="text"
										class="form-control form-control-sm" id="regDatetime" name="regDatetime"
										value="${board_file_detail[0].regDatetime}" readonly></td>
								</tr>
								
							</tbody>

						</table>
					</div>
				</div>
				<div class="btn_wr text-right mt-3">
					<button class="btn btn-md btn-success f-left modal-list-btn" onClick="javascript:location.href='${path}/board__file/board_file'">목록</button>
					
					<!-- ${sessionScope.userNo} -->
					<c:if test="${sessionScope.userNo == board_file_detail[0].userNo}">
						<button class="btn btn-md btn-primary f-right modal-list-btn" style="margin-left: 5px;" onClick="location.href='${path}/board__file/board_file_update/${board_file_detail[0].bf_pk}'">수정</button>
						<button class="btn btn-md btn-danger f-right modal-list-btn" style="margin-left: 5px;" onClick="location.href='${path}/board__file/board_file_delete/${board_file_detail[0].bf_pk}'">삭제</button>
					</c:if>
					<!--  -->
					
					<input type="hidden" id="bf_pk" name="bf_pk" class="form-control " readonly value="${board_file_detail[0].bf_pk}">
				</div>
				<!-- 파일 첨부 라인 -->
				<div class="tab-pane " id="tab04" role="tabpanel">
					<div class="page-header2">
						<div class="row align-items-end">
							<div class="col-lg-12">
								<div class="page-header-title">
									<div class="d-inline">첨부파일</div>
								</div>
							</div>
						</div>
					</div>
					<jsp:include page="../board__file/board_filelist.jsp"/>
					</div>
					<!-- 파일 첨부 라인 -->
				
			</div>
		</div>
	</div>
	<!--//영업활동등록-->

</div>
<jsp:include page="../body-bottom.jsp"/>
