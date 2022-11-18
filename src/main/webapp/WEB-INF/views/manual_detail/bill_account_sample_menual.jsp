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
            <h1>계산서 & 계좌 엑셀 등록 양식</h1>
        </header>
        <section class="content">
        	<p><b>비즈코어 ERP 계산서 & 계좌 등록 시 디폴트 양식 입니다.</b></p>
        	<p><b>아래 메뉴얼을 참조 하여 등록 진행 부탁드립니다.</b></p><br>
        	<p><b>1. 계좌 내역 등록 가이드</b></p>
        	 <div>
            	<img src="../assets/images/sample_bac_pic.png" style="width: 100%;">
            </div>
            <p><b>1-1. 셀서식의 디폴트 값은 반드시 "일반" or "텍스트" or "사용자 지정"이 되어야 합니다.</b></p>
        	<p><b>1-2. "YYYY.MM.DD HH:mm:ss" 조건에 만족 되는지 확인 부탁드립니다. 해당 조건에 만족하지 않거나, 1-1의 조건을 만족하지 않는다면 비즈코어 ERP 조건에 부합하지 않아 데이터가 들어가지 않습니다.</b></p>
        	<p><b>1-3. 입금금액, 거래후잔액의 기본 텍스트는 ","가 들어가 있지 않고 숫자로만 표기되어 있어야 합니다.</b></p>
        	<p><b>1-4. 모든 엑셀 파일에서 동일한 양식을 준수함에도 불구하고 데이터가 들어가지 않는다면 문의 주시기 바랍니다.</b></p>
            <div>
            	<a href="../assets/images/sample_bac.xls" style="width: 100%;" download>≫계좌 내역 등록 양식</a>
            </div>
            <div>
            	<a href="../assets/images/sample_card.xls" style="width: 100%;" download>≫카드 내역 등록 양식</a>
            </div>
            <div>
            	<a href="../assets/images/sample_vat.xls" style="width: 100%;" download>≫매입&매출 계산서 등록 양식</a>
            </div>
         	<p><b>해당 파일을 내려 받은 뒤 양식에 맞춰 기입한 뒤 등록을 진행 하여 주십시오.</b></p>
        </section>
    </main>
	<jsp:include page="../manual/sidebar.jsp"/>
</div>
</body>

</html>