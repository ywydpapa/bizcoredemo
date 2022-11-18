$.fn.extend({
    stage: null,
    source: null,
    p_class: null,
    s_class: null,
    m_class: null,
    activity: null,
    p_status: null,
    info_kind: null,
    class_code: null,
    gubun: null,
    gr_code: null,
    sch_co_priority: null,
    nation: null,
    sch_indust_field: null,
    sch_co_type: null,
    pr_code: null,
    part_code: null,
    role: null,
    ct_type: null,
    assign_id: null,
    bill_status: null,
    flg: null,
    assign_flg: null,
    sr_type: null,
    si_type: null,
    sub_p_class: null,
    no_type: null,
    cate_idx: null,
	page: 1,
	url: null,
	tbody: null,
	query: null,
	page_custom_function: null, // 페이지 번호 클릭시 해당 코드 로직을 태우지 않고, custom function을 호출 할수 있음
	hash: null,
	show_list: function(path, query, noinit_page, init) {
	    if (init == true && location.hash) {
		if ($.fn.hash != location.hash.substring(1)) {
		    $.fn.url = path;
		    $.fn.tbody = $(this);
		    $(this).children().remove();
		    param	= location.hash.substring(1);
		    window.location.hash	= param;
		    $.fn.hash = param;

		    // 조건절 셋팅
		    if ($('select[name^=stage]').length > 0) {
			$('select[name^=stage]').val('');
			$('.selectpicker').selectpicker('refresh');
		    }
		    $.fn.stage = new Array();
		    $.fn.source= new Array();
		    $.fn.p_class= new Array();
		    $.fn.s_class= new Array();
		    $.fn.m_class= new Array();
		    $.fn.activity= new Array();
		    $.fn.p_status= new Array();
		    $.fn.info_kind= new Array();
		    $.fn.class_code= new Array();
		    $.fn.gubun= new Array();
		    $.fn.gr_code= new Array();
		    $.fn.sch_co_priority= new Array();
		    $.fn.nation= new Array();
		    $.fn.sch_indust_field= new Array();
		    $.fn.sch_co_type= new Array();
		    $.fn.pr_code= new Array();
		    $.fn.part_code= new Array();
		    $.fn.role= new Array();
		    $.fn.ct_type= new Array();
		    $.fn.assign_id= new Array();
		    $.fn.bill_status= new Array();
		    $.fn.flg= new Array();
		    $.fn.assign_flg= new Array();
		    $.fn.sr_type= new Array();
		    $.fn.si_type= new Array();
		    $.fn.sub_p_class= new Array();
		    $.fn.no_type= new Array();
		    $.fn.cate_idx= new Array();
		    param.split('&').forEach(set_condition);
		    if ($.fn.stage.length > 0) {
			$('select[name^=stage]').val($.fn.stage);
		    }
		    if ($.fn.source.length > 0) {
			$('select[name^=source]').val($.fn.source);
		    }
		    if ($.fn.p_class.length > 0) {
			$('select[name^=p_class]').val($.fn.p_class);
		    }
		    if ($.fn.s_class.length > 0) {
			$('select[name^=s_class]').val($.fn.s_class);
		    }
		    if ($.fn.activity.length > 0) {
			$('select[name^=activity]').val($.fn.activity);
		    }
		    if ($.fn.p_status.length > 0) {
			$('select[name^=status]').val($.fn.p_status);
		    }
		    if ($.fn.info_kind.length > 0) {
			$('select[name^=info_kind]').val($.fn.info_kind);
		    }
		    if ($.fn.class_code.length > 0) {
			$('select[name^=class_code]').val($.fn.class_code);
		    }
		    if ($.fn.gubun.length > 0) {
			$('select[name^=gubun]').val($.fn.gubun);
		    }
		    if ($.fn.gr_code.length > 0) {
			$('select[name^=gr_code]').val($.fn.gr_code);
		    }
		    if ($.fn.sch_co_priority.length > 0) {
			$('select[name^=sch_co_priority]').val($.fn.sch_co_priority);
		    }
		    if ($.fn.nation.length > 0) {
			$('select[name^=nation]').val($.fn.nation);
		    }
		    if ($.fn.sch_indust_field.length > 0) {
			$('select[name^=sch_indust_field]').val($.fn.sch_indust_field);
		    }
		    if ($.fn.sch_co_type.length > 0) {
			$('select[name^=sch_co_type]').val($.fn.sch_co_type);
		    }
		    if ($.fn.pr_code.length > 0) {
			$('select[name^=pr_code]').val($.fn.pr_code);
		    }
		    if ($.fn.part_code.length > 0) {
			$('select[name^=part_code]').val($.fn.part_code);
		    }
		    if ($.fn.role.length > 0) {
			$('select[name^=role]').val($.fn.role);
		    }
		    if ($.fn.ct_type.length > 0) {
			$('select[name^=type]').val($.fn.ct_type);
		    }
		    if ($.fn.assign_id.length > 0) {
			$('select[name^=assign_id]').val($.fn.assign_id);
		    }
		    if ($.fn.bill_status.length > 0) {
			$('select[name^=bill_status]').val($.fn.bill_status);
		    }
		    if ($.fn.flg.length > 0) {
			$('select[name^=flg]').val($.fn.flg);
		    }
		    if ($.fn.assign_flg.length > 0) {
			$('select[name^=assign_flg]').val($.fn.assign_flg);
		    }
		    if ($.fn.sr_type.length > 0) {
			$('select[name^=sr_type]').val($.fn.sr_type);
		    }
		    if ($.fn.si_type.length > 0) {
			$('select[name^=si_type]').val($.fn.si_type);
		    }
		    if ($.fn.sub_p_class.length > 0) {
			$('select[name^=sub_p_class]').val($.fn.sub_p_class);
		    }
		    if ($.fn.no_type.length > 0) {
			$('select[name^=no_type]').val($.fn.no_type);
		    }
		    if ($.fn.cate_idx.length > 0) {
			$('select[name^=cate_idx]').val($.fn.cate_idx);
		    }
		    $('.selectpicker').selectpicker('refresh');

		    _ajax(path, param, $.fn.data_output, undefined, true);
		    if (typeof tiny_output == 'function') {
			//tiny_output();
		    }
		}
	    } else {
		var q = '';
		if (query != undefined) {
			q += "&"+query;
			$.fn.query = query;
			if (noinit_page != true) {
				$.fn.page = 1; // 쿼리가 변경되었다는 것은 새로운 데이터를 가져온다는 의미로 해석. 페이지 초기화.
			}
		} else {
			q += "&"+$.fn.query;
		}
		var param = "page="+$.fn.page+q;

		$.fn.url = path;
		$.fn.tbody = $(this);
		$(this).children().remove();
		window.location.hash	= param;
		$.fn.hash = param;
		_ajax(path, param, $.fn.data_output, undefined, true);
		return;
	    }
	},
	data_output: function(data) {
		_loading(0);
		if (data.success != undefined) {
			ajax_resp(data);
			return;
		}
		if (data.debug != undefined) {
			if (data.debug) {
				goto_debug();
			}
		}
		var obj = $.fn.tbody;
		var page_cnt = 0;
		var next_page = false;
		var list_cnt = 0;
		var total_cnt = 0;
		var total_amount = 0;
		var total_net_profit = 0;
		var total_cost	= 0;
		var total_with_vat	= 0;
		var complete_bill = 0;
		var reg_date_flg	= 0;
		var display_mode	= '';

		if (data.page_cnt != undefined) {
			page_cnt = data.page_cnt;
		}
		if (data.next_page != undefined) {
			next_page = data.next_page;
		}
		if (data.list_cnt != undefined) {
			list_cnt = data.list_cnt;
		}
		if (data.total_cnt != undefined) {
			total_cnt = data.total_cnt;
		}
		if (data.total_amount != undefined) {
			total_amount = data.total_amount;
		}
		if (data.total_net_profit != undefined) {
			total_net_profit = data.total_net_profit;
		}
		if (data.total_cost != undefined) {
			total_cost = data.total_cost;
		}
		if (data.total_with_vat	!= undefined) {
			total_with_vat	= data.total_with_vat;
		}
		if (data.display_mode != undefined) {
			display_mode	= data.display_mode;
		}
		if (data.reg_date_flg != undefined) {
		    reg_date_flg = data.reg_date_flg;
		    if (reg_date_flg == 1) {
			$('#mod_date_str').text(JS_TEXT['reg_date']);
		    } else {
			$('#mod_date_str').text(JS_TEXT['mod_date']);
		    }

		}
		if (data.complete_bill != undefined) {
		    complete_bill = data.complete_bill;
		    if (complete_bill > 0) {
			$('#complete_bill').hide();
			$('#not_complete_bill').show();
		    } else {
			$('#complete_bill').show();
			$('#not_complete_bill').hide();
		    }
		} else {
		    $('#complete_bill').show();
		    $('#not_complete_bill').hide();
		}

		var total;
		if (data.total != undefined) {
			total = data.total;
		}

		$(obj).children().remove();
		$('#total_cnt').text(total_cnt);
		$('#total_amount').text(total_amount);
		$('#total_net_profit').text(total_net_profit);
		$('#total_with_vat').text(total_with_vat);
		$('#total_cost').text(total_cost);
		if (data.field != undefined) {
		    code += '<tr>';
		    $.each(data.field, function(k2, v) {
			code += '<th>' + v + '</th>';
		    });
		    code += '</tr>';
		    $(obj).append(code);
		}

		var code = '';
		var cnt = 0;
		var line_cnt = 0;
		if ($(obj).attr("id") == 'stock_pr_list') { // stock_list
		    $.each(data, function(k, dt) {
			if (k == 'page_cnt' || k == 'next_page') {
				return true;
			}
			code += '<tr>';
			cnt = 0;
			$.each(dt, function(k2, v) {
			    if (k2 == '') {
				code += '<input type="hidden" name="stock_seq[]" value="' + v + '" />';
			    } else {
				code += '<td>';
				if (v != null) {
				    if (k2 == 'pr_name') {
					code += '<input type="hidden" name="stock_pr_name[]" value="' + v + '" />';
				    } else if (k2 == 'pr_sn') {
					code += '<input type="hidden" name="stock_sn[]" value="' + v + '" />';
				    } else if (k2 == 'price') {
					code += '<input type="hidden" name="stock_price[]" value="' + v + '" />';
				    }
				    code += v;
				}
				code += '</td>';
				cnt++;
			    }
			});
			code += '</tr>';
		    });
		} else if ($(obj).attr('id') == 'request_list') { // 발주요청조회
		    $.each(data, function(k, dt) {
			    if (k == 'page_cnt' || k == 'next_page' || k == 'total' || k == 'debug' || k == 'list_cnt' || k == 'total_cnt' || k == 'total_amount' || k == 'total_with_vat' || k == 'field' || k == 'complete_bill' || k == 'total_net_profit') {
				    return true;
			    }
			    var rowspan	= '';
			    if (dt['rowspan'] != undefined) {
				rowspan	= dt['rowspan'];
			    }
			    cnt = 0;
			    code += '<tr>';
			    $.each(dt, function(k2, v) {
				if (k2 == 'rowspan') {
				    return true;
				}
				if (k2.indexOf('product_') < 0) {
				    if (rowspan != '') {
					code += '<td rowspan="' + rowspan + '">';
				    } else {
					code += '<td>';
				    }
				} else {
				    code += '<td>';
				}
				if (v != null) {
					code += v;
				}
				code += '</td>';
				cnt++;
			    });
			    code += '</tr>';
		    });
		} else {
		    $.each(data, function(k, dt) {
			    if (k == 'page_cnt' || k == 'next_page' || k == 'total' || k == 'debug' || k == 'list_cnt' || k == 'total_cnt' || k == 'total_amount' || k == 'total_with_vat' || k == 'field' || k == 'complete_bill' || k == 'display_mode' || k == 'total_net_profit' || k == 'total_cost') {
				    return true;
			    }
			    if (dt['td_class'] != undefined) {
				code += '<tr class="' + dt['td_class'] + '">';
			    } else if (dt['key'] == undefined) {
				code += '<tr>';
			    } else {
				    code += '<tr id="key_'+dt['key']+'">';
			    }
			    cnt = 0;
			    $.each(dt, function(k2, v) {
				    if (k2 == 'key' || k2 == 'td_class') {
					    return true;
				    }
				    code += '<td>';
				    if (v != null) {
					    code += v;
				    }
				    code += '</td>';
				    cnt++;
			    });
			    code += '</tr>';
		    });
		}
		if (display_mode == '1') {
		    $('.ma-th').hide();
		    $('.svc-th').hide();
		    $('.po-th').show();
		} else if (display_mode == '2') {
		    $('.ma-th').hide();
		    $('.po-th').hide();
		    $('.svc-th').show();
		} else if (display_mode == '3') {
		    $('.ma-th').show();
		    $('.po-th').hide();
		    $('.svc-th').hide();
		} else if (display_mode == 'dft') {
		    $('.ma-th').hide();
		    $('.po-th').hide();
		    $('.svc-th').hide();
		}
		$(obj).append(code);
		code = '';

		$('.table2').parent().parent().css('padding', '0px'); /* bill list ..appliacne list */

		/* if exists checkbox, th check event setting */
		$(obj).prev().find('th input:checkbox').removeAttr('checked');
		$(obj).prev().find('th input:checkbox').unbind('change');
		$(obj).prev().find('th input:checkbox').change(function() {
			if ($(this).is(':checked')) {
				$(obj).find('td input:checkbox').not(":checked").click();
			} else {
				$(obj).find('td input:checkbox:checked').click();
			}
		});
		$(obj).find('td input:checkbox').change(function() {
			if ($(this).is(':checked') == false) {
				if ($(obj).prev().find('th input:checkbox').is(':checked')) {
					$(obj).prev().find('th input:checkbox').attr('checked', false);
				}
			}
		});

		if (page_cnt == 0 && list_cnt == 0) { // no data
		    $('#paging').html('').children().remove();
			var colspan = $(obj).parent().find('th').length;
			$(obj).html('<tr><td class="text-center no-data" colspan="' + colspan + '">' + JS_TEXT['no_data'] + '</td></tr>');
			//$('#paging').html('<span>' + JS_TEXT['no_data'] + '</span>').addClass('no_data');
			return;
		}

		var first_page = 1;
		if ($.fn.page > 10) {
			var remain = page_cnt % 10;
			if (remain > 0) {
				first_page = page_cnt - (remain - 1);
			} else {
				first_page = page_cnt - 9;
			}
		}
		var pages = '';
		var cls = '';
		for (var pg=first_page; pg <= page_cnt; pg++) {
			if ($.fn.page == pg) {
				cls = 'active';
			} else {
				cls = 'page';
			}
			pages += '<li class="'+cls+'"><a>'+pg+'</a></li>';
		}
		var page_class = '';
		if ($(obj).attr("id") == 'stock_pr_list') {
		    page_class = ' pagination-sm';
		}
		var left = '<nav aria-label="Page navigation"><ul class="pagination' + page_class + '">';
		if ($.fn.page > 10) { // prev button
		    left += '<li><a id="prev_btn"><span aria-hidden="true">&laquo;</span></a></li>';
		} else {
		    left += '<li class="disabled"><a><span aria-hidden="true">&laquo;</span></a></li>';
		}
		var right = '';
		if (next_page == true) {
		    right = '<li><a id="next_btn"><span aria-hidden="true">&raquo;</span></a></li>';
		} else {
		    right = '<li class="disabled"><a><span aria-hidden="true">&raquo;</span></a></li>';
		}
		right += '</ul></nav>';

		/* show html */
		$('#paging').html('').children().remove();
		//$('#paging').removeClass('paging').addClass('paging').removeClass('no_data').css('width', $(obj).parent().css('width'));
		if (total != undefined) {
			$('#paging').html('<span class="page_total">' + JS_TEXT['total_cnt'] + ' : ' +total+ ' '+ JS_TEXT['case'] +'</span>');
		}
		$('#paging').append(left + pages + right);
		//$('#paging').append(left).append(pages).append(right).append('</ul>');
		$('[data-toggle="tooltip"]').tooltip(); 

		$('.page').click(function() {
			$.fn.page = $(this).text();
			if ($.fn.page_custom_function == null) {
			    var query = '';
			    if ($('#cond :input').length > 0) {
				query = $('#cond :input').serialize();
			    } else {
				query = $('#condition :input').serialize();
			    }
			    $.fn.tbody.show_list($.fn.url, query, true);
			} else {
				eval($.fn.page_custom_function);
			}
		});

		$('#prev_btn').click(function() {
			$.fn.page = parseInt(first_page - 1);
			if ($.fn.page_custom_function == null) {
			    var query = '';
			    if ($('#cond :input').length > 0) {
				query = $('#cond :input').serialize();
			    } else {
				query = $('#condition :input').serialize();
			    }
			    $.fn.tbody.show_list($.fn.url, query, true);
			}
		});

		$('#next_btn').click(function() {
			$.fn.page = parseInt(pg);
			if ($.fn.page_custom_function == null) {
			    var query = '';
			    if ($('#cond :input').length > 0) {
				query = $('#cond :input').serialize();
			    } else {
				query = $('#condition :input').serialize();
			    }
			    $.fn.tbody.show_list($.fn.url, query, true);
			}
		});
	},
	search_button: function() {
	    $(this).append('<button class="btn btn-primary btn-sm" type="button"><i class="fas fa-search"></i> ' + JS_TEXT['search'] + '</button>');
	    $(this).click(function() {
		$('input[name=orderby]').val('');
		$('input[name=asc_set]').val('');
		refresh();
	    });
	},
	init_button: function() {
	    $(this).append('<button class="btn btn-warning btn-sm" type="button"><i class="fas fa-sync-alt"></i> ' + JS_TEXT['init'] + '</button>');
	    $(this).click(function() {
		$('#condition :input').each(function() {
		    if ($(this).attr("name") == 'syear' || $(this).attr("name") == 'eyear' || $(this).attr("name") == 'section' || $(this).attr('id') == 'sales_team_open' 
			    || $(this).hasClass('tw-control')) {
		    } else {
			$(this).val('');
		    }

		    if ($(this).attr('name') == 'product_gubun') {
			$('.part').hide();
			$('.main').hide();
		    } else if ($(this).attr('name') == 'account_gubun') {
			$('.co_type_class').hide();
		    } else if ($(this).attr('name') == 'pr_gubun') { // status.php
			$('select[name=pr_gubun]').val('1');
			$('.product-cond').show();
			$('.part-cond').hide();
		    }
		});
		$('.selectpicker').selectpicker('refresh');
		$('.tw-control:checked').prop('checked', false);
	    });
	},
	excel_button: function(url, f) {
	    $(this).append('<button class="btn btn-primary btn-sm" type="button"><i class="fas fa-download" aria-hidden="true"></i> ' + JS_TEXT['download'] + '</button>');
	    $(this).click(function() {
		if (f == undefined) {
		    document.condition_form.action = url;
		    document.condition_form.submit();
		} else {
		    f.target = "excel_hidden_frame";
		    f.action = url;
		    f.submit();
		    f.target = "";
		}
	    });
	},
	add_button: function(url) {
	    $(this).append('<button class="btn btn-success btn-sm" type="button"><i class="fas fa-pencil-alt" aria-hidden="true"></i> ' + JS_TEXT['reg'] + '</button>');
	    $(this).click(function() {
		location.href = url;
		return;
	    });
	},
	del_button: function(url) {
	    $(this).append('<button class="btn btn-danger btn-sm" type="button" onclick="$.fn.del(\''+url+'\')"><i class="far fa-trash-alt" aria-hidden="true"></i> ' + JS_TEXT['delete']  + '</button>');
	},
	del: function(url) {
	    var obj = $.fn.tbody;
	    if ($(obj).find('td input:checkbox:checked').length == 0) {
		swal({
		    title:JS_TEXT['no_select'],
		    type:'warning'
		});
		//alert(JS_TEXT['no_select']);
		return false;
	    }
	    var delete_title	= JS_TEXT['ask_delete'];
	    if ($(obj).attr('id') == 'stock_list') { // 재고목록에서 삭제하는 경우
		delete_title	= JS_TEXT['warning_stock_delete'];
	    }

	    swal({
		title:delete_title,
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: "#DD6B55",
		confirmButtonText: JS_TEXT['confirm'],
		closeOnConfirm: true
	    }, function () {
		for (var i=0; i<$('form').length; i++) {
		    if ($('form').eq(i).attr('name') == 'list_frm') {
			var form_name = $('form').eq(i).attr('name');
			break;
		    }
		}
		var data = $(document.forms[form_name]).serialize();
		_ajax(url, data, del_result);
	    });
	}
});

