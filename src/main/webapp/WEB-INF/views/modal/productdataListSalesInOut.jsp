<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

<div class="dt-responsive table-responsive">
	<table id="productdataTable" class="table table-striped table-bordered nowrap">
		<thead>
		<tr>
			<th>-</th>
			<th>제품코드명</th>
			<th>상품명</th>
			<th>상품설명(상세)</th>
			<th>거래처</th>
		</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<style>
	.miniTable {
		border: 2px solid;
	}
	.miniTable > tbody > tr > td{
		text-align: center;
	}
	td.details-control {
		background: url('/assets/images/details_open.png') no-repeat center center;
		cursor: pointer;
	}
	tr.shown td.details-control {
		background: url('/assets/images/details_close.png') no-repeat center center;
	}
	#productdataTable > tbody > tr > td > a {
		text-decoration: underline;
	}
</style>
<script>
	var productdataTable = $('#productdataTable').DataTable({
		info:false,
		searching: true,
		oLanguage: {
			sZeroRecords : "일치하는 데이터가 존재하지 않습니다.",
			sInfo : "현재 _START_ - _END_ / _TOTAL_건",
			slengthMenu: "페이지당 _MENU_ 개씩 보기",
			sInfoEmpty: "데이터 없음",
			sInfoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
			sSearch : "내부검색 : ",
			sProcessing : '데이터 불러오는중...',
			oPaginate: {
				sFirst : '처음으로',
				sLast : '마지막으로',
				sPrevious: "이전",
				sNext: "다음"
			}
		},
		columns : [
			{
				"className":      'details-control',
				"orderable":      false,
				"data":           null,
				"defaultContent": ''
			},
			{data : 'productCategoryName'},
			{data : 'productName'},
			{data : 'productDesc'},
			{data : 'custName'},
		],
		columnDefs: [
			{
				render : function (data, type, row) {
					// 마우스 올리면 또는 클릭하면 툴팁으로 데이터 상세 표시 ** AJAX로 구현이 필요
					return '<a href="javascript:void(0);" onclick="fnSetproductdata('+row.productNo+',\''+data+'\')">'+ data +'</a>';
				},
				targets: 2
			}
		]
	});

	var productdataJson;
	function fn_productdataTableReload(){
		$.ajax({
			type: "get",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			url : '${path}/product/listAjax'
		}).done(function (result) {
			var newData = JSON.parse(result);
			console.dir(newData);

			if(newData.data != "") {
				var arr = JSON.parse(newData.data);
				// 글로벌 변수에 저장한다. 상세보기때 참고할 변수!!
				productdataJson = arr;
				productdataTable.clear();
				for (var i = 0; i < arr.length; i++) {
					productdataTable.row.add(arr[i]).draw();
				}
			}
		})
	}

	var html = '';
	// Add event listener for opening and closing details
	$('#productdataTable tbody').on('click', 'td.details-control', function () {
		var tr = $(this).closest('tr');
		var row = productdataTable.row(tr);
		if ( row.child.isShown() ) {
			// This row is already open - close it
			row.child.hide();
			tr.removeClass('shown');
		}
		else {
			// Open this row
			var td = $(tr).find("td");
			var obj = new Object();
			for(var i=0; i<productdataJson.length; i++){
				if(productdataJson[i].productCategoryName == td[1].innerText &&
						productdataJson[i].productName == td[2].innerText &&
						productdataJson[i].custName == td[4].innerText
				){
					obj.compNo = productdataJson[i].compNo;
					obj.custNo = productdataJson[i].custNo;
					obj.productNo = productdataJson[i].productNo;
				}
			}
			$.ajax({
				url : '${path}/product/listAjax/detail',
				type: "post",
				contentType: "application/json; charset=UTF-8",
				data : JSON.stringify(obj),
				dataType : 'json'
			}).done(function (result) {
				if(result.data != "") {
					result = JSON.parse(result.data);
					html = '<table class="miniTable">' +
							'<colgroup>' +
							'<col width="10%"/>' +
							'<col width="60%"/>' +
							'<col width="30%"/>' +
							'</colgroup>' +
							'<thead>';
					html += '<tr>';
					html += '<th>'+'번호'+'</th>';
					html += '<th>'+'모델명'+'</th>';
					html += '<th>'+'가격'+'</th>';
					html += '</tr></thead><tbody>';
					for(var i=0; i<result.length; i++){
						html += '<tr>';
						html += '<td>'+(i+1)+'</td>';
						html += '<td>'+result[i].productModel+'</td>';
						html += '<td>'+result[i].productPrice+'</td>';
						html += '</tr>';
					}
					html += '</tbody></table>';
				} else {
					html = "데이터 없음";
				}
				row.child(html).show();
				tr.addClass('shown');
			})
		}
	});
</script>

