$(document).ready(function () {
    $('#pop_close').on('click', function() {
	$('#pop_md').modal('hide');
    });
    // Condition
    $('.sch-company').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=co_name&code_field=co_code", print_pop_company);
    });
    $('.sch-company').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=co_name&code_field=co_code", print_pop_company);
    });
    $('.sch-campaign').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_campaign.php", "name_field=ca_name&code_field=ca_code", print_pop_campaign);
    });
    $('.sch-campaign').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_campaign.php", "name_field=ca_name&code_field=ca_code", print_pop_campaign);
    });
    $('.sch-company2').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=" + name_field + "&code_field=" + code_field, print_pop_company);
    });
    $('.sch-company2').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-company2').attr('name-field');
	var code_field	= $(this).parent().find('.sch-company2').attr('code-field');
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=" + name_field + "&code_field=" + code_field, print_pop_company);
    });
    $('.sch-maintenance').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=mc_name&code_field=mc_code", print_pop_company);
    });
    $('.sch-maintenance').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=mc_name&code_field=mc_code", print_pop_company);
    });
    $('.sch-supplier').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=sc_name&code_field=sc_code", print_pop_company);
    });
    $('.sch-supplier').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=sc_name&code_field=sc_code", print_pop_company);
    });
    $('.sch-partner-account').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	_ajax_html("/sfa/m/pop/popup_partner_account.php", "name_field=" + name_field + "&code_field=" + code_field, print_pop_partner_account);
    });
    $('.sch-partner-account').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-partner-account').attr('name-field');
	var code_field	= $(this).parent().find('.sch-partner-account').attr('code-field');
	_ajax_html("/sfa/m/pop/popup_partner_account.php", "name_field=" + name_field + "&code_field=" + code_field, print_pop_partner_account);
    });
    $('.sch-end-company').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=end_co_name&code_field=end_co_code", print_pop_company);
    });
    $('.sch-end-company').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=end_co_name&code_field=end_co_code", print_pop_company);
    });
    $('.sch-coop-company').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=coop_co_name&code_field=coop_co_code", print_pop_company);
    });
    $('.sch-coop-company').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_company.php", "name_field=coop_co_name&code_field=coop_co_code", print_pop_company);
    });
    $('.sch-bill-company').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_bill_company.php", "name_field=bill_co_name&code_field=bill_co_code", print_pop_bill_company);
    });
    $('.sch-bill-company').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_bill_company.php", "name_field=bill_co_name&code_field=bill_co_code", print_pop_bill_company);
    });
    $('.sch-bill-company2').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	_ajax_html("/sfa/m/pop/popup_bill_company.php", "name_field=" + name_field + "&code_field=" + code_field, print_pop_bill_company);
    });
    $('.sch-bill-company2').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-bill-company2').attr('name-field');
	var code_field	= $(this).parent().find('.sch-bill-company2').attr('code-field');
	_ajax_html("/sfa/m/pop/popup_bill_company.php", "name_field=" + name_field + "&code_field=" + code_field, print_pop_bill_company);
    });
    $('.sch-customer').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_customer.php", "name_field=cu_name&code_field=cu_code&co_name_field=co_name&co_code_field=co_code", print_pop_customer);
    });
    $('.sch-customer').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_customer.php", "name_field=cu_name&code_field=cu_code&co_name_field=co_name&co_code_field=co_code", print_pop_customer);
    });
    $('.sch-contact').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_contact.php", "name_field=contact_name&code_field=contact_code", print_pop_contact);
    });
    $('.sch-contact').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_contact.php", "name_field=contact_name&code_field=contact_code", print_pop_contact);
    });
    $('.sch-end-customer').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_customer.php", "name_field=end_cu_name&code_field=end_cu_code", print_pop_customer);
    });
    $('.sch-end-customer').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_customer.php", "name_field=end_cu_name&code_field=end_cu_code", print_pop_customer);
    });
    $('.sch-coop-customer').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_customer.php", "name_field=coop_cu_name&code_field=coop_cu_code", print_pop_customer);
    });
    $('.sch-coop-customer').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_customer.php", "name_field=coop_cu_name&code_field=coop_cu_code", print_pop_customer);
    });
    $('.sch-bill-customer').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_customer.php", "name_field=b_cu_name&code_field=b_cu_code", print_pop_customer);
    });
    $('.sch-bill-customer').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_customer.php", "name_field=b_cu_name&code_field=b_cu_code", print_pop_customer);
    });
    $('.sch-support').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_support.php", "name_field=ep_name&code_field=ep_code", print_pop_support);
    });
    $('.sch-support').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_support.php", "name_field=ep_name&code_field=ep_code", print_pop_support);
    });
    $('.sch-order').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_order.php", '', print_pop_order);
	//window.open("/sfa/m/pop/popup_order.php", "ORDER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-order').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_order.php", '', print_pop_order);
	//window.open("/sfa/m/pop/popup_order.php", "ORDER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-assign').on('click', function() {
	_ajax_html('/sfa/m/pop/popup_user.php', 'name_field=assign_name&id_field=assign_id', print_pop_user);
    });
    $('.sch-assign').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html('/sfa/m/pop/popup_user.php', 'name_field=assign_name&id_field=assign_id', print_pop_user);
    });
    $('.sch-assign2').on('click', function() {
	_ajax_html('/sfa/m/pop/popup_user.php', 'name_field=assign_name2&id_field=assign_id2', print_pop_user);
    });
    $('.sch-assign2').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html('/sfa/m/pop/popup_user.php', 'name_field=assign_name2&id_field=assign_id2', print_pop_user);
    });
    $('.sch-assign3').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var id_field	= $(this).attr('id-field');
	_ajax_html("/sfa/m/pop/popup_user.php", "name_field=" + name_field + "&id_field=" + id_field, print_pop_user);
    });
    $('.sch-assign3').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-assign3').attr('name-field');
	var id_field	= $(this).parent().find('.sch-assign3').attr('id-field');
	_ajax_html("/sfa/m/pop/popup_user.php", "name_field=" + name_field + "&id_field=" + id_field, print_pop_user);
    });
    $('.sch-reg-id').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_user.php", "name_field=reg_name&id_field=reg_id", print_pop_user);
    });
    $('.sch-reg-id').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_user.php", "name_field=reg_name&id_field=reg_id", print_pop_user);
    });
    $('.sch-present').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_user.php", "name_field=present_name&id_field=present_id", print_pop_user);
    });
    $('.sch-present').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_user.php", "name_field=present_name&id_field=present_id", print_pop_user);
    });
    $('.sch-supporter').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_user.php", "name_field=supporter_name&id_field=supporter", print_pop_user);
    });
    $('.sch-supporter').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_user.php", "name_field=supporter_name&id_field=supporter", print_pop_user);
    });
    $('.sch-opportunity').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_opportunity.php", "name_field=op_name&code_field=op_code", print_pop_opp);
    });
    $('.sch-opportunity').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_opportunity.php", "name_field=op_name&code_field=op_code", print_pop_opp);
    });
    $('.sch-opportunity2').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_opportunity.php", "name_field=op_name&code_field=op_code&coname_field=co_name&cocode_field=co_code", print_pop_opp);
    });
    $('.sch-opportunity2').parent().parent().find('input[type=text]').on('click', function() {
	_ajax_html("/sfa/m/pop/popup_opportunity.php", "name_field=op_name&code_field=op_code&coname_field=co_name&cocode_field=co_code", print_pop_opp);
    });
    $('.sch-opportunity3').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	var coname_field	= $(this).attr('coname-field');
	var cocode_field	= $(this).attr('cocode-field');
	var param = "name_field=" + name_field + "&code_field=" + code_field;
	if (coname_field != '') {
	    param += "&coname_field=" + coname_field + "&cocode_field=" + cocode_field;
	}
	_ajax_html("/sfa/m/pop/popup_opportunity.php", param, print_pop_opp);
    });
    $('.sch-opportunity3').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-opportunity3').attr('name-field');
	var code_field	= $(this).parent().find('.sch-opportunity3').attr('code-field');
	var coname_field	= $(this).parent().find('.sch-opportunity3').attr('coname-field');
	var cocode_field	= $(this).parent().find('.sch-opportunity3').attr('cocode-field');
	var param = "name_field=" + name_field + "&code_field=" + code_field;
	if (coname_field != '') {
	    param += "&coname_field=" + coname_field + "&cocode_field=" + cocode_field;
	}
	_ajax_html("/sfa/m/pop/popup_opportunity.php", param, print_pop_opp);
    });
    $('#trans-btn').on('click', function() {
	var default_type = $('#default_in_type').val();
	var code = '';
	$('input[name^=od_od_code]').each(function(idx) {
	    if ($(this).prop('checked') == true) {
		var reg_count	= $('input[name^=count]').eq(idx).val();
		var price	= $('input[name^=unit_price]').eq(idx).val();
		var pr_code	= $('input[name^=od_pr_code').eq(idx).val();
		var od_code	= $('input[name^=od_od_code').eq(idx).val();
		var od_seq	= $('input[name^=od_seq').eq(idx).val();
		var pr_name	= $('input[name^=od_pr_name').eq(idx).val();
		var od_cnt	= $('input[name^=od_cnt').eq(idx).val();

		// current 
		var cur_count	= 0;
		$('input[name^=si_pr_code]').each(function() {
		    if ($(this).val() == pr_code) cur_count++;
		});

		if (od_cnt < reg_count) {
		    reg_count = parseInt(od_cnt, 10);
		    $('input[name^=count]').eq(idx).val(reg_count);
		}

		var i = 0;
		for (i = 0; i < (reg_count - cur_count); i++) {
		    code += '<tr class="si-product-form-list">';
		    code += '<input type="hidden" name="si_od_code[]" value="' + od_code + '" />';
		    code += '<input type="hidden" name="si_od_seq[]" value="' + od_seq + '" />';
		    code += '<td><button class="btn btn-primary disabled">' + JS_TEXT['newer'] + '</button></td>';
		    code += '<td>';
		    code += '<input type="text" class="form-control" value="' + default_type + '" />';
		    code += '<input type="hidden" name="stockin_type[]" value="01" />';
		    code += '</td>';
		    code += '<td>';
		    code += '<input type="text" class="form-control" value="' + pr_name + '" />';
		    code += '<input type="hidden" name="si_pr_code[]" value="' + pr_code + '" />';
		    code += '</td>';
		    code += '<td><input type="text" name="si_sn[]" class="form-control" /></td>';
		    code += '<td><input type="text" name="si_price[]" class="form-control" value="' + price + '" /></td>';
		    code += '<td><input type="text" name="si_memo[]" class="form-control" /></td>';
		    code += '<td class="si-product-buttons">';
		    code += '<button class="btn btn-danger stockin-product-row-del-btn btn-sm" type="button"><i class="fa fa-trash-o" aria-hidden="true"></i></button>';
		    code += '</td>';
		    code += '</div>';
		}
	    }
	});

	if (code != '') {
	    $(".si-product-form").append(code);
	}
	
	if ($('.order-product-row-add-btn').length == 0) {
	    $('.product-buttons').first().append('<button class="btn btn-success order-product-row-add-btn btn-sm" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	}
    });


    if (typeof group_data !== 'undefined') {
	$('#group_list').treeview({data: group_data});
	$('#group-close-btn').on('click', function() {
	    $('#group_list_div').hide();
	});
    }
});
$(document).on('click', '.m-product-row-del-btn', function() {
    $(this).parent().parent().parent().remove();
});
$(document).on('click', '.product-row-del-btn', function() {
    $(this).parent().parent().parent().remove();
});
$(document).on('click', '.product-row-add-btn', function() {
    if ($('select[name=product_class]').val() != '' &&
	    $('select[name=product_code]').val() != '' &&
	    $('input[name=product_price]').val() != '') {
	var code = '';
	code = '<div class="list-content-wrapper">' +
		'<div class="list-content">' + 
		    '<input type="hidden" name="p_class[]" value="' + $('select[name=product_class]').val() + '" />' + 
		    '<input type="hidden" name="pr_code[]" value="' + $('select[name=product_code]').val() + '" />' + 
		    '<input type="hidden" name="quantity[]" value="' + $('input[name=product_quantity]').val() + '" />' + 
		    '<input type="hidden" name="price[]" value="' + $('input[name=product_price]').val() + '" />' + 
		    JS_TEXT['product_class']  + ' :	' + $('select[name=product_class] option:selected').html() + '<br />' + 
		    JS_TEXT['appliance'] + ' : ' + $('select[name=product_code] option:selected').html() + '<br />' + 
		    JS_TEXT['quantity'] + ' : ' + $('input[name=product_quantity]').val() + '<br />' + 
		    JS_TEXT['price'] + ' : ' + convert_currency($('input[name=product_price]').val()) + '<br />' ; 
	code +=	'</div>' + 
		'<div class="swipe-content">' + 
		    '<span>' + 
			'<span class="product-row-del-btn swipe-menu del"><i class="fa fa-trash-o" aria-hidden="true"></i></span>' + 
		    '</span>' + 
		'</div>' + 
	    '</div>';
	$('.product-list').append(code);

	$('select[name=product_class]').val('');
	$('input[name=product_quantity]').val('');
	$('input[name=product_price]').val('');

    }

});
$(document).on('click', '.service-row-add-btn', function() {
    if ($('select[name=service_class]').val() != '' &&
	    $('select[name=service_code]').val() != '' &&
	    $('input[name=service_price]').val() != '') {
	var code = '';
	var part_code	= '';

	var part_cnt	= 0;
	$('input[name^=s_p_pr_code]').each(function(index) {
	    part_code += '<li>' + 
		'<input type="hidden" name="s_part_pr_code[]" value="' + $('input[name^=s_p_pr_code]').eq(index).val() + '" />' + 
		'<input type="hidden" name="s_part_price[]" value="' + $('input[name^=s_p_price]').eq(index).val() + '" />' + 
		'<input type="hidden" name="s_part_quantity[]" value="' + $('input[name^=s_p_quantity]').eq(index).val() + '" />' + 
		'<h3>' + $('input[name^=s_p_pr_name]').eq(index).val() + '</h3>' +
		JS_TEXT['price'] + ":" + $('input[name^=s_p_price]').eq(index).val() + '<br>' +
		JS_TEXT['quantity'] + ":" + $('input[name^=s_p_quantity]').eq(index).val() +
		'</li>';
	    part_cnt++;
	});
	code = '<div class="list-content-wrapper">' +
		'<div class="list-content">' + 
		    '<input type="hidden" name="s_part_cnt[]" value="' + part_cnt + '" />' + 
		    '<input type="hidden" name="s_class[]" value="' + $('select[name=service_class]').val() + '" />' + 
		    '<input type="hidden" name="s_pr_code[]" value="' + $('select[name=service_code]').val() + '" />' + 
		    '<input type="hidden" name="s_price[]" value="' + $('input[name=service_price]').val() + '" />' + 
		    JS_TEXT['product_class']  + ' :	' + $('select[name=service_class] option:selected').html() + '<br />' + 
		    JS_TEXT['appliance'] + ' : ' + $('select[name=service_code] option:selected').html() + '<br />' + 
		    JS_TEXT['price'] + ' : ' + $('input[name=service_price]').val() + '<br />' ; 
	if (part_code != '') {
	    code += JS_TEXT['product_part'] + '<ul>' + 
		    part_code +
		    '</ul>';
	}
	code +=	'</div>' + 
		'<div class="swipe-content">' + 
		    '<span>' + 
			'<span class="service-row-del-btn swipe-menu del"><i class="fa fa-trash-o" aria-hidden="true"></i></span>' + 
		    '</span>' + 
		'</div>' + 
	    '</div>';
	$('.service-list').append(code);

	$('select[name=service_class]').val('');
	$('input[name=service_price]').val('');

	$('#s_part_list').children().remove();
    }

});
$(document).on('click', '.service-row-del-btn', function() {
    $(this).parent().parent().parent().remove();
});
$(document).on('click', '.mc-row-add-btn', function() {
    if ($('select[name=mc_class]').val() != '' &&
	    $('select[name=mc_code]').val() != '' &&
	    $('input[name=mc_price]').val() != '') {
	var code = '';
	var part_code	= '';

	var part_cnt	= 0;
	$('input[name^=m_p_pr_code]').each(function(index) {
	    part_code += '<li>' + 
		'<input type="hidden" name="m_part_pr_code[]" value="' + $('input[name^=m_p_pr_code]').eq(index).val() + '" />' + 
		'<input type="hidden" name="m_part_price[]" value="' + $('input[name^=m_p_price]').eq(index).val() + '" />' + 
		'<input type="hidden" name="m_part_quantity[]" value="' + $('input[name^=m_p_quantity]').eq(index).val() + '" />' + 
		'<h3>' + $('input[name^=m_p_pr_name]').eq(index).val() + '</h3>' +
		JS_TEXT['price'] + ":" + $('input[name^=m_p_price]').eq(index).val() + '<br>' +
		JS_TEXT['quantity'] + ":" + $('input[name^=m_p_quantity]').eq(index).val() +
		'</li>';
	    part_cnt++;
	});
	code = '<div class="list-content-wrapper">' +
		'<div class="list-content">' + 
		    '<input type="hidden" name="m_part_cnt[]" value="' + part_cnt + '" />' + 
		    '<input type="hidden" name="m_class[]" value="' + $('select[name=mc_class]').val() + '" />' + 
		    '<input type="hidden" name="m_pr_code[]" value="' + $('select[name=mc_code]').val() + '" />' + 
		    '<input type="hidden" name="m_price[]" value="' + $('input[name=mc_price]').val() + '" />' + 
		    JS_TEXT['product_class']  + ' :	' + $('select[name=mc_class] option:selected').html() + '<br />' + 
		    JS_TEXT['appliance'] + ' : ' + $('select[name=mc_code] option:selected').html() + '<br />' + 
		    JS_TEXT['price'] + ' : ' + $('input[name=mc_price]').val() + '<br />' ; 
	if (part_code != '') {
	    code += JS_TEXT['product_part'] + '<ul>' + 
		    part_code +
		    '</ul>';
	}
	code +=	'</div>' + 
		'<div class="swipe-content">' + 
		    '<span>' + 
			'<span class="mc-row-del-btn swipe-menu del"><i class="fa fa-trash-o" aria-hidden="true"></i></span>' + 
		    '</span>' + 
		'</div>' + 
	    '</div>';
	$('.mc-list').append(code);

	$('select[name=mc_class]').val('');
	$('input[name=mc_price]').val('');

	$('#m_part_list').children().remove();
    }

});
$(document).on('click', '.mc-row-del-btn', function() {
    $(this).parent().parent().parent().remove();
});
$(document).on('click', '.c-product-row-del-btn', function() {
    $(this).parent().parent().parent().remove();
});
$(document).on('click', '.s-product-row-del-btn', function() {
    if ($(this).parent().parent().parent().parent().parent().parent().parent().find('.sales-product-form-list').length > 1) {
	var obj	= $(this).parent().parent().parent().parent().parent().parent();
	$(this).parent().parent().parent().parent().parent().remove();
	if (obj.find('.s-product-row-add-btn').length == 0) {
	    obj.find('.product-buttons').first().append('<button class="btn btn-success s-product-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	}
	product_row_count(obj);
    }
});
$(document).on('click', '.c-product-row-add-btn', function() {
    if ($('select[name=product_class]').val() != '' &&
	    $('select[name=product_code]').val() != '' &&
	    $('input[name=product_quantity]').val() != '' &&
	    $('input[name=product_price]').val() != '') {
	var code = '';
	code = '<div class="list-content-wrapper">' +
		'<div class="list-content product-form-list">' + 
		    '<input type="hidden" name="p_class[]" value="' + $('select[name=product_class]').val() + '" />' + 
		    '<input type="hidden" name="pr_code[]" value="' + $('select[name=product_code]').val() + '" />' + 
		    '<input type="hidden" name="quantity[]" value="' + $('input[name=product_quantity]').val() + '" />' + 
		    '<input type="hidden" name="price[]" value="' + $('input[name=product_price]').val() + '" />' + 
		    '<input type="hidden" name="pr_memo[]" value="' + $('input[name=product_memo]').val() + '" />' + 
		    JS_TEXT['product_class']  + ' :	' + $('select[name=product_class] option:selected').html() + '<br />' + 
		    JS_TEXT['appliance'] + ' : ' + $('select[name=product_code] option:selected').html() + '<br />' + 
		    JS_TEXT['quantity'] + ' : ' + $('input[name=product_quantity]').val() + '<br />' + 
		    JS_TEXT['price'] + ' : ' + $('input[name=product_price]').val() + '<br />' + 
		    JS_TEXT['description'] + ' : ' + $('input[name=product_memo]').val() + '<br />' + 
		'</div>' + 
		'<div class="swipe-content">' + 
		    '<span>' + 
			'<span class="c-product-row-del-btn swipe-menu del"><i class="fa fa-trash-o" aria-hidden="true"></i></span>' + 
		    '</span>' + 
		'</div>' + 
	    '</div>';
	$('.product-list').append(code);
    }
});
$(document).on('click', '.s-product-row-add-btn', function() {
    var obj	= $(this);
    $.ajax({
	url:'/sfa/m/template/form/contract_sales_product_row.tmpl.php?ct_code=' + $('#ct_code').val(),
	type:'GET',
	success: function(data){
	    obj.parent().parent().parent().parent().parent().parent().append(data);
	    $('.selectpicker').selectpicker('refresh');
	    product_row_count(obj.parent().parent().parent().parent().parent().parent()); // td colspan="4"
	}
    });
});
function product_row_count(obj) {
    obj.find('input[name^=row]').val(obj.find('.sales-product-form-list').length);
    var total = 0;
    obj.find('input[name^=s_price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/\,/g, '').replace(/\./g, ''), 10);
	}
    });
    obj.parent().parent().find('input[name^=sales_price]').val(total);
    sales_total_calc();
}
/*
$(document).on('click', '.service-row-del-btn', function() {
	if ($('.service-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    if ($('.service-row-add-btn').length == 0) {
		$('.service-buttons').first().append('<button class="btn btn-success service-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	}
});
$(document).on('click', '.service-row-add-btn', function() {
    if ($('select[name=service_class]').val() != '' &&
	    $('select[name=service_code]').val() != '' &&
	    $('input[name=service_quantity]').val() != '' &&
	    $('input[name=service_price]').val() != '') {
	var code = '';
	code = '<div class="list-content-wrapper">' +
		'<div class="list-content">' + 
		    '<input type="hidden" name="s_class[]" value="' + $('select[name=service_class]').val() + '" />' + 
		    '<input type="hidden" name="s_pr_code[]" value="' + $('select[name=service_code]').val() + '" />' + 
		    '<input type="hidden" name="s_quantity[]" value="' + $('input[name=service_quantity]').val() + '" />' + 
		    '<input type="hidden" name="s_price[]" value="' + $('input[name=service_price]').val() + '" />' + 
		    '<input type="hidden" name="s_pr_memo[]" value="' + $('input[name=service_memo]').val() + '" />' + 
		    JS_TEXT['service_class']  + ' :	' + $('select[name=service_class] option:selected').html() + '<br />' + 
		    JS_TEXT['appliance'] + ' : ' + $('select[name=service_code] option:selected').html() + '<br />' + 
		    JS_TEXT['quantity'] + ' : ' + $('input[name=service_quantity]').val() + '<br />' + 
		    JS_TEXT['price'] + ' : ' + $('input[name=service_price]').val() + '<br />' + 
		    JS_TEXT['description'] + ' : ' + $('input[name=service_memo]').val() + '<br />' + 
		'</div>' + 
		'<div class="swipe-content">' + 
		    '<span>' + 
			'<span class="product-row-del-btn swipe-menu del"><i class="fa fa-trash-o" aria-hidden="true"></i></span>' + 
		    '</span>' + 
		'</div>' + 
	    '</div>';
	$('.service-list').append(code);
    }
});
*/
$(document).on('click', '.c-service-row-del-btn', function() {
    $(this).parent().parent().parent().remove();
});
$(document).on('click', '.c-service-row-add-btn', function() {
    if ($('select[name=service_class]').val() != '' &&
	    $('select[name=service_code]').val() != '' &&
	    $('input[name=service_quantity]').val() != '' &&
	    $('input[name=service_price]').val() != '') {
	var code = '';
	code = '<div class="list-content-wrapper">' +
		'<div class="list-content service-form-list">' + 
		    '<input type="hidden" name="s_class[]" value="' + $('select[name=service_class]').val() + '" />' + 
		    '<input type="hidden" name="s_pr_code[]" value="' + $('select[name=service_code]').val() + '" />' + 
		    '<input type="hidden" name="s_quantity[]" value="' + $('input[name=service_quantity]').val() + '" />' + 
		    '<input type="hidden" name="s_price[]" value="' + $('input[name=service_price]').val() + '" />' + 
		    '<input type="hidden" name="s_pr_memo[]" value="' + $('input[name=service_memo]').val() + '" />' + 
		    JS_TEXT['service_class']  + ' :	' + $('select[name=service_class] option:selected').html() + '<br />' + 
		    JS_TEXT['appliance'] + ' : ' + $('select[name=service_code] option:selected').html() + '<br />' + 
		    JS_TEXT['quantity'] + ' : ' + $('input[name=service_quantity]').val() + '<br />' + 
		    JS_TEXT['price'] + ' : ' + $('input[name=service_price]').val() + '<br />' + 
		    JS_TEXT['description'] + ' : ' + $('input[name=service_memo]').val() + '<br />' + 
		'</div>' + 
		'<div class="swipe-content">' + 
		    '<span>' + 
			'<span class="c-service-row-del-btn swipe-menu del"><i class="fa fa-trash-o" aria-hidden="true"></i></span>' + 
		    '</span>' + 
		'</div>' + 
	    '</div>';
	$('.service-list').append(code);
    }
});
$(document).on('click', '.order-product-row-del-btn', function() {
	if ($('.product-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    if ($('.order-product-row-add-btn').length == 0) {
		$('.product-buttons').first().append('<button class="btn btn-success order-product-row-add-btn btn-sm" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	}
});
$(document).on('click', '.order-product-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/order_product_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.product-form').append(data);
	    $('.selectpicker').selectpicker('refresh');
	}
    });
});
$(document).on('click', '.mc-product-row-del-btn', function() {
    $(this).parent().parent().parent().remove();
});
$(document).on('click', '.mc-product-row-add-btn', function() {
    if ($('select[name=product_class]').val() != '' &&
	    $('select[name=product_code]').val() != '' &&
	    $('input[name=product_quantity]').val() != '' &&
	    $('input[name=product_price]').val() != '') {
	var code = '';
	code = '<div class="list-content-wrapper">' +
		'<div class="list-content product-form-list">' + 
		    '<input type="hidden" name="p_class[]" value="' + $('select[name=product_class]').val() + '" />' + 
		    '<input type="hidden" name="pr_code[]" value="' + $('select[name=product_code]').val() + '" />' + 
		    '<input type="hidden" name="quantity[]" value="' + $('input[name=product_quantity]').val() + '" />' + 
		    '<input type="hidden" name="price[]" value="' + $('input[name=product_price]').val() + '" />' + 
		    '<input type="hidden" name="pr_memo[]" value="' + $('input[name=product_memo]').val() + '" />' + 
		    JS_TEXT['product_class']  + ' :	' + $('select[name=product_class] option:selected').html() + '<br />' + 
		    JS_TEXT['appliance'] + ' : ' + $('select[name=product_code] option:selected').html() + '<br />' + 
		    JS_TEXT['quantity'] + ' : ' + $('input[name=product_quantity]').val() + '<br />' + 
		    JS_TEXT['price'] + ' : ' + $('input[name=product_price]').val() + '<br />' + 
		    JS_TEXT['description'] + ' : ' + $('input[name=product_memo]').val() + '<br />' + 
		'</div>' + 
		'<div class="swipe-content">' + 
		    '<span>' + 
			'<span class="mc-product-row-del-btn swipe-menu del"><i class="fa fa-trash-o" aria-hidden="true"></i></span>' + 
		    '</span>' + 
		'</div>' + 
	    '</div>';
	$('.product-list').append(code);
    }
});
$(document).on('click', '.stockin-product-row-del-btn', function() {
	if ($('.si-product-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    if ($('.stockin-product-row-add-btn').length == 0) {
		$('.si-product-buttons').first().append('<button class="btn btn-success stockin-product-row-add-btn btn-sm" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	}
});
$(document).on('click', '.stockout-product-row-del-btn', function() {
    $(this).parent().parent().parent().remove();
});
$(document).on('click', '.stockin-product-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/stockin_product_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.si-product-form').append(data);
	    $('.selectpicker').selectpicker('refresh');
	}
    });
});
$(document).on('click', '.list-group-item', function(e) {
    var code = $(this).attr('data-code');
    var name = $(this).attr('data-name');
    if (!$(e.target).is('.expand-icon')) {
	select_group(name, code);
    }
    return false;
});

