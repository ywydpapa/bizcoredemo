$.fn.extend({
	page: 1,
	url: null,
	tbody: null,
	query: null,
	page_custom_function: null, // 페이지 번호 클릭시 해당 코드 로직을 태우지 않고, custom function을 호출 할수 있음
	hash: null,
	scroll:0,
	latest_title:null,
	show_list: function(path, query, noinit_page, init) {
	    $.fn.scroll = 0;
	    if ($.fn.latest_title == null) {
		$.fn.latest_title = $('.latest-text').html();
	    }
	    if (init == true && location.hash) {
		if ($.fn.hash != location.hash.substring(1)) { 
		    if ($.fn.hash != null) {
			var parent_page = $.fn.hash.substring(0, $.fn.hash.indexOf('&')).split('=')[1];
			var cur_page	= location.hash.substring(0, location.hash.indexOf('&')).split('=')[1];

			if (parent_page != cur_page && ($.fn.hash.substring($.fn.hash.indexOf('&')) == location.hash.substring(location.hash.indexOf('&')))) {
			    if (parent_page > cur_page) { // 뒤로가기
				history.back();
				return true;
			    } else { // 앞으로가기
				history.forward();
				return true;
			    }
			} else {
			    if ($.fn.hash.substring(0, $.fn.hash.indexOf('&scroll')) == location.hash.substring(1)) {
				history.back();
				return true;
			    }
			}
		    }
		    $.fn.url = path;
		    $.fn.tbody = $(this);
		    param	= location.hash.substring(1);
		    window.location.hash	= param;
		    $.fn.hash = param;

		    // 조건절 셋팅
		    param.split('&').forEach(set_condition);
		   
		    $.fn.query = param + '&pageview=all';

		    _ajax(path, param + '&pageview=all', $.fn.data_output, undefined, true);
		} else {
		    $.fn.query = query;
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
		    //+ '&scroll=' + $(document).scrollTop();

		$.fn.url = path;
		$.fn.tbody = $(this);
		if (location.href.indexOf('_form.php') < 0 && location.href.indexOf('personal.php') < 0) {
		    window.location.hash	= param;
		    $.fn.hash = param;
		}
		_ajax(path, param, $.fn.data_output, undefined, true);
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

		if ($.fn.page == '1') {
		    $(obj).children().remove();
		}
		$('#total_cnt').text(total_cnt);
		$('#total_amount').text(total_amount);

		var code = '';
		var line_cnt = 0;
		//if ($(obj).attr("id") != 'stock_pr_list') {
		    $.each(data, function(k, dt) {
			    if (k == 'page_cnt' || k == 'next_page' || k == 'total' || k == 'debug' || k == 'list_cnt' || k == 'total_cnt' || k == 'total_amount' || k == 'field') {
				    return true;
			    }
			    code += '<div class="list-content-wrapper">';
			    $.each(dt, function(k2, v) {
				code += v;
			    });
			    code += '</div>';
		    });
		    /*
		} else { // stock_list
		    $.each(data, function(k, dt) {
			if (k == 'page_cnt' || k == 'next_page' || k == 'total_cnt') {
				return true;
			}
			code += '<tr>';
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
			    }
			});
			code += '</tr>';
		    });
		}
		*/
		$(obj).append(code);
		code = '';

		$('.swipe-content').each(function() {
		    $(this).css('height', $(this).parent().find('.list-content').css('height'));
		});
		
		if ($.fn.scroll > 0) {
		    setTimeout(scrollTo, 100, 0, $.fn.scroll); //안드로이드 스크롤 아래이동
		    setTimeout(window.scrollTo, 100, 0, $.fn.scroll); //안드로이드 스크롤 아래이동
		    //$(window).scrollTop($.fn.scroll);
		    //$(document).addClass('androidFix').scrollTop($.fn.scroll).removeClass('androidFix');
		}

		if (page_cnt == 0 && list_cnt == 0) { // no data
			if ($('.latest-text').text() == '') {
			    $('#paging').html('<span>' + JS_TEXT['no_data'] + '</span>').addClass('no_data');
			} else {
			    $('#mobile-search-btn').click();
			}
			return;
		}

		/* show html */
		$('#paging').html('').children().remove();
		$('#paging').removeClass('paging').addClass('paging').removeClass('no_data').css('width', $(obj).parent().css('width'));
		if (total != undefined) {
			$('#paging').html('<span class="page_total">' + JS_TEXT['total_cnt'] + ' : ' +total+ ' '+ JS_TEXT['case'] +'</span>');
		}
		if ($.fn.page != page_cnt) {
		    $('#paging').append('<button class="btn btn-default btn-sm page" type="button" page="' + (parseInt($.fn.page) + 1) + '">' + JS_TEXT['more']  + '</button>');
		    $('#paging').css('margin-top', '10px');
		    $('#paging').css('height', '50px');
		}
		$('[data-toggle="tooltip"]').tooltip(); 

		$('.page').click(function() {
			$.fn.page = $(this).attr('page');
			if ($.fn.page_custom_function == null) {
			    //var query = $('#condition :input').serialize();
			    $.fn.tbody.show_list($.fn.url, $.fn.query, true);
			} else {
				eval($.fn.page_custom_function);
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

    if ($.fn.url != null) {
	$.fn.tbody.show_list($.fn.url);
    }
}
function set_condition(item, index) {
    var sp	= item.split("=");
    if (sp[0] == 'page') {
	$.fn.page = sp[1];
    } else if (sp[0] == 'scroll') {
	$.fn.scroll = sp[1];
	//$(document).addClass('androidFix').scrollTop(sp[1]).removeClass('androidFix');
	//$(window).scrollTop(sp[1]);
	/*
	if (navigator.userAgent.indexOf('iPhone') != -1)
	{
	    setTimeout(window.scrollTo, 0, 0, sp[1]); //안드로이드 스크롤 아래이동
	}else{
	    alert(sp[1]);
	    setTimeout(window.scrollTo, 0, 0, sp[1]); //안드로이드 스크롤 아래이동
	    //window.scrollTo(0, sp[1]); //아이폰 스크롤 아래이동.
	}
	*/
	$('html, body').stop().animate({scrollTop : sp[1]}, 400);
    } else {
	if (sp[0] != '') {
	    sp[0]	= sp[0].replace(/%5B/g, '').replace(/%5D/g, '');
	    sp[1]	= decodeURIComponent(sp[1]);
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
$(document).ready(function() {
    $(window).on('hashchange', function () {
	//$.fn.tbody.show_list($.fn.url, '', true, true);
	if (location.hash.indexOf('&scroll') < 0) {
	    $.fn.tbody.show_list($.fn.url, $.fn.query, true, true);
	}
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
    $('.latest-text').text('');
});
