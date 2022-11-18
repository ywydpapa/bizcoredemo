
$(document).on('change', '.sub_class', function() {
    var elem	= $(this);
    _ajax('/sfa/stock/xhr/product_part_list.xhr.php', 'sub_class=' + $(this).val(), print_product_part_option, elem);
});

// 장비추가
$(document).on('click', '#appliance-add-btn', function() {
    var max_seq	= parseInt($('.seq').last().text(), 10);
    var seq	= max_seq + 1;

    if ($('.main-del-btn').parent().attr('rowspan') == 2) { // 반품처리
	$('#appliance_list').append('<tr class="seq_' + seq + '">' + 
	    '<td class="seq">' + seq + '</td>' + 
	    '<td>' + JS_TEXT['stockout_class'] + ':' + JS_TEXT['returned_product'] + '</td>' + 
	    '<td><input type="hidden" name="r_main_pr_code[]" /></td>' + 
	    '<td><input type="hidden" name="r_main_p_class[]" /></td>' + 
	    '<td><input type="text" class="form-control" name="r_main_sn[]" value="" placeholder="' + JS_TEXT['returned_sn'] + '" /></td>' + 
	    '<td><input type="hidden" name="r_main_price[]" /></td>' + 
	    '<td></td>' + 
	    '<td rowspan="2">' + 
	    '<button class="btn btn-danger btn-sm main-del-btn" type="button">' + 
	    '<i class="fa fa-trash"></i>' + 
	    '</button>' + 
	    '</td>' + 
	    '</tr>' + 
	    '<tr>' + 
	    '<td><i class="fa fa-arrow-right"></i></td>' + 
	    '<td><select class="form-control" name="main_si_type[]"></select></td>' + 
	    '<td><select data-live-search="true" class="selectpicker" name="main_pr_code[]" class="form-control" title="' + JS_TEXT['select'] + '"></select></td>' + 
	    '<td><select name="main_p_class[]" class="form-control"></select></td>' + 
	    '<td><input type="text" class="form-control" name="main_sn[]" /></td>' + 
	    '<td><div class="input-group"><span class="input-group-addon">￦</span><input type="text" class="form-control" name="main_price[]" /></div></td>' + 
	    '<td><input type="text" class="form-control" name="main_memo[]" /></td>' + 
	    '</tr>');
	get_si_class_option($('select[name^=main_si_type]').eq(seq-1));
	get_product_option($('select[name^=main_pr_code]').eq(seq-1));
	get_product_class_option($('select[name^=main_p_class]').eq(seq-1));
    } else {
	$('#appliance_list').append('<tr class="seq_' + seq + '">' + 
		'<td class="seq">' + seq + '</td>' + 
		'<td><select class="form-control" name="main_si_type[]"></select></td>' + 
		'<td><select data-live-search="true" class="selectpicker" name="main_pr_code[]" class="form-control" title="' + JS_TEXT['select'] + '"></select></td>' + 
		'<td><select name="main_p_class[]" class="form-control"></select></td>' + 
		'<td><input type="text" class="form-control" name="main_sn[]" /></td>' + 
		'<td><div class="input-group"><span class="input-group-addon">￦</span><input type="text" class="form-control" name="main_price[]" /></div></td>' + 
		'<td><input type="text" class="form-control" name="main_memo[]" /></td>' + 
		'<td><button class="btn btn-danger btn-sm main-del-btn" type="button"><i class="fa fa-trash"></i></button></td>' + 
		'</tr>');
	get_si_class_option($('#appliance_list').find('.seq_' + seq).find('select[name^=main_si_type]'));
	get_product_option($('#appliance_list').find('.seq_' + seq).find('select[name^=main_pr_code]'));
	get_product_class_option($('#appliance_list').find('.seq_' + seq).find('select[name^=main_p_class]'));

	if (seq > 1) {
	    set_product_value(seq);
	}
    }
});
function set_product_value(seq) {
    var si_type	= $('#appliance_list').find('.seq_1').find('select[name^=main_si_type]').val();
    //var pr_code	= $('#appliance_list').find('.seq_1').find('select[name^=main_pr_code]').val();
    var p_class	= $('#appliance_list').find('.seq_1').find('select[name^=main_p_class]').val();
    var price	= $('#appliance_list').find('.seq_1').find('input[name^=main_price]').val();

    $('#appliance_list').find('.seq_' + seq).find('select[name^=main_si_type]').val(si_type);
    //$('#appliance_list').find('.seq_' + seq).find('select[name^=main_pr_code]').val(pr_code);
    $('#appliance_list').find('.seq_' + seq).find('select[name^=main_p_class]').val(p_class);
    $('#appliance_list').find('.seq_' + seq).find('input[name^=main_price]').val(price);
}
// 부품추가
$(document).on('click', '#part-add-btn', function() {
    var max_seq	= parseInt($('.sub_seq').last().text(), 10);
    var seq	= max_seq + 1;
    
    if ($('.sub-del-btn').parent().attr('rowspan') == 2) { // 반품처리
	$('#part_list').append('<tr class="sub_seq_' + seq + '">' + 
	    '<td class="sub_seq">' + seq + '</td>' + 
	    '<td>' + JS_TEXT['stockout_class'] + ':' + JS_TEXT['returned_product'] + '</td>' + 
	    '<td><input type="hidden" name="r_sub_class[]" /></td>' + 
	    '<td><input type="hidden" name="r_sub_pr_code[]" /></td>' + 
	    '<td><input type="hidden" name="r_sub_p_class[]" /></td>' + 
	    '<td><input type="text" class="form-control" name="r_sub_sn[]" value="" placeholder="' + JS_TEXT['returned_sn'] + '" /></td>' + 
	    '<td><input type="hidden" name="r_sub_price[]" /></td>' + 
	    '<td></td>' + 
	    '<td rowspan="2">' + 
	    '<button class="btn btn-danger btn-sm sub-del-btn" type="button">' + 
	    '<i class="fa fa-trash"></i>' + 
	    '</button>' + 
	    '</td>' + 
	    '</tr>' + 
	    '<tr>' + 
	    '<td><i class="fa fa-arrow-right"></i></td>' + 
	    '<td><select class="form-control" name="sub_si_type[]"></select></td>' + 
	    '<td><select name="sub_class[]" class="sub_class form-control"></select></td>' + 
	    '<td><select name="sub_pr_code[]" class="sub_pr_list form-control"></td>' + 
	    '<td><select name="sub_p_class[]" class="form-control"></select></td>' + 
	    '<td><input type="text" class="form-control" name="sub_sn[]" /></td>' + 
	    '<td><div class="input-group"><span class="input-group-addon">￦</span><input type="text" class="form-control" name="sub_price[]" /></div></td>' + 
	    '<td><input type="text" class="form-control" name="sub_memo[]" /></td>' + 
	    '</tr>');
	get_si_class_option($('select[name^=sub_si_type]').eq(seq-1));
	get_part_class_option($('select[name^=sub_class]').eq(seq-1));
	get_product_class_option($('select[name^=sub_p_class]').eq(seq-1));
    } else {
	$('#part_list').append('<tr class="sub_seq_' + seq + '">' + 
		'<td class="sub_seq">' + seq + '</td>' + 
		'<td><select class="form-control" name="sub_si_type[]"></select></td>' + 
		'<td><select name="sub_class[]" class="sub_class form-control"></select></td>' + 
		'<td><select name="sub_pr_code[]" class="sub_pr_list form-control"></td>' + 
		'<td><select name="sub_p_class[]" class="form-control"></select></td>' + 
		'<td><input type="text" class="form-control" name="sub_sn[]" /></td>' + 
		'<td><div class="input-group"><span class="input-group-addon">￦</span><input type="text" class="form-control" name="sub_price[]" /></div></td>' + 
		'<td><input type="text" class="form-control" name="sub_memo[]" /></td>' + 
		'<td><button class="btn btn-danger btn-sm sub-del-btn" type="button"><i class="fa fa-trash"></i></button></td>' + 
		'</tr>');
	get_si_class_option($('#part_list').find('.sub_seq_' + seq).find('select[name^=sub_si_type]'));
	get_part_class_option($('#part_list').find('.sub_seq_' + seq).find('select[name^=sub_class]'));
	get_product_class_option($('#part_list').find('.sub_seq_' + seq).find('select[name^=sub_p_class]'));
    }
});