function select_group(name, code) {
    $('#dept_name').val(name);
    $('#dept_code').val(code);
    $('#group_list_div').hide();
    if (typeof get_user_list == 'function') {
	get_user_list();
    }
}
function get_order_info(param) {
    _ajax('/sfa/m/pop/order_info.xhr.php', param, print_order_info, undefined, true);
}
function print_order_info(data) {
    _loading(0);
    var code = '';
    $("#order_pr_list").children().remove();
    code += '<table class="table table-bordered" width="100%">';
    if (data.field != undefined) {
	var dt = data.field;
	code += '<tr>';
	code += '<th></th>';
	code += '<th>' + dt[0] + '</th>';
	code += '<th>' + dt[1] + '</th>';
	code += '<th>' + dt[2] + '</th>';
	code += '<th>' + dt[3] + '</th>';
	code += '<th>' + dt[4] + '</th>';
	code += '<th>' + dt[5] + '</th>';
	code += '</tr>';
	$.each(data, function(k, dt) {
	    if (k == 'field') {
	    } else {
		code += '<tr class="od-product-form-list">';
		if (dt.od_cnt > 0) {
		    code += '<td><input type="checkbox" name="od_od_code[]" value="' + dt.od_code+ '" /></td>';
		    code += '<td><input type="hidden" name="od_pr_code[]" value="' + dt.pr_code + '" />';
		    code += '<input type="text" name="od_pr_name[]" class="form-control" value="' + dt.pr_name + '" readonly />';
		    code += '<input type="hidden" name="od_cnt[]" class="form-control" value="' + dt.od_cnt + '" readonly />';
		    code += '<input type="hidden" name="unit_price[]" class="form-control" value="' + dt.pr_price + '" readonly />';
		    code += '<input type="hidden" name="od_seq[]" class="form-control" value="' + dt.od_seq + '" readonly /></td>';
		} else {
		    code += '<td><input type="checkbox" disabled /></td>';
		    code += '<td><input type="text" class="form-control" value="' + dt.pr_name +'" readonly /></td>';
		}
		code += '<td><input type="text" class="form-control" value="' + dt.order_date + '" readonly /></td>';
		code += '<td><input type="text" class="form-control" value="' + dt.order_in_date + '" readonly /></td>';
		code += '<td><input type="text" class="form-control" value="' + dt.pr_quantity+' / ' + dt.stock_in_count + '" readonly /></td>';
		code += '<td><input type="text" class="form-control" value="' + dt.total_price + '" readonly /></td>';
		code += '<td>';
		if (dt.od_cnt > 0) {
		    code += '<input type="number" name="count[]" class="form-control" value="' + (dt.od_cnt) + '" min="0" max="' + (dt.od_cnt) + '" />';
		}
		code += '</td>';
		code += '</tr>';
	    }
	});
	code += '</table>';
	$("#order_pr_list").append(code);
    } else {
	$("#order_pr_list").append('<div class="text-center"><h4>' + JS_TEXT['no_data'] + '</h4></div>');
    }
}
function get_version_list(code) {
    var version_option = '';
    if (typeof version_list != 'undefined') {
	for (var i = 0; i < version_list.length; i++) {
	    if (version_list[i][0] == code) {
		version_option += '<option value="' + version_list[i][1] + '">' + version_list[i][1] + '</option>';
	    }
	}
    }
    return version_option;
}
function show_version(obj) {
    var no = $('select[name^=so_p_class]').index(obj);
    $('select[name^=so_version]').eq(no).children().remove();
    $('select[name^=so_version]').eq(no).append(get_version_list(obj.val()));
}

