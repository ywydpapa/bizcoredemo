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
		int day = calendar.get(Calendar.DATE);
		String monthStr = "";
		String dayStr = "";
		if(month < 10){
			monthStr = "0"+ String.valueOf(month);
		} else {
			monthStr = String.valueOf(month);
		}
		if(day < 10){
			dayStr = "0" +  String.valueOf(day);
		}else {
			dayStr = String.valueOf(day);
		}
	%>
	<div class="page-header2">
		<div class="row align-items-end">
			<div class="col-lg-12">
				<div class="page-header-title">
					<div class="d-inline">
						유지보수 계약 <small style="color:gray;">2022년 <%=monthStr%>월 <%=dayStr%>일 기준</small>
					</div>
				</div>
				
			</div>
		</div>
	</div>
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
			
			<!-- test 횟수 -->
			<div class="col-md-2" style="min-width: auto; min-height: 94%;">
				<div class="card" style="width: auto; height: 94%; ">
					<div class="card-header" style="padding: 25px 12px;">
						<div id="center_text">
							<h5>유지보수 계약 예상 현황</h5>
							<div>
								<h1><input class="form-control" type="text" id="count1" value="" /></h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- test 횟수 -->
			<!-- test 횟수 -->
			<div class="col-md-2" style="min-width: auto; min-height: 94%;">
				<div class="card" style="width: auto; height: 94%; ">
					<div class="card-header" style="padding: 25px 12px;">
						<div id="center_text">
							<h5>유지보수 계약 현황</h5>
							<div>
								<h1><input class="form-control" type="text" id="count2" value="" /></h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- test 횟수 -->
			<!-- test 횟수 -->
			<div class="col-md-2" style="min-width: auto; min-height: 94%;">
				<div class="card" style="width: auto; height: 94%; ">
					<div class="card-header" style="padding: 25px 12px;">
						<div id="center_text">
							<h5 id="center_text">계산서 미발행/미연결 현황</h5>
							<div>
								<h1><input class="form-control" type="text" id="count3" value="" /></h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- test 횟수 -->
			<!-- test 횟수 -->
			<div class="col-md-6" style="min-width: auto; min-height: 94%;">
				<div class="card" style="width: auto; height: 94%; ">
					<div class="card-header" style="padding: 25px 12px;">
						<div id="center_text">
							<h5 id="center_text">유지보수 계약 현황 금액</h5>
							<div style="vertical">
								<h1><input class="form-control" type="text" id="count4" value="" /></h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- test 횟수 -->
			<!-- 1번째 그래프 -->
			<div class="col-md-12" style="min-width: auto; min-height: 94%;">
				<div class="card" style="width: auto; height: 94%; ">
					<div class="card-header" style="padding: 25px 12px;">
					</div>
					<div class="defalut_gra">
						<canvas id="myChart" width="400" height="200"></canvas>
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
		</div>
	</div>
	<style>
		body {
			font-family: "微軟正黑體", Arial, Helvetica, sans-serif;
			background-color: #ffffff;
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
		
		#count1, #count2, #count3, #count4 {
			border: none;
			text-align: center;
			font-size: 40px;
			margin-top: 25px;
		}
		#center_text{
			text-align: center;
			display: inline-block;
		}
	</style>
	<script>
		$(document).ready(function() {
			$.ajax({
				url: "${path}/acc/count_maintenance.do", 
				method: "POST",
				dataType: "json",
			})
			.done(function(result){
				$('#count1').val(result.count1.length + ' 개');
				$('#count2').val(result.count2.length + ' 개');
				$('#count3').val(result.count3.length + ' 개');
				$('#count4').val(result.sum.toLocaleString("en-US") + ' 원');
				//유지보수 월 추가 후
			});
		});
	
	
	
		 var today = new Date();
		var day = ('0' + today.getDate()).slice(-2);
		
		var ctx = document.getElementById("myChart");
		var chart = new Chart(ctx, {
		  type: "bar",
		  data: {
		    labels: ["2020/02/17", "", "2020/02/23", "", "2020/02/29", ""],
		    datasets: [
		      {
		        type: "bar",
		        backgroundColor: "rgba(54, 162, 235, 0.2)",
		        borderColor: "rgba(54, 162, 235, 1)",
		        borderWidth: 1,
		        label: "bar_chart",
		        data: [60, 49, 72, 90, 100, 60]
		      },
		      {
		        type: "line",
		        label: "line_chart",
		        data: [25, 13, 30, 35, 25, 40],
		        lineTension: 0, 
		        fill: true 
		      }
		    ]
		  }
		});
		var ctx = document.getElementById("myChart2");
		var chart = new Chart(ctx, {
		  type: "bar",
		  data: {
		    labels: ["2020/02/17", "", "2020/02/23", "", "2020/02/29", ""],
		    datasets: [
		      {
		        type: "bar",
		        backgroundColor: "rgba(54, 162, 235, 0.2)",
		        borderColor: "rgba(54, 162, 235, 1)",
		        borderWidth: 1,
		        label: "bar_chart",
		        data: [60, 49, 72, 90, 100, 60]
		      },
		      {
		        type: "line",
		        label: "line_chart",
		        data: [25, 13, 30, 35, 25, 40],
		        lineTension: 0, 
		        fill: true 
		      }
		    ]
		  }
		}); 
		
		const ctx2 = document.getElementById('myChartdoughnut1').getContext('2d');
		window.myChartdoughnut1 = new Chart(ctx2, {
			type: 'doughnut',
	    	data: {
		       	labels: ['달성률', '미달성률'],
		       	datasets: [{
			    	data: [1, 2],
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
	</script>
<jsp:include page="../body-bottom.jsp"/>