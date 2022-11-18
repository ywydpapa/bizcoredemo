/* list */
$(document).on('click', '.sr-mod-btn', function() {
    var sr_code	= $(this).attr('sr_code');
    location.href	= '/sfa/order/request_form.php?sr_code=' + sr_code;
});
$(document).on('click', '.sr-mod-auth-btn', function() {
    var sr_code	= $(this).attr('sr_code');
    _ajax('/sfa/order/request_auth.php', 'sr_code=' + sr_code, auth_result);
});
$(document).on('click', '.sr-detail-btn', function() {
    var sr_code	= $(this).attr('sr_code');
    location.href	= '/sfa/order/request_detail.php?sr_code=' + sr_code;
});
function auth_result(resp)
{
    _loading(0);
    refresh(true);

}



$(document).on('change', '.sub_p_class', function() {
    var elem	= $(this);
    _ajax('/sfa/stock/xhr/product_part_list.xhr.php', 'sub_class=' + $(this).val(), print_product_part_option, elem);
});
function print_product_part_option(data, target) {
    target.parent().next().find('.sub_pr_list').html(data.html);
    if (data.seq != undefined) {
	$('.main-line-' + data.seq).find('select[name^=sub_pr_code_' + data.seq + ']').val(data.part_code);
    }
}

/*
// 수량 체크
$(document).on('click', '.quantity-minus-btn', function() {
    var target = $(this).parent().find('.quantity');
    var hidden_target	= $(this).parent().find('.quantity-hidden');
    var quantity = parseInt(target.text(), 10);
    if (quantity > 1) {
	var new_quantity	= quantity - 1;
	target.text(new_quantity);
	hidden_target.val(new_quantity);
    }
});
$(document).on('click', '.quantity-plus-btn', function() {
    var target = $(this).parent().find('.quantity');
    var hidden_target	= $(this).parent().find('.quantity-hidden');
    var quantity = parseInt(target.text(), 10);
    var new_quantity	= quantity + 1;
    target.text(new_quantity);
    hidden_target.val(new_quantity);
});

// 부품라인삭제
$(document).on('click', '.part-del-btn', function() {
    var seq	= $(this).attr('seq');
    if ($('select[name^=sub_p_class_' + seq + ']').length == 1) {
	// 초기화
	$('select[name^=sub_p_class_' + seq + ']').val('');
	$('select[name^=sub_pr_code_' + seq + ']').html('');
	$('input[name^=quantity_' + seq + ']').val('1');
	$(this).parent().parent().find('.quantity').text('1');
    } else {
	var seq	= $(this).attr('seq');
	var total_line	= $('.main-line-' + seq).length + $('.sub-line-' + seq).length;
	$('.main-line-' + seq).find('td').each(function(){
	    if (!$(this).hasClass('part-form')) {
		$(this).attr('rowspan', total_line-1);
	    }
	});
	if ($(this).parent().parent().hasClass('main-line-' + seq)) { 
	    // 첫번째 라인이면 다음 라인에 있는 값을 첫번째 라인에 넣고 다음라인을 삭제
	    var part_class = $('.sub-line-' + seq).first().find('select[name^=sub_p_class_' + seq + ']').val();
	    var part_code = $('.sub-line-' + seq).first().find('select[name^=sub_pr_code_' + seq + ']').val();
	    var quantity = $('.sub-line-' + seq).first().find('input[name^=quantity_' + seq + ']').val();

	    var elem = $('.main-line-' + seq).find('select[name^=sub_p_class_' + seq + ']');
	    elem.val(part_class);
	    _ajax('/sfa/stock/xhr/product_part_list.xhr.php', 
		    'sub_class=' + part_class + '&seq=' + seq + '&part_code=' + part_code, 
		    print_product_part_option, elem);
	    $('.main-line-' + seq).find('input[name^=quantity_' + seq + ']').val(quantity);
	    $('.main-line-' + seq).find('.quantity').text(quantity);
	    $(this).parent().parent().next().remove();
	} else {
	    $(this).parent().parent().remove();
	}
    }
});
// 부품라인추가
$(document).on('click', '.part-add-btn', function() {
    var seq	= $(this).attr('seq');
    var total_line	= $('.main-line-' + seq).length + $('.sub-line-' + seq).length;
    if ($('.sub-line-' + seq).length > 0) {
	var target	= $('.sub-line-' + seq).last();
    } else {
	var target	= $(this).parent().parent();
    }
    $('.main-line-' + seq).find('td').each(function(){
	if (!$(this).hasClass('part-form')) {
	    $(this).attr('rowspan', total_line+1);
	}
    });
    target.after('<tr class="sub-line-' + seq + '">' + 
	    '<td class="part-form">' +
	    '<select name="sub_p_class_' + seq + '[]" class="sub_p_class form-control">' + 
	    '</select>' + 
	    '</td>' + 
	    '<td class="part-form">' + 
	    '<select name="sub_pr_code_' + seq + '[]" class="sub_pr_list form-control">' + 
	    '</select>' + 
	    '</td>' + 
	    '<td class="part-form">' + 
	    '<button class="btn btn-success btn-xs quantity-minus-btn" type="button">' + 
	    '<i class="fa fa-minus"></i></button>&nbsp;' + 
	    '<span style="padding-left:10px; padding-right:10px;" class="quantity">1</span>&nbsp;' + 
	    '<button class="btn btn-success btn-xs quantity-plus-btn" type="button">' + 
	    '<i class="fa fa-plus"></i></button>' + 
	    '<input type="hidden" name="quantity_' + seq + '[]" class="quantity-hidden" value="1" />' + 
	    '</td>' + 
	    '<td class="part-form">' + 
	    '<button class="btn btn-danger btn-sm part-del-btn" seq="' + seq + '" type="button">' + 
	    '<i class="fa fa-trash"></i></button>' + 
	    '</td>'
	    );
    get_part_class_option(target.next().find('select[name^=sub_p_class_' + seq + ']')); 
});
// 장비추가
$(document).on('click', '#appliance-add-btn', function() {
    var last_seq = parseInt($('.seq').last().text(), 10);
    var seq	= last_seq + 1;
    $('#appliance_list').append('<tr class="main-line-' + seq + ' main-line">' +
	    '<td class="seq">' + seq + '</td>' + 
	    '<td>' + 
	    '<select name="p_class_' + seq + '" class="form-control">' + 
	    '</select>' + 
	    '</td>' + 
	    '<td>' + 
	    '<select data-live-search="true" class="selectpicker" name="pr_code_' + seq + '" class="form-control">' + 
	    '</select>' + 
	    '</td>' + 
	    '<td class="part-form">' + 
	    '<select name="sub_p_class_' + seq + '[]" class="sub_p_class form-control">' + 
	    '</select>' + 
	    '</td>' + 
	    '<td class="part-form">' + 
	    '<select name="sub_pr_code_' + seq + '[]" class="sub_pr_list form-control">' + 
	    '</select>' + 
	    '</td>' + 
	    '<td class="part-form">' + 
	    '<button class="btn btn-success btn-xs quantity-minus-btn" type="button">' + 
	    '<i class="fa fa-minus"></i>' + 
	    '</button>&nbsp;' + 
	    '<span style="padding-left:10px; padding-right:10px;" class="quantity">1</span>&nbsp;' + 
	    '<button class="btn btn-success btn-xs quantity-plus-btn" type="button">' + 
	    '<i class="fa fa-plus"></i>' + 
	    '</button>' + 
	    '<input type="hidden" name="quantity_' + seq + '[]" class="quantity-hidden" value="1" />' + 
	    '</td>' + 
	    '<td class="part-form">' + 
	    '<button class="btn btn-danger btn-sm part-del-btn" seq="' + seq + '" type="button">' + 
	    '<i class="fa fa-trash"></i>' + 
	    '</button>&nbsp;' + 
	    '<button class="btn btn-success btn-sm part-add-btn" seq="' + seq + '" type="button">' + 
	    '<i class="fa fa-plus"></i>' + 
	    '</button>' + 
	    '</td>' + 
	    '<td>' + 
	    '<input type="text" name="memo_' + seq + '" class="form-control" />' + 
	    '</td>' + 
	    '<td>' + 
	    '<button class="btn btn-danger btn-sm appliance-del-btn" type="button">' + 
	    '<i class="fa fa-trash"></i>' + 
	    '</button>' + 
	    '</td>' +
	    '</tr>');
    get_part_class_option($('#appliance_list').find('tr').last().find('select[name^=sub_p_class_' + seq + ']')); 
    get_product_class_option($('#appliance_list').find('tr').last().find('select[name=p_class_' + seq + ']'));
    get_product_option($('#appliance_list').find('tr').last().find('select[name=pr_code_' + seq + ']'));
    
});

// 장비삭제
$(document).on('click', '.appliance-del-btn', function() {
    // main-line이 하나밖에 없으면 삭제 불가
    if ($('.main-line').length > 1) {
	var seq	= parseInt($(this).parent().parent().find('.seq').text(), 10);
	$('.sub-line-' + seq).remove();
	$('.main-line-' + seq).remove();

	var max_seq	= parseInt($('.seq').last().text(), 10);
	for (i = seq + 1; i <= max_seq; i++) {
	    $('.main-line-' + i).find('.seq').text(i-1);
	    $('select[name=p_class_' + i + ']').attr('name', 'p_class_' + (i-1));
	    $('select[name=pr_code_' + i + ']').attr('name', 'pr_code_' + (i-1));
	    $('input[name=memo_' + i + ']').attr('name', 'memo_' + (i-1));
	    $('select[name^=sub_p_class_' + i + ']').each(function() {
		$(this).attr('name', 'sub_p_class_' + (i-1) + '[]');
	    });
	    $('select[name^=sub_pr_code_' + i + ']').each(function() {
		$(this).attr('name', 'sub_pr_code_' + (i-1) + '[]');
	    });
	    $('input[name^=quantity_' + i + ']').each(function() {
		$(this).attr('name', 'quantity_' + (i-1) + '[]');
	    });
	    $('.main-line-' + i).find('.part-del-btn').attr('seq', (i-1));
	    $('.sub-line-' + i).find('.part-del-btn').each(function() {
		$(this).attr('seq', (i-1));
	    });
	    $('.main-line-' + i).find('.part-add-btn').attr('seq', (i-1));
	    $('.sub-line-' + i).find('.part-add-btn').each(function() {
		$(this).attr('seq', (i-1));
	    });
	    $('.main-line-' + i).addClass('main-line-' + (i-1));
	    $('.main-line-' + i).removeClass('main-line-' + i);
	    $('.sub-line-' + i).addClass('sub-line-' + (i-1));
	    $('.sub-line-' + i).removeClass('sub-line-' + i);
	}
    } else {
	swal({
	    title:JS_TEXT['alert_at_least_one_appliance'],
	    type: 'warning',
	    showCancelButton: true,
	    closeOnConfirm:true
	});
    }
});

function get_part_class_option(target) {
    _ajax_html('/sfa/stock/xhr/part_class_list.xhr.php', '', print_html, target);
}
function get_product_class_option(target) {
    _ajax_html('/sfa/stock/xhr/product_class_list.xhr.php', '', print_html, target);
}
function get_product_option(target) {
    _ajax_html('/sfa/stock/xhr/product_list.xhr.php', '', print_html, target);
}
function print_html(html) {
    var target = this.arg;
    target.html(html);
    if (target.attr('name').indexOf('pr_code_') == 0) {
	target.selectpicker('refresh');
    }
}
*/

