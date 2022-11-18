$(document).on('change', 'select[name^=gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=gr_code]').index(this);
    var arg	= new Array(index, 'po');
    _ajax_html('/sfa/template/xhr/get_product_list.xhr.php', 'gr_code=' + gr_code, print_product_options, arg, true);
});
$(document).on('change', 'select[name^=s_gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=s_gr_code]').index(this);
    var arg	= new Array(index, 'svc');
    _ajax_html('/sfa/template/xhr/get_product_list.xhr.php', 'gr_code=' + gr_code, print_product_options, arg, true);
});
$(document).on('change', 'select[name^=m_gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=m_gr_code]').index(this);
    var arg	= new Array(index, 'mc');
    _ajax_html('/sfa/template/xhr/get_product_list.xhr.php', 'gr_code=' + gr_code, print_product_options, arg, true);
});


$(document).on('change', 'select[name^=part_gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=part_gr_code]').index(this);
    var arg	= new Array(index, 'po');
    _ajax_html('/sfa/template/xhr/get_product_part_list.xhr.php', 'gr_code=' + gr_code, print_product_part_options, arg, true);
});
$(document).on('change', 'select[name^=s_part_gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=s_part_gr_code]').index(this);
    var arg	= new Array(index, 'svc');
    _ajax_html('/sfa/template/xhr/get_product_part_list.xhr.php', 'gr_code=' + gr_code, print_product_part_options, arg, true);
});
$(document).on('change', 'select[name^=m_part_gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=m_part_gr_code]').index(this);
    var arg	= new Array(index, 'mc');
    _ajax_html('/sfa/template/xhr/get_product_part_list.xhr.php', 'gr_code=' + gr_code, print_product_part_options, arg, true);
});


$(document).on('input', 'input[name^=price]', function() {
    var index	= $('input[name^=price]').index(this);
    calc_total_amount(index, 'po');
});
$(document).on('input', 'input[name^=part_price]', function() {
    var index	= $('.product-tbody').index($(this).parent().parent().parent());
    calc_total_amount(index, 'po');
});
$(document).on('input', 'input[name^=s_price]', function() {
    var index	= $('input[name^=s_price]').index(this);
    calc_total_amount(index, 'svc');
});
$(document).on('input', 'input[name^=s_part_price]', function() {
    var index	= $('.s-product-tbody').index($(this).parent().parent().parent());
    calc_total_amount(index, 'svc');
});
$(document).on('input', 'input[name^=m_price]', function() {
    var index	= $('input[name^=m_price]').index(this);
    calc_total_amount(index, 'ma');
});
$(document).on('input', 'input[name^=m_part_price]', function() {
    var index	= $('.m-product-tbody').index($(this).parent().parent().parent());
    calc_total_amount(index, 'ma');
});


$(document).on('click', '.part-add-btn', function() {
    var index	= $('.part-add-btn').index(this);
    var arg	= new Array(index, 'po');
    _ajax_html('/sfa/template/form/op_product_part_row.tmpl.php', 'type=po', print_product_part_row, arg, true);

});
$(document).on('click', '.s-part-add-btn', function() {
    var index	= $('.s-part-add-btn').index(this);
    var arg	= new Array(index, 'svc');
    _ajax_html('/sfa/template/form/op_product_part_row.tmpl.php', 'type=svc', print_product_part_row, arg, true);

});
$(document).on('click', '.m-part-add-btn', function() {
    var index	= $('.m-part-add-btn').index(this);
    var arg	= new Array(index, 'ma');
    _ajax_html('/sfa/template/form/op_product_part_row.tmpl.php', 'type=ma', print_product_part_row, arg, true);

});


$(document).on('click', '.product-del-btn', function() {
    var index	= $('.product-del-btn').index(this);
    $('.product-tbody').eq(index).remove();
});
$(document).on('click', '.s-product-del-btn', function() {
    var index	= $('.s-product-del-btn').index(this);
    $('.s-product-tbody').eq(index).remove();
});
$(document).on('click', '.m-product-del-btn', function() {
    var index	= $('.m-product-del-btn').index(this);
    $('.m-product-tbody').eq(index).remove();
});


$(document).on('click', '.part-del-btn', function() {
    var index	= $('.product-tbody').index($(this).parent().parent().parent());
    var rowspan	= ($('.p-class-td').eq(index).attr('rowspan'));
    if (rowspan == undefined) rowspan	= 1;
    rowspan	= parseInt(rowspan, 10) -1;
    $('.p-class-td').eq(index).attr('rowspan', rowspan);
    $('.total-price-td').eq(index).attr('rowspan', rowspan);
    $(this).parent().parent().remove();
    calc_total_amount(index, 'po');
});
$(document).on('click', '.s-part-del-btn', function() {
    var index	= $('.s-product-tbody').index($(this).parent().parent().parent());
    var rowspan	= ($('.s-p-class-td').eq(index).attr('rowspan'));
    if (rowspan == undefined) rowspan	= 1;
    rowspan	= parseInt(rowspan, 10) -1;
    $('.s-p-class-td').eq(index).attr('rowspan', rowspan);
    $('.s-total-price-td').eq(index).attr('rowspan', rowspan);
    $(this).parent().parent().remove();
    calc_total_amount(index, 'svc');
});
$(document).on('click', '.m-part-del-btn', function() {
    var index	= $('.m-product-tbody').index($(this).parent().parent().parent());
    var rowspan	= ($('.m-p-class-td').eq(index).attr('rowspan'));
    if (rowspan == undefined) rowspan	= 1;
    rowspan	= parseInt(rowspan, 10) -1;
    $('.m-p-class-td').eq(index).attr('rowspan', rowspan);
    $('.m-total-price-td').eq(index).attr('rowspan', rowspan);
    $(this).parent().parent().remove();
    calc_total_amount(index, 'mc');
});


