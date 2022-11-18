<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>
							<colgroup>
								<col width="1%"/>
								<col width="5%"/>
								<col width="16%"/>
								<col width="12%"/>
								<col width="12%"/>
								<col width="7%"/>
								<col width="10%"/>
								<col width="10%"/>
								<col width="7%"/>
								<col width="5%"/>
								<col width="10%"/>
							</colgroup>							
							<thead>
								<tr>
									<th><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<th>코드번호</th>
									<th>Lv3 코드</th>
									<th>Lv3 코드명</th>
									<th>Lv3 코드값</th>									
								</tr>
							</thead>
							<tbody>
							<c:forEach var="row" items="${dto03}">
								<tr>
									<th scope="row"><input class="border-checkbox" type="checkbox" id="checkbox0"></th>
									<td><a href="javascript:location.herf='${path}/code/detail03/${row.codeNo}'">${row.codeNo}</a></td>
									<td>${row.code03}</td> 
									<td>${row.desc03}</td>
									<td>${row.value03}</td>
								</tr>
							</c:forEach>								
							</tbody>