$(document).on('click', '.detail-sch-down', function() {
    $('.detail_sch').show();
    $(this).removeClass('detail-sch-down');
    $(this).addClass('detail-sch-up');
    $('.detail_sch').addClass('slideInDown');
    $(this).html('<i class="fa fa-chevron-up" aria-hidden="true"></i>');
});
$(document).on('click', '.detail-sch-up', function() {
    $('.detail_sch').hide();
    $(this).removeClass('detail-sch-up');
    $(this).addClass('detail-sch-down');
    $(this).html('<i class="fa fa-filter" aria-hidden="true"></i>');
});
$(document).on('keyup', 'input[name=sch_user_name]', function() {
    var query = $('#condition :input').serialize();
    $('#user_list').show_list('/sfa/m/pop/user_list.xhr.php', query);
});
$(document).on('keyup', 'input[name=sch_u_name]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/user_list.xhr.php', query, print_pop_list, 'pop_user_list', true);
});
$(document).on('keyup', 'input[name=sch_op_name]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/opportunity_list.xhr.php', query, print_pop_list, 'pop_opportunity_list', true);
});
$(document).on('keyup', 'input[name=sch_co_name]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/company_list.xhr.php', query, print_pop_list, 'pop_company_list', true);
});
$(document).on('keyup', 'input[name=sch_partner_name]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/partner_list.xhr.php', query, print_pop_list, 'pop_partner_list', true);
});
$(document).on('keyup', 'input[name=sch_company_name]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/partner_account_list.xhr.php', query, print_pop_list, 'pop_partner_account_list', true);
});
$(document).on('keyup', 'input[name=sch_cu_name]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/customer_list.xhr.php', query, print_pop_list, 'pop_customer_list', true);
});
$(document).on('keyup', 'input[name=sch_cu_co_name]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/customer_list.xhr.php', query, print_pop_list, 'pop_customer_list', true);
});
$(document).on('keyup', 'input[name=sch_cuname]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/contact_list.xhr.php', query, print_pop_list, 'pop_contact_list', true);
});
$(document).on('keyup', 'input[name=sch_coname]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/contact_list.xhr.php', query, print_pop_list, 'pop_contact_list', true);
});
$(document).on('keyup', 'input[name=sch_support_name]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/support_list.xhr.php', query, print_pop_list, 'pop_support_list', true);
});
$(document).on('keyup', 'input[name=sch_order_name]', function() {
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/order_list.xhr.php', query, print_pop_list, 'pop_order_list', true);
});
/*
 * added by yongmin
 *
 */