$(document).on('click', '.product-add-btn', function() {
    _ajax_html('/sfa/template/form/op_product_row.tmpl.php', 'type=po', print_product_row, 'po', true);
});


function print_product_options(data) {
    var index	= this.arg[0];
    var type	= this.arg[1]; // po,svc,ma
    if (type == 'po') {
	$('select[name^=pr_code]').eq(index).html(data);
	$('select[name^=pr_code]').selectpicker('refresh');
    } else if (type == 'svc') {
	$('select[name^=s_pr_code]').eq(index).html(data);
	$('select[name^=s_pr_code]').selectpicker('refresh');
    } else {
	$('select[name^=m_pr_code]').eq(index).html(data);
	$('select[name^=m_pr_code]').selectpicker('refresh');
    }
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
function calc_total_amount(index, type) {
    var total	= 0;
    if (type == 'po') {
	if ($('.product-tbody').eq(index).find('input[name^=price]').val() != '') {
	    total = parseInt($('.product-tbody').eq(index).find('input[name^=price]').val().replace(/\,/g, '').replace(/\./g, ''), 10);
	}
	$('.product-tbody').eq(index).find('input[name^=part_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/\,/g, '').replace(/\./g, ''), 10);
	    }
	});
	$('.total-price-td').eq(index).text('￦' + convert_currency(total));
    } else if (type == 'svc') {
	if ($('.s-product-tbody').eq(index).find('input[name^=s_price]').val() != '') {
	    total = parseInt($('.s-product-tbody').eq(index).find('input[name^=s_price]').val().replace(/\,/g, '').replace(/\./g, ''), 10);
	}
	$('.s-product-tbody').eq(index).find('input[name^=s_part_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/\,/g, '').replace(/\./g, ''), 10);
	    }
	});
	$('.s-total-price-td').eq(index).text('￦' + convert_currency(total));
    } else {
	if ($('.m-product-tbody').eq(index).find('input[name^=m_price]').val() != '') {
	    total = parseInt($('.m-product-tbody').eq(index).find('input[name^=m_price]').val().replace(/\,/g, '').replace(/\./g, ''), 10);
	}
	$('.m-product-tbody').eq(index).find('input[name^=m_part_price]').each(function() {
	    if ($(this).val() != '') {
		total += parseInt($(this).val().replace(/\,/g, '').replace(/\./g, ''), 10);
	    }
	});
	$('.m-total-price-td').eq(index).text('￦' + convert_currency(total));
    }
}
function print_product_part_row(data) {
    var index	= this.arg[0];
    var type	= this.arg[1];

    if (type == 'po') {
	$('.product-tbody').eq(index).append(data);
	$('select[name^=part_pr_code]').selectpicker('refresh');

	var rowspan	= ($('.p-class-td').eq(index).attr('rowspan'));
	if (rowspan == undefined) rowspan	= 1;
	rowspan	= parseInt(rowspan, 10);

	$('.p-class-td').eq(index).attr('rowspan', rowspan+1);
	$('.total-price-td').eq(index).attr('rowspan', rowspan+1);
    } else if (type == 'svc') {
	$('.s-product-tbody').eq(index).append(data);
	$('select[name^=s_part_pr_code]').selectpicker('refresh');

	var rowspan	= ($('.s-p-class-td').eq(index).attr('rowspan'));
	if (rowspan == undefined) rowspan	= 1;
	rowspan	= parseInt(rowspan, 10);

	$('.s-p-class-td').eq(index).attr('rowspan', rowspan+1);
	$('.s-total-price-td').eq(index).attr('rowspan', rowspan+1);
    } else {
	$('.m-product-tbody').eq(index).append(data);
	$('select[name^=m_part_pr_code]').selectpicker('refresh');

	var rowspan	= ($('.m-p-class-td').eq(index).attr('rowspan'));
	if (rowspan == undefined) rowspan	= 1;
	rowspan	= parseInt(rowspan, 10);

	$('.m-p-class-td').eq(index).attr('rowspan', rowspan+1);
	$('.m-total-price-td').eq(index).attr('rowspan', rowspan+1);
    }
}
function print_product_row(data) {
    var type	= this.arg;
    if (type == 'po') {
	$('.product-table').append(data);
	$('select[name^=pr_code]').selectpicker('refresh');
    } else if (type == 'svc') {
	$('.s-product-table').append(data);
	$('select[name^=s_pr_code]').selectpicker('refresh');
    } else {
	$('.m-product-table').append(data);
	$('select[name^=m_pr_code]').selectpicker('refresh');
    }
}
