<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<button class="btn btn-md btn-primary" data-toggle="modal" data-target="#fileUploadModal" onClick="openFileUploadModal()" style="float: right; padding: 5px 12px; margin-bottom: 9px;">등록</button>

<div class="modal fade " id="fileUploadModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h4 class="modal-title">파일 등록</h4>
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