$(document).on('keyup', 'input[name=sch_name]', function() {
    var query = $('#pop_condition :input').serialize();
	var select_code = query.substring(12, 14);
	var text = $(this).val();
	if(select_code == 'op'){
		_ajax('/sfa/m/pop/opportunity_list.xhr.php', 'sch_op_name='+text+'&page=', print_pop_list, 'pop_show_list', true);
	} else if(select_code == 'sc'){
		_ajax('/sfa/m/pop/schedule_list.xhr.php', 'sch_word='+text+'&page=', print_pop_list, 'pop_show_list', true);
	} else if(select_code == 'co'){
		_ajax('/sfa/m/pop/company_list.xhr.php', 'sch_co_name='+text+'&page=', print_pop_list, 'pop_show_list', true);
	} else if(select_code == 'cu'){
		_ajax('/sfa/m/pop/contact_list.xhr.php', 'sch_cuname='+text+'&page=', print_pop_list, 'pop_show_list', true);
	} else if(select_code == 'ct'){
		_ajax('/sfa/m/pop/contract_list.xhr.php', 'sch_ctname='+text+'&page=', print_pop_list, 'pop_show_list', true);
	} else if(select_code == 'pc'){
		_ajax('/sfa/m/pop/partner_list.xhr.php', 'sch_co_name='+text+'&page=', print_pop_list, 'pop_show_list', true);
	}
});