$(document).on('change', 'select[name^=gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=gr_code]').index(this);
    _ajax_html('/sfa/template/xhr/get_product_list.xhr.php', 'gr_code=' + gr_code, print_product_options, index, true);
});


$(document).on('change', 'select[name^=part_gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=part_gr_code]').index(this);
    var arg	= new Array(index, 'po');
    _ajax_html('/sfa/template/xhr/get_product_part_list.xhr.php', 'gr_code=' + gr_code, print_product_part_options, arg, true);
});


$(document).on('click', '.part-add-btn', function() {
    var index	= $('.part-add-btn').index(this);
    _ajax_html('/sfa/template/form/request_product_part_row.tmpl.php', '', print_product_part_row, index, true);

});

$(document).on('click', '.part-del-btn', function() {
    var obj	= $(this);
    if ($('input[name=op_code]').val() != '') {
	swal({
	    title:JS_TEXT['confirm_del_request_product'],
	    type: 'warning',
	    showCancelButton: true,
	    closeOnConfirm:true
	}, function() {
	    var index	= $('.product-tbody').index($(this).parent().parent().parent());
	    var rowspan	= ($('.p-class-td').eq(index).attr('rowspan'));
	    if (rowspan == undefined) rowspan	= 1;
	    rowspan	= parseInt(rowspan, 10) -1;
	    $('.p-class-td').eq(index).attr('rowspan', rowspan);
	    $('.seq').eq(index).attr('rowspan', rowspan);
	    obj.parent().parent().remove();
	});
    } else {
	var index	= $('.product-tbody').index($(this).parent().parent().parent());
	var rowspan	= ($('.p-class-td').eq(index).attr('rowspan'));
	if (rowspan == undefined) rowspan	= 1;
	rowspan	= parseInt(rowspan, 10) -1;
	$('.p-class-td').eq(index).attr('rowspan', rowspan);
	$('.seq').eq(index).attr('rowspan', rowspan);
	$(this).parent().parent().remove();
    }
});


