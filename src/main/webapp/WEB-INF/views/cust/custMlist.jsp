<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<c:set var="path" value ="${pageContext.request.contextPath}"/>

								<colgroup>
										<col width="5%" />
										<col width="12%" />
										<col width="11%" />
										<col width="15%" />
										<col width="15%" />
										<col width="15%" />
										<col width="20%" />
									</colgroup>
									<thead>
										<tr>
											<th class="text-center">고객 담당자 번호</th>
											<th class="text-center">고객성명</th>
											<th class="text-center">직급</th>
											<th class="text-center">연락처(휴대폰)</th>
											<th class="text-center">연락처(사무실)</th>
											<th class="text-center">연락처(이메일)</th>
											<th class="text-center">메모</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="memberlist" items="${dtodata01}">
											<tr align="center">
												<td>${memberlist.custData03no}</td>
												<td>${memberlist.custMname}</td>
												<td>${memberlist.custMrank}</td>
												<td>${memberlist.custMmobile}</td>
												<td>${memberlist.custMtel}</td>
												<td>${memberlist.custMemail}</td>
												<td>${memberlist.custMmemo}</td>
											</tr>
										</c:forEach>
									</tbody>