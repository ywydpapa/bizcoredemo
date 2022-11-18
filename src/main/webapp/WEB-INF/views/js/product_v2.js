$(document).on('click', '#btn_op_add_items', function() {
    _ajax_html('/sfa/template/form/items.tmpl.php', '', print_items);
});
$(document).on('click', '#m_btn_add_items', function() {
    _ajax_html('/sfa/template/form/m_items.tmpl.php', '', print_items_m);
});
$(document).on('click', '#btn_op_add_main', function() {
    _ajax_html('/sfa/template/form/items.tmpl.php', '', print_items);
});
$(document).on('click', '.btn_ct_add_main', function() {
    var type	= $(this).attr('type');
    _ajax_html('/sfa/template/form/ct_items.tmpl.php', 'type=' + type, print_ct_items, type);
});
$(document).on('click', '.btn_ct_mod_add_main', function() {
    var type	= $(this).attr('type');
    _ajax_html('/sfa/template/form/ct_mod_items.tmpl.php', 'type=' + type, print_ct_items, type);
});
$(document).on('click', '.btn-add-part', function() {
    var index	= $('[name^=p_class]').index($(this).parent().parent().find('[name^=p_class]'));
    var arg	= new Array(index, '1');
    _ajax_html('/sfa/template/form/part_in_main.tmpl.php', '', print_part_in_main, arg);
});
$(document).on('click', '.btn-ct-mod-add-part', function() {
    var type	= $(this).attr('ct_type');
    var index	= '';
    if (type == '1') {
	index	= $('[name^=p_class]').index($(this).parent().parent().find('[name^=p_class]'));
    } else if (type == '2') {
	index	= $('[name^=s_class]').index($(this).parent().parent().find('[name^=s_class]'));
    } else if (type == '3') {
	index	= $('[name^=m_class]').index($(this).parent().parent().find('[name^=m_class]'));
    }
    var arg	= new Array(index, type);
    _ajax_html('/sfa/template/form/ct_mod_part_in_main.tmpl.php', 'type=' + type, print_part_in_main, arg);
});
$(document).on('click', '.btn-ct-add-part', function() {
    var type	= $(this).attr('ct_type');
    var index	= '';
    if (type == '1') {
	index	= $('[name^=p_class]').index($(this).parent().parent().find('[name^=p_class]'));
    } else if (type == '2') {
	index	= $('[name^=s_class]').index($(this).parent().parent().find('[name^=s_class]'));
    } else if (type == '3') {
	index	= $('[name^=m_class]').index($(this).parent().parent().find('[name^=m_class]'));
    }
    var arg	= new Array(index, type);
    _ajax_html('/sfa/template/form/ct_part_in_main.tmpl.php', 'type=' + type, print_part_in_main, arg);
});
$(document).on('click', '#btn_op_add_part', function() {
    _ajax_html('/sfa/template/form/parts.tmpl.php', '', print_parts, '1');
});
$(document).on('click', '.btn_ct_add_part', function() {
    var type	= $(this).attr('type');
    _ajax_html('/sfa/template/form/ct_parts.tmpl.php', 'type=' + type, print_parts, type);
});
$(document).on('click', '.btn_ct_mod_add_part', function() {
    var type	= $(this).attr('type');
    _ajax_html('/sfa/template/form/ct_mod_parts.tmpl.php', 'type=' + type, print_parts, type);
});
$(document).on('input', '.only-number', function() {
    $(this).val(convert_currency($(this).val().replace(/[^0-9|-]/g,"")));
    if ($(this).hasClass('total-check')) {
	var total	= 0;
	$(this).parent().parent().parent().parent().find('input[name^=price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/,/g, ''));
	    }
	});
	$(this).parent().parent().parent().parent().find('input[name^=part_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/,/g, ''));
	    }
	});
	$(this).parent().parent().parent().parent().find('.total-price').text(convert_currency(total));

	total	= 0;
	$('input[name^=price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/,/g, ''));
	    }
	});
	$('input[name^=part_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/,/g, ''));
	    }
	});
	$('#opp_total_amount').text(convert_currency(total));
	$('#po_ct_price').val(convert_currency(total));

	if ($(this).parent().parent().parent().parent().find('input[name^=svc_price]').length > 0 ||
		$(this).parent().parent().parent().parent().find('input[name^=svc_part_price]').length > 0) {
	    total	= 0;
	    $(this).parent().parent().parent().parent().find('input[name^=svc_price]').each(function() {
		if ($(this).val() != '') {
		    total += parseInt($(this).val().replace(/,/g, ''));
		}
	    });
	    $(this).parent().parent().parent().parent().find('input[name^=svc_part_price]').each(function() {
		if ($(this).val() != '') {
		    total += parseInt($(this).val().replace(/,/g, ''));
		}
	    });
	    $(this).parent().parent().parent().parent().find('.total-price').text(convert_currency(total));
	}

	total	= 0;
	$('input[name^=svc_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/,/g, ''));
	    }
	});
	$('input[name^=svc_part_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/,/g, ''));
	    }
	});
	$('#svc_opp_total_amount').text(convert_currency(total));
	$('#svc_ct_price').val(convert_currency(total));

	if ($(this).parent().parent().parent().parent().find('input[name^=m_price]').length > 0 ||
		$(this).parent().parent().parent().parent().find('input[name^=m_part_price]').length > 0) {
	    total	= 0;
	    $(this).parent().parent().parent().parent().find('input[name^=m_price]').each(function() {
		if ($(this).val() != '') {
		    total += parseInt($(this).val().replace(/,/g, ''));
		}
	    });
	    $(this).parent().parent().parent().parent().find('input[name^=m_part_price]').each(function() {
		if ($(this).val() != '') {
		    total += parseInt($(this).val().replace(/,/g, ''));
		}
	    });
	    $(this).parent().parent().parent().parent().find('.total-price').text(convert_currency(total));
	}

	total	= 0;
	$('input[name^=m_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/,/g, ''));
	    }
	});
	$('input[name^=m_part_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/,/g, ''));
	    }
	});
	$('#m_total_amount').text(convert_currency(total));
	$('#ma_ct_price').val(convert_currency(total));
    } else if ($(this).hasClass('m-total-check')) {
	var total	= 0;
	$(this).parent().parent().parent().parent().find('input[name^=m_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/,/g, ''));
	    }
	});
	$(this).parent().parent().parent().parent().find('.m-total-price').text(convert_currency(total));

	total	= 0;
	$('input[name^=m_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/,/g, ''));
	    }
	});
	$('#m_total_amount').text(convert_currency(total));
    }
});