$(document).on('click', '.product-add-btn', function() {
    _ajax_html('/sfa/template/form/request_product_row.tmpl.php', 'op_code=' + $('input[name=op_code]').val(), print_product_row);
});

$(document).on('click', '.product-del-btn', function() {
    var obj	= this;
    if ($('input[name=op_code]').val() != '') {
	swal({
	    title:JS_TEXT['confirm_del_request_product'],
	    type: 'warning',
	    showCancelButton: true,
	    closeOnConfirm:true
	}, function() {
	    var index	= $('.product-del-btn').index(obj);
	    $('.product-tbody').eq(index).remove();
	    remake_seq();
	});
    } else {
	var index	= $('.product-del-btn').index(obj);
	$('.product-tbody').eq(index).remove();
	remake_seq();
    }
});



function print_product_options(data) {
    var index	= this.arg;
    $('select[name^=pr_code]').eq(index).html(data);
    $('select[name^=pr_code]').selectpicker('refresh');
}
function print_product_part_options(data) {
    var index	= this.arg[0];
    var type	= this.arg[1];
    if (type == 'po') {
	$('select[name^=part_pr_code]').eq(index).html(data);
	$('select[name^=part_pr_code]').selectpicker('refresh');
    } else if (type == 'svc') {
	$('select[name^=s_part_pr_code]').eq(index).html(data);
	$('select[name^=s_part_pr_code]').selectpicker('refresh');
    } else {
	$('select[name^=m_part_pr_code]').eq(index).html(data);
	$('select[name^=m_part_pr_code]').selectpicker('refresh');
    }
}
function print_product_part_row(data) {
    var index	= this.arg;
    $('.product-tbody').eq(index).append(data);
    $('select[name^=part_pr_code]').selectpicker('refresh');

    var rowspan	= ($('.p-class-td').eq(index).attr('rowspan'));
    if (rowspan == undefined) rowspan	= 1;
    rowspan	= parseInt(rowspan, 10);

    $('.p-class-td').eq(index).attr('rowspan', rowspan+1);
    $('.seq').eq(index).attr('rowspan', rowspan+1);
}
function print_product_row(data) {
    $('.product-table').append(data);
    $('select[name^=pr_code]').selectpicker('refresh');
    remake_seq();
}
function remake_seq() {
    var seq	= 1;
    $('.seq').each(function() {
	$(this).text(seq);
	seq++;
    });
}
