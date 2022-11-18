<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="row">
	<div class="col-md-12 col-lg-4">
		<div class="card">
			<div class="card-header">
				<h5>Doughnut chart</h5>
				<span>lorem ipsum dolor sit amet, consectetur adipisicing
					elit</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<canvas id="myChart" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-4">
		<div class="card">
			<div class="card-header">
				<h5>Radar chart</h5>
				<span>lorem ipsum dolor sit amet, consectetur adipisicing
					elit</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<canvas id="radarChart" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-4">
		<div class="card">
			<div class="card-header">
				<h5>Polar chart</h5>
				<span>lorem ipsum dolor sit amet, consectetur adipisicing
					elit</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<canvas id="polarChart" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-4">
		<div class="card">
			<div class="card-header">
				<h5>Pie chart</h5>
				<span>lorem ipsum dolor sit amet, consectetur adipisicing
					elit</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<canvas id="pieChart" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-4">
		<div class="card">
			<div class="card-header">
				<h5>Bar chart</h5>
				<span>lorem ipsum dolor sit amet, consectetur adipisicing
					elit</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<canvas id="barChart" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-4">
		<div class="card">
			<div class="card-header">
				<h5>Bubble Chart</h5>
				<span>lorem ipsum dolor sit amet, consectetur adipisicing
					elit</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<canvas id="bubblechart" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-4">
		<div class="card">
			<div class="card-header">
				<h5>Scales chart</h5>
				<span>lorem ipsum dolor sit amet, consectetur adipisicing
					elit</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<canvas id="stancechart" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-lg-4">
		<div class="card">
			<div class="card-header">
				<h5>Time Scale chart</h5>
				<span>lorem ipsum dolor sit amet, consectetur adipisicing
					elit</span>
				<div class="card-header-right">
					<i class="icofont icofont-spinner-alt-5"></i>
				</div>
			</div>
			<div class="card-block">
				<canvas id="timescalechart" width="400" height="400"></canvas>
			</div>
		</div>
	</div>
</div>