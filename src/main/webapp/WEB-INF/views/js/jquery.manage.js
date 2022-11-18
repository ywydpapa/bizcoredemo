$.fn.extend({
	page: 1,
	url: null,
	tbody: null,
	query: null,
	page_custom_function: null, // 페이지 번호 클릭시 해당 코드 로직을 태우지 않고, custom function을 호출 할수 있음
	show_list: function(path, query, noinit_page) {
		var page_rows = 15;
		if ($('input[name=page_rows]').val() != undefined) {
			page_rows = $('input[name=page_rows]').val();
		}

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
		var param = "page_rows="+page_rows+"&page="+$.fn.page+q;

		$.fn.url = path;
		$.fn.tbody = $(this);
		$(this).children().remove();
		_ajax(path, param, $.fn.data_output, undefined, true);
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

		var total;
		if (data.total != undefined) {
			total = data.total;
		}

		$(obj).children().remove();
		$('#total_cnt').text(total_cnt);
		$('#total_amount').text(total_amount);
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
		if ($(obj).attr("id") != 'stock_pr_list') {
		    $.each(data, function(k, dt) {
			    var td_class = '';
			    if (k == 'page_cnt' || k == 'next_page' || k == 'total' || k == 'debug' || k == 'list_cnt' || k == 'total_cnt' || k == 'total_amount' || k == 'field') {
				    return true;
			    }
			    if (dt['key'] == undefined) {
				    code += '<tr>';
			    } else {
				    code += '<tr id="key_'+dt['key']+'">';
			    }
			    if (dt['active'] == undefined || dt['active'] == '') {
				td_class = '';
			    } else {
				td_class = 'purple';
			    }
			    cnt = 0;
			    $.each(dt, function(k2, v) {
				    if (k2 == 'key' || k2 == 'active') {
					    return true;
				    }
				    if (k2.indexOf('hidden') > 0) {
					if (k2.indexOf('hidden_sm') > 0) {
					    add_class	= ' hidden-xs hidden-sm';
					} else {
					    add_class	= ' hidden-xs';
					}
				    } else {
					add_class	= '';
				    }
				    code += '<td class="' + td_class + add_class + '">';
				    if (v != null) {
					    code += v;
				    }
				    code += '</td>';
				    cnt++;
			    });
			    code += '</tr>';
		    });
		} else { // stock_list
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
		}
		$(obj).append(code);
		code = '';

		//i-checks
		$('.i-checks').iCheck({
		    checkboxClass: 'icheckbox_square-purple'
		});

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
			$('#paging').html('<span>' + JS_TEXT['no_data'] + '</span>').addClass('no_data');
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
				$.fn.tbody.show_list($.fn.url);
			} else {
				eval($.fn.page_custom_function);
			}
		});

		$('#prev_btn').click(function() {
			$.fn.page = parseInt(first_page - 1);
			if ($.fn.page_custom_function == null) {
				$.fn.tbody.show_list($.fn.url);
			}
		});

		$('#next_btn').click(function() {
			$.fn.page = parseInt(pg);
			if ($.fn.page_custom_function == null) {
				$.fn.tbody.show_list($.fn.url);
			}
		});
	},
	search_button: function() {
	    $(this).append('<button class="btn btn-primary btn-sm" type="button">' + JS_TEXT['search'] + '</button>');
	    $(this).click(function() {
		refresh();
	    });
	},
	init_button: function() {
	    $(this).append('<button class="btn btn-warning btn-sm" type="button">' + JS_TEXT['init'] + '</button>');
	    $(this).click(function() {
		$('#condition :input').each(function() {
		    if ($(this).attr("name") == 'syear' || $(this).attr("name") == 'eyear' || $(this).attr("name") == 'section') {
		    } else {
			$(this).val('');
		    }
		});
		$('.selectpicker').selectpicker('refresh');
	    });
	},
	excel_button: function(url, f) {
	    $(this).append('<button class="btn btn-primary btn-sm" type="button"><i class="fa fa-download" aria-hidden="true"></i></button>');
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
	    $(this).append('<button class="btn btn-success btn-sm" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    $(this).click(function() {
		location.href = url;
		return;
	    });
	},
	del_button: function(url) {
	    $(this).append('<button class="btn btn-danger btn-sm" type="button" onclick="$.fn.del(\''+url+'\')"><i class="fa fa-trash-o" aria-hidden="true"></i></button>');
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

	    swal({
		title:JS_TEXT['ask_delete'],
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

function refresh()
{
    var query = $('form[name=condition_form]').serialize();
    $.fn.tbody.show_list($.fn.url, query);
    $.fn.page = 1;
    if ($('#chart').length > 0) {
	_ajax('/sfa/sales/sales_plan_chart.xhr.php', query, output_graph);
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