function checkEnterKey() {
    if (window.event.keyCode ==  13) {
	refresh();
	return false;
    }  
    else return false;
}

function refresh(init)
{
    /*
    if (location.href.indexOf('/sfa/schedule/all.php') > 0) {
	var get_date = $('#calendar').fullCalendar('getDate');
	var cal_type	= $('#calendar').fullCalendar('getView').name;
	if (get_date.toString().indexOf('+0000') > 0) {
	    get_date = get_date.toString().replace('+0000', '+0900');
	}
	var date = new Date(get_date);
	var year = date.getFullYear();
	var month = date.getMonth();
	alert(32 - new Date(year, month, 32).getDate());
    }
    */
    var query = $('form[name=condition_form]').serialize();
    if (init == undefined) {
	$.fn.tbody.show_list($.fn.url, query);
	$.fn.page = 1;
    } else {
	$.fn.tbody.show_list($.fn.url, query, true);
    }
    if ($('#s_plan_chart').length > 0) {
	_ajax('/sfa/sales/sales_plan_chart.xhr.php', query, output_graph);
    } else if ($('#s_chart').length > 0) {
	_ajax('/sfa/sales/sales_chart.xhr.php', query, output_graph);
    }
}
function del_result(resp)
{
    _loading(0);
    ajax_resp(resp);

    if (resp.debug != undefined) {
	if (resp.debug == true) {
	    alert("Confirm INPUT/OUTPUT Result...");
	}
    }

    $.fn.tbody.show_list($.fn.url);
}
function set_condition(item, index) {
    var sp	= item.split("=");
    if (sp[0] == 'page') {
	$.fn.page = sp[1];
    } else {
	if (sp[0] != '') {
	    sp[1]	= decodeURIComponent(sp[1]);
	    
	    if (sp[0].indexOf('stage%5B%5D') == 0) {
		$.fn.stage.push(sp[1]);
	    } else if (sp[0].indexOf('source%5B%5D') == 0) {
		$.fn.source.push(sp[1]);
	    } else if (sp[0].indexOf('p_class%5B%5D') == 0) {
		$.fn.p_class.push(sp[1]);
	    } else if (sp[0].indexOf('s_class%5B%5D') == 0) {
		$.fn.s_class.push(sp[1]);
	    } else if (sp[0].indexOf('m_class%5B%5D') == 0) {
		$.fn.m_class.push(sp[1]);
	    } else if (sp[0].indexOf('activity%5B%5D') == 0) {
		$.fn.activity.push(sp[1]);
	    } else if (sp[0].indexOf('status%5B%5D') == 0) {
		$.fn.p_status.push(sp[1]);
	    } else if (sp[0].indexOf('info_kind%5B%5D') == 0) {
		$.fn.info_kind.push(sp[1]);
	    } else if (sp[0].indexOf('class_code%5B%5D') == 0) {
		$.fn.class_code.push(sp[1]);
	    } else if (sp[0].indexOf('gubun%5B%5D') == 0) {
		$.fn.gubun.push(sp[1]);
	    } else if (sp[0].indexOf('gr_code%5B%5D') == 0) {
		$.fn.gr_code.push(sp[1]);
	    } else if (sp[0].indexOf('sch_co_priority%5B%5D') == 0) {
		$.fn.sch_co_priority.push(sp[1]);
	    } else if (sp[0].indexOf('nation%5B%5D') == 0) {
		$.fn.nation.push(sp[1]);
	    } else if (sp[0].indexOf('sch_indust_field%5B%5D') == 0) {
		$.fn.sch_indust_field.push(sp[1]);
	    } else if (sp[0].indexOf('sch_co_type%5B%5D') == 0) {
		$.fn.sch_co_type.push(sp[1]);
	    } else if (sp[0].indexOf('pr_code%5B%5D') == 0) {
		$.fn.pr_code.push(sp[1]);
	    } else if (sp[0].indexOf('part_code%5B%5D') == 0) {
		$.fn.part_code.push(sp[1]);
	    } else if (sp[0].indexOf('role%5B%5D') == 0) {
		$.fn.role.push(sp[1]);
	    } else if (sp[0].indexOf('assign_id%5B%5D') == 0) {
		$.fn.assign_id.push(sp[1]);
	    } else if (sp[0].indexOf('type%5B%5D') == 0) {
		$.fn.ct_type.push(sp[1]);
	    } else if (sp[0].indexOf('bill_status%5B%5D') == 0) {
		$.fn.bill_status.push(sp[1]);
	    } else if (sp[0].indexOf('flg%5B%5D') == 0) {
		$.fn.flg.push(sp[1]);
	    } else if (sp[0].indexOf('assign_flg%5B%5D') == 0) {
		$.fn.assign_flg.push(sp[1]);
	    } else if (sp[0].indexOf('sr_type%5B%5D') == 0) {
		$.fn.sr_type.push(sp[1]);
	    } else if (sp[0].indexOf('si_type%5B%5D') == 0) {
		$.fn.si_type.push(sp[1]);
	    } else if (sp[0].indexOf('sub_p_class%5B%5D') == 0) {
		$.fn.sub_p_class.push(sp[1]);
	    } else if (sp[0].indexOf('no_type%5B%5D') == 0) {
		$.fn.no_type.push(sp[1]);
	    } else if (sp[0].indexOf('cate_idx%5B%5D') == 0) {
		$.fn.cate_idx.push(sp[1]);
	    } else if (sp[0].indexOf('sales_team') >= 0) {
		$('input[name=sales_team]').val(sp[1]);
		var sales_team_arr	= sp[1].split(',');
		var txt = '';
		$('#treeview').find('.tw-control').each(function() {
		    if ($.inArray($(this).val(), sales_team_arr) != -1) {
			$(this).prop('checked', true);
			$(this).parent().contents().filter(function() {
			    return this.nodeType == 3;
			}).each(
			    function(i,el){
				if (txt != '') txt += ',';
				txt += $(el).text();
				return false;
			    }
			);
		    }
		});
		$('#sales_team_open').val(txt);
	    } else {
		sp[0]	= sp[0].replace(/%5B/g, '').replace(/%5D/g, '');
		if ($('input[name^=' + sp[0] + ']').length > 0) {
		    $('input[name^=' + sp[0] + ']').val(sp[1]);
		    if (sp[0].indexOf('date') > 0) {
			$('#' + sp[0] + '_grp').datepicker('update');
		    }
		} else if ($('select[name^=' + sp[0] + ']').length > 0) {
		    $('select[name^=' + sp[0] + ']').val(sp[1]);
		}
	    }
	}
    }
}
$(document).ready(function() {
    $(window).on('hashchange', function () {
	$.fn.tbody.show_list($.fn.url, '', true, true);
    });
});

$('#mobile-init-btn').click(function() {
    $('#condition :input').each(function() {
	if ($(this).attr("name") == 'syear' || $(this).attr("name") == 'eyear' || $(this).attr("name") == 'section') {
	} else {
	    $(this).val('');
	}
    });
    $('.selectpicker').selectpicker('refresh');
});
$('#mobile-search-btn').click(function() {
    refresh();
    $('.detail-sch-up').click();
});