// 장비삭제
$(document).on('click', '.main-del-btn', function() {
    var rowspan	= $(this).parent().attr('rowspan');
    if ($('.seq').length > 1) {
	var max_seq	= parseInt($('.seq').last().text(), 10);
	var seq	= parseInt($(this).parent().parent().find('.seq').text(), 10);
	if (rowspan == 2) { // 반품
	    $(this).parent().parent().next().remove();
	    $(this).parent().parent().remove();
	} else {
	    $(this).parent().parent().remove();
	}
	for (i = seq + 1; i <= max_seq; i++) {
	    new_seq	= i - 1;
	    $('.seq_' + i).find('.seq').text(new_seq);
	    $('.seq_' + i).addClass('seq_' + new_seq);
	    $('.seq_' + i).removeClass('seq_' + i);
	}
    } else { // 초기화
	if (rowspan == 2) {
	    _ajax('/sfa/stock/xhr/return_form.xhr.php', '', print_init_main_product_list);
	} else {
	    $('select[name^=main_si_type]').val('');
	    $('select[name^=main_pr_code]').val('');
	    $('select[name^=main_p_class]').val('');
	    $('input[name^=main_sn]').val('');
	    $('input[name^=main_price]').val('');
	    $('input[name^=main_memo]').val('');
	}
    }
});
// 부품삭제
$(document).on('click', '.sub-del-btn', function() {
    var rowspan	= $(this).parent().attr('rowspan');
    if ($('.sub_seq').length > 1) {
	var max_seq	= parseInt($('.sub_seq').last().text(), 10);
	var seq	= parseInt($(this).parent().parent().find('.sub_seq').text(), 10);
	if (rowspan == 2) { // 반품
	    $(this).parent().parent().next().remove();
	    $(this).parent().parent().remove();
	} else {
	    $(this).parent().parent().remove();
	}
	for (i = seq + 1; i <= max_seq; i++) {
	    new_seq	= i - 1;
	    $('.sub_seq_' + i).find('.sub_seq').text(new_seq);
	    $('.sub_seq_' + i).addClass('sub_seq_' + new_seq);
	    $('.sub_seq_' + i).removeClass('sub_seq_' + i);
	}
    } else { // 초기화
	if (rowspan == 2) {
	    _ajax('/sfa/stock/xhr/return_form.xhr.php', '', print_init_sub_product_list);
	} else {
	    $('select[name^=sub_si_type]').val('');
	    $('select[name^=sub_class]').val('');
	    $('select[name^=sub_pr_code]').html('');
	    $('select[name^=sub_p_class]').val('');
	    $('input[name^=sub_sn]').val('');
	    $('input[name^=sub_price]').val('');
	    $('input[name^=sub_memo]').val('');
	}
    }
});
// 장비삭제
$(document).on('click', '.so-main-del-btn', function() {
    var max_seq	= parseInt($('.seq').last().text(), 10);
    var seq	= parseInt($(this).parent().parent().find('.seq').text(), 10);
    $(this).parent().parent().remove();
    for (i = seq + 1; i <= max_seq; i++) {
	new_seq	= i - 1;
	$('.seq_' + i).find('.seq').text(new_seq);
	$('.seq_' + i).addClass('seq_' + new_seq);
	$('.seq_' + i).removeClass('seq_' + i);
    }
});
// 부품삭제
$(document).on('click', '.so-sub-del-btn', function() {
    var max_seq	= parseInt($('.sub_seq').last().text(), 10);
    var seq	= parseInt($(this).parent().parent().find('.sub_seq').text(), 10);
    $(this).parent().parent().remove();
    for (i = seq + 1; i <= max_seq; i++) {
	new_seq	= i - 1;
	$('.sub_seq_' + i).find('.sub_seq').text(new_seq);
	$('.sub_seq_' + i).addClass('sub_seq_' + new_seq);
	$('.sub_seq_' + i).removeClass('sub_seq_' + i);
    }
});
function print_init_main_product_list(data) {
    $('#appliance_list').children().remove();
    $('#appliance_list').append(data.main_html);
    $('.selectpicker').selectpicker('refresh');
}
function print_init_sub_product_list(data) {
    $('#part_list').children().remove();
    $('#part_list').append(data.sub_html);
    $('.selectpicker').selectpicker('refresh');
}