function selectUser(id, name) {
    var id_field	= $('#id_field').val();
    var name_field	= $('#name_field').val();
    if (name_field == '' && id_field == '') { // schedule 에서 present 선택
	$('#present_list').append('<div><label class="label label-primary"><input type="hidden" name="present_code[]" value="' + id + '"/><input type="hidden" name="status[]" value="0" /> ' + name + ' <span class="delete-present" style="cursor:pointer"><i class="fa fa-times"></i></span></label></div>');
    } else {
	$('#' + id_field).val(id);
	$('#' + name_field).val(name);
    }
}
function selectOpp(code, name, co_code, co_name, stage, sales_date) {
    var name_field = $("#name_field").val();
    var code_field = $("#code_field").val();
    var coname_field = $("#coname_field").val();
    var cocode_field = $("#cocode_field").val();
    if (typeof get_product_list == 'function') {                                                                              
	get_product_list(code);
    } else {
	$("#" + name_field).val(name);                                                                                        
	$("#" + code_field).val(code);
	$("#" + coname_field).val(co_name);
	$("#" + cocode_field).val(co_code);
	$("select[name=stage]").val(stage);
	$("input[name=sales_date]").val(sales_date);                                                                          
    }
}
function selectCompany(code, name) {
    var code_field	= $('#code_field').val();
    var name_field	= $('#name_field').val();
    $('#' + code_field).val(code);
    $('#' + name_field).val(name);
}
function selectCampaign(code, name) {
    var code_field	= $('#code_field').val();
    var name_field	= $('#name_field').val();
    $('#' + code_field).val(code);
    $('#' + name_field).val(name);
}
function selectCustomer(code, name, co_code, co_name, position, mobile) {
    var code_field	= $('#code_field').val();
    var name_field	= $('#name_field').val();
    var co_code_field	= $('#co_code_field').val();
    var co_name_field	= $('#co_name_field').val();
    $('#' + code_field).val(code);
    $('#' + name_field).val(name);
    $('#' + co_code_field).val(co_code);
    $('#' + co_name_field).val(co_name);
    $('#position').val(position);
    $('#mobile').val(mobile);
}
function selectContact(co_name, cu_code, cu_name) {
    $('#present_list').append('<div><label class="label label-primary"><input type="hidden" name="present_code[]" value="' + cu_code + '"/><input type="hidden" name="status[]" value="0" /> ' + cu_name + ' <span class="delete-present" style="cursor:pointer"><i class="fa fa-times"></i></span></label></div>');
}
function selectContact2(code, name) {
    $('input[name=contact_name]').val(name);
    $('input[name=contact_code]').val(code);
}
function selectSupport(code, name) {
    var code_field	= $('#code_field').val();
    var name_field	= $('#name_field').val();
    $('#' + code_field).val(code);
    $('#' + name_field).val(name);
}
function selectOrder(code, title) {
    $('#od_code').val(code);
    $('#od_name').val(title);
    if ($("#order_pr_list").length > 0) {
	var param = 'od_code=' + code;
	get_order_info(param);
    }
}
/*
 * added by yongmin
 *
 */
