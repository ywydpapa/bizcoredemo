var progress_chart	= null;
var month_chart	= null;
var accum_chart	= null;
var annual_chart	= null;
function show_dashlet(order, num, edit) {
    if (edit == undefined) edit = true;
    var param = new Array(num, order, edit);
    _ajax_html('/sfa/dashboard/dashlet.xhr.php', 'order=' + order, output_dashlet, param);
}
function show_new_dashlet(order, num, query) {
    var param = new Array(num, order, true);
    _ajax_html('/sfa/dashboard/dashlet_new.xhr.php', query, output_dashlet, param);
}
function output_dashlet(data) {
    var num	= this.arg[0];
    var order 	= this.arg[1];
    var edit	= this.arg[2];
    /*
    if (parent.$('#custom_dashboard').find('.ibox').length > 0) {
	parent.$('#custom_dashboard').find('.ibox').eq(dashlet_order).html(data);
	parent.$('#custom_dashboard').find('.ibox').eq(dashlet_order).find('.ibox-content').resizable({
	    helper: "ui-resizable-helper",
	    grid: 20,
	    handles: 'n, s',
	    stop: function(event, ui) {
		$(this).css('width', ui.originalSize.width);
	    }
	});
	if (num == '2' || num == '3') {
	    var query = parent.$('#' + order + '_cond :input').serialize() + "&order=" + order;
	    //_ajax("/sfa/dashboard/xhr/mbo_this_month.xhr.php", query, output_mbo_this_month);
	}
    } else {
	alert('bb');
	$('#custom_dashboard').find('.ibox').eq(dashlet_order).html(data);
    }
    */
    $('#custom_dashboard').find('.ibox').eq(order).html(data);
    $('#custom_dashboard').find('.ibox').eq(order).removeClass('dashlet');
    if (edit == false) {
	$('#custom_dashboard').find('.ibox').eq(order).find('.ibox-tools').remove();
	$('#custom_dashboard').find('.ibox').eq(order).find('.ibox-title').append('<div class="ibox-tools"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></div>');
    }
    if (num == '2') {
	var query = $('#' + order + '_cond :input').serialize() + "&order=" + order;
	console.log(query);
	_ajax("/sfa/dashboard/xhr/mbo_this_month.xhr.php", query, output_mbo_this_month);
    } else if (num == '3') {
	var query = $('#' + order + '_cond :input').serialize() + "&order=" + order;
	_ajax("/sfa/dashboard/xhr/mbo_accumulate.xhr.php", query, output_mbo_accum);
    } else if (num == '4') {
	var query = $('#' + order + '_cond :input').serialize() + "&order=" + order;
	_ajax("/sfa/dashboard/xhr/mbo_annual.xhr.php", query, output_mbo_annual);
    } else if (num == '5') {
	var query = $('#' + order + '_cond :input').serialize() + "&order=" + order;
	_ajax("/sfa/dashboard/xhr/mbo_progress.xhr.php", query, output_mbo_progress);
    }

}
function output_mbo_this_month(data) {
    var order 	= data.order;
    var title	= data.title;
    $('#' + order + '_month_plan').text(data.month_plan);
    $('#' + order + '_month_sum').text(data.month_sum);
    $('#' + order + '_month_text').html(data.month_text);
    $('#' + order + '_month_per').text(data.month_per + '%');
    var option = {
	toolbox: {
	    show : false
	},
	series : [
	    {
		type:'gauge',
		min: 0,                     
		max: 120,                   
		precision: 0,               
		splitNumber: 6,             
		axisLine: {            
		    show: true,        
		    lineStyle: {       
			//color: [[0.17, '#d1dade'], [0.833, '#3DB7CC'],[1, '#ff4500']], 
			width: 30
		    }
		},
		title : {
		    show : false
		},
		detail : {
		    show : true,
		    backgroundColor: 'rgba(0,0,0,0)',
		    borderWidth: 0,
		    borderColor: '#ccc',
		    width: 100,
		    height: 20,
		    formatter:'{value}%',
		    offsetCenter: [0, '60%'],
		    textStyle: {       
			color: 'auto',
			fontSize : 30 
		    }
		},
		data:[{value: data.month_per}]
	    }
	]
    };
    month_chart = echarts.init(document.getElementById(order + '_this_month_chart'));
    month_chart.setOption(option);
}
function output_mbo_accum(data) {
    var order 	= data.order;
    $('#' + order + '_accum_plan').text(data.accum_plan);
    $('#' + order + '_accum_sum').text(data.accum_sum);
    $('#' + order + '_accum_text').html(data.accum_text);
    $('#' + order + '_accum_per').text(data.accum_per + '%');
    var option = {
	toolbox: {
	    show : false
	},
	series : [
	    {
		type:'gauge',
		min: 0,                     
		max: 120,                   
		precision: 0,               
		splitNumber: 6,             
		axisLine: {            
		    show: true,        
		    lineStyle: {       
			//color: [[0.17, '#d1dade'], [0.833, '#3DB7CC'],[1, '#ff4500']], 
			width: 30
		    }
		},
		title : {
		    show : false
		},
		detail : {
		    show : true,
		    backgroundColor: 'rgba(0,0,0,0)',
		    borderWidth: 0,
		    borderColor: '#ccc',
		    width: 100,
		    height: 20,
		    formatter:'{value}%',
		    offsetCenter: [0, '60%'],
		    textStyle: {       
			color: 'auto',
			fontSize : 30 
		    }
		},
		data:[{value: data.accum_per}]
	    }
	]
    };
    accum_chart = echarts.init(document.getElementById(order + '_mbo_accum_chart'));
    accum_chart.setOption(option);
}
function output_mbo_annual(data) {
    var order 	= data.order;
    $('#' + order + '_annual_plan').text(data.annual_plan);
    $('#' + order + '_annual_sum').text(data.annual_sum);
    $('#' + order + '_annual_text').html(data.annual_text);
    $('#' + order + '_annual_per').text(data.annual_per + '%');
    var option = {
	toolbox: {
	    show : false
	},
	series : [
	    {
		type:'gauge',
		min: 0,                     
		max: 120,                   
		precision: 0,               
		splitNumber: 6,             
		axisLine: {            
		    show: true,        
		    lineStyle: {       
			//color: [[0.17, '#d1dade'], [0.833, '#3DB7CC'],[1, '#ff4500']], 
			width: 30
		    }
		},
		title : {
		    show : false
		},
		detail : {
		    show : true,
		    backgroundColor: 'rgba(0,0,0,0)',
		    borderWidth: 0,
		    borderColor: '#ccc',
		    width: 100,
		    height: 20,
		    formatter:'{value}%',
		    offsetCenter: [0, '60%'],
		    textStyle: {       
			color: 'auto',
			fontSize : 30 
		    }
		},
		data:[{value: data.annual_per}]
	    }
	]
    };
    annual_chart = echarts.init(document.getElementById(order + '_mbo_annual_chart'));
    annual_chart.setOption(option);
}
function output_mbo_progress(data) {
    var order	= data.order;
    var progress_option = {
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
	    data:data.legend
	},
	xAxis : [
	    {
		type : 'category',
		       /*
		position: 'bottom',
		boundaryGap: true,
		axisLine : {
		    show:false
		},
		axisLabel : {
		    show:true,
		    interval: 'auto',    // {number}
		    formatter: '{value}'
		},
		splitLine : {
		    show:false
		},
		splitArea : {
		    show: false
		},
		*/
		splitLine : {
		    show:true
		},
		axisPointer: {
		    type: 'shadow'
		},
		data : data.axis.data
	    },
	    {
		type : 'category',
		axisLine : {
		    show:true
		},
		axisLabel : {
		    show:false
		},
		data : data.axis.data
	    }
	],
	yAxis : [
	    {
		type : 'value',
		position: 'left',
		axisLine : {
		    show:true
		},
		axisLabel : {
		    show:true,
		    interval: 'auto'    // {number}
		},
		splitLine : {
		    show:true
		}
	    },
	    {
		type : 'value',
		axisLine : {
		    show:true
		},
		axisLabel : {
		    show:true,
		    interval: 'auto'    // {number}
		},
		splitLine : {
		    show:true 
		}
	    }
	],
	series : data.series
    };
    progress_chart = echarts.init(document.getElementById(order + '_progress_chart'));
    progress_chart.setOption(progress_option);
}
$(document).on('click', '.dash2-btn-search', function() {
    var order = $(this).attr('order');
    var query = $('#' + order + '_cond :input').serialize() + "&order=" + order;
    _ajax("/sfa/dashboard/xhr/mbo_this_month.xhr.php", query, output_mbo_this_month);
});
$(document).on('click', '.dash3-btn-search', function() {
    var order = $(this).attr('order');
    var query = $('#' + order + '_cond :input').serialize() + "&order=" + order;
    _ajax("/sfa/dashboard/xhr/mbo_accumulate.xhr.php", query, output_mbo_accum);
});
$(document).on('click', '.dash4-btn-search', function() {
    var order = $(this).attr('order');
    var query = $('#' + order + '_cond :input').serialize() + "&order=" + order;
    _ajax("/sfa/dashboard/xhr/mbo_annual.xhr.php", query, output_mbo_annual);
});
$(document).on('click', '.dash5-btn-search', function() {
    var order = $(this).attr('order');
    var query = $('#' + order + '_cond :input').serialize() + "&order=" + order;
    _ajax("/sfa/dashboard/xhr/mbo_progress.xhr.php", query, output_mbo_progress);
});
