<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Page-header start 페이지 타이틀-->
<div class="page-header2">
	<div class="row align-items-end">
		<div class="col-lg-12">
			<div class="page-header-title">
				<div class="d-inline">
					계약 등록
				</div>
			</div>
		</div>
	</div>
</div>
<!--Page-header end 페이지 타이틀 -->

<!--계약등록-->
<div class="cnt_wr">
	<h5 class="cont_title"><i class="icofont icofont-square-right"></i>계약정보</h5>
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table class="table table-sm bst02">
						<colgroup>
							<col width="15%" />
							<col width="35%"/>
							<col width="15%"/>
							<col width="35%"/>
						</colgroup>				
						<tbody>
							<tr>
								<th scope="row">계약명</th>
								<td colspan="3">
									<input type="text" class="form-control form-control-sm" id="contTitle" name="contTitle" placeholder="계약명을 입력해 주세요.">
								</td>
							</tr>
							<tr>
								<th scope="row">계약번호</th>
								<td>
									<input type="text" id="contNo" name="contNo" class="form-control " readonly placeholder="자동생성 됩니다..">
								</td>
								<th>영업기회</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="soppTitle" id="soppTitle" value="" />
										<input type="hidden" class="form-control" name="soppNo" id="soppNo" value="" />
										<span class="input-group-btn">
											<button class="btn btn-primary sch-opportunity2"
												data-remote="${path}/modal/popup.do?popId=sopp"
												type="button" data-toggle="modal" data-target="#soppModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="soppModal" tabindex="-1"
											role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title"></h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>영업기회목록</h5>
														<p>Loading!!!</p>
													</div>
													<div class="modal-footer">
														<button type="button"
															class="btn btn-default waves-effect "
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">담당사원</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="userName" id="userName" value="" />
										<input type="hidden" class="form-control" name="userNo" id="userNo" value="" />
										 <span class="input-group-btn">
											<button class="btn btn-primary sch-company"
												data-remote="${path}/modal/popup.do?popId=user"
												type="button" data-toggle="modal" data-target="#userModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="userModal" tabindex="-1"
											role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title"></h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>사용자목록</h5>
														<p>Loading!!!</p>
													</div>
													<div class="modal-footer">
														<button type="button"
															class="btn btn-default waves-effect "
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
								<th>매출처</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="custName" id="custName" value="" />
										 <input type="hidden" name="custNo" id="custNo" value="" /> <span class="input-group-btn">
											<button class="btn btn-primary sch-company"
												data-remote="${path}/modal/popup.do?popId=cust"
												type="button" data-toggle="modal" data-target="#custModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="custModal" tabindex="-1"
											role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title">매출처검색</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>매출처목록</h5>
														<p>Loading!!!</p>
													</div>
													<div class="modal-footer">
														<button type="button"
															class="btn btn-default waves-effect "
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">영업 타입</th>
								<td>
									<select name="salesType" id="salesType" class="form-control form-control-sm col-md-12">
										<option value="">선택</option>			
										<option value="101">신규</option>			
										<option value="102">노후화교체</option>			
										<option value="103">윈백</option>			
										<option value="104">증설</option>			
										<option value="105">이중화</option>			
										<option value="106">조달구매</option>			
										<option value="199">기타</option>							
									</select>
								</td>
								<th>매출처 담당자</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" id="custmemberName" name="custmemberName" class="form-control " readonly>
										<input type="hidden" id="custmemberNo" name="custmemberNo" class="form-control ">
										<span class="input-group-btn">
											<button class="btn btn-primary sch-company btn-sm" type="button"><i class="icofont icofont-search"></i></button>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">유지보수업체</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="ptncName" id="ptncName" value="" />
										 <input type="hidden" name="ptncNo" id="ptncNo" value="" />
										  <span class="input-group-btn">
											<button class="btn btn-primary sch-partner"
												data-remote="${path}/modal/popup.do?popId=ptnc"
												type="button" data-toggle="modal" data-target="#ptncModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="ptncModal" tabindex="-1"
											role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title"></h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>협력사목록</h5>
														<p>Loading!!!</p>
													</div>
													<div class="modal-footer">
														<button type="button"
															class="btn btn-default waves-effect "
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
								<th>공급업체</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" class="form-control" name="supplierName" id="supplierName" value="" />
										 <input type="hidden" name="supplierNo" id="supplierNo" value="" />
										  <span class="input-group-btn">
											<button class="btn btn-primary sch-partner"
												data-remote="${path}/modal/popup.do?popId=supply"
												type="button" data-toggle="modal" data-target="#supplyModal">
												<i class="icofont icofont-search"></i>
											</button>
										</span>
										<div class="modal fade " id="supplyModal" tabindex="-1"
											role="dialog">
											<div class="modal-dialog modal-80size" role="document">
												<div class="modal-content modal-80size">
													<div class="modal-header">
														<h4 class="modal-title"></h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<h5>협력사목록</h5>
														<p>Loading!!!</p>
													</div>
													<div class="modal-footer">
														<button type="button"
															class="btn btn-default waves-effect "
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">발주일자</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-12" type="date">
									</div>
								</td>
								<th>공급일</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-12" type="date">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">검수일</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-12" type="date">
									</div>
								</td>
								<th >계약금액</th>
								<td>
									<input type="text" id="" name="" class="form-control " readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">무상유지보수</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input class="form-control form-control-sm col-sm-6 m-r-5" type="date" max="9999-12-30"> ~ <input class="form-control form-control-sm col-sm-6 m-l-5" type="date" max="9999-12-31">
									</div>
								</td>
								<th >VAT 포함여부</th>
								<td>
									 <select name="po_v_check" id="po_v_check" class="form-control form-control-sm">
									 	<option value="" >선택</option>
										<option value="Y" >Yes</option>
										<option value="N" >No</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">지역</th>
								<td>
									<select name="po_region" id="po_region" class="form-control form-control-sm">
										<option value="">선택</option>			
										<option value="01">서울</option>			
										<option value="03">인천, 경기</option>			
										<option value="04">충북</option>			
										<option value="05">충남</option>			
										<option value="06">강원도</option>			
										<option value="07">경북</option>			
										<option value="08">경남</option>			
										<option value="09">전북</option>			
										<option value="10">전남</option>			
										<option value="11">제주</option>			
										<option value="12">해외</option>			
										<option value="13">기타</option>			
										<option value="14">세종</option>	    
									</select>
								</td>
								<th>판매방법</th>
								<td>
									<select name="po_method" id="po_method" class="form-control form-control-sm">
										<option value="">선택</option>			
										<option value="01">조달</option>			
										<option value="02">수의</option>			
										<option value="03">입찰</option>			
										<option value="04">기타</option>	    
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="3">
									<textarea name="memo" id="memo" rows="8" class="form-control"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="cnt_wr">
	<h5 class="cont_title"><i class="icofont icofont-square-right"></i> 매출정보</h5>
	<div class="row">
		<div class="col-sm-12">
			<div class="card-block table-border-style">
				<div class="table-responsive">
					<table class="table table-sm bst02">
						<colgroup>
							<col width="15%" />
							<col width="35%"/>
							<col width="15%"/>
							<col width="35%"/>
						</colgroup>				
						<tbody>
							<tr>
								<th scope="row">매출구분</th>
								<td colspan="3">
									<select name="po_sales_type" id="po_sales_type" class="form-control form-control-sm col-md-4">
										<option value="">선택</option>
										<option value='01'>유상계약</option>
										<option value='03'>임대계약</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>매출 기간</th>
								<td colspan="3">
									<div class="ms-selectable sales_date">
										<select name="s_year" id="s_year" class="form-control form-control-sm">
											<option value="">선택</option>			
											<option value="2010">2010</option>			
											<option value="2011">2011</option>			
											<option value="2012">2012</option>			
											<option value="2013">2013</option>			
											<option value="2014">2014</option>			
											<option value="2015">2015</option>			
											<option value="2016">2016</option>			
											<option value="2017">2017</option>			
											<option value="2018">2018</option>			
											<option value="2019">2019</option>			
											<option value="2020">2020</option>			
											<option value="2021">2021</option>			
											<option value="2022">2022</option>			
											<option value="2023">2023</option>			
											<option value="2024">2024</option>			
											<option value="2025">2025</option>			
											<option value="2026">2026</option>			
											<option value="2027">2027</option>			
											<option value="2028">2028</option>			
											<option value="2029">2029</option>			
											<option value="2030">2030</option>			
										</select>
										<select name="s_month" id="s_month" class="form-control form-control-sm">
											<option value="">선택</option>
												<option value="1">1월</option>
												<option value="2">2월</option>
												<option value="3">3월</option>
												<option value="4">4월</option>
												<option value="5">5월</option>
												<option value="6">6월</option>
												<option value="7">7월</option>
												<option value="8">8월</option>
												<option value="9">9월</option>
												<option value="10">10월</option>
												<option value="11">11월</option>
												<option value="12">12월</option>					
										</select> ~ 
										<select name="e_year" id="e_year" class="form-control form-control-sm">
											<option value="">선택</option>			
											<option value="2010">2010</option>			
											<option value="2011">2011</option>			
											<option value="2012">2012</option>			
											<option value="2013">2013</option>			
											<option value="2014">2014</option>			
											<option value="2015">2015</option>			
											<option value="2016">2016</option>			
											<option value="2017">2017</option>			
											<option value="2018">2018</option>			
											<option value="2019">2019</option>			
											<option value="2020">2020</option>			
											<option value="2021">2021</option>			
											<option value="2022">2022</option>			
											<option value="2023">2023</option>			
											<option value="2024">2024</option>			
											<option value="2025">2025</option>			
											<option value="2026">2026</option>			
											<option value="2027">2027</option>			
											<option value="2028">2028</option>			
											<option value="2029">2029</option>			
											<option value="2030">2030</option>				
										</select>
										<select name="e_month" id="e_month" class="form-control form-control-sm">
											<option value="">선택</option>
												<option value="1">1월</option>
												<option value="2">2월</option>
												<option value="3">3월</option>
												<option value="4">4월</option>
												<option value="5">5월</option>
												<option value="6">6월</option>
												<option value="7">7월</option>
												<option value="8">8월</option>
												<option value="9">9월</option>
												<option value="10">10월</option>
												<option value="11">11월</option>
												<option value="12">12월</option>					
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">계산서 발행일</th>
								<td>
									<div class="input-group input-group-sm mb-0 col-sm-12 m-l-0 p-l-0 f-left">
										<input type="text" id="" name="" class="form-control form-control-sm col-sm-8"> <label class="form-control-sm m-l-5" for=""> 일</label>
										<div class="border-checkbox-section col-sm-3 f-left m-b-0 m-t-5 m-l-10">
										<div class="border-checkbox-group border-checkbox-group-primary m-b-0 col-sm-4 f-left m-l-0 p-l-0">
											<input class="border-checkbox" type="checkbox" id="checkbox1">
											<label class="border-checkbox-label" for="checkbox1"> 말일</label>
										</div>		
									</div>
									</div>	
								</td>
								<th>계산서 발행업체</th>
								<td>
									<div class="input-group input-group-sm mb-0">
										<input type="text" id="" name="" class="form-control " readonly>
										<span class="input-group-btn">
											<button class="btn btn-primary sch-company btn-sm" type="button"><i class="icofont icofont-search"></i></button>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">역발행</th>
								<td colspan="3">
									<div class="border-checkbox-section col-sm-6 f-left m-b-0 m-t-5 p-l-0">
										<div class="border-checkbox-group border-checkbox-group-primary m-b-0 col-sm-6 f-left m-l-0 p-l-0">
											<input class="border-checkbox" type="checkbox" id="checkbox1">
											<label class="border-checkbox-label" for="checkbox1"></label>
										</div>		
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="cnt_wr">
	<h5 class="cont_title"><i class="icofont icofont-square-right"></i>계약상품</h5>
	<div class="row">
		<div class="col-sm-12">
			<div class="btn_wr text-right">
				<button href="#" class="btn btn-sm btn-primary f-left"><i class="icofont icofont-plus"></i>상품추가</button>
			</div>
			<div class="prd_add">	
				<ul>
					<!--상품추가 버튼 클릭시 li가 추가됨-->
					<li>
						<div class="form-group row">
							<div class="col-sm-12 col-md-2">
								<label class="col-form-label" for="co_name">제품분류</label>
								<select class="form-control form-control-sm" name="p_class[]">
									<option value="01">AIWAF</option>			
									<option value="02">AIDFW</option>			
									<option value="03">AIDFW-500</option>			
									<option value="04">AISWG</option>			
									<option value="05">AIWFP</option>			
									<option value="06">AISEG</option>			
									<option value="07">AISVA</option>			
									<option value="08">Dstation</option>			
									<option value="09">ZeroPlex</option>			
									<option value="10">Q1000</option>			
									<option value="11">Q2000</option>			
									<option value="12">MF2 800</option>			
									<option value="13">WIWAF-200</option>			
									<option value="14">MF2 2100</option>			
									<option value="99">etc</option>	    
								</select>
							</div>
							<div class="col-sm-12 col-md-2">
								<label class="col-form-label" for="co_name">제품그룹</label>
								<select class="form-control form-control-sm" name="pr_group[]">
									<option value="gr13tmqRw.WI0Ko">개인정보솔루션</option>
									<option value="gr13Q9zwgCvwW5Y">은성의료제단_개인정보솔루션</option>
									<option value="gr13oGyiRvs8GLo">잉카인터넷</option>
									<option value="gr13xxOTuQn3QRI">엑스게이트</option>
									<option value="gr13sg8TNtKOCSI">SECUI</option>
									<option value="gr13gtbWvKcuQGw">아이넵</option>
									<option value="gr13ngRW6bfnGkE">Net-insider v1.1</option>
									<option value="gr13Psov4x80zSE">넷맨</option>
									<option value="gr13kMcNLZo9elU">한드림넷</option>
									<option value="gr13hWPXROGybl2">PIOLINK</option>
									<option value="gr13yWZxxfy8/EI">지란지교</option>
									<option value="gr13/CBs/MVQROY">기타</option>
									<option value="gr13Uig7I7sgfVM">모니터랩</option>
									<option value="gr13zO9y.1rDjIE">틸론</option>
									<option value="gr13RD/VtZ00.pc">넷코아테크</option>
									<option value="gr13phn1cj.A8lk">SQI소프트</option>
									<option value="gr13P9WYEDS.EHU">KSign</option>
									<option value="gr1602726377001">Palo Alto</option>
									<option value="gr13.qZOG4C2XxI">알티베이스</option>
									<option value="gr1567469035001">웜스토리지</option>
								</select>
							</div>
							<div class="col-sm-12 col-md-2">
								<label class="col-form-label" for="co_name">제품</label>	
								<select class="form-control form-control-sm" name="pr_code[]">
								<c:forEach items="${productList}" var="proc">
								<option value="${proc.productNo}" >${proc.productName}</option>
								</c:forEach>
								</select>
								
							</div>
							<div class="col-sm-4 col-md-2">
								<label class="col-form-label" for="co_name">가격</label>
								<div class="input-group input-group-sm">
									<span class="input-group-addon">￦</span>
									<input type="text" name="price[]" class="form-control text-right"  value="0">
								</div>
							</div>
							<div class="col-sm-4 col-md-2">
								<label class="col-form-label" for="co_name">원가</label>
								<div class="input-group input-group-sm">
									<span class="input-group-addon">￦</span>
									<input type="text" name="cost_price[]" class="form-control text-right" value="0">
								</div>
							</div>
							<div class="col-sm-4 col-md-2">
								<label class="col-form-label" for="co_name">수량</label>
								<div class="input-group input-group-sm">
									<input type="text" name="quantity[]" class="form-control" value="1">
									<span class="input-group-addon">EA</span>
								</div>
							</div>
						</div>
						<div class="btn_wr text-right">
							<button class="btn btn-sm btn-inverse btn-outline-inverse"><i class="icofont icofont-close m-0"></i></button>
						</div>
					</li>
					<!--//상품추가 버튼 클릭시 li가 추가됨-->
				</ul>				
			</div>
			<div class="price_sum">
				<dl>
					<dt class="p-t-5">총금액 :</dt>
					<dd class="price">￦ 0</dd>
				</dl>
			</div>
			<div class="btn_wr text-right mt-3">
				<button class="btn btn-md btn-success f-left">임시저장</button>
				<button class="btn btn-md btn-primary">계약등록</button>
				<button class="btn btn-md btn-inverse">취소</button>
			</div>
		</div>
	</div>
</div>
<!--//계약등록-->

