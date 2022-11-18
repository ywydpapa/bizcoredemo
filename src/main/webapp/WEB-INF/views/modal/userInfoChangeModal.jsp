<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="userInfoChangeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-80size" role="document">
        <div class="modal-content modal-80size">
            <div class="modal-header">
                <h4 class="modal-title">개인정보수정</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="userInfoForm">
                    <div class="form-group">
                        <label>아이디</label>
                        <input type="text" class="form-control" name="userId" value="${sessionScope.userId}" readonly>
                    </div>
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" class="form-control" name="userName" value="${sessionScope.userName}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="userPasswd">현재 비밀번호</label>
                        <input type="password" class="form-control" id="userPasswd">
                    </div>
                    <div class="form-group">
                        <label for="userChangePasswd">변경할 비밀번호</label>
                        <input type="password" class="form-control" id="userChangePasswd" >
                    </div>
                    <div class="form-group">
                        <label for="checkedUserChangePasswd">비밀번호 확인</label>
                        <input type="password" class="form-control" id="checkedUserChangePasswd">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default waves-effect" onclick="javascript:fnChangeInfo()">Change</button>
              <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>