function print_product_part_option(data, target) {
    if (target.parent().next().find('.sub_pr_list').length > 0) {
	target.parent().next().find('.sub_pr_list').html(data.html);

	var seq	= parseInt(target.parent().parent().find('.sub_seq').text(), 10);
	if ($('.sub_seq_' + (seq-1)).length > 0) {
	    last_value	= $('.sub_seq_' + (seq-1)).find('select[name^=sub_pr_code]').val();
	    $('.sub_seq_' + seq).find('select[name^=sub_pr_code]').val(last_value);
	}
    } else {
	target.parent().find('.sub_pr_list').html(data.html);
    }
}
function print_stockout_list(data) {
    $('select[name^=so_list]').html(data.html);
    $('#r_out_list').show();
    $('select[name^=so_list]').selectpicker('refresh');
    $('select[name^=so_list]').trigger('change');
}
function get_product_option(target) {
    var selected	= $('#appliance_list').find('.seq_1').find('select[name^=main_pr_code]').val();
    _ajax_html('/sfa/stock/xhr/product_list.xhr.php', 'selected=' + selected, print_html, target);
}
function get_product_class_option(target) {
    _ajax_html('/sfa/stock/xhr/product_class_list.xhr.php', '', print_html, target);
}
function get_si_class_option(target) {
    _ajax_html('/sfa/stock/xhr/stockin_class_list.xhr.php', '', print_html, target);
}
function get_part_class_option(target) {
    _ajax_html('/sfa/stock/xhr/part_class_list.xhr.php', '', print_html, target);
}
function print_html(html) {
    var target	= this.arg;
    target.html(html);
    if (target.attr('name').indexOf('main_si_type') >= 0) {
	if ($('input[name=return_flg]').is(':checked') == true) { // 반품인경우
	    target.val('18');
	} else {
	    var max_seq	= parseInt($('.seq').last().text(), 10);
	    if ($('.seq_' + (max_seq-1)).length > 0) {
		last_value	= $('.seq_' + (max_seq-1)).find('select[name^=main_si_type]').val();
		$('.seq_' + max_seq).find('select[name^=main_si_type]').val(last_value);
	    }
	}
    } else if (target.attr('name').indexOf('main_pr_code') >= 0) {
	var max_seq	= parseInt($('.seq').last().text(), 10);
	if ($('.seq_' + (max_seq-1)).length > 0) {
	    last_value	= $('.seq_' + (max_seq-1)).find('select[name^=main_pr_code]').val();
	    $('.seq_' + max_seq).find('select[name^=main_pr_code]').val(last_value);
	}
    } else if (target.attr('name').indexOf('main_p_class') >= 0) {
	var max_seq	= parseInt($('.seq').last().text(), 10);
	if ($('.seq_' + (max_seq-1)).length > 0) {
	    last_value	= $('.seq_' + (max_seq-1)).find('select[name^=main_p_class]').val();
	    $('.seq_' + max_seq).find('select[name^=main_p_class]').val(last_value);
	}
    } else if (target.attr('name').indexOf('sub_si_type') >= 0) {
	if ($('input[name=return_flg]').is(':checked') == true) { // 반품인경우
	    target.val('18');
	} else {
	    var max_seq	= parseInt($('.sub_seq').last().text(), 10);
	    if ($('.sub_seq_' + (max_seq-1)).length > 0) {
		last_value	= $('.sub_seq_' + (max_seq-1)).find('select[name^=sub_si_type]').val();
		$('.sub_seq_' + max_seq).find('select[name^=sub_si_type]').val(last_value);
	    }
	}
    } else if (target.attr('name').indexOf('sub_class') >= 0) {
	var max_seq	= parseInt($('.sub_seq').last().text(), 10);
	if ($('.sub_seq_' + (max_seq-1)).length > 0) {
	    last_value	= $('.sub_seq_' + (max_seq-1)).find('select[name^=sub_class]').val();
	    $('.sub_seq_' + max_seq).find('select[name^=sub_class]').val(last_value);
	    var elem = $('.sub_seq_' + max_seq).find('select[name^=sub_class]');
	    _ajax('/sfa/stock/xhr/product_part_list.xhr.php', 'sub_class=' + last_value, print_product_part_option, elem);
	}
    } else if (target.attr('name').indexOf('sub_p_class') >= 0) {
	var max_seq	= parseInt($('.sub_seq').last().text(), 10);
	if ($('.sub_seq_' + (max_seq-1)).length > 0) {
	    last_value	= $('.sub_seq_' + (max_seq-1)).find('select[name^=sub_p_class]').val();
	    $('.sub_seq_' + max_seq).find('select[name^=sub_p_class]').val(last_value);
	}
    }
    
    if (target.attr('name').indexOf('pr_code') >= 0) {
	target.selectpicker('refresh');
    }
}


