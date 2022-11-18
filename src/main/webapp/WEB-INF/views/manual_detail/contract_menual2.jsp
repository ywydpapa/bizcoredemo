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
            <h1>계약서 메뉴얼</h1>
        </header>
        <section class="content">
        	<p><b>비즈코어 계약서와 계산서 연결 메뉴얼 과정입니다.</b></p>
            <div>
            	<img src="../assets/images/contract.png" style="width: 100%;">
            </div>
            <p><b>업무관리 > 계약관리 > 계약조회</b></p>
            <div>
            	<img src="../assets/images/contract1.png" style="width: 100%;">
            </div>
            <p><b>계산서를 등록시킬 계약을 검색합니다.</b></p>
            <div>
            	<img src="../assets/images/contract3.png" style="width: 100%;">
            </div>
            <p><b>해당 계약의 매입매출 내역 탭에서 계약서 승인번호를 연결시킵니다.</b></p>
            <div>
            	<img src="../assets/images/contract4.png" style="width: 100%;">
            </div>
            <p><b>회계관리 > 매입/매출관리 > 미지급 현황</b></p>
            <div>
            	<img src="../assets/images/contract5.png" style="width: 100%;">
            </div>
            <p><b>계약의 해당 업체를 검색하여 클릭합니다.</b></p>
            <div>
            	<img src="../assets/images/contract6.png" style="width: 100%;">
            </div>
            <p><b>모달창에서 list-up된 해당 업체의 매입계산서의 수금확인 컬럼을 확인 할수 있습니다. 해당 버튼을 클릭합니다.</b></p>
            <div>
            	<img src="../assets/images/contract7.png" style="width: 100%;">
            </div>
            <p><b>해당 매입계산서와 계약을 매개로한 매출계산서 list가 출력됩니다.</b></p>
            <div>
            	<img src="../assets/images/contract8.png" style="width: 100%;">
            </div>
            <p><b>해당건의 연결은 미수금 현황과 연동 되어있으며,</b></p>
            <p><b>미지급과 동일한 flow로 확인하실 수 있습니다.</b></p>
            <div>
            	<img src="../assets/images/contract9.png" style="width: 100%;">
            </div>
            <div>
            	<img src="../assets/images/contract10.png" style="width: 100%;">
            </div>
        </section>
    </main>
	<jsp:include page="../manual/sidebar.jsp"/>
</div>
</body>

</html>