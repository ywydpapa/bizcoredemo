<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<button class="btn btn-md btn-primary" data-toggle="modal" data-target="#fileUploadModal" style="float: right; padding: 5px 12px; margin-bottom: 9px;">등록</button>

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
				<form id="uploadForm" enctype="multipart/form-data">
					<input type="file" name="file" id="fileUpload" multiple="multiple" /><br><br>
        			파일 미리보기
        			<div class="form-control viewstyle">
        				<div id="preview"></div>
					</div>
				</form>
				<div>
					<span class="text_for_file"><b>※20MB 이상 파일 제한</b></span><br>
					<span class="text_for_file"><b>※파일 다중으로 업로드 시 'ctrl'키 사용</b></span>
				</div>			
				<!--<br> 파일 설명<input type="text" class="form-control" id="fileDesc" />-->
			</div>
			<form id="uploadForm1" enctype="multipart/form-data" style="display:none;">
				<input type="file" name="test0222" id="test0222"/>
			</form>
			<div class="modal-footer">
				<button type="button" class="btn btn-default waves-effect" onclick="uploadFile()">등록</button>
				<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<style>
	.viewstyle {
		border: 1px solid #d8d8d8;
		height: 200px;
		overflow-y: scroll;
	}
	.text_for_file {
		float: right;
		color: red;
	}
</style>