$(document).on('click', '.btn-del-item', function() {
    var target_tr	= $(this).parent().parent().parent().parent();
    var target_tbody	= $(this).parent().parent().parent().parent().parent();
    if (target_tbody.parent().next().length > 0 && target_tbody.parent().next().prop('tagName').toLowerCase() == 'hr') {
	target_tbody.parent().next().remove();
    }
    target_tbody.parent().remove();
    var total	= 0;
    $('input[name^=price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    $('#opp_total_amount').text(convert_currency(total));
    $('#po_ct_price').val(convert_currency(total));
    labeling();
});
$(document).on('click', '.btn-del-part', function() {
    var target_tbody	= $(this).parent().parent().parent().parent().parent();
    var target_tr	= $(this).parent().parent().parent().parent();
    if (target_tbody.find('tr').length == 1) {
	if (target_tbody.parent().next().length > 0 && target_tbody.parent().next().prop('tagName').toLowerCase() == 'hr') {
	    target_tbody.parent().next().remove();
	}
    }
   
    var html	= '';
    if (target_tr.find('td').last().find('h4').length > 0) {
	html	= target_tr.find('td').last().find('h4').html();
    }

    if (target_tbody.find('tr').length == 1) {
	target_tbody.parent().remove();
    } else {
	target_tr.remove();
    }
    
    if (html != '') {
	target_tbody.find('td').last().append('<h4 class="text-right">' + html + '</h4>');
    }
    
    var total	= 0;
    
    target_tbody.find('input[name^=price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    target_tbody.find('input[name^=part_price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    target_tbody.find('.total-price').text(convert_currency(total));

    total	= 0;
    $('input[name^=price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    $('input[name^=part_price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    $('#opp_total_amount').text(convert_currency(total));
    $('#po_ct_price').val(convert_currency(total));
    labeling();
});
$(document).on('click', '.m-btn-del-item', function() {
    $(this).parent().parent().parent().parent().parent().parent().remove();
    var total	= 0;
    $('input[name^=m_price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    $('#m_total_amount').text(convert_currency(total));
});
$(document).on('change', 'select[name^=pr_group]', function() {
    var index	= $('select[name^=pr_group]').index(this);
    _ajax_html('/sfa/product/xhr/product_list.xhr.php', 'gr_code=' + $(this).val(), print_product_options, index, true);
});
$(document).on('change', 'select[name^=part_pr_group]', function() {
    var index	= $('select[name^=part_pr_group]').index(this);
    _ajax_html('/sfa/product/xhr/product_part_list.xhr.php', 'gr_code=' + $(this).val(), print_product_part_options, index, true);
});
$(document).on('change', 'select[name^=pr_code]', function() {
    var index	= $('select[name^=pr_code]').index(this);
    if ($('input[name^=cost_price]').length > 0) {
	_ajax('/sfa/product/xhr/get_cost_price.xhr.php', 'pr_code=' + $(this).val(), print_product_cost_price, index, true);
    }
});
$(document).on('change', 'select[name^=svc_pr_group]', function() {
    var index	= $('select[name^=svc_pr_group]').index(this);
    _ajax_html('/sfa/product/xhr/product_list.xhr.php', 'gr_code=' + $(this).val(), print_product_options_svc, index, true);
});
$(document).on('change', 'select[name^=svc_part_pr_group]', function() {
    var index	= $('select[name^=svc_part_pr_group]').index(this);
    _ajax_html('/sfa/product/xhr/product_part_list.xhr.php', 'gr_code=' + $(this).val(), print_product_part_options_svc, index, true);
});
$(document).on('change', 'select[name^=m_pr_group]', function() {
    var index	= $('select[name^=m_pr_group]').index(this);
    _ajax_html('/sfa/product/xhr/product_list.xhr.php', 'gr_code=' + $(this).val(), print_product_options_m, index, true);
});
$(document).on('change', 'select[name^=m_pr_code]', function() {
    var index	= $('select[name^=m_pr_code]').index(this);
    if ($('input[name^=m_cost_price]').length > 0) {
	_ajax('/sfa/product/xhr/get_cost_price.xhr.php', 'pr_code=' + $(this).val(), print_product_cost_price_m, index, true);
    }
});
$(document).on('change', 'select[name^=sales_type]', function() {
    var index	= $('select[name^=sales_type]').index(this);
    _ajax_html('/sfa/product/xhr/get_p_class.xhr.php', 'sales_type=' + $(this).val(), print_p_class_option, index, true);
});

function print_ct_items(data) {
    var type = this.arg;
    if (type == '1') {
	$('#items_list_form').append(data);
    } else if (type == '2') {
	$('#svc_items_list_form').append(data);
    } else if (type == '3') {
	$('#m_items_list_form').append(data);
    }
    change_currency();
}

function print_items(data) {
    var label_check = 0;
    if ($('#items_list_form').find('.items-table').length > 0) {
    } else {
	label_check	= 1;
    }
    $('#items_list_form').append(data);

    if ($('input[name^=sales_type]').length > 0) { // disabled상태임
	$('input[name^=sales_type]').each(function() {
	    var type	= $(this).val();
	    if (type == '1') {
		$('select[name^=sales_type] option[value=1]').remove();
	    } else if (type == '2') {
		$('select[name^=sales_type] option[value=2]').remove();
	    } else if (type == '3') {
		$('select[name^=sales_type] option[value=3]').remove();
	    }
	});
    }

    /* first table */
    if (label_check == 1) {
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=sales_type]').before('<label>' + JS_TEXT['type'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=p_class]').before('<label>' + JS_TEXT['product_class'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('input[name^=price]').parent().before('<label>' + JS_TEXT['price'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('input[name^=cost_price]').parent().before('<label>' + JS_TEXT['cost_price'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('input[name^=quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('button').css('margin-top', '23px');
    }

    change_currency();
}
function change_currency() {
    if ($('select[name=currency]').length > 0) {
	var option      = $('select[name=currency] option:selected').text();
	var currency_text	= option.substring(0, option.indexOf('('));
	if (currency_text == '') currency_text	= '₩';

	$('#opp_total_amount').parent().html('Total : ' + currency_text + '<span id="opp_total_amount">' + $('#opp_total_amount').text() + '</span>');

	$('input[name^=price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('input[name^=part_price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('.total-price').each(function() {
	    var total	= $(this).text();
	    if (isNaN(total.substring(0, 1))) {
		total	= total.substring(1);
	    }
	    $(this).parent().html('Total:' + currency_text + '<span class="total-price">' + total + '</span>');
	});
    } 
    if ($('select[name=po_currency]').length > 0) {
	var option      = $('select[name=po_currency] option:selected').text();
	var currency_text	= option.substring(0, option.indexOf('('));
	if (currency_text == '') currency_text	= '₩';
	
	$('#opp_total_amount').parent().html('Total : ' + currency_text + '<span id="opp_total_amount">' + $('#opp_total_amount').text() + '</span>');
	
	$('input[name^=price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('input[name^=part_price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('input[name^=sales_price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('input[name^=ss_price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	var sales_total	= $('#sales_total').text();
	if (isNaN(sales_total.substring(0, 1))) {
	    sales_total	= sales_total.substring(1);
	}
	$('#sales_total').text(currency_text + sales_total);
    } 
    if ($('select[name=svc_currency]').length > 0) {
	var option      = $('select[name=svc_currency] option:selected').text();
	var currency_text	= option.substring(0, option.indexOf('('));
	if (currency_text == '') currency_text	= '₩';
	
	$('#svc_opp_total_amount').parent().html('Total : ' + currency_text + '<span id="svc_opp_total_amount">' + $('#svc_opp_total_amount').text() + '</span>');
	
	$('input[name^=svc_price]').each(function() {
	    if ($(this).attr('type') == 'hidden') return;
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('input[name^=svc_part_price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('input[name^=sales_price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('input[name^=ss_price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	var sales_total	= $('#sales_total').text();
	if (isNaN(sales_total.substring(0, 1))) {
	    sales_total	= sales_total.substring(1);
	}
	$('#sales_total').text(currency_text + sales_total);
    }
    if ($('select[name=ma_currency]').length > 0) {
	var option      = $('select[name=ma_currency] option:selected').text();
	var currency_text	= option.substring(0, option.indexOf('('));
	if (currency_text == '') currency_text	= '₩';
	
	$('#m_total_amount').parent().html('Total : ' + currency_text + '<span id="m_total_amount">' + $('#m_total_amount').text() + '</span>');
	
	$('input[name^=m_price]').each(function() {
	    if ($(this).attr('type') == 'hidden') return;
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('input[name^=m_part_price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('input[name^=sales_price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	$('input[name^=ss_price]').each(function() {
	    $(this).parent().find('.input-group-addon').remove();
	    $(this).before('<span class="input-group-addon">' + currency_text + '</span>');
	});
	var sales_total	= $('#sales_total').text();
	if (isNaN(sales_total.substring(0, 1))) {
	    sales_total	= sales_total.substring(1);
	}
	$('#sales_total').text(currency_text + sales_total);
    }
}
function print_parts(data) {
    var type	= this.arg;
    var label_check = 0;

    if (type == '1') {
	if ($('#items_list_form').find('.items-table').length > 0) {
	} else {
	    label_check	= 1;
	}
	$('#items_list_form').append(data);
	if ($('input[name^=sales_type]').length > 0) { // disabled상태임
	    $('input[name^=sales_type]').each(function() {
		var type	= $(this).val();
		if (type == '1') {
		    $('select[name^=sales_type] option[value=1]').remove();
		} else if (type == '2') {
		    $('select[name^=sales_type] option[value=2]').remove();
		} else if (type == '3') {
		    $('select[name^=sales_type] option[value=3]').remove();
		}
	    });
	}

	/* first table */
	/*
	if (label_check == 1) {
	    $('#items_list_form').find('.items-table').eq(0).find('select[name^=sales_type]').before('<label>' + JS_TEXT['type'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('select[name^=p_class]').before('<label>' + JS_TEXT['product_class'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('select[name^=part_pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('select[name^=part_pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=part_price]').parent().before('<label>' + JS_TEXT['price'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=part_cost_price]').parent().before('<label>' + JS_TEXT['cost_price'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=part_quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	}
	*/
    } else if (type == '2') {
	if ($('#svc_items_list_form').find('.items-table').length > 0) {
	} else {
	    label_check	= 1;
	}
	$('#svc_items_list_form').append(data);

	/* first table */
	/*
	if (label_check == 1) {
	    $('#svc_items_list_form').find('.items-table').eq(0).find('select[name^=svc_sales_type]').before('<label>' + JS_TEXT['type'] + '</label>');
	    $('#svc_items_list_form').find('.items-table').eq(0).find('select[name^=s_class]').before('<label>' + JS_TEXT['product_class'] + '</label>');
	    $('#svc_items_list_form').find('.items-table').eq(0).find('select[name^=svc_part_pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	    $('#svc_items_list_form').find('.items-table').eq(0).find('select[name^=svc_part_pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	    $('#svc_items_list_form').find('.items-table').eq(0).find('input[name^=svc_part_price]').parent().before('<label>' + JS_TEXT['price'] + '</label>');
	    $('#svc_items_list_form').find('.items-table').eq(0).find('input[name^=svc_part_cost_price]').parent().before('<label>' + JS_TEXT['cost_price'] + '</label>');
	    $('#svc_items_list_form').find('.items-table').eq(0).find('input[name^=svc_part_quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	}
	*/
    } else if (type == '3') {
	if ($('#m_items_list_form').find('.items-table').length > 0) {
	} else {
	    label_check	= 1;
	}
	$('#m_items_list_form').append(data);

	/* first table */
	/*
	if (label_check == 1) {
	    $('#m_items_list_form').find('.items-table').eq(0).find('select[name^=m_sales_type]').before('<label>' + JS_TEXT['type'] + '</label>');
	    $('#m_items_list_form').find('.items-table').eq(0).find('select[name^=m_class]').before('<label>' + JS_TEXT['product_class'] + '</label>');
	    $('#m_items_list_form').find('.items-table').eq(0).find('select[name^=m_part_pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	    $('#m_items_list_form').find('.items-table').eq(0).find('select[name^=m_part_pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	    $('#m_items_list_form').find('.items-table').eq(0).find('input[name^=m_part_price]').parent().before('<label>' + JS_TEXT['price'] + '</label>');
	    $('#m_items_list_form').find('.items-table').eq(0).find('input[name^=m_part_cost_price]').parent().before('<label>' + JS_TEXT['cost_price'] + '</label>');
	    $('#m_items_list_form').find('.items-table').eq(0).find('input[name^=m_part_quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	}
	*/
    }
    change_currency();
}
function print_part_in_main(data) {
    var index	= this.arg[0];
    var type	= this.arg[1];
    if (type == '1') {
	$('#items_list_form').find('.items-table').eq(index).append(data);
	if ($('#items_list_form').find('.items-table').eq(index).find('.last-td').find('h4').length > 0) {
	    var price_html	= $('#items_list_form').find('.items-table').eq(index).find('.last-td').find('h4').html();
	    $('#items_list_form').find('.items-table').eq(index).find('.last-td').find('h4').remove();
	    $('#items_list_form').find('.items-table').eq(index).find('td').last().append('<h4 class="text-right">' + price_html + '</h4>');
	}
    } else if (type == '2') {
	$('#svc_items_list_form').find('.items-table').eq(index).append(data);
	if ($('#svc_items_list_form').find('.items-table').eq(index).find('.last-td').find('h4').length > 0) {
	    var price_html	= $('#svc_items_list_form').find('.items-table').eq(index).find('.last-td').find('h4').html();
	    $('#svc_items_list_form').find('.items-table').eq(index).find('.last-td').find('h4').remove();
	    $('#svc_items_list_form').find('.items-table').eq(index).find('td').last().append('<h4 class="text-right">' + price_html + '</h4>');
	}
    } else if (type == '3') {
	$('#m_items_list_form').find('.items-table').eq(index).append(data);
	if ($('#m_items_list_form').find('.items-table').eq(index).find('.last-td').find('h4').length > 0) {
	    var price_html	= $('#m_items_list_form').find('.items-table').eq(index).find('.last-td').find('h4').html();
	    $('#m_items_list_form').find('.items-table').eq(index).find('.last-td').find('h4').remove();
	    $('#m_items_list_form').find('.items-table').eq(index).find('td').last().append('<h4 class="text-right">' + price_html + '</h4>');
	}
    }
    change_currency();
}
function print_product_options(data) {
    var index	= this.arg;
    $('select[name^=pr_code]').eq(index).html(data);
    $('select[name^=pr_code]').eq(index).trigger('change');
}
function print_product_options_svc(data) {
    var index	= this.arg;
    $('select[name^=svc_pr_code]').eq(index).html(data);
    $('select[name^=svc_pr_code]').eq(index).trigger('change');
}
function print_product_part_options(data) {
    var index	= this.arg;
    $('select[name^=part_pr_code]').eq(index).html(data);
    $('select[name^=part_pr_code]').eq(index).trigger('change');
}
function print_product_part_options_svc(data) {
    var index	= this.arg;
    $('select[name^=svc_part_pr_code]').eq(index).html(data);
    $('select[name^=svc_part_pr_code]').eq(index).trigger('change');
}
function print_product_cost_price(data, index) {
    $('input[name^=cost_price]').eq(index).val(data.cost_price);
}
function print_items_m(data) {
    var label_check = 0;
    if ($('#m_items_list_form').find('.items-table').length > 0) {
    } else {
	label_check	= 1;
    }
    $('#m_items_list_form').append(data);
    
    /* first table */
    if (label_check == 1) {
	$('#m_items_list_form').find('.items-table').eq(0).find('select[name^=m_class]').before('<label>' + JS_TEXT['product_class'] + '</label>');
	$('#m_items_list_form').find('.items-table').eq(0).find('select[name^=m_pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	$('#m_items_list_form').find('.items-table').eq(0).find('select[name^=m_pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	$('#m_items_list_form').find('.items-table').eq(0).find('input[name^=m_price]').parent().before('<label>' + JS_TEXT['price'] + '</label>');
	$('#m_items_list_form').find('.items-table').eq(0).find('input[name^=m_cost_price]').parent().before('<label>' + JS_TEXT['cost_price'] + '</label>');
	$('#m_items_list_form').find('.items-table').eq(0).find('input[name^=m_quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	$('#m_items_list_form').find('.items-table').eq(0).find('button').css('margin-top', '23px');
    }
}
function print_product_options_m(data) {
    var index	= this.arg;
    $('select[name^=m_pr_code]').eq(index).html(data);
    $('select[name^=m_pr_code]').eq(index).trigger('change');
}
function print_product_cost_price_m(data, index) {
    $('input[name^=m_cost_price]').eq(index).val(data.cost_price);
}
function labeling() {
    var label_check = 0;
    if ($('#items_list_form').find('.items-table').length >= 1) {
	if ($('#items_list_form').find('.items-table').eq(0).find('label').length <= 0) {
	    label_check	= 1;
	}
    }

    /* first table */
    if (label_check == 1) {
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=sales_type]').before('<label>' + JS_TEXT['type'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=p_class]').before('<label>' + JS_TEXT['product_class'] + '</label>');
	if ($('#items_list_form').find('.items-table').eq(0).find('select[name^=pr_group]').length > 0) {
	    $('#items_list_form').find('.items-table').eq(0).find('select[name^=pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('select[name^=pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=price]').parent().before('<label>' + JS_TEXT['price'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=cost_price]').parent().before('<label>' + JS_TEXT['cost_price'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('button').css('margin-top', '23px');
	} else {
	    $('#items_list_form').find('.items-table').eq(0).find('select[name^=part_pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('select[name^=part_pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=part_price]').parent().before('<label>' + JS_TEXT['price'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=part_cost_price]').parent().before('<label>' + JS_TEXT['cost_price'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=part_quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	}
    }
}
function print_p_class_option(data) {
    var index	= this.arg
    var target	= $('select[name^=p_class]').eq(index);
    target.html(data);
}
$(document).on('click', '.btn-ct-del-item', function() {
    var type	= $(this).attr('ct_type');
    var target_tr	= $(this).parent().parent();
    var target_tbody	= $(this).parent().parent().parent();
    if (target_tbody.parent().next().length > 0 && target_tbody.parent().next().prop('tagName').toLowerCase() == 'hr') {
	target_tbody.parent().next().remove();
    }
    target_tbody.parent().remove();
    var total	= 0;
    $('input[name^=price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    $('#opp_total_amount').text(convert_currency(total));
    $('#po_ct_price').val(convert_currency(total));
});
$(document).on('click', '.btn-ct-del-part', function() {
    var type	= $(this).attr('ct_type');
    var target_tbody	= $(this).parent().parent().parent();
    var target_tr	= $(this).parent().parent();
    if (target_tbody.find('tr').length == 1) {
	if (target_tbody.parent().next().length > 0 && target_tbody.parent().next().prop('tagName').toLowerCase() == 'hr') {
	    target_tbody.parent().next().remove();
	}
    }
   
    var html	= '';
    var td	= '';
    var label_check	= 0;
    if (target_tr.find('input[name^=p_class]').length > 0) {
	td = target_tr.find('td').eq(0).html();
    }
    if (target_tr.find('label').length > 0) {
	label_check	= 1;
    }
    if (target_tr.find('td').last().find('h4').length > 0) {
	html	= target_tr.find('td').last().find('h4').html();
    }

    if (target_tbody.find('tr').length == 1) {
	target_tbody.parent().remove();
    } else {
	target_tr.remove();
	if (td != '') {
	    target_tbody.find('td').eq(0).html(td);
	    target_tbody.find('td').eq(0).attr('width', '180px');
	}
	if (label_check == 1) {
	    target_tbody.find('tr').eq(0).find('select[name^=part_pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	    target_tbody.find('tr').eq(0).find('select[name^=part_pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	    target_tbody.find('tr').eq(0).find('input[name^=part_pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	    target_tbody.find('tr').eq(0).find('input[name^=part_pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	    target_tbody.find('tr').eq(0).find('input[name^=sn]').before('<label>S/N</label>');
	    target_tbody.find('tr').eq(0).find('input[name^=part_price]').parent().before('<label>' + JS_TEXT['price'] + '</label>');
	    target_tbody.find('tr').eq(0).find('input[name^=part_quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	    target_tbody.find('tr').eq(0).find('button').css('margin-top', '23px');
	}
    }
    
    if (html != '') {
	target_tbody.find('td').last().append('<h4 class="text-right">' + html + '</h4>');
    }
    
    var total	= 0;
    
    target_tbody.find('input[name^=price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    target_tbody.find('input[name^=part_price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    target_tbody.find('.total-price').text(convert_currency(total));

    total	= 0;
    $('input[name^=price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    $('input[name^=part_price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/,/g, ''));
	}
    });
    $('#opp_total_amount').text(convert_currency(total));
    $('#po_ct_price').val(convert_currency(total));
});
