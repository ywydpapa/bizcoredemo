<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="../modal/AttachedFile.jsp"/>
<div class="card-block table-border-style">
	<div class="table-responsive" style="overflow-x: hidden;">
		<!-- <form name="form2" method="post" onsubmit="return false;"> -->
		<table class="table table-sm bst02 filelist">
			<colgroup>
				<col width="25%" />
				<col width="45%" />
				<col width="20%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th class="text-center">일자</th>
					<th class="text-center">파일명</th>
					<th class="text-center">파일설명</th>
					<th class="text-center">삭제</th>
				</tr>
			</thead>
			<tbody id="ItemFilelist">
				<c:forEach var="row2" items="${contFiles}">
					<tr class="item1">
						<td class="text-center">${fn:substring(row2.uploadDate, 0, 10)}</td>
						<td><a href="javascript:downloadFile('${row2.fileId}', '${row2.fileName}');">${row2.fileName}</a></td>
						<td>${row2.fileDesc}</td>
						<td style="text-align: center;"><button class="btn btn-sm btn-inverse" onclick="javascript:deleteFile('${row2.fileId}');">삭제</button></td>
					</tr>
					<c:remove var="repName" />
				</c:forEach>
			</tbody>
		</table>
		<!-- </form> -->
	</div>
</div>

<script>
	
$(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();
      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        //var fileName2 = 'X';
        if(fileName.length > 10){
          fileName = fileName.substring(0,12)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
        	str += '<input type="text" name="fileDesc" class="form-control" id="fileDesc" />'
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
        	str += '<input type="text" name="fileDesc" class="form-control" id="fileDesc" />'
          	$(str).appendTo('#preview');

        }
      });
    }
});

	function fileTableCreate(data) {
		var html = '';
		if(data.length > 0){
			for(var i=0; i<data.length; i++){
				html = html + '<tr class="item1">' +
								'<td>'+data[i].uploadDate+'</td>' +
								'<td><a href="javascript:downloadFile(\''+data[i].fileId+'\');">'+data[i].fileName+'</a></td>' +
								'<td>'+data[i].fileDesc+'</td>' +
								'<td style="text-align: center;"><button class="btn btn-sm btn-inverse" onclick="javascript:deleteFile(\''+data[i].fileId+'\');">삭제</button></td>' +
							  '</tr>';
			}
		}
		return html;
	}

	function uploadFile() {
		
		//각 파일 설명.
	    var list = new Array();
	    $("input[name=fileDesc]").each(function(index, item) {
	    	list.push($(item).val());
	    });
		
	    //파일 데이터 배열화
	    var filesTempArr = [];
	    var fileInput = document.getElementById("fileUpload");
	    var files = fileInput.files;
	    var arr =Array.prototype.slice.call(files);
	    
	    filesTempArr = arr;
	    
		var filesArrLen = arr.length;
		var filesTempArrLen = filesTempArr.length;
		
		//var uploadForm = $('#uploadForm')[0];
		//var uploadData = new FormData(uploadForm);
		
		var uploadData = new FormData();
		for(var i=0, filesTempArrLen = filesTempArr.length; i<filesTempArrLen; i++) {
	    	uploadData.append('file', arr[i]);
	    	//파일 확장자명
	    	var file_name = arr[i].name.split(".").pop();
	    	//파일 크기
	    	var file_size = arr[i].size;
	    	uploadData.append('fileSize', file_size);
	    	uploadData.append('fileExtention', file_name);
	    	uploadData.append('fileDesc', list[i]);
	    	
			if(!uploadData.get('file').name) {
				alert('파일을 선택해주세요');
			}else {
				uploadData.append('fileDesc', $('#fileDesc').val());
				$.ajax({
					url : "${path}/cont/uploadfile/"+$("#contNo").val(),
					method : "POST",
					data : uploadData,
					contentType : false,
					processData : false
				}).done(function(result){
					if(result.code == 10001){
						$("#fileUploadModal").modal("hide");
						var html = fileTableCreate(result.data);
						$("#ItemFilelist").empty();
						$("#ItemFilelist").html(html);
						$("#tablist > li:nth-child(4) > a")[0].innerText = "파일첨부("+result.data.length+")";
					}else {
						alert('파일 업로드 실패');
					}
				}).fail(function(xhr, status, errorThrown) {
				});
			}
			//for문 당 배열 초기화
	    	var uploadData = new FormData();
		}
		alert("파일 업로드 완료");
	}

	function deleteFile(fileId) {
		if(!confirm("정말 삭제하시겠습니까?")){
			return false;
		}

		var deleteData = {};
		deleteData.contNo = $("#contNo").val();
		deleteData.fileId = fileId;

		$.ajax({
			url : "${path}/cont/deleteFile",
			data : deleteData,
			method : "POST",
		}).done(function(result, status, xhr){
			if(result.code == 10001){
				alert('파일 삭제 완료');
				var html = fileTableCreate(result.data);
				$("#ItemFilelist").empty();
				$("#ItemFilelist").html(html);
				$("#tablist > li:nth-child(4) > a")[0].innerText = "파일첨부("+result.data.length+")";
			}else {
				alert('파일 삭제 실패');
			}
		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}


	function downloadFile(fileId, fileName) {
		var downloadData = {};
		downloadData.contNo = $("#contNo").val();
		downloadData.fileId = fileId;

		$.ajax({
			url : "${path}/cont/downloadfile",
			data : downloadData,
			method : "POST",
			xhrFields: {
				responseType: 'blob'
			},
		}).done(function(data, status, xhr){
			/* var fileName = xhr.getResponseHeader('content-disposition'); */
			var link = document.createElement('a');
			link.href = window.URL.createObjectURL(data);
			link.download = fileName;
			link.click();

		}).fail(function(xhr, status, errorThrown) {
			alert("통신 실패");
		});
	}
</script>