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
            <h1>일정 메뉴얼</h1>
        </header>
        <section class="content">
            <p>비즈코어 일정 메뉴얼 페이지 입니다.</p>
            <div>
            	<img src="../assets/images/manual_cal.png" style="width: 100%;">
            </div>
            <p>Ullamcorper inceptos in magna vestibulum penatibus aliquet tellus suspendisse nascetur convallis
             a id diam netus a a parturient posuere nam orci fermentum duis habitasse nam. Iaculis eros hendrerit r
             honcus et enim commodo nulla vivamus consequat id rhoncus vestibulum a maecenas justo vestibulum mi vel purus id ullamcorper mus a.
              Potenti mattis placerat ligula a suspendisse ipsum mus elementum a himenaeos et aliquam inceptos euismod ad placerat sociosqu mauris vestibulum conubia condimentum semper
               penatibus ridiculus. Dictumst diam eros fames a elementum eros mus fusce feugiat vestibulum a dui parturient ad ullamcorper suspendisse eleifend vestibulum facilisi ridiculus.
                Condimentum felis sed laoreet aliquam proin dignissim eu mi ad vestibulum ut suspendisse volutpat nibh cras mi praesent morbi ad. Est libero facilisis vestibulum suspendisse rutrum
                 fames a facilisi semper interdum consectetur consectetur a scelerisque parturient volutpat ad eros torquent tincidunt senectus risus adipiscing donec parturient. Maecenas mus suspendisse
                  laoreet non morbi vestibulum eros dolor nam nullam nec parturient nascetur suspendisse tincidunt suspendisse convallis blandit.</p>
        </section>
    </main>
	<jsp:include page="../manual/sidebar.jsp"/>
</div>
</body>

</html>