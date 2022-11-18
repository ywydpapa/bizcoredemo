$(document).on('change', 'select[name=gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name=gr_code]').index(this);
    var arg	= new Array(index, 'po');
    _ajax_html('/sfa/template/xhr/get_product_list.xhr.php', 'gr_code=' + gr_code, print_product_options, arg, true);
});
$(document).on('change', 'select[name=s_gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name=s_gr_code]').index(this);
    var arg	= new Array(index, 'svc');
    _ajax_html('/sfa/template/xhr/get_product_list.xhr.php', 'gr_code=' + gr_code, print_product_options, arg, true);
});
$(document).on('change', 'select[name=m_gr_code]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name=s_gr_code]').index(this);
    var arg	= new Array(index, 'mc');
    _ajax_html('/sfa/template/xhr/get_product_list.xhr.php', 'gr_code=' + gr_code, print_product_options, arg, true);
});
$(document).on('click', '.part-add-btn', function() {
    _ajax_html("/sfa/m/template/form/product_part.tmpl.php", "", print_pop_product_part);
});
$(document).on('click', '.s-part-add-btn', function() {
    _ajax_html("/sfa/m/template/form/s_product_part.tmpl.php", "", print_pop_product_part);
});
$(document).on('click', '.m-part-add-btn', function() {
    _ajax_html("/sfa/m/template/form/m_product_part.tmpl.php", "", print_pop_product_part);
});
$(document).on('change', 'select[name=product_part_class]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=product_part_class]').index(this);
    var arg	= new Array(index, 'po');
    _ajax_html('/sfa/template/xhr/get_product_part_list.xhr.php', 'gr_code=' + gr_code, print_product_part_options, arg, true);
});
$(document).on('change', 'select[name=s_product_part_class]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=s_product_part_class]').index(this);
    var arg	= new Array(index, 'svc');
    _ajax_html('/sfa/template/xhr/get_product_part_list.xhr.php', 'gr_code=' + gr_code, print_product_part_options, arg, true);
});
$(document).on('change', 'select[name=m_product_part_class]', function() {
    var gr_code	= $(this).val();
    var index	= $('select[name^=m_product_part_class]').index(this);
    var arg	= new Array(index, 'mc');
    _ajax_html('/sfa/template/xhr/get_product_part_list.xhr.php', 'gr_code=' + gr_code, print_product_part_options, arg, true);
});
$(document).on('click', '.part-product-save-btn', function() {
    if ($('select[name=part_product_code]').val() != '' &&
	    $('input[name=part_product_price]').val() != '' &&
	    $('input[name=part_product_quantity]').val() != '') {
	$('#part_list').append('<li>' + 
		'<input type="hidden" name="p_pr_name[]" value="' + $('select[name=part_product_code] option:selected').text() + '">' +
		'<input type="hidden" name="p_pr_code[]" value="' + $('select[name=part_product_code]').val() + '">' + 
		'<input type="hidden" name="p_price[]" value="' + $('input[name=part_product_price]').val() + '">' +
		'<input type="hidden" name="p_quantity[]" value="' + $('input[name=part_product_quantity]').val() + '">' + 
		'<h3>' + $('select[name=product_part_class] option:selected').text() + ":" +
		$('select[name=part_product_code] option:selected').text() + 
		'</h3>' + 
		JS_TEXT['price'] + ":" + $('input[name=part_product_price]').val() + "<br>" + 
		JS_TEXT['quantity'] + ":" + $('input[name=part_product_quantity]').val() + 
		'<button class="btn btn-danger btn-xs pull-right part-product-del-btn" type="button"><i class="fa fa-times"></i></button>' + 
		'</li>');
	$('#pop_md').modal('hide');
    }
});
$(document).on('click', '.s-part-product-save-btn', function() {
    if ($('select[name=s_part_product_code]').val() != '' &&
	    $('input[name=s_part_product_price]').val() != '' &&
	    $('input[name=s_part_product_quantity]').val() != '') {
	$('#s_part_list').append('<li>' + 
		'<input type="hidden" name="s_p_pr_name[]" value="' + $('select[name=s_part_product_code] option:selected').text() + '">' +
		'<input type="hidden" name="s_p_pr_code[]" value="' + $('select[name=s_part_product_code]').val() + '">' + 
		'<input type="hidden" name="s_p_price[]" value="' + $('input[name=s_part_product_price]').val() + '">' +
		'<input type="hidden" name="s_p_quantity[]" value="' + $('input[name=s_part_product_quantity]').val() + '">' + 
		'<h3>' + $('select[name=s_product_part_class] option:selected').text() + ":" +
		$('select[name=s_part_product_code] option:selected').text() + 
		'</h3>' + 
		JS_TEXT['price'] + ":" + $('input[name=s_part_product_price]').val() + "<br>" + 
		JS_TEXT['quantity'] + ":" + $('input[name=s_part_product_quantity]').val() + 
		'<button class="btn btn-danger btn-xs pull-right s-part-product-del-btn" type="button"><i class="fa fa-times"></i></button>' + 
		'</li>');
	$('#pop_md').modal('hide');
    }
});
$(document).on('click', '.m-part-product-save-btn', function() {
    if ($('select[name=m_part_product_code]').val() != '' &&
	    $('input[name=m_part_product_price]').val() != '' &&
	    $('input[name=m_part_product_quantity]').val() != '') {
	$('#m_part_list').append('<li>' + 
		'<input type="hidden" name="m_p_pr_name[]" value="' + $('select[name=m_part_product_code] option:selected').text() + '">' +
		'<input type="hidden" name="m_p_pr_code[]" value="' + $('select[name=m_part_product_code]').val() + '">' + 
		'<input type="hidden" name="m_p_price[]" value="' + $('input[name=m_part_product_price]').val() + '">' +
		'<input type="hidden" name="m_p_quantity[]" value="' + $('input[name=m_part_product_quantity]').val() + '">' + 
		'<h3>' + $('select[name=m_product_part_class] option:selected').text() + ":" +
		$('select[name=m_part_product_code] option:selected').text() + 
		'</h3>' + 
		JS_TEXT['price'] + ":" + $('input[name=m_part_product_price]').val() + "<br>" + 
		JS_TEXT['quantity'] + ":" + $('input[name=m_part_product_quantity]').val() + 
		'<button class="btn btn-danger btn-xs pull-right m-part-product-del-btn" type="button"><i class="fa fa-times"></i></button>' + 
		'</li>');
	$('#pop_md').modal('hide');
    }
});
$(document).on('click', '.part-product-del-btn', function() {
    $(this).parent().remove();
});
$(document).on('click', '.s-part-product-del-btn', function() {
    $(this).parent().remove();
});
$(document).on('click', '.m-part-product-del-btn', function() {
    $(this).parent().remove();
});
function print_product_options(data) {
    var index	= this.arg[0];
    var type	= this.arg[1]; // po,svc,ma
    if (type == 'po') {
	$('select[name=product_code]').eq(index).html(data);
	$('select[name=product_code]').selectpicker('refresh');
    } else if (type == 'svc') {
	$('select[name=service_code]').eq(index).html(data);
	$('select[name=service_code]').selectpicker('refresh');
    } else {
	$('select[name=mc_code]').eq(index).html(data);
	$('select[name=mc_code]').selectpicker('refresh');
    }
}
function print_product_part_options(data) {
    var index	= this.arg[0];
    var type	= this.arg[1];
    if (type == 'po') {
	$('select[name=part_product_code]').eq(index).html(data);
	$('select[name=part_product_code]').selectpicker('refresh');
    } else if (type == 'svc') {
	$('select[name=s_part_product_code]').eq(index).html(data);
	$('select[name=s_part_product_code]').selectpicker('refresh');
    } else {
	$('select[name=m_part_product_code]').eq(index).html(data);
	$('select[name=m_part_product_code]').selectpicker('refresh');
    }
}
function print_pop_product_part(html) {
    $('#modal_body').html(html);
    $('#pop_md').modal('show');
}
