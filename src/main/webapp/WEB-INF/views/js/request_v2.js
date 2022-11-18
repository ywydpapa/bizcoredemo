$(document).on('click', '#btn_op_add_items', function() {
    _ajax_html('/sfa/template/form/request_items.tmpl.php', '', print_items);
});
$(document).on('click', '#btn_op_add_main', function() {
    _ajax_html('/sfa/template/form/request_items.tmpl.php', '', print_items);
});
$(document).on('click', '.btn-add-part', function() {
    var index	= $('select[name^=p_class]').index($(this).parent().parent().find('select[name^=p_class]'));
    _ajax_html('/sfa/template/form/request_part_in_main.tmpl.php', '', print_part_in_main, index);
});
$(document).on('click', '#btn_op_add_part', function() {
    _ajax_html('/sfa/template/form/request_parts.tmpl.php', '', print_parts);
});
$(document).on('input', '.only-number', function() {
    $(this).val(convert_currency($(this).val().replace(/[^0-9]/g,"")));
});

$(document).on('click', '.btn-del-item', function() {
    var target_tr	= $(this).parent().parent().parent().parent();
    var target_tbody	= $(this).parent().parent().parent().parent().parent();
    if (target_tbody.parent().next().length > 0 && target_tbody.parent().next().prop('tagName').toLowerCase() == 'hr') {
	target_tbody.parent().next().remove();
    }
    target_tbody.parent().remove();
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

    labeling();
});
$(document).on('change', 'select[name^=pr_group]', function() {
    var index	= $('select[name^=pr_group]').index(this);
    _ajax_html('/sfa/product/xhr/product_list.xhr.php', 'gr_code=' + $(this).val(), print_product_options, index, true);
});
$(document).on('change', 'select[name^=part_pr_group]', function() {
    var index	= $('select[name^=part_pr_group]').index(this);
    _ajax_html('/sfa/product/xhr/product_part_list.xhr.php', 'gr_code=' + $(this).val(), print_product_part_options, index, true);
});
$(document).on('change', 'select[name^=m_pr_group]', function() {
    var index	= $('select[name^=m_pr_group]').index(this);
    _ajax_html('/sfa/product/xhr/product_list.xhr.php', 'gr_code=' + $(this).val(), print_product_options_m, index, true);
});
$(document).on('change', 'select[name^=sales_type]', function() {
    var index	= $('select[name^=sales_type]').index(this);
    _ajax_html('/sfa/product/xhr/get_p_class.xhr.php', 'sales_type=' + $(this).val(), print_p_class_option, index, true);
});


function print_items(data) {
    var label_check = 0;
    if ($('#items_list_form').find('.items-table').length > 0) {
    } else {
	label_check	= 1;
    }
    $('#items_list_form').append(data);

    /* first table */
    if (label_check == 1) {
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=sales_type]').before('<label>' + JS_TEXT['type'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=p_class]').before('<label>' + JS_TEXT['product_class'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('input[name^=memo]').before('<label>' + JS_TEXT['description'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('input[name^=quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('button').css('margin-top', '23px');
    }
}
function print_parts(data) {
    var label_check = 0;
    if ($('#items_list_form').find('.items-table').length > 0) {
    } else {
	label_check	= 1;
    }
    $('#items_list_form').append(data);

    /* first table */
    if (label_check == 1) {
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=sales_type]').before('<label>' + JS_TEXT['type'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=p_class]').before('<label>' + JS_TEXT['product_class'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=part_pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('select[name^=part_pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('input[name^=part_memo]').before('<label>' + JS_TEXT['description'] + '</label>');
	$('#items_list_form').find('.items-table').eq(0).find('input[name^=part_quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
    }
}
function print_part_in_main(data) {
    var index	= this.arg;
    $('#items_list_form').find('.items-table').eq(index).append(data);
}
function print_product_options(data) {
    var index	= this.arg;
    $('select[name^=pr_code]').eq(index).html(data);
    $('select[name^=pr_code]').eq(index).trigger('change');
}
function print_product_part_options(data) {
    var index	= this.arg;
    $('select[name^=part_pr_code]').eq(index).html(data);
    $('select[name^=part_pr_code]').eq(index).trigger('change');
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
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=memo]').before('<label>' + JS_TEXT['description'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('tr').eq(0).find('button').css('margin-top', '23px');
	} else {
	    $('#items_list_form').find('.items-table').eq(0).find('select[name^=part_pr_group]').before('<label>' + JS_TEXT['product_group'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('select[name^=part_pr_code]').before('<label>' + JS_TEXT['product'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=part_memo]').before('<label>' + JS_TEXT['description'] + '</label>');
	    $('#items_list_form').find('.items-table').eq(0).find('input[name^=part_quantity]').parent().before('<label>' + JS_TEXT['quantity'] + '</label>');
	}
    }
}
function print_p_class_option(data) {
    var index	= this.arg
    var target	= $('select[name^=p_class]').eq(index);
    target.html(data);
}
