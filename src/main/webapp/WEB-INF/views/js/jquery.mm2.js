$.fn.extend({
    c_page: 1,
    c_url: null,
    c_tbody: null,
    c_query: null,
    id: null,
    print_list: function(path, query, id) {
	var q = '';
	if (query != undefined) {
	    q += "&"+query;
	    $.fn.c_query = query;
	    $.fn.c_page = 1; // 쿼리가 변경되었다는 것은 새로운 데이터를 가져온다는 의미로 해석. 페이지 초기화.
	} else {
	    q += "&"+$.fn.c_query;
	}
	if (id != undefined) {
	    $.fn.id = id;
	}
	var param = "page="+$.fn.c_page+q;

	$.fn.c_url = path;
	$.fn.c_tbody = $(this);
	$(this).children().remove();
	_ajax(path, param, $.fn.data_print, undefined, true);
    },
    data_print: function(data) {
	_loading(0);
	var id	= $.fn.id;
	var obj = $.fn.c_tbody;
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
	$('#total_cnt_' + id).text(total_cnt);
	$('#total_amount' + id).text(total_amount);
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
	$.each(data, function(k, dt) {
	    if (k == 'page_cnt' || k == 'next_page' || k == 'total' || k == 'total_cnt' || k == 'total_amount' || k == 'field') {
		return true;
	    }
	    if (dt['key'] == undefined) {
		code += '<tr>';
	    } else {
		code += '<tr id="key_'+dt['key']+'">';
	    }
	    cnt = 0;
	    $.each(dt, function(k2, v) {
		if (k2 == 'key') {
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
	$(obj).append(code);
	code = '';

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
	    $('#paging_' + id).html('<span>' + JS_TEXT['no_data'] + '</span>').addClass('no_data');
	    return;
	}

	var first_page = 1;
	if ($.fn.c_page > 10) {
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
	    if ($.fn.c_page == pg) {
		cls = 'active';
	    } else {
		cls = 'page_' + id;
	    }
	    pages += '<li class="'+cls+'"><a>'+pg+'</a></li>';
	}

	var left = '<nav aria-label="Page navigation"><ul class="pagination pagination-sm">';
	if ($.fn.c_page > 10) { // prev button
	    left += '<li><a id="prev_btn_' + id + '"><span aria-hidden="true">&laquo;</span></a></li>';
	} else {
	    left += '<li class="disabled"><a><span aria-hidden="true">&laquo;</span></a></li>';
	}
	var right = '';
	if (next_page == true) {
	    right = '<li><a id="next_btn_' + id + '"><span aria-hidden="true">&raquo;</span></a></li>';
	} else {
	    right = '<li class="disabled"><a><span aria-hidden="true">&raquo;</span></a></li>';
	}
	right += '</ul></nav>';

	/* show html */
	$('#paging_' + id).html('').children().remove();
	$('#paging_' + id).removeClass('paging').addClass('paging').removeClass('no_data').css('width', $(obj).parent().css('width'));
	if (total != undefined) {
	    $('#paging_' + id).html('<span class="page_total">' + JS_TEXT['total_cnt'] + ' : ' +total+ ' '+ JS_TEXT['case'] +'</span>');
	}
	$('#paging_' + id).append(left + pages + right);
	$('[data-toggle="tooltip"]').tooltip(); 

	$('.page_' + id).click(function() {
	    $.fn.c_page = $(this).text();
	    $.fn.c_tbody.print_list($.fn.c_url);
	});

	$('#prev_btn_' + id).click(function() {
	    $.fn.c_page = parseInt(first_page - 1);
	    $.fn.c_tbody.print_list($.fn.c_url);
	});

	$('#next_btn_' + id).click(function() {
	    $.fn.c_page = parseInt(pg);
	    $.fn.c_tbody.print_list($.fn.c_url);
	});
    }
});