function selectSchedule(code, name){
	var code_field	= $('#code_field').val();
	var name_field  = $('#name_field').val();
	$('#' + code_field).val(code);
	$('#' + name_field).val(name);
}
function selectContract(code, name){
	var code_field	= $('#code_field').val();
	var name_field  = $('#name_field').val();
	$('#' + code_field).val(code);
	$('#' + name_field).val(name);
}
function print_pop_company(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    //$('#company_list').show_list('/sfa/m/pop/company_list.xhr.php', query);
    _ajax('/sfa/m/pop/company_list.xhr.php', query, print_pop_list, 'pop_company_list', true);
    $('#pop_md').modal('show');
}
function print_pop_campaign(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    //$('#company_list').show_list('/sfa/m/pop/company_list.xhr.php', query);
    _ajax('/sfa/m/pop/campaign_list.xhr.php', query, print_pop_list, 'pop_campaign_list', true);
    $('#pop_md').modal('show');
}
function print_pop_partner_account(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    //$('#company_list').show_list('/sfa/m/pop/company_list.xhr.php', query);
    _ajax('/sfa/m/pop/partner_account_list.xhr.php', query, print_pop_list, 'pop_partner_account_list', true);
    $('#pop_md').modal('show');
}
function print_pop_partner(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    //$('#company_list').show_list('/sfa/m/pop/company_list.xhr.php', query);
    _ajax('/sfa/m/pop/partner_list.xhr.php', query, print_pop_list, 'pop_partner_list', true);
    $('#pop_md').modal('show');
}
function print_pop_bill_company(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/bill_company_list.xhr.php', query, print_pop_list, 'pop_company_list', true);
    //$('#pop_company_list').show_list('/sfa/m/pop/bill_company_list.xhr.php', query);
    $('#pop_md').modal('show');
}
function print_pop_customer(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/customer_list.xhr.php', query, print_pop_list, 'pop_customer_list', true);
    //$('#customer_list').show_list('/sfa/m/pop/customer_list.xhr.php', query);
    $('#pop_md').modal('show');
}
function print_pop_contact(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/contact_list.xhr.php', query, print_pop_list, 'pop_contact_list', true);
    //$('#customer_list').show_list('/sfa/m/pop/customer_list.xhr.php', query);
    $('#pop_md').modal('show');
}
function print_pop_support(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/support_list.xhr.php', query, print_pop_list, 'pop_support_list', true);
    //$('#support_list').show_list('/sfa/m/pop/support_list.xhr.php', query);
    $('#pop_md').modal('show');
}
function print_pop_user(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/user_list.xhr.php', query, print_pop_list, 'pop_user_list', true);
    //$('#user_list').show_list('/sfa/m/pop/user_list.xhr.php', query);
    $('#pop_md').modal('show');
}
function print_pop_opp(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/opportunity_list.xhr.php', query, print_pop_list, 'pop_opportunity_list', true);
    //$('#opportunity_list').show_list('/sfa/m/pop/opportunity_list.xhr.php', query);
    $('#pop_md').modal('show');
}
function print_pop_order(html) {
    $('#modal_body').html(html);
    var query = $('#pop_condition :input').serialize();
    _ajax('/sfa/m/pop/order_list.xhr.php', query, print_pop_list, 'pop_order_list', true);
    //$('#support_list').show_list('/sfa/m/pop/support_list.xhr.php', query);
    $('#pop_md').modal('show');
}
/*
 * added by yongmin 2019-10-04
 */
