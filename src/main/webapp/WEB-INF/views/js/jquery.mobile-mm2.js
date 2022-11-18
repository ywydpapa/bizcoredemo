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
	if ($.fn.c_page == '1') {
	    $(obj).children().remove();
	}

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
	    cnt = 0;
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (k2 == 'key') {
		    return true;
		}
		if (v != null) {
		    code += v;
		}
		cnt++;
	    });
	    code += '</div>';
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


	/* show html */
	$('#paging_' + id).html('').children().remove();
	$('#paging_' + id).removeClass('paging').addClass('paging').removeClass('no_data').css('width', $(obj).parent().css('width'));
	if (total != undefined) {
	    $('#paging_' + id).html('<span class="page_total">' + JS_TEXT['total_cnt'] + ' : ' +total+ ' '+ JS_TEXT['case'] +'</span>');
	}
	if ($.fn.c_page != page_cnt) {
	    $('#paging_' + id).append('<button class="btn btn-default btn-sm page_' + id + '" type="button" page="' + (parseInt($.fn.c_page) + 1) + '">' + JS_TEXT['more']  + '</button>');
	    $('#paging_' + id).css('margin-top', '10px');
	    $('#paging_' + id).css('height', '50px');
	}
	$('.page_' + id).click(function() {
	    $.fn.c_page = $(this).attr('page');
	    $.fn.c_tbody.print_list($.fn.c_url, $.fn.c_query, true);
	});
	$('[data-toggle="tooltip"]').tooltip(); 

    }
});
