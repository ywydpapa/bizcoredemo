<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<jsp:include page="../head.jsp"/>
<jsp:include page="../body-top4.jsp"/>
<head>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>
<div id="main_content">
	<script type="text/javascript" src="${path}/assets/echart/echarts-5.0.2.js"></script>
	<%
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH)+1;
		String monthStr = "";
		String monthStr_minus_one = "";
		if(month < 10){
			monthStr = "0"+ String.valueOf(month);
			monthStr_minus_one = "0" + String.valueOf(month-1);
		} else {
			monthStr = String.valueOf(month);
			monthStr_minus_one = String.valueOf(month-1);
		}
	%>

	<div class="row">
		<!-- 그래프 타입 3가지 -->
			<!-- <div class="col-md-12 col-lg-12" style="text-align:left; display:none">
			선택 옵션 : 
				<select class="custom-select mr-sm-2" id="controlAllgraph">
					<option value="2" selected>계산서 발행 기준</option>
					<option value="1">-</option>
					<option value="3">-</option>
				</select>
			</div> -->
			<!-- 그래프 타입 3가지 -->
			
			<!-- 1번째 그래프 -->
			<div class="col-md-4" style="min-width: auto; min-height: 94%;">
				<div class="card" style="width: auto; height: 94%; ">
					<div class="card-header" style="padding: 25px 12px;">
						<select class="custom-select mr-sm-1" name="graph2TargetMonth1"
							id="graph2TargetMonth1" style="float: right;">
							<option value="<%=monthStr%>"><%=monthStr%></option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> 
						<select class="custom-select mr-sm-1" name="graph2TargetYear" id="graph2TargetYear" style="float: right;">
							<option value="2022">2022</option>
						</select> 
						<!-- <select class="custom-select mr-sm-1" name="graph2TargetDepartment" id="graph2TargetDepartment" style="float: right;">
							<option value="all" selected>전체</option>
						</select> -->
						<div style="display: inline-block;">
							<h5>월 계획대비 실적</h5>
							<span style="vertical-align: bottom;" id="graph2TargetMiniTitle">2022년
							</span>
						</div>
					</div>
					<div class="defalut_gra">
						<div class="mbo-title ky-box ky-box-default">
							<div class="col-sm-12">
								<div class="ky-box-content text-right">
									<small>목표</small>
									<span id="chart2_month_profitTarget1">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>매출</small>
									<span id="chart2_month_salesTarget1">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>달성률</small>
									<span class="text-danger" id="chart2_month_percent1">0%</span>
								</div>
								<div class="ky-box-content text-right" style="border-top:1px solid #8C8C8C" id="0_month_text"><span class="" id="chart2_month_overTarget1">+₩0</span></div>
							</div>
						</div>
						<canvas id="myChartdoughnut" width="90" height="40"></canvas>
					</div>
				</div>
			</div>
			<!-- 1번째 그래프 -->
			
			<!-- 2번째 그래프 -->
			<div class="col-md-4" style="min-width: auto; min-height: 94%;">
				<div class="card" style="width: auto; height: 94%; ">
					<div class="card-header">
						<!-- <select class="custom-select mr-sm-1" name="graph3TargetYear" id="graph3TargetYear" style="float:right;">
							<option value = "2022" >2022</option>
						</select>
						<select class="custom-select mr-sm-1" name="graph3TargetDepartment" id="graph3TargetDepartment" style="float:right;">
							<option value = "" selected>전체</option>
						</select> -->
						<div style="display: inline-block;">
							<h5>누적 계획대비 실적</h5>
							<span style="vertical-align: bottom;" id="graph3TargetMiniTitle">2022년</span>
						</div>
					</div>
					<div class="defalut_gra">
						<div class="mbo-title ky-box ky-box-default">
							<div class="col-sm-12">
								<div class="ky-box-content text-right">
									<small>목표</small>
									<span id="chart3_month_profitTarget1">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>매출</small>
									<span id="chart3_month_salesTarget1">₩0</span>
								</div>
								<div class="ky-box-content text-right">
									<small>달성률</small>
									<span class="text-danger" id="chart3_month_percent1">0%</span>
								</div>
								<div class="ky-box-content text-right" style="border-top:1px solid #8C8C8C" id="0_year_text"><span class="" id="chart3_month_overTarget1">+₩0</span></div>
							</div>
						</div>
						<canvas id="myChartdoughnut1" width="90" height="40"></canvas>
					</div>
				</div>
			</div>
			<!-- 2번째 그래프 -->
						
			<!-- 3번쟤 그래프 -->
			<div class="col-md-4" style="min-width: auto; min-height: 94%;">
				<div class="card" style="width: auto; height: 94%; ">
					<div class="card-header">
						<div style="display: inline-block;">
							<h5>전월 대비(건별)</h5>
							<span style="vertical-align: bottom;">2022년 <%=monthStr_minus_one%>월~<%=monthStr%>월</span>
						</div>
					</div>
					<div class="defalut_gra">
						<canvas id="bar_chart" width="100" height="70"></canvas>
					</div>
				</div>
			</div>
			<!-- 3번쟤 그래프 -->
		</div>
		<div class="row">
		<!-- 4번째 그래프 -->
			<div class="col-md-12" style="width: 100%; min-height: auto;">
				<div class="card" style="width: 100%; height: auto;">
					<div class="card-header">
							<div style="display: inline-block;">
								<h5>매출 추이</h5>
								<span style="vertical-align: bottom;">2022년</span>
							</div>
							<select class="custom-select mr-sm-2" name="graph1TargetYear1" id="graph1TargetYear1" style="float:right;">
							<option value = "2022" selected>2022</option>
								<!-- <option value = "2021">2021</option>
								<option value = "2020">2020</option> -->
							</select>
						</div>
					<div class="defalut_gra">
						<canvas id="myChart" width="1500" height="400"></canvas>
					</div>
				</div>
			</div>
		<!-- 4번째 그래프 -->
		</div>
		<div class="row">
		<!-- 5번째 그래프 -->
			<div class="col-md-12" style="width: 100%; min-height: auto;">
				<div class="card" style="width: 100%; height: auto;">
					<div class="card-header">
							<div style="display: inline-block;">
								<h5>담당자별 매출현황</h5>
							</div>
							<select class="custom-select mr-sm-1" name="graph2TargetMonth1" id="myChart_user_mounth" style="float: right;">
								<option value="1">01</option>
								<option value="2">02</option>
								<option value="3">03</option>
								<option value="4" selected>04</option>
								<option value="5">05</option>
								<option value="6">06</option>
								<option value="7">07</option>
								<option value="8">08</option>
								<option value="9">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select> 
							<select class="custom-select mr-sm-2" name="graph1TargetYear1" id="graph1TargetYear1" style="float:right;">
								<option value = "2022" selected>2022</option>
							<!-- 	<option value = "2021">2021</option>
								<option value = "2020">2020</option> -->
							</select>
						</div>
					<div class="defalut_gra">
						<canvas id="user_chart" width="1500" height="400"></canvas>
					</div>
				</div>
			</div>
		<!-- 5번째 그래프 -->
		</div>
	<style>
		.chart2, .chart3{
			padding-bottom: 33px;
			margin-left: 6px;
			margin-top: -148px;
			width: 95%;
		}
		.ky-box-default {
			background-color: #ebebeb;
			color: #5e5e5e;
		}
		.ky-box {
			border-radius: 5px;
		}
		.ky-box-content > span{
			font-size: 20px !important;
			font: bold;
		}
		.text-test > span{
			font-size: 20px !important;
		    color: #5e5e5e;
		}
		.mbo-title {
			padding: 1px 0px 5px 0px;
		}
		.pull-left{float:left!important;}
		.pull-right{float:right!important;}
		.defalut_gra {
			width: 95%;
			margin-left: 2.5%;
		}
	</style>
	<script>
	// data	
		$("#controlAllgraph").on("change", function(){
			var graphtype = $("#controlAllgraph").val();
			//그래프 타입 1번=======================================================================================================================================
			 if(graphtype == 1){
				 alert("개발 진행 중입니다.")
				/*if(window.myChart != undefined){
					window.myChart.destroy();
				}
				if(window.myChartdoughnut != undefined){
					window.myChartdoughnut.destroy();
				}
				if(window.myChartdoughnut1 != undefined){
					window.myChartdoughnut1.destroy();
				}
				if(window.myChartdoughnut2 != undefined){
					window.myChartdoughnut2.destroy();
				}
				//그래프 1번
				const ctx = document.getElementById('myChart').getContext('2d');
				window.myChart = new Chart(ctx, {
				    type: 'bar',
					data: {
				        datasets: [
				        	{
				            label: '월별목표',
				            data: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				            order: 1,
				            backgroundColor: [
				            	'#5470C6',
				            	'#5470C6',
				            	'#5470C6',
				            	'#5470C6',
				            	'#5470C6',
				            	'#5470C6',
				            	'#5470C6',
				            	'#5470C6',
				            	'#5470C6',
				            	'#5470C6',
				            	'#5470C6',
				            	'#5470C6'
				            ]
				        }, 
				        {
				        	label: '월별매츨',
				        	data: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				        	order: 1,
				        	backgroundColor: [
				        		 '#91CC75',
				        		 '#91CC75',
				        		 '#91CC75',
				        		 '#91CC75',
				        		 '#91CC75',
				        		 '#91CC75',
				        		 '#91CC75',
				        		 '#91CC75',
				        		 '#91CC75',
				        		 '#91CC75',
				        		 '#91CC75',
				        		 '#91CC75'
				            ]
				        }, 
				        {
				        	label: '누적목표',
				        	data: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				        	type: 'line',
				        	fill: false,
				        	order: 2,
				        	backgroundColor: [
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)',
				        		 'rgba(255, 206, 86, 1)'
				        	]
				        },
				        {
				        	label: '누적매출',
				        	data: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
				        	type: 'line',
				        	fill: false,
				        	order: 2,
				        	backgroundColor: [
				        		 '#EE6666',
				        		 '#EE6666',
				        		 '#EE6666',
				        		 '#EE6666',
				        		 '#EE6666',
				        		 '#EE6666',
				        		 '#EE6666',
				        		 '#EE6666',
				        		 '#EE6666',
				        		 '#EE6666',
				        		 '#EE6666',
				        		 '#EE6666'
				        	]
				        }],
				        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
				    },
				    options: {
				    	scales:{
				    		yAxes: [
				    			{
				    				scaleLabel: {
				                    	display: true,
				                    	labelString: "억단위",
				                    },
				    	    		position: 'left'
				    			},
				    		]
				    		
				    	}
				    }
				});
				//그래프 2번
				const ctx1 = document.getElementById('myChartdoughnut').getContext('2d');
				window.myChartdoughnut = new Chart(ctx1, {
					 type: 'doughnut',
					    data: {
					    	labels: ['달성률', '미달성률'],
					        datasets: [{
					            data: ["20", "80"],
					            backgroundColor: [
					            	'rgba(54, 162, 235, 1)',
					                'rgba(255, 99, 132, 1)'
					            ]
					        }]
					    },
					    options: {
					        scales: {
					            y: {
					                beginAtZero: true
					            }
					        }
					    }
					});
				//3번 그래프
				const ctx2 = document.getElementById('myChartdoughnut1').getContext('2d');
				window.myChartdoughnut1 = new Chart(ctx2, {
					 type: 'doughnut',
					    data: {
					        labels: ['달성률', '미달성률'],
					        datasets: [{
					            data: ["20", "80"],
					            backgroundColor: [
					            	'rgba(54, 162, 235, 1)',
					                'rgba(255, 99, 132, 1)'
					            ]
					        }]
					    },
					    options: {
					        scales: {
					            y: {
					                beginAtZero: true
					            }
					        }
					    }
					});*/
				//4-1, 4-2번 그래프
				
			} 
			//그래프 타입 1번=======================================================================================================================================
				
			//2번 타입(계산서 발행 기준) 그래프 ===========================================================================================================================================================================================================================================
			else if(graphtype == 2) {
				$.LoadingOverlay("show", true);
				
				if(window.myChart != undefined){
					window.myChart.destroy();
				}
				if(window.myChartdoughnut != undefined){
					window.myChartdoughnut.destroy();
				}
				if(window.myChartdoughnut1 != undefined){
					window.myChartdoughnut1.destroy();
				}

				//해당 월별 목표 매출액
				var sum01 = 0;
				var sum02 = 0;
				var sum03 = 0;
				var sum04 = 0;
				var sum05 = 0;
				var sum06 = 0;
				var sum07 = 0;
				var sum08 = 0;
				var sum09 = 0;
				var sum10 = 0;
				var sum11 = 0;
				var sum12 = 0;
				//해당 월 누적 매출액
				var stacksum01 = 0;
				var stacksum02 = 0;
				var stacksum03 = 0;
				var stacksum04 = 0;
				var stacksum05 = 0;
				var stacksum06 = 0;
				var stacksum07 = 0;
				var stacksum08 = 0;
				var stacksum09 = 0;
				var stacksum10 = 0;
				var stacksum11 = 0;
				//계산서 발행번호가 나왔고 완료건 데이터(완료가 된건만 나오게.(B5)) => 매출건
				var conpletevaclist01 = 0;
				var conpletevaclist02 = 0;
				var conpletevaclist03 = 0;
				var conpletevaclist04 = 0;
				var conpletevaclist05 = 0;
				var conpletevaclist06 = 0;
				var conpletevaclist07 = 0;
				var conpletevaclist08 = 0;
				var conpletevaclist09 = 0;
				var conpletevaclist10 = 0;
				var conpletevaclist11 = 0;
				var conpletevaclist12 = 0;
				//위 건 누적 매출 데이터
				var convacstack01 =0;
				var convacstack02 =0;
				var convacstack03 =0;
				var convacstack04 =0;
				var convacstack05 =0;
				var convacstack06 =0;
				var convacstack07 =0;
				var convacstack08 =0;
				var convacstack09 =0;
				var convacstack10 =0;
				var convacstack11 =0;
				
				// 실시간 데이터 반영 그래프 4번 데이터
				$.ajax({
					url: "${path}/salesTarget/gradata.do", 
					method: "POST",
					dataType: "json",
				})
				.done(function(result){
					var janlength = result.data.length;
					var janlength01 = result.data01.length;
					var janlength02 = result.data02.length;
					var janlength03 = result.data03.length;
					var janlength04 = result.data04.length;
					var janlength05 = result.data05.length;
					var janlength06 = result.data06.length;
					var janlength07 = result.data07.length;
					var janlength08 = result.data08.length;
					var janlength09 = result.data09.length;
					var janlength10 = result.data10.length;
					var janlength11 = result.data11.length;
					var janlength12 = result.data12.length;
							
					for(var i=0;i<janlength;i++){
						sum01 += result.data[i].mm01;
					}
					for(var i=0;i<janlength;i++){
						sum02 += result.data[i].mm02;
					}
					for(var i=0;i<janlength;i++){
						sum03 += result.data[i].mm03;
					}
					for(var i=0;i<janlength;i++){
						sum04 += result.data[i].mm04;
					}
					for(var i=0;i<janlength;i++){
						sum05 += result.data[i].mm05;
					}
					for(var i=0;i<janlength;i++){
						sum06 += result.data[i].mm06;
					}
					for(var i=0;i<janlength;i++){
						sum07 += result.data[i].mm07;
					}
					for(var i=0;i<janlength;i++){
						sum08 += result.data[i].mm08;
					}
					for(var i=0;i<janlength;i++){
						sum09 += result.data[i].mm09;
					}
					for(var i=0;i<janlength;i++){
						sum10 += result.data[i].mm10;
					}
					for(var i=0;i<janlength;i++){
						sum11 += result.data[i].mm11;
					}
					for(var i=0;i<janlength;i++){
						sum12 += result.data[i].mm12;
					}
					stacksum01 = sum01 + sum02;
					stacksum02 = stacksum01 + sum03;
					stacksum03 = stacksum02 + sum04;
					stacksum04 = stacksum03 + sum05;
					stacksum05 = stacksum04 + sum06;
					stacksum06 = stacksum05 + sum07;
					stacksum07 = stacksum06 + sum08;
					stacksum08 = stacksum07 + sum09;
					stacksum09 = stacksum08 + sum10;
					stacksum10 = stacksum09 + sum11;
					stacksum11 = stacksum10 + sum12;
									
					for(var i=0;i<janlength01;i++){
						conpletevaclist01 += (result.data01[i].vatTax + result.data01[i].vatAmount);
					}
					for(var i=0;i<janlength02;i++){
						conpletevaclist02 += (result.data02[i].vatTax + result.data02[i].vatAmount);
					}
					for(var i=0;i<janlength03;i++){
						conpletevaclist03 += (result.data03[i].vatTax + result.data03[i].vatAmount);
					}
					for(var i=0;i<janlength04;i++){
						conpletevaclist04 += (result.data04[i].vatTax + result.data04[i].vatAmount);
					}
					for(var i=0;i<janlength05;i++){
						conpletevaclist05 += (result.data05[i].vatTax + result.data05[i].vatAmount);
					}
					for(var i=0;i<janlength06;i++){
						conpletevaclist06 += (result.data06[i].vatTax + result.data06[i].vatAmount);
					}
					for(var i=0;i<janlength07;i++){
						conpletevaclist07 += (result.data07[i].vatTax + result.data07[i].vatAmount);
					}
					for(var i=0;i<janlength08;i++){
						conpletevaclist08 += (result.data08[i].vatTax + result.data08[i].vatAmount);
					}
					for(var i=0;i<janlength09;i++){
						conpletevaclist09 += (result.data09[i].vatTax + result.data09[i].vatAmount);
					}
					for(var i=0;i<janlength10;i++){
						conpletevaclist10 += (result.data10[i].vatTax + result.data10[i].vatAmount);
					}
					for(var i=0;i<janlength11;i++){
						conpletevaclist11 += (result.data11[i].vatTax + result.data11[i].vatAmount);
					}
					for(var i=0;i<janlength12;i++){
						conpletevaclist12 += (result.data12[i].vatTax + result.data12[i].vatAmount);
					}
									
					//계산서 완료건에 대한 누적 매출 data
					convacstack01 = conpletevaclist01 + conpletevaclist02; 
					convacstack02 = convacstack01 + conpletevaclist03;
					convacstack03 = convacstack02 + conpletevaclist04;
					convacstack04 = convacstack03 + conpletevaclist05;
					convacstack05 = convacstack04 + conpletevaclist06;
					convacstack06 = convacstack05 + conpletevaclist07;
					convacstack07 = convacstack06 + conpletevaclist08;
					convacstack08 = convacstack07 + conpletevaclist09;
					convacstack09 = convacstack08 + conpletevaclist10;
					convacstack10 = convacstack09 + conpletevaclist11;
					convacstack11 = convacstack10 + conpletevaclist12;
									
					//+2번째 관련 아래 테이블 정보
					var chart3_month_profitTarget1 = 0;
					chart3_month_profitTarget1 = '₩'+stacksum11.toLocaleString("en-US");
					
					var chart3_month_salesTarget1 = 0;
					chart3_month_salesTarget1 = Math.floor(chart3_month_salesTarget1);
					chart3_month_salesTarget1 = '₩'+convacstack11.toLocaleString("en-US");

					var onepersenttarget = stacksum11/100;
					var priceonepersenttarget = (convacstack11/onepersenttarget).toFixed(2);
					var livepersent = 100 - priceonepersenttarget;
					var chart3minusprice = stacksum11 - convacstack11;
					
					var chart3_month_percent1 = priceonepersenttarget;
					
					chart3_month_percent1 = chart3_month_percent1+'%';
					var chart3_month_overTarget1 = convacstack11 - stacksum11;
					chart3_month_overTarget1 = Math.floor(chart3_month_overTarget1);
					if(chart3_month_overTarget1 > 0){
						chart3_month_overTarget1 = '+₩' + chart3minusprice.toLocaleString("en-US");
						$("#chart3_month_overTarget1").removeClass("text-danger");
						$("#chart3_month_overTarget1").addClass("text-success");
					} else if(chart3_month_overTarget1 < 0){
						chart3_month_overTarget1 = '-₩' + (chart3minusprice).toLocaleString("en-US");
						$("#chart3_month_overTarget1").removeClass("text-success");
						$("#chart3_month_overTarget1").addClass("text-danger");
					}
					$("#chart3_month_profitTarget1").html(chart3_month_profitTarget1);
					$("#chart3_month_salesTarget1").html(chart3_month_salesTarget1);
					$("#chart3_month_overTarget1").html(chart3_month_overTarget1);
					$("#chart3_month_percent1").html(chart3_month_percent1);
					//+2번째 관련 아래 테이블 정보
	
						//1번 그래프(월 계획대비 실적)
				 		$.ajax({
							url: "${path}/salesTarget/gradata.do/" + "4", 
							method: "POST",
							dataType: "json",
						})
						.done(function(result){
							var sum = 0;
							var sumlength = result.datanomal.length;
							for(var i=0;i<sumlength;i++){
								sum += result.datanomal[i].price;
							}
							var MonthvatTotal = 0;
							var MonthvatTotallength = result.data.length;
							for(var i=0;i<MonthvatTotallength;i++){
								MonthvatTotal += result.data[i].vatTax + result.data[i].vatAmount;
							}
							var testtest = sum/100;
							var test0314 = (MonthvatTotal/testtest).toFixed(2);
							var test0314test = 100 - test0314
							var TotalmountM = sum - MonthvatTotal;
							
							$("#chart2_month_profitTarget1").html('₩'+sum.toLocaleString("en-US"));
							$("#chart2_month_salesTarget1").html('₩'+MonthvatTotal.toLocaleString("en-US"));
							
							//달성률이 100%이상이라면 색상변경 
							if(test0314 >= 100){
								$("#chart2_month_percent1").html(test0314+'%');	
								$("#chart2_month_percent1").removeClass("text-danger");
								$("#chart2_month_percent1").addClass("text-success");
							}else{
								$("#chart2_month_percent1").html(test0314+'%');
								$("#chart2_month_percent1").removeClass("text-success");
								$("#chart2_month_percent1").addClass("text-danger");
							}
							//달성률이 100%이상이라면 색상변경 
							
							//목표금액을 매출이 넘었다면 색상 변경
							var overOrgin = MonthvatTotal - sum;
							if(overOrgin >= 0) {
								overOrgin = '+₩' + overOrgin.toLocaleString("en-US");
								$("#chart2_month_overTarget1").removeClass("text-danger");
								$("#chart2_month_overTarget1").addClass("text-success");
							} else {
								overOrgin = '-₩' + overOrgin.toLocaleString("en-US");
								$("#chart2_month_overTarget1").removeClass("text-success");
								$("#chart2_month_overTarget1").addClass("text-danger");
							}
							//목표금액을 매출이 넘었다면 색상 변경
							
							$("#chart2_month_overTarget1").html(overOrgin);
							
							//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
							if(test0314 >= 100){
								test0314test = 0;
							}
							//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
							
							const ctx1 = document.getElementById('myChartdoughnut').getContext('2d');
							window.myChartdoughnut = new Chart(ctx1, {
								 type: 'doughnut',
								    data: {
								    	labels: ['달성률', '미달성률'],
								        datasets: [{
								            data: [test0314, test0314test],
								            backgroundColor: [
								            	'rgba(54, 162, 235, 1)',
								                'rgba(255, 99, 132, 1)'
								            ]
								        }]
								    },
								    options: {
								        scales: {
								            y: {
								                beginAtZero: true
								            }
								        }
								    }
								})
							});
							//1번 그래프(월 계획대비 실적)
							
							//2번 그래프(누적 계획대비 실적)
							const ctx2 = document.getElementById('myChartdoughnut1').getContext('2d');
							window.myChartdoughnut1 = new Chart(ctx2, {
								type: 'doughnut',
						    	data: {
							       	labels: ['달성률', '미달성률'],
							       	datasets: [{
								    	data: [priceonepersenttarget, livepersent],
								        backgroundColor: [
								        	'rgba(54, 162, 235, 1)',
								            'rgba(255, 99, 132, 1)'
							            ]
							        }]
								},
							    options: {
								       scales: {
							           y: {
							 	             beginAtZero: true
							              }
						           }
							    }
							})
							//2번 그래프(누적 계획대비 실적)
							
							//4번 그래프(연간 계획대비 실적)
							var myChart1 = echarts.init(document.getElementById('myChart'));
							globalmyChart1 = myChart1;
							option1 = {
								tooltip : {
									trigger: 'axis',
									axisPointer:{
										type:'cross',
										crossStyle: {
											color: '#999'
										}
									}
								},
								legend: {
									data:["월별목표", "월별매출", "누적목표", "누적매출"]
								},
								xAxis : [
									{
										type : 'category',
										splitLine : {
											show:true
										},
										axisPointer: {
											type: 'shadow'
										},
										data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
									},
									{
										type : 'category',
										axisLine : {
											show:true
										},
										axisLabel : {
											show:false
										},
										data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
									}
								],
								yAxis : [
									{
										type: 'value',
										name: '월별(억원)',
										position: 'left',
										axisLine: {
											show: true,
											lineStyle: {
												color: '#999'
											}
										},
										axisLabel: {
											formatter: function (data) {
												return Math.floor(data/10000000)
											}
										}
									},
									{
										type: 'value',
										name: '누적(억원)',
										position: 'right',
										axisLine: {
											show: true,
											lineStyle: {
												color: '#999'
											}
										},
										axisLabel: {
											formatter: function (data) {
												return Math.floor(data/10000000)
											}
										}
									}
								],
								series : [
									{
										name: '월별목표',
										type: 'bar',
										data: [sum01, sum02, sum03, sum04, sum05, sum06, sum07, sum08, sum09, sum10, sum11, sum12]
									},
									{
										name: '월별매출',
										type: 'bar',
										data: [conpletevaclist01, conpletevaclist02, conpletevaclist03, conpletevaclist04, conpletevaclist05, conpletevaclist06, conpletevaclist07, conpletevaclist08, conpletevaclist09, conpletevaclist10, conpletevaclist11, conpletevaclist12]
									},
									{
										name: '누적목표',
										type: 'line',
										yAxisIndex: 1,
										data: [sum01, stacksum01, stacksum02, stacksum03, stacksum04, stacksum05, stacksum06, stacksum07, stacksum08, stacksum09, stacksum10, stacksum11]
									},
									{
										name: '누적매출',
										type: 'line',
										yAxisIndex: 1,
										data: [conpletevaclist01, convacstack01, convacstack02, convacstack03, convacstack04, convacstack05, convacstack06, convacstack07, convacstack08, convacstack09, convacstack10, convacstack11]
									}
								]
							}
							myChart1.setOption(option1);
							globaloption1 = option1;
							//4번 그래프(얀간 계획대비 실적)
							
							//5번 그래프(월간 실적)
							var month = date.getMonth() + 1;
							$.ajax({
								url: "${path}/salesTarget/user_chart.do/" + month, 
								method: "POST",
								dataType: "json",
							})
							.done(function(result){
								var user = new Array();
								var user_target = new Array();
								var user1 = result.data[0].userName;
								var user2 = result.data[1].userName;
								var user3 = result.data[2].userName;
								var user4 = result.data[3].userName;
								var user5 = result.data[4].userName;
								var user6 = result.data[5].userName;
								var user1_target = result.data[0].month_target;
								var user2_target = result.data[1].month_target;
								var user3_target = result.data[2].month_target;
								var user4_target = result.data[3].month_target;
								var user5_target = result.data[4].month_target;
								var user6_target = result.data[5].month_target;
								var user_now_graph1 = result.data[0].test;
								var user_now_graph2 = result.data[1].test;
								var user_now_graph3 = result.data[2].test;
								var user_now_graph4 = result.data[3].test;
								var user_now_graph5 = result.data[4].test;
								var user_now_graph6 = result.data[5].test;
								
								/* for(var i = 0; i < result.data.length; i++){
									user.push(result.data[i].userName);
									user_target.push(result.data[i].month_target);
								} */

									var user_chart = echarts.init(document.getElementById('user_chart'));
									user_chart_main = user_chart;
									option = {
										tooltip : {
											trigger: 'axis',
											axisPointer:{
												type:'cross',
												crossStyle: {
													color: '#999'
												}
											}
										},
										legend: {
											data:["월별목표", "월별매출"]
										},
										xAxis : [
											{
												type : 'category',
												splitLine : {
													show:true
												},
												axisPointer: {
													type: 'shadow'
												},
												data : [user1, user2, user3, user4, user5, user6]
											},
											{
												type : 'category',
												axisLine : {
													show:true
												},
												axisLabel : {
													show:false
												},
												data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
											}
										],
										yAxis : [
											{
												type: 'value',
												name: '월별(억원)',
												position: 'left',
												axisLine: {
													show: true,
													lineStyle: {
														color: '#999'
													}
												},
												axisLabel: {
													formatter: function (data) {
														return Math.floor(data/10000000)
													}
												}
											},
											{
												type: 'value',
												name: '누적(억원)',
												position: 'right',
												axisLine: {
													show: true,
													lineStyle: {
														color: '#999'
													}
												},
												axisLabel: {
													formatter: function (data) {
														return Math.floor(data/10000000)
													}
												}
											}
										],
										series : [
											{
												name: '월별목표',
												type: 'bar',
												data: [user1_target, user2_target, user3_target, user4_target, user5_target, user6_target]
											},
											{
												name: '월별매출',
												type: 'bar',
												data: [user_now_graph1, user_now_graph2, user_now_graph3, user_now_graph4, user_now_graph5, user_now_graph6]
											}
										]
									}
									user_chart.setOption(option);
									user_chart_main = option;
								})
							
							})
							//5번 그래프(월간 실적)
							
						//3번 그래프(전월 대비)
						var date = new Date();
						var month = date.getMonth() + 1;
						var last_month = date.getMonth();
						if(last_month == 12){
							month = 1;
						}
						var STR_month = month + "월"
						var STR_last_month = last_month + "월"
						
						$.ajax({
							url: "${path}/salesTarget/cnt_mouth_data.do/" + month + "/" +  last_month,
							method: "POST",
							dataType: "json",
						})
						.done(function(result){
							const ctx3 = document.getElementById('bar_chart').getContext('2d');
							window.bar_chart = new Chart(ctx3, {
								type: 'bar',
						    	data: {
							       	labels: [STR_last_month, STR_month],
							       	datasets: [{
								    	data: [result.data_last[0].count, result.data[0].count],
								        backgroundColor: [
								        	'rgba(54, 162, 235, 1)',
								            'rgba(255, 99, 132, 1)'
							            ]
							        }]
								},
							    options: {
									scales: {
										y: {
								            beginAtZero: true
							            }
									},
								 	legend: {
										display: false,
									},
							    }
							})	
							
						});
						//3월 그래프(전월 대비)
			
						//+1번째 그래프 관련 아래 테이블 정보 및 change event
						$("#graph2TargetMonth1").on("change", function(){
							var graph2TargetMonth1 = Number($("#graph2TargetMonth1").val());
				
							 $.ajax({
								url: "${path}/salesTarget/gradata.do/" + graph2TargetMonth1, 
								method: "POST",
								dataType: "json",
							 })
								.done(function(result){
									var sum = 0;
									var sumlength = result.datanomal.length;
									for(var i=0;i<sumlength;i++){
										sum += result.datanomal[i].price;
									}
									var MonthvatTotal = 0;
									var MonthvatTotallength = result.data.length;
									for(var i=0;i<MonthvatTotallength;i++){
										MonthvatTotal += result.data[i].vatTax + result.data[i].vatAmount;
									}
									var testtest = sum/100;
									var test0314 = (MonthvatTotal/testtest).toFixed(2);
									var test0314test = 100 - test0314
									var TotalmountM = sum - MonthvatTotal;
									
									$("#chart2_month_profitTarget1").html('₩'+sum.toLocaleString("en-US"));
									$("#chart2_month_salesTarget1").html('₩'+MonthvatTotal.toLocaleString("en-US"));
									if(test0314 >= 100){
										$("#chart2_month_percent1").html(test0314+'%');	
										$("#chart2_month_percent1").removeClass("text-danger");
										$("#chart2_month_percent1").addClass("text-success");
									}else{
										$("#chart2_month_percent1").html(test0314+'%');
										$("#chart2_month_percent1").removeClass("text-success");
										$("#chart2_month_percent1").addClass("text-danger");
									}
									var overOrgin = MonthvatTotal - sum;
									if(overOrgin >= 0) {
										overOrgin = '+₩' + overOrgin.toLocaleString("en-US");
										$("#chart2_month_overTarget1").removeClass("text-danger");
										$("#chart2_month_overTarget1").addClass("text-success");
									} else {
										overOrgin = '-₩' + overOrgin.toLocaleString("en-US");
										$("#chart2_month_overTarget1").removeClass("text-success");
										$("#chart2_month_overTarget1").addClass("text-danger");
									}
									$("#chart2_month_overTarget1").html(overOrgin);
									//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
									if(test0314 >= 100){
										test0314test = 0;
									}
									//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
									const ctx1 = document.getElementById('myChartdoughnut').getContext('2d');
									if(window.myChartdoughnut != undefined){
										window.myChartdoughnut.destroy();
									}
									window.myChartdoughnut = new Chart(ctx1, {
										type: 'doughnut',
										data: {
										    labels: ['달성률', '미달성률'],
										    datasets: [{
									  	    	data: [test0314, test0314test],
										        backgroundColor: [
										        	'rgba(54, 162, 235, 1)',
										            'rgba(255, 99, 132, 1)'
										        ]
										    }]
										},
										options: {
										    scales: {
										        y: {
										            beginAtZero: true
								          		}
										    }
										}
									});
								});
							});
							//+1번째 그래프 관련 아래 테이블 정보 및 change event
							setTimeout(function(){
								$.LoadingOverlay("hide", true);
							}, 4000);

				}
				//2번 타입(계산서 발행 기준) 그래프 ===========================================================================================================================================================================================================================================
			
			//그래프 타입 3번=======================================================================================================================================
			else if(graphtype ==3) {
				alert("개발 진행 중");
			}
			//그래프 타입 3번=======================================================================================================================================
				
		});
		//첫화면 로드 시 그래프타입 1번으로 selected 되게 설정.

		//년도 select 바뀔때
		$("#graph1TargetYear1").on("change", function(){
			var graph2TargetMonth1 = $("#graph1TargetDepartment1").val();
			var graph1TargetYear1 = $("#graph1TargetYear1").val();
			$.ajax({
				url: "${path}/salesTarget/usergradata.do/" + graph2TargetMonth1 + "/" + graph1TargetYear1,
				method: "POST",
				dataType: "json",
			})
			.done(function(result){
							
			});
		});
		//년도 select 바뀔때
				
				//첫화면 로드 시============================================================================
		$(document).ready(function(){
			
			$.LoadingOverlay("show", true);
			
				//해당 월별 목표 매출액
				var sum01 = 0;
				var sum02 = 0;
				var sum03 = 0;
				var sum04 = 0;
				var sum05 = 0;
				var sum06 = 0;
				var sum07 = 0;
				var sum08 = 0;
				var sum09 = 0;
				var sum10 = 0;
				var sum11 = 0;
				var sum12 = 0;
				//해당 월 누적 매출액
				var stacksum01 = 0;
				var stacksum02 = 0;
				var stacksum03 = 0;
				var stacksum04 = 0;
				var stacksum05 = 0;
				var stacksum06 = 0;
				var stacksum07 = 0;
				var stacksum08 = 0;
				var stacksum09 = 0;
				var stacksum10 = 0;
				var stacksum11 = 0;
				//계산서 발행번호가 나왔고 완료건 데이터(완료가 된건만 나오게.(B5)) => 매출건
				var conpletevaclist01 = 0;
				var conpletevaclist02 = 0;
				var conpletevaclist03 = 0;
				var conpletevaclist04 = 0;
				var conpletevaclist05 = 0;
				var conpletevaclist06 = 0;
				var conpletevaclist07 = 0;
				var conpletevaclist08 = 0;
				var conpletevaclist09 = 0;
				var conpletevaclist10 = 0;
				var conpletevaclist11 = 0;
				var conpletevaclist12 = 0;
				//위 건 누적 매출 데이터
				var convacstack01 =0;
				var convacstack02 =0;
				var convacstack03 =0;
				var convacstack04 =0;
				var convacstack05 =0;
				var convacstack06 =0;
				var convacstack07 =0;
				var convacstack08 =0;
				var convacstack09 =0;
				var convacstack10 =0;
				var convacstack11 =0;
				
				// 실시간 데이터 반영 그래프 4번 데이터
				$.ajax({
					url: "${path}/salesTarget/gradata.do", 
					method: "POST",
					dataType: "json",
				})
				.done(function(result){
					var janlength = result.data.length;
					var janlength01 = result.data01.length;
					var janlength02 = result.data02.length;
					var janlength03 = result.data03.length;
					var janlength04 = result.data04.length;
					var janlength05 = result.data05.length;
					var janlength06 = result.data06.length;
					var janlength07 = result.data07.length;
					var janlength08 = result.data08.length;
					var janlength09 = result.data09.length;
					var janlength10 = result.data10.length;
					var janlength11 = result.data11.length;
					var janlength12 = result.data12.length;
							
					for(var i=0;i<janlength;i++){
						sum01 += result.data[i].mm01;
					}
					for(var i=0;i<janlength;i++){
						sum02 += result.data[i].mm02;
					}
					for(var i=0;i<janlength;i++){
						sum03 += result.data[i].mm03;
					}
					for(var i=0;i<janlength;i++){
						sum04 += result.data[i].mm04;
					}
					for(var i=0;i<janlength;i++){
						sum05 += result.data[i].mm05;
					}
					for(var i=0;i<janlength;i++){
						sum06 += result.data[i].mm06;
					}
					for(var i=0;i<janlength;i++){
						sum07 += result.data[i].mm07;
					}
					for(var i=0;i<janlength;i++){
						sum08 += result.data[i].mm08;
					}
					for(var i=0;i<janlength;i++){
						sum09 += result.data[i].mm09;
					}
					for(var i=0;i<janlength;i++){
						sum10 += result.data[i].mm10;
					}
					for(var i=0;i<janlength;i++){
						sum11 += result.data[i].mm11;
					}
					for(var i=0;i<janlength;i++){
						sum12 += result.data[i].mm12;
					}
					stacksum01 = sum01 + sum02;
					stacksum02 = stacksum01 + sum03;
					stacksum03 = stacksum02 + sum04;
					stacksum04 = stacksum03 + sum05;
					stacksum05 = stacksum04 + sum06;
					stacksum06 = stacksum05 + sum07;
					stacksum07 = stacksum06 + sum08;
					stacksum08 = stacksum07 + sum09;
					stacksum09 = stacksum08 + sum10;
					stacksum10 = stacksum09 + sum11;
					stacksum11 = stacksum10 + sum12;

					for(var i=0;i<janlength01;i++){
						conpletevaclist01 += (result.data01[i].vatTax + result.data01[i].vatAmount);
					}
					for(var i=0;i<janlength02;i++){
						conpletevaclist02 += (result.data02[i].vatTax + result.data02[i].vatAmount);
					}
					for(var i=0;i<janlength03;i++){
						conpletevaclist03 += (result.data03[i].vatTax + result.data03[i].vatAmount);
					}
					for(var i=0;i<janlength04;i++){
						conpletevaclist04 += (result.data04[i].vatTax + result.data04[i].vatAmount);
					}
					for(var i=0;i<janlength05;i++){
						conpletevaclist05 += (result.data05[i].vatTax + result.data05[i].vatAmount);
					}
					for(var i=0;i<janlength06;i++){
						conpletevaclist06 += (result.data06[i].vatTax + result.data06[i].vatAmount);
					}
					for(var i=0;i<janlength07;i++){
						conpletevaclist07 += (result.data07[i].vatTax + result.data07[i].vatAmount);
					}
					for(var i=0;i<janlength08;i++){
						conpletevaclist08 += (result.data08[i].vatTax + result.data08[i].vatAmount);
					}
					for(var i=0;i<janlength09;i++){
						conpletevaclist09 += (result.data09[i].vatTax + result.data09[i].vatAmount);
					}
					for(var i=0;i<janlength10;i++){
						conpletevaclist10 += (result.data10[i].vatTax + result.data10[i].vatAmount);
					}
					for(var i=0;i<janlength11;i++){
						conpletevaclist11 += (result.data11[i].vatTax + result.data11[i].vatAmount);
					}
					for(var i=0;i<janlength12;i++){
						conpletevaclist12 += (result.data12[i].vatTax + result.data12[i].vatAmount);
					}
									
					//계산서 완료건에 대한 누적 매출 data
					convacstack01 = conpletevaclist01 + conpletevaclist02; 
					convacstack02 = convacstack01 + conpletevaclist03;
					convacstack03 = convacstack02 + conpletevaclist04;
					convacstack04 = convacstack03 + conpletevaclist05;
					convacstack05 = convacstack04 + conpletevaclist06;
					convacstack06 = convacstack05 + conpletevaclist07;
					convacstack07 = convacstack06 + conpletevaclist08;
					convacstack08 = convacstack07 + conpletevaclist09;
					convacstack09 = convacstack08 + conpletevaclist10;
					convacstack10 = convacstack09 + conpletevaclist11;
					convacstack11 = convacstack10 + conpletevaclist12;
									
					//+2번째 관련 아래 테이블 정보
					var chart3_month_profitTarget1 = 0;
					chart3_month_profitTarget1 = '₩'+stacksum11.toLocaleString("en-US");
					
					var chart3_month_salesTarget1 = 0;
					chart3_month_salesTarget1 = Math.floor(chart3_month_salesTarget1);
					chart3_month_salesTarget1 = '₩'+convacstack11.toLocaleString("en-US");

					var onepersenttarget = stacksum11/100;
					var priceonepersenttarget = (convacstack11/onepersenttarget).toFixed(2);
					var livepersent = 100 - priceonepersenttarget;
					var chart3minusprice = stacksum11 - convacstack11;
					
					var chart3_month_percent1 = priceonepersenttarget;
					
					chart3_month_percent1 = chart3_month_percent1+'%';
					var chart3_month_overTarget1 = convacstack11 - stacksum11;
					chart3_month_overTarget1 = Math.floor(chart3_month_overTarget1);
					if(chart3_month_overTarget1 > 0){
						chart3_month_overTarget1 = '+₩' + chart3minusprice.toLocaleString("en-US");
						$("#chart3_month_overTarget1").removeClass("text-danger");
						$("#chart3_month_overTarget1").addClass("text-success");
					} else if(chart3_month_overTarget1 < 0){
						chart3_month_overTarget1 = '-₩' + (chart3minusprice).toLocaleString("en-US");
						$("#chart3_month_overTarget1").removeClass("text-success");
						$("#chart3_month_overTarget1").addClass("text-danger");
					}
					$("#chart3_month_profitTarget1").html(chart3_month_profitTarget1);
					$("#chart3_month_salesTarget1").html(chart3_month_salesTarget1);
					$("#chart3_month_overTarget1").html(chart3_month_overTarget1);
					$("#chart3_month_percent1").html(chart3_month_percent1);
					//+2번째 관련 아래 테이블 정보
	
						//1번 그래프(월 계획대비 실적)
						var month = date.getMonth() + 1;
				 		$.ajax({
							url: "${path}/salesTarget/gradata.do/" + month, 
							method: "POST",
							dataType: "json",
						})
						.done(function(result){
							var sum = 0;
							var sumlength = result.datanomal.length;
							for(var i=0;i<sumlength;i++){
								sum += result.datanomal[i].price;
							}
							var MonthvatTotal = 0;
							var MonthvatTotallength = result.data.length;
							for(var i=0;i<MonthvatTotallength;i++){
								MonthvatTotal += result.data[i].vatTax + result.data[i].vatAmount;
							}
							var testtest = sum/100;
							var test0314 = (MonthvatTotal/testtest).toFixed(2);
							var test0314test = 100 - test0314
							var TotalmountM = sum - MonthvatTotal;
							
							$("#chart2_month_profitTarget1").html('₩'+sum.toLocaleString("en-US"));
							$("#chart2_month_salesTarget1").html('₩'+MonthvatTotal.toLocaleString("en-US"));
							
							//달성률이 100%이상이라면 색상변경 
							if(test0314 >= 100){
								$("#chart2_month_percent1").html(test0314+'%');	
								$("#chart2_month_percent1").removeClass("text-danger");
								$("#chart2_month_percent1").addClass("text-success");
							}else{
								$("#chart2_month_percent1").html(test0314+'%');
								$("#chart2_month_percent1").removeClass("text-success");
								$("#chart2_month_percent1").addClass("text-danger");
							}
							//달성률이 100%이상이라면 색상변경 
							
							//목표금액을 매출이 넘었다면 색상 변경
							var overOrgin = MonthvatTotal - sum;
							if(overOrgin >= 0) {
								overOrgin = '+₩' + overOrgin.toLocaleString("en-US");
								$("#chart2_month_overTarget1").removeClass("text-danger");
								$("#chart2_month_overTarget1").addClass("text-success");
							} else {
								overOrgin = '-₩' + overOrgin.toLocaleString("en-US");
								$("#chart2_month_overTarget1").removeClass("text-success");
								$("#chart2_month_overTarget1").addClass("text-danger");
							}
							//목표금액을 매출이 넘었다면 색상 변경
							
							$("#chart2_month_overTarget1").html(overOrgin);
							
							//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
							if(test0314 >= 100){
								test0314test = 0;
							}
							//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
							
							const ctx1 = document.getElementById('myChartdoughnut').getContext('2d');
							window.myChartdoughnut = new Chart(ctx1, {
								 type: 'doughnut',
								    data: {
								    	labels: ['달성률', '미달성률'],
								        datasets: [{
								            data: [test0314, test0314test],
								            backgroundColor: [
								            	'rgba(54, 162, 235, 1)',
								                'rgba(255, 99, 132, 1)'
								            ]
								        }]
								    },
								    options: {
								        scales: {
								            y: {
								                beginAtZero: true
								            }
								        }
								    }
								})
							});
							//1번 그래프(월 계획대비 실적)
							
							//2번 그래프(누적 계획대비 실적)
							const ctx2 = document.getElementById('myChartdoughnut1').getContext('2d');
							window.myChartdoughnut1 = new Chart(ctx2, {
								type: 'doughnut',
						    	data: {
							       	labels: ['달성률', '미달성률'],
							       	datasets: [{
								    	data: [priceonepersenttarget, livepersent],
								        backgroundColor: [
								        	'rgba(54, 162, 235, 1)',
								            'rgba(255, 99, 132, 1)'
							            ]
							        }]
								},
							    options: {
								       scales: {
							           y: {
							 	             beginAtZero: true
							              }
						           }
							    }
							})
							//2번 그래프(누적 계획대비 실적)
							
							//4번 그래프(연간 계획대비 실적)
							var myChart1 = echarts.init(document.getElementById('myChart'));
							globalmyChart1 = myChart1;
							option1 = {
								tooltip : {
									trigger: 'axis',
									axisPointer:{
										type:'cross',
										crossStyle: {
											color: '#999'
										}
									}
								},
								legend: {
									data:["월별목표", "월별매출", "누적목표", "누적매출"]
								},
								xAxis : [
									{
										type : 'category',
										splitLine : {
											show:true
										},
										axisPointer: {
											type: 'shadow'
										},
										data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
									},
									{
										type : 'category',
										axisLine : {
											show:true
										},
										axisLabel : {
											show:false
										},
										data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
									}
								],
								yAxis : [
									{
										type: 'value',
										name: '월별(억원)',
										position: 'left',
										axisLine: {
											show: true,
											lineStyle: {
												color: '#999'
											}
										},
										axisLabel: {
											formatter: function (data) {
												return Math.floor(data/10000000)
											}
										}
									},
									{
										type: 'value',
										name: '누적(억원)',
										position: 'right',
										axisLine: {
											show: true,
											lineStyle: {
												color: '#999'
											}
										},
										axisLabel: {
											formatter: function (data) {
												return Math.floor(data/10000000)
											}
										}
									}
								],
								series : [
									{
										name: '월별목표',
										type: 'bar',
										data: [sum01, sum02, sum03, sum04, sum05, sum06, sum07, sum08, sum09, sum10, sum11, sum12]
									},
									{
										name: '월별매출',
										type: 'bar',
										data: [conpletevaclist01, conpletevaclist02, conpletevaclist03, conpletevaclist04, conpletevaclist05, conpletevaclist06, conpletevaclist07, conpletevaclist08, conpletevaclist09, conpletevaclist10, conpletevaclist11, conpletevaclist12]
									},
									{
										name: '누적목표',
										type: 'line',
										yAxisIndex: 1,
										data: [sum01, stacksum01, stacksum02, stacksum03, stacksum04, stacksum05, stacksum06, stacksum07, stacksum08, stacksum09, stacksum10, stacksum11]
									},
									{
										name: '누적매출',
										type: 'line',
										yAxisIndex: 1,
										data: [conpletevaclist01, convacstack01, convacstack02, convacstack03, convacstack04, convacstack05, convacstack06, convacstack07, convacstack08, convacstack09, convacstack10, convacstack11]
									}
								]
							}
							myChart1.setOption(option1);
							globaloption1 = option1;
							//4번 그래프(얀간 계획대비 실적)
							
							//5번 그래프(월간 실적)
							var month = date.getMonth() + 1;
							$.ajax({
								url: "${path}/salesTarget/user_chart.do/" + month, 
								method: "POST",
								dataType: "json",
							})
							.done(function(result){
								var user = new Array();
								var user_target = new Array();
								var user1 = result.data[0].userName;
								var user2 = result.data[1].userName;
								var user3 = result.data[2].userName;
								var user4 = result.data[3].userName;
								var user5 = result.data[4].userName;
								var user6 = result.data[5].userName;
								var user1_target = result.data[0].month_target;
								var user2_target = result.data[1].month_target;
								var user3_target = result.data[2].month_target;
								var user4_target = result.data[3].month_target;
								var user5_target = result.data[4].month_target;
								var user6_target = result.data[5].month_target;
								var user_now_graph1 = result.data[0].test;
								var user_now_graph2 = result.data[1].test;
								var user_now_graph3 = result.data[2].test;
								var user_now_graph4 = result.data[3].test;
								var user_now_graph5 = result.data[4].test;
								var user_now_graph6 = result.data[5].test;
								
								/* for(var i = 0; i < result.data.length; i++){
									user.push(result.data[i].userName);
									user_target.push(result.data[i].month_target);
								} */

									var user_chart = echarts.init(document.getElementById('user_chart'));
									user_chart_main = user_chart;
									option = {
										tooltip : {
											trigger: 'axis',
											axisPointer:{
												type:'cross',
												crossStyle: {
													color: '#999'
												}
											}
										},
										legend: {
											data:["월별목표", "월별매출"]
										},
										xAxis : [
											{
												type : 'category',
												splitLine : {
													show:true
												},
												axisPointer: {
													type: 'shadow'
												},
												data : [user1, user2, user3, user4, user5, user6]
											},
											{
												type : 'category',
												axisLine : {
													show:true
												},
												axisLabel : {
													show:false
												},
												data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
											}
										],
										yAxis : [
											{
												type: 'value',
												name: '월별(억원)',
												position: 'left',
												axisLine: {
													show: true,
													lineStyle: {
														color: '#999'
													}
												},
												axisLabel: {
													formatter: function (data) {
														return Math.floor(data/10000000)
													}
												}
											},
											{
												type: 'value',
												name: '누적(억원)',
												position: 'right',
												axisLine: {
													show: true,
													lineStyle: {
														color: '#999'
													}
												},
												axisLabel: {
													formatter: function (data) {
														return Math.floor(data/10000000)
													}
												}
											}
										],
										series : [
											{
												name: '월별목표',
												type: 'bar',
												data: [user1_target, user2_target, user3_target, user4_target, user5_target, user6_target]
											},
											{
												name: '월별매출',
												type: 'bar',
												data: [user_now_graph1, user_now_graph2, user_now_graph3, user_now_graph4, user_now_graph5, user_now_graph6]
											}
										]
									}
									user_chart.setOption(option);
									user_chart_main = option;
								})
							
							})
							//5번 그래프(월간 실적)
							
						//3번 그래프(전월 대비)
						var date = new Date();
						var month = date.getMonth() + 1;
						var last_month = date.getMonth();
						if(last_month == 12){
							month = 1;
						}
						var STR_month = month + "월"
						var STR_last_month = last_month + "월"
						
						$.ajax({
							url: "${path}/salesTarget/cnt_mouth_data.do/" + month + "/" +  last_month,
							method: "POST",
							dataType: "json",
						})
						.done(function(result){
							const ctx3 = document.getElementById('bar_chart').getContext('2d');
							window.bar_chart = new Chart(ctx3, {
								type: 'bar',
						    	data: {
							       	labels: [STR_last_month, STR_month],
							       	datasets: [{
								    	data: [result.data_last[0].count, result.data[0].count],
								        backgroundColor: [
								        	'rgba(54, 162, 235, 1)',
								            'rgba(255, 99, 132, 1)'
							            ]
							        }]
								},
							    options: {
									scales: {
										y: {
								            beginAtZero: true
							            }
									},
								 	legend: {
										display: false,
									},
							    }
							})	
							
						});
						//3월 그래프(전월 대비)
			
						//+1번째 그래프 관련 아래 테이블 정보 및 change event
						$("#graph2TargetMonth1").on("change", function(){
							var graph2TargetMonth1 = Number($("#graph2TargetMonth1").val());
				
							 $.ajax({
								url: "${path}/salesTarget/gradata.do/" + graph2TargetMonth1, 
								method: "POST",
								dataType: "json",
							 })
								.done(function(result){
									var sum = 0;
									var sumlength = result.datanomal.length;
									for(var i=0;i<sumlength;i++){
										sum += result.datanomal[i].price;
									}
									var MonthvatTotal = 0;
									var MonthvatTotallength = result.data.length;
									for(var i=0;i<MonthvatTotallength;i++){
										MonthvatTotal += result.data[i].vatTax + result.data[i].vatAmount;
									}
									var testtest = sum/100;
									var test0314 = (MonthvatTotal/testtest).toFixed(2);
									var test0314test = 100 - test0314
									var TotalmountM = sum - MonthvatTotal;
									
									$("#chart2_month_profitTarget1").html('₩'+sum.toLocaleString("en-US"));
									$("#chart2_month_salesTarget1").html('₩'+MonthvatTotal.toLocaleString("en-US"));
									if(test0314 >= 100){
										$("#chart2_month_percent1").html(test0314+'%');	
										$("#chart2_month_percent1").removeClass("text-danger");
										$("#chart2_month_percent1").addClass("text-success");
									}else{
										$("#chart2_month_percent1").html(test0314+'%');
										$("#chart2_month_percent1").removeClass("text-success");
										$("#chart2_month_percent1").addClass("text-danger");
									}
									var overOrgin = MonthvatTotal - sum;
									if(overOrgin >= 0) {
										overOrgin = '+₩' + overOrgin.toLocaleString("en-US");
										$("#chart2_month_overTarget1").removeClass("text-danger");
										$("#chart2_month_overTarget1").addClass("text-success");
									} else {
										overOrgin = '-₩' + overOrgin.toLocaleString("en-US");
										$("#chart2_month_overTarget1").removeClass("text-success");
										$("#chart2_month_overTarget1").addClass("text-danger");
									}
									$("#chart2_month_overTarget1").html(overOrgin);
									//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
									if(test0314 >= 100){
										test0314test = 0;
									}
									//달성률이 100%이상일때 그래프 미달성률 0%로 만들기
									const ctx1 = document.getElementById('myChartdoughnut').getContext('2d');
									if(window.myChartdoughnut != undefined){
										window.myChartdoughnut.destroy();
									}
									window.myChartdoughnut = new Chart(ctx1, {
										type: 'doughnut',
										data: {
										    labels: ['달성률', '미달성률'],
										    datasets: [{
									  	    	data: [test0314, test0314test],
										        backgroundColor: [
										        	'rgba(54, 162, 235, 1)',
										            'rgba(255, 99, 132, 1)'
										        ]
										    }]
										},
										options: {
										    scales: {
										        y: {
										            beginAtZero: true
								          		}
										    }
										}
									})
								})
							})
							//+1번째 그래프 관련 아래 테이블 정보 및 change event
							
							//+5번째 그래프 관련 아래 테이블 정보 및 change event
							$("#myChart_user_mounth").on("change", function(){
								var mounth = $("#myChart_user_mounth").val();
								$.ajax({
									url: "${path}/salesTarget/user_chart.do/" + mounth,
									method: "POST",
									dataType: "json",
								})
								.done(function(result){
									var user = new Array();
									var user_target = new Array();
									var user1 = result.data[0].userName;
									var user2 = result.data[1].userName;
									var user3 = result.data[2].userName;
									var user4 = result.data[3].userName;
									var user5 = result.data[4].userName;
									var user6 = result.data[5].userName;
									var user1_target = result.data[0].month_target;
									var user2_target = result.data[1].month_target;
									var user3_target = result.data[2].month_target;
									var user4_target = result.data[3].month_target;
									var user5_target = result.data[4].month_target;
									var user6_target = result.data[5].month_target;
									var user_now_graph1 = result.data[0].test;
									var user_now_graph2 = result.data[1].test;
									var user_now_graph3 = result.data[2].test;
									var user_now_graph4 = result.data[3].test;
									var user_now_graph5 = result.data[4].test;
									var user_now_graph6 = result.data[5].test;
									
									/* for(var i = 0; i < result.data.length; i++){
										user.push(result.data[i].userName);
										user_target.push(result.data[i].month_target);
									} */

										var user_chart = echarts.init(document.getElementById('user_chart'));
										user_chart_main = user_chart;
										option = {
											tooltip : {
												trigger: 'axis',
												axisPointer:{
													type:'cross',
													crossStyle: {
														color: '#999'
													}
												}
											},
											legend: {
												data:["월별목표", "월별매출"]
											},
											xAxis : [
												{
													type : 'category',
													splitLine : {
														show:true
													},
													axisPointer: {
														type: 'shadow'
													},
													data : [user1, user2, user3, user4, user5, user6]
												},
												{
													type : 'category',
													axisLine : {
														show:true
													},
													axisLabel : {
														show:false
													},
													data : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
												}
											],
											yAxis : [
												{
													type: 'value',
													name: '월별(억원)',
													position: 'left',
													axisLine: {
														show: true,
														lineStyle: {
															color: '#999'
														}
													},
													axisLabel: {
														formatter: function (data) {
															return Math.floor(data/10000000)
														}
													}
												},
												{
													type: 'value',
													name: '누적(억원)',
													position: 'right',
													axisLine: {
														show: true,
														lineStyle: {
															color: '#999'
														}
													},
													axisLabel: {
														formatter: function (data) {
															return Math.floor(data/10000000)
														}
													}
												}
											],
											series : [
												{
													name: '월별목표',
													type: 'bar',
													data: [user1_target, user2_target, user3_target, user4_target, user5_target, user6_target]
												},
												{
													name: '월별매출',
													type: 'bar',
													data: [user_now_graph1, user_now_graph2, user_now_graph3, user_now_graph4, user_now_graph5, user_now_graph6]
												}
											]
										}
										user_chart.setOption(option);
										user_chart_main = option;
								})
							});
							//+5번째 그래프 관련 아래 테이블 정보 및 change event
							setTimeout(function(){
								$.LoadingOverlay("hide", true);
							}, 4000);
		});
		//첫화면 로드 시============================================================================
	</script>
</div>
<jsp:include page="../body-bottom.jsp"/>