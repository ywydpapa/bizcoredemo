<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>BizCore manual</title>
</head>
<body>
	<div class="container">
    <main class="main" role="main">
        <div class="mask"></div>
        <header>
            <h1>유지보수 계산서 연결</h1>
        </header>
        <section class="content">
        	<p><b>비즈코어 ERP 유지보수 계약 & 계산서 연결 메뉴얼 입니다.</b></p>
        	<p><b>아래 메뉴얼을 참조 하여 등록 진행 부탁드립니다.</b></p><br>
        	<p><b>1. 계약 > 매입매출 탭 클릭.</b></p>
        	<div>
            	<img src="../assets/images/menual_maintenance_1.png" style="width: 100%;">
            </div>
        	<p><b>2. 유지보수 계약에서 발행 될 계산서의 갯수와 계산서 범위를 설정 (항목 : 분할횟수, 단위)<br>ex) 계약금액이 2,000,000원이고 해당 계약에 대해 발행 될 매출계산서가 최종적으로 2개가 나오고 6개월 마다 한번씩 계산서를 발행한다 하면 "분할횟수"에 2를 기입, "단위"에 6를 기입 후 "분할추가" 버튼을 클릭.</b></p>
        	<div>
            	<img src="../assets/images/menual_maintenance_2.png" style="width: 100%;">
            </div>
        	<p><b>3. 하단 매출/매입 란에 목적에 맞게 삽입 되었는지 확인.</b></p>
        	<div>
            	<img src="../assets/images/menual_maintenance_7.png" style="width: 100%;">
            </div>
        	<p><b>4. 만들어진 매출/매입 항목에 발행된 계산서 승인번호를 연결.</b></p>
        	<div>
            	<img src="../assets/images/menual_maintenance_8.png" style="width: 100%;">
            </div>
        	<p><b>5. 수정 완료 하면 해당 항목에 정상적으로 승인번호가 들어가있는지 확인.</b></p>
        	<div>
            	<img src="../assets/images/menual_maintenance_9.png" style="width: 100%;">
            </div>
            <div>
            	<img src="../assets/images/menual_maintenance_10.png" style="width: 100%;">
            </div>
        	
        	
        	<p><b>ps. 해당 항목 수정 시 각 과정의 경고창을 확인하여 주십시오.<br>일반 매출의 경우와 유지보수 매출의 창은 다릅니다.<br>매출/매입 금액에 변동이 존재할 경우 우상단 "계약금액 업데이트"를 클릭해 주십시오.<br>리스트에서 표기될때 금액이 업데이트 되어 표기 되어 집니다.</b></p>
        </section>
    </main>
	<jsp:include page="../manual/sidebar.jsp"/>
</div>
</body>

</html>