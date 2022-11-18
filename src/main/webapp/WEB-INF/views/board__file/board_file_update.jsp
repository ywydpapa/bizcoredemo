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

<div class="content-page">
	<div class="content">

		<!-- Start Content-->
		<div class="container-fluid">
			<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						자료실 수정
					</div>
				</div>
			</div>
		</div>
	</div>
			<div class="row">

				<div class="col-xl-12">
					<div class="card-box">
						<div class="middle_searchform">
						
							<form action="${pageContext.request.contextPath}/board__file/board_file_update_action" method="POST"> <!-- enctype="multipart/form-data">-->
								
								
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
													<th scope="row">제목</th>
													<td colspan="3"><input type="text"
														class="form-control form-control-sm" id="userName"
														name="bf_Title" value="${board_file_detail[0].bf_Title}" ></td>
												</tr>
												<tr>
													<th scope="row">내용</th>
													<td colspan="3"><textarea name="bf_Contents"
															id="notiContents" rows="8" class="form-control" >${board_file_detail[0].bf_Contents}</textarea>
													</td>
												</tr>
											</tbody>

										</table>
									</div>
								</div>
								<!-- file 1 -->
								<!--<div class="form-group">
									<label for="userName">1. 파일첨부</label>
									<div class="custom-file">
										<input type="file" class="custom-file-input" id=q_file name="file1" value="">
											<label class="custom-file-label"></label>
									</div>

								</div>-->
								
								
								<!-- file 2 -->
								<!--<div class="form-group">
									<label for="userName">2. 파일첨부</label>
									<div class="custom-file">
										<input type="file" class="custom-file-input" id=q_file name="file2" value="">
											<label class="custom-file-label"></label>
									</div>

								</div>-->
								
								<div class="form-group text-center mb-0">
									<button class="btn btn-primary waves-effect waves-light mr-1"
										type="submit">등록</button>
									<button type="reset"
										class="btn btn-secondary waves-effect waves-light" onclick="location.href='${pageContext.request.contextPath}/board__file/board_file'">
										취소</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
									<input type="hidden" name="bf_pk"
									value="${board_file_detail[0].bf_pk}" />
							</form>
						</div>
					</div>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- container-fluid -->
	</div>
	<!-- content -->
<jsp:include page="../body-bottom.jsp" />
</body>
</html>