function print_pop_sticky(html){
	$('#modal_body').html(html);
	var query = $('#pop_condition :input').serialize();
	_ajax('/sfa/m/pop/opportunity_list.xhr.php', query, print_pop_list, 'pop_show_list', true);
    $('#pop_md').modal('show');
}
function print_pop_list(data, arg) {
    _loading(0);
    var obj	= $('#' + arg);
    var page_cnt = 0;
    var total_cnt = 0;
    var page	= 0;
    var url	= '';
    var id	= arg;
    if (data.page_cnt != undefined) {
	page_cnt = data.page_cnt;
    }
    if (data.total_cnt != undefined) {
	total_cnt = data.total_cnt;
    }
    if (data.page != undefined) {
	page = data.page;
    }
    if (data.url != undefined) {
	url = data.url;
    }
    if (page == '1') {
	$(obj).children().remove();
    }
    var code = '';
    $.each(data, function(k, dt) {
	if (k == 'page_cnt' || k == 'page' || k == 'total_cnt' || k == 'url') {
	    return true;
	}
	code += '<div class="list-content-wrapper">';
	$.each(dt, function(k2, v) {
	    code += v;
	});
	code += '</div>';
    });
    $(obj).append(code);
    code = '';
    if (page_cnt == 0) { // no data
	$('#pop_paging').html('<span>' + JS_TEXT['no_data'] + '</span>').addClass('no_data');
	return;
    }
    $('#pop_paging').html('').children().remove();
    $('#pop_paging').removeClass('paging').addClass('paging').removeClass('no_data').css('width', $(obj).parent().css('width'));
    if (page != page_cnt) {
	$('#pop_paging').append('<button class="btn btn-default btn-sm page" type="button" page="' + (parseInt(page) + 1) + '">' + JS_TEXT['more']  + '</button>');
	$('#pop_paging').css('margin-top', '10px');
	$('#pop_paging').css('height', '50px');
    }
    $(obj).parent().find('.page').click(function() {
	$('input[name=page]').val($(this).attr('page'));
	var query = $('#pop_condition :input').serialize();
	_ajax(url, query, print_pop_list, id, true);
    });
}
$(document).on('click', '.stock-list-open-btn', function() {
    _ajax_html('/sfa/m/stock/stock_list_form.php', '', print_custom_form);
	//var query = $('#product_condition :input').serialize();
	//$('#stock_pr_list').show_list('/sfa/template/xhr/stock_list.xhr.php', query);
});
$(document).on('click', "#stock-pr-sch-btn", function() {
    var query = $('#product_condition :input').serialize();
    $('#stock_pr_list').show_list('/sfa/m/template/xhr/stock_list.xhr.php', query);
});
$(document).on('click', '#stock-trans-btn', function() {
    var code = '';
    var separ_option = '';
    var class_option = '';
    var version_option = '';
    if (typeof separ_list != 'undefined') {
	for (var i = 0; i < separ_list.length; i++) {
	    separ_option += '<option value="' + separ_list[i][0] + '">' + separ_list[i][1] + '</option>';
	}
    }
    if (typeof class_list != 'undefined') {
	for (var i = 0; i < class_list.length; i++) {
	    class_option += '<option value="' + class_list[i][0] + '">' + class_list[i][1] + '</option>';
	}
	version_option = get_version_list(class_list[0][0]);
    }

    $('input[name^=chks]').each(function(idx) {
	if ($(this).prop('checked') == true) {
	    var stock_seq = $(this).val();
	    var pr_name 	= $('input[name^=stock_pr_name]').eq(idx).val();
	    var pr_sn 	= $('input[name^=stock_sn]').eq(idx).val();
	    var pr_price 	= $('input[name^=stock_price]').eq(idx).val();
	    if ($('input[name^=so_stock_seq]:input[value=' + stock_seq + ']').length > 0) return;
	    /*
	    code += '<tr class="so-product-form-list">';
	    code += '<input type="hidden" name="so_stock_seq[]" value="' + stock_seq + '" />';
	    code += '<td>';
	    code += '<select name="so_stockout_type[]" class="form-control">';
	    code += separ_option;
	    code += '</select>';
	    code += '</itd>'; // col
	    code += '<td><input type="text" class="form-control" readonly value="' + pr_name + '" /></td>';
	    code += '<td><input type="text" class="form-control" readonly value="' + pr_sn + '" /></td>';
	    code += '<td>';
	    code += '<select name="so_p_class[]" class="form-control" onchange="javascript:show_version($(this))">';
	    code += class_option;
	    code += '</select>';
	    code += '</td>'; // col
	    code += '<td>';
	    code += '<select name="so_version[]" class="form-control">';
	    code += version_option;
	    code += '</select>';
	    code += '</td>'; // col
	    code += '<td><input type="text" class="form-control" name="so_price[]" value="' + pr_price + '" /></td>';
	    code += '<td><input type="text" class="form-control" name="so_memo[]" value="" /></td>';
	    code += '<td><input type="text" class="form-control" name="so_mac[]" value="" /></td>';
	    code += '<td><button class="btn btn-danger btn-sm stockout-product-row-del-btn" type="button"><i class="fa fa-trash-o" aria-hidden="true"></i></button></td>';
	    code += '</tr>'; // form-group
	    */
	    code += '<div class="list-content-wrapper">' +
		'<div class="list-content">';
	    code += '<input type="hidden" name="so_stock_seq[]" value="' + stock_seq + '">';
	    code += '<div class="form-group">' + 
		'<select name="so_stockout_type[]" class="form-control">' +
		separ_option +
		'</select>' + 
		'</div>';
	    code += '<div class="form-group"><div class="input-group">' + 
		'<span class="input-group-addon">' + JS_TEXT['product_name'] + '</span>' + 
		'<input type="text" class="form-control" readonly value="' + pr_name + '" />' +
		'</div></div>';
	    code += '<div class="form-group"><div class="input-group">' + 
		'<span class="input-group-addon">SN</span>' + 
		'<input type="text" class="form-control" readonly value="' + pr_sn + '" />' +
		'</div></div>';
	    code += '<div class="form-group"><div class="input-group">' + 
		'<span class="input-group-addon">' + JS_TEXT['product_class'] + '</span>' + 
		'<select name="so_p_class[]" class="form-control" onchange="javascript:show_version($(this))">' +
		class_option +
		'</select>' + 
		'</div></div>';
	    code += '<div class="form-group"><div class="input-group">' + 
		'<span class="input-group-addon">' + JS_TEXT['version']  + '</span>' + 
		'<select name="so_version[]" class="form-control">' +
		version_option +
		'</select>' +
		'</div></div>';
	    code += '<div class="form-group"><div class="input-group">' + 
		'<span class="input-group-addon">' + JS_TEXT['price']  + '</span>' + 
		'<input type="text" class="form-control" name="so_price[]" value="' + pr_price + '" />' +
		'</div></div>';
	    code += '<div class="form-group"><div class="input-group">' + 
		'<span class="input-group-addon">' + JS_TEXT['description'] + '</span>' + 
		'<input type="text" class="form-control" name="so_memo[]" value="" />' +
		'</div></div>';
	    code += '<div class="form-group"><div class="input-group">' + 
		'<span class="input-group-addon">MAC</span>' + 
		'<input type="text" class="form-control" name="so_mac[]" value="" />' +
		'</div></div>';
	    code += '</div>';
	    code += '<div class="swipe-content">' +
		'<span>' +
	        '<span class="stockout-product-row-del-btn swipe-menu del"><i class="fa fa-trash-o"></i></span>' +
		'</span>' + 
		'</div>';
	    code += '</div>';

	}
    });
    if (code != '') {
	$('#so_list').append(code);
    }
    $('#custom_md').modal('hide');

});

$(document).on('click', '.sch-opportunity2', function() {
    _ajax_html("/sfa/m/pop/popup_opportunity.php", "name_field=op_name&code_field=op_code&coname_field=co_name&cocode_field=co_code", print_pop_opp);
});
