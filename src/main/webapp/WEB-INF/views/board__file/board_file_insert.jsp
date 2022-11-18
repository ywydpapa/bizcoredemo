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

<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						자료실 등록
					</div>
				</div>
			</div>
		</div>
	</div>
		<!-- Start Content-->
		<div class="container-fluid">
			
			<div class="row">

				<div class="col-xl-12">
					<div class="card-box">
						<div class="middle_searchform">
						
							<form action="${pageContext.request.contextPath}/board__file/board_file_insert_action" method="POST" enctype="multipart/form-data"> 
								
								
								<!--<div class="form-group">
									<label for="userName">Title</label>
									<div class="form-group row" >
										<input type="text"  name="bf_Title"
											placeholder="제목을 입력해주세요." class="form-control"
											id="board_file_Title"
											value="">
									</div>
								</div>
								<input type="hidden" class="form-control" name="userNo" id="userNo" value="${sessionScope.userNo}" />
								<div class="form-group">
									<blockquote>
										<blockquote>
											<label for="userName">Content</label>
										</blockquote>
									</blockquote>
									<textarea id="textarea" class="form-control"
										name="bf_Contents" maxlength="225" rows="8"></textarea>
								</div>-->
								<!-- 수정 추가 -->
								<!-- 수정 추가 -->
								<!-- 수정 추가 -->
								<!-- 수정 추가 -->
								<!-- 수정 추가 -->
								<!-- 수정 추가 -->
								<div class="card-block table-border-style">
									<div class="table-responsive">
									<input type="hidden" class="form-control" name="userNo" id="userNo" value="${sessionScope.userNo}" />
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
														name="bf_Title" value="" ></td>
												</tr>
												<tr>
													<th scope="row">내용</th>
													<td colspan="3"><textarea name="bf_Contents"
															id="notiContents" rows="8" class="form-control" ></textarea>
													</td>
												</tr>
											</tbody>

										</table>
									</div>
								</div>
								<!-- 수정 추가 -->
								<!-- 수정 추가 -->
								<!-- 수정 추가 -->
								<!-- 수정 추가 -->
								<!-- 수정 추가 -->

								<div class="form-group text-center mb-0">
									<button class="btn btn-primary waves-effect waves-light mr-1"
										type="submit">등록</button>
									<button type="reset"
										class="btn btn-secondary waves-effect waves-light" onclick="location.href='${pageContext.request.contextPath}/board__file/board_file'">
										취소</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
									
									
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