/*
   2018.10 
   */
$(document).on('change', 'select[name=p_gubun]', function() {
    if ($(this).val() == '1') {
	_ajax_html('/sfa/product/xhr/product_group_list.xhr.php', '', print_product_group);
    } else {
	_ajax_html('/sfa/product/xhr/product_part_group_list.xhr.php', '', print_product_group);
    }

});
$(document).on('change', 'select[name=gr_code]', function() {
    if ($('select[name=p_gubun]').val() == '1') {
	_ajax_html('/sfa/product/xhr/product_list.xhr.php', 'gr_code=' + $('select[name=gr_code]').val(), print_product);
    } else {
	_ajax_html('/sfa/product/xhr/product_part_list.xhr.php', 'gr_code=' + $('select[name=gr_code]').val(), print_product);
    }
});

$(document).on('click', '#add-stock-item', function() {
	
    if (!requiredField($("select[name=si_type]"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("select[name=p_class]"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("select[name=pr_code]"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("input[name=price]"), JS_TEXT['alert_insert'])) return;
    
    var si_type	= $('select[name=si_type]').val();
    var si_type_str	= $('select[name=si_type] option:selected').text();
    var p_class	= $('select[name=p_class]').val();
    var p_class_str	= $('select[name=p_class] option:selected').text();
    var gubun	= $('select[name=p_gubun]').val();
    var pr_code	= $('select[name=pr_code]').val();
    var pr_name	= $('select[name=pr_code] option:selected').text();
    var price	= $('input[name=price]').val();
    if (gubun == '1') {
	$('#items_list').append('<tr>' +
		'<td class="seq"></td>' + 
		'<td><input type="hidden" name="main_si_type[]" value="' + si_type + '" />' + si_type_str + '</td>' + 
		'<td><input type="hidden" name="main_p_class[]" value="' + p_class + '" />' + p_class_str + '</td>' +
		'<td><input type="hidden" name="main_pr_code[]" value="' + pr_code + '" />' + pr_name + '</td>' + 
		'<td><input type="hidden" name="main_price[]" value="' + price + '" />' + price + '</td>' + 
		'<td><input type="text" name="main_sn[]" class="form-control" /></td>' +
		'<td><input type="text" name="main_memo[]" class="form-control" /></td>' +
		'<td><button class="btn btn-danger btn-sm del-stock-item" type="button"><i class="fa fa-times"></i></button></td>' +
		'</tr>');
    } else {
	$('#items_list').append('<tr>' +
		'<td class="seq"></td>' + 
		'<td><input type="hidden" name="sub_si_type[]" value="' + si_type + '" />' + si_type_str + '</td>' + 
		'<td><input type="hidden" name="sub_p_class[]" value="' + p_class + '" />' + p_class_str + '</td>' +
		'<td><input type="hidden" name="sub_pr_code[]" value="' + pr_code + '" />' + pr_name + '</td>' + 
		'<td><input type="hidden" name="sub_price[]" value="' + price + '" />' + price + '</td>' + 
		'<td><input type="text" name="sub_sn[]" class="form-control" /></td>' +
		'<td><input type="text" name="sub_memo[]" class="form-control" /></td>' +
		'<td><button class="btn btn-danger btn-sm del-stock-item" type="button"><i class="fa fa-times"></i></button></td>' +
		'</tr>');
    }
    make_seq();
    total_amount_calc();
});
$(document).on('click', '.del-stock-item', function() {
    $(this).parent().parent().remove();
    make_seq();
});
function make_seq() {
    var no = 1;
    $('.seq').each(function() {
	$(this).text(no);
	no++;	
    });
}
function print_product_group(html) {
    $('select[name=gr_code]').html(html);
    $('select[name=gr_code]').trigger('change');
}
function print_product(html) {
    $('select[name=pr_code]').html(html);
}
