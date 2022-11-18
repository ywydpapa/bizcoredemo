$(document).ready(function () {
    $('.relative-list-li').on('click', function() {
	if ($(this).next().hasClass('panel-body')) {
	    if ($(this).next().css('display') == 'none') {
		$(this).find('.angle').html('<i class="fa fa-angle-up"></i>');
		$(this).next().show();
	    } else {
		$(this).find('.angle').html('<i class="fa fa-angle-down"></i>');
		$(this).next().hide();
	    }
	}
    });
    $("#save-note-btn").on('click', function() {
	var frm = document.frm;
	if (!requiredField($("textarea[name=note]"), JS_TEXT['insert_content'])) return;
	frm.target = "ifrm";
	frm.action = "/sfa/common/detail/note_proc.php?gubun=insnote";
	frm.submit();
    });
    $("#attach-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	_ajax_html("/sfa/m/pop/popup_upload.php", "ref_code=" + code, print_pop_upload);
    });
    function print_pop_upload(html) {
	$('#modal_upload_body').html(html);
	$('#pop_upload_md').modal('show');
    }
    $("#schedule-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/m/schedule/schedule_form.php?' + init_code + '_code=' + code;
    });
    $("#contract-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/m/contract/contract_form.php?' + init_code + '_code=' + code;
    });
    $("#customer-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/m/customer/customer_form.php?' + init_code + '_code=' + code;
    });
    $("#opportunity-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/m/opportunity/opportunity_form.php?' + init_code + '_code=' + code;
    });
    $("#activity-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/m/activity/activity_form.php?' + init_code + '_code=' + code;
    });
    $("#support-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/m/support/support_form.php?' + init_code + '_code=' + code;
    });
    $("#support-history-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/m/support/support_info_form.php?' + init_code + '_code=' + code;
    });
    $("#order-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/m/order/order_form.php?' + init_code + '_code=' + code;
    });
    $("#stockin-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/m/stock/stockin_form.php?' + init_code + '_code=' + code;
    });
    $("#stockout-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/m/stock/stockout_form.php?' + init_code + '_code=' + code;
    });
    $("#op-product-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	_ajax_html('/sfa/m/opportunity/opportunity_product_form.php', 'op_code=' + code, print_custom_form);
    });
    $("#op-service-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	_ajax_html('/sfa/m/opportunity/opportunity_service_form.php', 'op_code=' + code, print_custom_form);
    });
    $("#contract-product-add-btn").on('click', function() {
	var code = $("input[name=ct_code]").val();
	_ajax_html('/sfa/m/contract/contract_product_form.php', 'ct_code=' + code, print_custom_form);
	//$("#product_ifrm").attr("src", '/sfa/m/contract/contract_product_form.php?ct_code=' + code);
	//$("#product_md").modal('show');
    });
    $("#contract-service-add-btn").on('click', function() {
	var code = $("input[name=ct_code]").val();
	_ajax_html('/sfa/m/contract/contract_service_form.php', 'ct_code=' + code, print_custom_form);
	/*
	var code = $("input[name=ct_code]").val();
	$("#service_ifrm").attr("src", '/sfa/m/contract/contract_service_form.php?ct_code=' + code);
	$("#service_md").modal('show');
	*/
    });
    $("#contract-mc-add-btn").on('click', function() {
	var code = $("input[name=ct_code]").val();
	window.open('/sfa/m/contract/contract_mc_form.php?parent_code=' + code, 'MAINTENANCE', "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=1100, height=640");
    });
    $("#op-customer-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	_ajax_html('/sfa/m/opportunity/opportunity_cust_form.php', 'op_code=' + code, print_custom_form);
    });
    $("#op-cooper-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	_ajax_html('/sfa/m/opportunity/opportunity_cooper_form.php', 'op_code=' + code, print_custom_form);
    });
    $("#op-rival-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	_ajax_html('/sfa/m/opportunity/opportunity_rival_form.php', 'op_code=' + code, print_custom_form);
    });
    $("#present-add-btn").on('click', function() {
	var code = $("input[name=ac_code]").val();
	$("#present_ifrm").attr("src", '/sfa/m/activity/activity_present_form.php?ac_code=' + code);
	$("#present_md").modal('show');
    });
    $("#sc-present-add-btn").on('click', function() {
	var code = $("input[name=sc_code]").val();
	$("#sc_present_ifrm").attr("src", '/sfa/m/schedule/schedule_present_form.php?sc_code=' + code);
	$("#sc_present_md").modal('show');
    });
    $("#cust-job-add-btn").on('click', function() {
	var code = $("input[name=cu_code]").val();
	$("#job_ifrm").attr("src", '/sfa/m/customer/customer_job_form.php?cu_code=' + code);
	$("#job_md").modal('show');
    });
    $("#member-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	_ajax_html('/sfa/m/auth/auth_group_member.php', 'xg_code=' + code, print_custom_form);
	//$("#member_ifrm").attr("src", '/sfa/m/auth/auth_group_member.php?xg_code=' + code);
	//$("#member_md").modal('show');
    });
    if ($("#note_list").length > 0) {
	show_note_list();
    }
    if ($("#attach_list").length > 0) {
	show_attach_list();
    }
    if ($("#support_history_list").length > 0) {
	show_support_history_list();
    }
    if ($("#schedule_list").length > 0) {
	show_schedule_list();
    }
    if ($("#customer_list").length > 0) {
	show_customer_list();
    }
    if ($("#campaign_info_list").length > 0) {
	show_campaign_info_list();
    }
    if ($("#campaign_mail_list").length > 0) {
	show_campaign_mail_list();
    }
    if ($("#campaign_mail_info_list").length > 0) {
	show_campaign_mail_info_list();
    }
    if ($("#opportunity_list").length > 0) {
	show_opportunity_list();
    }
    if ($("#opportunity_partner_list").length > 0) {
	show_opportunity_partner_list();
    }
    if ($("#opportunity_cust_list").length > 0) {
	show_opportunity_cust_list();
    }
    if ($("#activity_list").length > 0) {
	show_activity_list();
    }
    if ($("#support_list").length > 0) {
	show_support_list();
    }
    if ($("#order_list").length > 0) {
	show_order_list();
    }
    if ($("#stockin_list").length > 0) {
	show_stockin_list();
    }
    if ($("#stockout_list").length > 0) {
	show_stockout_list();
    }
    if ($("#stockout_partner_list").length > 0) {
	show_stockout_partner_list();
    }
    if ($("#stockout_product_list").length > 0) {
	show_stockout_product_list();
    }
    if ($("#stockin_product_list").length > 0) {
	show_stockin_product_list();
    }
    if ($("#contract_list").length > 0) {
	show_contract_list();
    }
    if ($("#contract_partner_list").length > 0) {
	show_contract_partner_list();
    }
    if ($("#op_product_list").length > 0) {
	show_op_product_list();
    }
    if ($("#op_service_list").length > 0) {
	show_op_service_list();
    }
    if ($("#op_mc_list").length > 0) {
	show_op_mc_list();
    }
    if ($("#contract_product_list").length > 0) {
	show_contract_product_list();
    }
    if ($("#contract_service_list").length > 0) {
	show_contract_service_list();
    }
    if ($("#contract_mc_list").length > 0) {
	show_contract_mc_list();
    }
    if ($("#op_history_list").length > 0) {
	show_op_history_list();
    }
    if ($("#present_list").length > 0) {
	show_present_list();
    }
    if ($("#sc_present_list").length > 0) {
	show_sc_present_list();
    }
    if ($("#cust_job_list").length > 0) {
	show_cust_job_list();
    }
    if ($("#member_list").length > 0) {
	show_member_list();
    }
});
function deletePresent(id) {
    if (confirm(JS_TEXT['ask_delete'])) {
	ifrm.location.href = "/sfa/activity/activity_present_proc.php?gubun=del&present_id=" + id + "&ac_code=" + $("#ac_code").val();
    }
}
function deleteScPresent(id) {
    if (confirm(JS_TEXT['ask_delete'])) {
	ifrm.location.href = "/sfa/schedule/schedule_present_proc.php?gubun=del&present_id=" + id + "&sc_code=" + $("#sc_code").val();
    }
}
function deleteNote(code) {
    if (confirm(JS_TEXT['ask_delete'])) {
	ifrm.location.href = "/sfa/common/detail/note_proc.php?gubun=delnote&nt_code=" + code;
    }
}
function deleteFile(code) {
    if (confirm(JS_TEXT['ask_delete'])) {
	ifrm.location.href = "/sfa/common/detail/attach_proc.php?gubun=delfile&ata_code=" + code;
    }
}
function show_note_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#note_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_note.xhr.php', param, note_data_output, undefined, true);
}
function show_attach_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    _ajax('/sfa/m/template/xhr/detail_attach.xhr.php', param, attach_data_output, undefined, true);
}
function show_schedule_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#schedule_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_schedule.xhr.php', param, schedule_data_output, undefined, true);
}
function show_customer_list() {
    var cur_count	= $('#customer_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#customer_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_customer.xhr.php', param, customer_data_output, undefined, true);
}
function show_campaign_info_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#campaign_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_campaign_info.xhr.php', param, campaign_info_data_output, undefined, true);
}
function show_campaign_mail_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#campaign_mail_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_campaign_mail.xhr.php', param, campaign_mail_data_output, undefined, true);
}
function show_campaign_mail_info_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#campaign_mail_info_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_campaign_mail_info.xhr.php', param, campaign_mail_info_data_output, undefined, true);
}
function show_opportunity_list() {
    var cur_count	= $('#opportunity_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#opportunity_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_opportunity.xhr.php', param, opportunity_data_output, undefined, true);
}
function show_opportunity_partner_list() {
    var cur_count	= $('#opportunity_partner_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#opportunity_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_opportunity_partner.xhr.php', param, opportunity_partner_data_output, undefined, true);
}
function show_opportunity_cust_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#opportunity_cust_list").children().remove();
    _ajax('/sfa/template/xhr/detail_opportunity_cust.xhr.php', param, opportunity_cust_data_output, undefined, true);
}
function show_activity_list() {
    var cur_count	= $('#activity_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#activity_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_activity.xhr.php', param, activity_data_output, undefined, true);
}
function show_support_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#support_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_support.xhr.php', param, support_data_output, undefined, true);
}
function show_support_history_list() {
    var cur_count	= $('#support_history_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#support_history_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_support_history.xhr.php', param, support_history_data_output, undefined, true);
}
function show_order_list() {
    var cur_count	= $('#order_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#order_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_order.xhr.php', param, order_data_output, undefined, true);
}
function show_stockin_list() {
    var cur_count	= $('#stockin_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#stockin_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_stockin.xhr.php', param, stockin_data_output, undefined, true);
}
function show_stockout_list() {
    var cur_count	= $('#stockout_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#stockout_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_stockout.xhr.php', param, stockout_data_output, undefined, true);
}
function show_stockout_partner_list() {
    var cur_count	= $('#stockout_partner_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#stockout_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_stockout_partner.xhr.php', param, stockout_partner_data_output, undefined, true);
}
function show_stockout_product_list() {
    var param = "so_code=" + $("input[name=so_code]").val();
    _ajax('/sfa/m/template/xhr/detail_stockout_product.xhr.php', param, stockout_product_data_output, undefined, true);
}
function show_stockin_product_list() {
    var param = "si_code=" + $("input[name=si_code]").val();
    _ajax('/sfa/m/template/xhr/detail_stockin_product.xhr.php', param, stockin_product_data_output, undefined, true);
}
function show_contract_list() {
    var cur_count	= $('#contract_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#contract_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_contract.xhr.php', param, contract_data_output, undefined, true);
}
function show_contract_partner_list() {
    var cur_count	= $('#contract_partner_list').find('tr').length;
    var param = "ref_code=" + $("input[name=ref_code]").val() + '&cur_count=' + cur_count;
    //$("#contract_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_contract_partner.xhr.php', param, contract_partner_data_output, undefined, true);
}
function show_op_product_list() {
    var param = "op_code=" + $("input[name=op_code]").val();
    _ajax('/sfa/m/template/xhr/detail_op_product.xhr.php', param, op_product_data_output, undefined, true);
}
function show_op_service_list() {
    var param = "op_code=" + $("input[name=op_code]").val();
    _ajax('/sfa/m/template/xhr/detail_op_service.xhr.php', param, op_service_data_output, undefined, true);
}
function show_op_mc_list() {
    var param = "op_code=" + $("input[name=op_code]").val();
    _ajax('/sfa/m/template/xhr/detail_op_mc.xhr.php', param, op_mc_data_output, undefined, true);
}
function show_contract_product_list() {
    var param = "ct_code=" + $("input[name=ct_code]").val();
    _ajax('/sfa/m/template/xhr/detail_contract_product.xhr.php', param, contract_product_data_output, undefined, true);
}
function show_contract_service_list() {
    var param = "ct_code=" + $("input[name=ct_code]").val();
    //$("#contract_service_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_contract_service.xhr.php', param, contract_service_data_output, undefined, true);
}
function show_contract_mc_list() {
    var param = "ct_code=" + $("input[name=ct_code]").val();
    //$("#contract_mc_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_contract_maintenance.xhr.php', param, contract_mc_data_output, undefined, true);
}
function show_op_history_list() {
    var param = "op_code=" + $("input[name=op_code]").val();
    _ajax('/sfa/m/template/xhr/detail_op_history.xhr.php', param, op_history_data_output, undefined, true);
}
function show_present_list() {
    var param = "ac_code=" + $("input[name=ac_code]").val();
    _ajax('/sfa/m/template/xhr/detail_present.xhr.php', param, present_data_output, undefined, true);
}
function add_present_list() {
    var param = "ac_code=" + $("input[name=ac_code]").val();
    _ajax('/sfa/m/template/xhr/detail_present.xhr.php', param, present_data_output, 'add', true);
}
function show_sc_present_list() {
    var param = "sc_code=" + $("input[name=sc_code]").val();
    $("#sc_present_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_schedule_present.xhr.php', param, sc_present_data_output, undefined, true);
}
function add_sc_present_list() {
    var param = "sc_code=" + $("input[name=sc_code]").val();
    _ajax('/sfa/m/template/xhr/detail_schedule_present.xhr.php', param, sc_present_data_output, 'add', true);
}
function show_cust_job_list() {
    var param = "cu_code=" + $("input[name=cu_code]").val();
    _ajax('/sfa/m/template/xhr/detail_customer_job.xhr.php', param, cust_job_data_output, undefined, true);
}
function show_member_list() {
    var param = "xg_code=" + $("input[name=ref_code]").val();
    $("#member_list").children().remove();
    _ajax('/sfa/m/template/xhr/detail_auth_group_member.xhr.php', param, member_data_output, undefined, true);
}
function note_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var code = '';
    if (cnt > 0) {
	if ($('#nt_label').parent().find('.angle').length == 0) {
	    var arrow = 'up';
	    if ($('#note_list').parent().css('display') == 'none') {
		arrow = 'down';
	    }
	    $('#nt_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-' + arrow + '"></i></span>');
	}
	$.each(data, function(k, dt) {
		if (k == 'cnt') {
		    return true;
		}
		var reg_date = dt.reg_date;
		var nt_code = dt.nt_code;
		var reg_name = dt.reg_name;
		var nt_desc = dt.nt_desc;
		code += '<div class="feed-element">';
		code += '	<div class="media-body">';
		code += '	    <small class="pull-right">' + reg_date + '&nbsp;<button class="btn btn-xs btn-danger" type="button" onclick="javascript:deleteNote(\'' + nt_code + '\')"><i class="fa fa-times" aria-hidden="true"></i></button></small>';
		code += '	    <strong>' + reg_name + '</strong>';
		code += '	    <div class="well">' + nt_desc + '</div>';
		code += '	</div>';
		code += '</div>';
	});
    } else {
	$('#nt_label').parent().find('.angle').remove();
	$('#note_list').parent().hide();
    }
    $('#note_list').append(code);
    $('#nt_label').text(cnt);
    code = '';
}
function attach_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#attach_list').children().remove();
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#at_label').parent().find('.angle').remove();
	$('#attach_list').parent().parent().hide();
    } else {
	if ($('#at_label').parent().find('.angle').length == 0) {
	    $('#at_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-up"></i></span>');
	    $('#attach_list').parent().show();
	}
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
			code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#attach_list').append(code);
    $('#at_label').text(cnt);
    code = '';
}
function schedule_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#schedule_list').parent().parent().remove();
	$('#sc_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#schedule_list').append(code);
    code = '';
    $('#sc_label').text(cnt);
    /*
    if (cnt > 5) {
	$('#schedule_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/schedule/schedule.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function customer_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#customer_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#customer_list').parent().parent().remove();
	$('#cu_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#customer_list').append(code);
    $('#cu_label').text(cnt);
    code = '';
    if (cnt > $('#customer_list').find('tr').length) {
	$('#customer_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_customer_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
}
function campaign_info_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#campaign_info_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#campaign_info_list').parent().parent().remove();
	$('#sendto_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#campaign_info_list').append(code);
    $('#sendto_label').text(cnt);
    code = '';
}
function campaign_mail_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#campaign_mail_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#campaign_mail_list').parent().parent().remove();
	$('#emails_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#campaign_mail_list').append(code);
    $('#emails_label').text(cnt);
    code = '';
}
function campaign_mail_info_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#campaign_mail_info_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#campaign_mail_info_list').parent().parent().remove();
	$('#sendto_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#campaign_mail_info_list').append(code);
    $('#sendto_label').text(cnt);
    code = '';
}
function opportunity_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#opportunity_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#opportunity_list').parent().parent().remove();
	$('#op_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code' || k == 'coop_cnt') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#opportunity_list').append(code);
    code = '';
    $('#op_label').text(cnt);
    if (cnt > $('#opportunity_list').find('tr').length) {
	$('#opportunity_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_opportunity_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
    /*
    if (cnt > 5) {
	$('#opportunity_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/opportunity/opportunity.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function opportunity_partner_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#opportunity_partner_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#opportunity_partner_list').parent().parent().remove();
	$('#op_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code' || k == 'coop_cnt') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#opportunity_partner_list').append(code);
    code = '';
    $('#op_label').text(cnt);
    if (cnt > $('#opportunity_partner_list').find('tr').length) {
	$('#opportunity_partner_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_opportunity_partner_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
    /*
    if (cnt > 5) {
	$('#opportunity_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/opportunity/opportunity.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function opportunity_cust_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="5" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#opportunity_cust_list').append(code);
    $('#op_cust_label').text(cnt);
    code = '';
}
function activity_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#activity_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#activity_list').parent().parent().remove();
	$('#ac_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#activity_list').append(code);
    code = '';
    $('#ac_label').text(cnt);
    if (cnt > $('#activity_list').find('tr').length) {
	$('#activity_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_activity_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
    /*
    if (cnt > 5) {
	$('#activity_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/activity/activity.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function support_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="4" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#support_list').append(code);
    code = '';
    $('#ep_label').text(cnt);
    /*
    if (cnt > 5) {
	$('#support_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/support/support.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function support_history_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#support_history_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#support_history_list').parent().parent().remove();
	$('#ei_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#support_history_list').append(code);
    code = '';
    $('#ei_label').text(cnt);
    if (cnt > $('#support_history_list').find('tr').length) {
	$('#support_history_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_support_history_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
    /*
    if (cnt > 5) {
	$('#support_history_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/support/support_history.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function order_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#order_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#order_list').parent().parent().remove();
	$('#or_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#order_list').append(code);
    code = '';
    $('#or_label').text(cnt);
    if (cnt > $('#order_list').find('tr').length) {
	$('#order_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_order_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
    /*
    if (cnt > 5) {
	$('#order_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/order/order.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function stockin_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#stockin_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#stockin_list').parent().parent().remove();
	$('#si_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#stockin_list').append(code);
    code = '';
    $('#si_label').text(cnt);
    if (cnt > $('#stockin_list').find('tr').length) {
	$('#stockin_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_stockin_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
    /*
    if (cnt > 5) {
	$('#stockin_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/stock/stockin.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function stockout_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#stockout_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#stockout_list').parent().parent().remove();
	$('#so_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#stockout_list').append(code);
    $('#so_label').text(cnt);
    code = '';
    if (cnt > $('#stockout_list').find('tr').length) {
	$('#stockout_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_stockout_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
    /*
    if (cnt > 5) {
	$('#stockout_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/stock/stockout.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function stockout_partner_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#stockout_partner_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#stockout_partner_list').parent().parent().remove();
	$('#so_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#stockout_partner_list').append(code);
    $('#so_label').text(cnt);
    code = '';
    if (cnt > $('#stockout_partner_list').find('tr').length) {
	$('#stockout_partner_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_stockout_partner_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
    /*
    if (cnt > 5) {
	$('#stockout_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/stock/stockout.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function stockout_product_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#stockout_product_list').children().remove();
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#so_pr_label').parent().find('.angle').remove();
    } else {
	if ($('#so_pr_label').parent().find('.angle').length == 0) {
	    $('#so_pr_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-up"></i></span>');
	    $('#stockout_product_list').parent().show();
	}
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
		    code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#stockout_product_list').append(code);
    $('#so_pr_label').text(cnt);
    code = '';
}
function stockin_product_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#stockin_product_list').children().remove();
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#si_pr_label').parent().find('.angle').remove();
    } else {
	if ($('#si_pr_label').parent().find('.angle').length == 0) {
	    $('#si_pr_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-up"></i></span>');
	    $('#stockin_product_list').parent().show();
	}
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
		    code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#stockin_product_list').append(code);
    $('#si_pr_label').text(cnt);
    code = '';
}
function contract_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#contract_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#contract_list').parent().parent().remove();
	$('#ct_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#contract_list').append(code);
    code = '';
    $('#ct_label').text(cnt);
    if (cnt > $('#contract_list').find('tr').length) {
	$('#contract_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_contract_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
    /*
    if (cnt > 5) {
	$('#contract_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/contract/contract.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function contract_partner_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#contract_partner_list').find('div').remove();
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	$('#contract_partner_list').parent().parent().remove();
	$('#ct_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#contract_partner_list').append(code);
    code = '';
    $('#ct_label').text(cnt);
    if (cnt > $('#contract_partner_list').find('tr').length) {
	$('#contract_partner_list').append('<div style="text-align:center;margin-top:10px"><button class="btn btn-default btn-sm" type="button" onclick="javascript:show_contract_partner_list()" style="width:100%"><i class="fa fa-angle-down"></i></button></div>');
    }
    /*
    if (cnt > 5) {
	$('#contract_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/contract/contract.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function op_product_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#op_product_list').children().remove();
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#op_product_label').parent().find('.angle').remove();
    } else {
	if ($('#op_product_label').parent().find('.angle').length == 0) {
	    $('#op_product_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-up"></i></span>');
	    $('#op_product_list').parent().show();
	}
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
		    code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#op_product_list').append(code);
    $('#op_product_label').text(cnt);
    code = '';
}
function op_service_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#op_service_list').children().remove();
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#op_service_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
		    code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#op_service_list').append(code);
    $('#op_service_label').text(cnt);
    code = '';
}
function op_mc_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#op_mc_list').children().remove();
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#op_mc_label').parent().find('.angle').remove();
    } else {
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
		    code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#op_mc_list').append(code);
    $('#op_mc_label').text(cnt);
    code = '';
}
function contract_product_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#contract_product_list').children().remove();
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#ct_product_label').parent().find('.angle').remove();
    } else {
	if ($('#ct_product_label').parent().find('.angle').length == 0) {
	    $('#ct_product_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-up"></i></span>');
	    $('#contract_product_list').parent().show();
	}
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
			code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#ct_product_label').text(cnt);
    $('#contract_product_list').append(code);
    code = '';
}
function contract_service_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#contract_service_list').children().remove();
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#ct_service_label').parent().find('.angle').remove();
    } else {
	if ($('#ct_service_label').parent().find('.angle').length == 0) {
	    $('#ct_service_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-up"></i></span>');
	    $('#contract_service_list').parent().show();
	}
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
			code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#ct_service_label').text(cnt);
    $('#contract_service_list').append(code);
    code = '';
}
function contract_mc_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#contract_mc_list').children().remove();
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#ct_mc_label').parent().find('.angle').remove();
    } else {
	if ($('#ct_mc_label').parent().find('.angle').length == 0) {
	    $('#ct_mc_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-up"></i></span>');
	    $('#contract_mc_list').parent().show();
	}
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
			code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#ct_mc_label').text(cnt);
    $('#contract_mc_list').append(code);
    code = '';
}
function op_history_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var op_code = data.op_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="5" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'op_code') {
		    return true;
		}
		code += '<tr>';
		$.each(dt, function(k2, v) {
			code += '<td>';
			if (v != null) {
				code += v;
			}
			code += '</td>';
		});
		code += '</tr>';
	});
    }
    $('#op_history_list').append(code);
    $('#op_history_label').text(cnt);
    code = '';
}
function present_data_output(data, arg) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    if (arg != undefined) {
	$('#present_list').children().remove();
    }
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#present_label').parent().find('.angle').remove();
    } else {
	if ($('#present_label').parent().find('.angle').length == 0) {
	    $('#present_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-up"></i></span>');
	    $('#present_list').parent().show();
	}
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
			code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#present_label').text(cnt);
    $('#present_list').append(code);
    code = '';
}
function sc_present_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#sc_present_label').parent().find('.angle').remove();
    } else {
	if ($('#sc_present_label').parent().find('.angle').length == 0) {
	    $('#sc_present_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-up"></i></span>');
	    $('#sc_present_list').parent().show();
	}
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
			code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#sc_present_list').append(code);
    $('#sc_present_label').text(cnt);
    code = '';
}
function cust_job_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    $('#cust_job_list').children().remove();
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	$('#cust_job_label').parent().find('.angle').remove();
    } else {
	if ($('#cust_job_label').parent().find('.angle').length == 0) {
	    $('#cust_job_label').parent().append('<span class="pull-right angle"><i class="fa fa-angle-up"></i></span>');
	    $('#cust_job_list').parent().show();
	}
	$.each(data, function(k, dt) {
	    if (k == 'cnt') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		if (v != null) {
		    code += v;
		}
	    });
	    code += '</div>';
	});
    }
    $('#cust_job_list').append(code);
    $('#cust_job_label').text(cnt);
    code = '';
}
function member_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var cu_code = data.cu_code;
    var code = '';
    if (cnt == '0') {
	code += '<div>' + JS_TEXT['no_data'] + '</div>';
    } else {
	$.each(data, function(k, dt) {
	    if (k == 'cnt' || k == 'ref_code') {
		return true;
	    }
	    code += '<div class="list-content-wrapper">';
	    $.each(dt, function(k2, v) {
		code += v;
	    });
	    code += '</div>';
	});
    }
    $('#member_list').append(code);
    code = '';
}
function member_del_result(resp)
{
    _loading(0);
    ajax_resp(resp);

    if (resp.debug != undefined) {
	if (resp.debug == true) {
	    alert("Confirm INPUT/OUTPUT Result...");
	}
    }
    show_member_list();
}
$(document).on('click', '#pop_close', function() {
    $('#pop_md').modal('hide');
});
$(document).on('click', '#pop_upload_close', function() {
    $('#pop_upload_md').modal('hide');
});
$(document).on('click', '.data-sch-btn', function() {
    $("#fclass2").prop("checked", true);                                                                                         
    _ajax_html("/sfa/m/pop/popup_data.php", "name_field=file_name&code_field=da_code&memo_field=title", print_pop_data);
});
function print_pop_data(html) {
    $('#modal_body').html(html);
    var query = $('#condition :input').serialize();
    $('#salesdata_list').show_list('/sfa/m/pop/salesdata_list.xhr.php', query);
    $('#pop_md').modal('show');
}
function selectData(code, name, memo) {
    var code_field	= $('#code_field').val();
    var name_field	= $('#name_field').val();
    var memo_field	= $('#memo_field').val();
    $('#' + code_field).val(code);
    $('#' + name_field).val(name);
    $('#' + memo_field).val(memo);
}
$(document).on('click', '.pop-upload-register', function () {
    var frm = document.up_frm;                                                                                                      
    if ($("#fclass1").is(":checked") == true) {
	if (!requiredField($("input[name=file]"), JS_TEXT['alert_select_file'])) return;
    } else if ($("#fclass2").is(":checked") == true) {
	if (!requiredField($("input[name=file_name]"), JS_TEXT['alert_select_file'])) return;
    } else {
	return;
    }
    frm.target = "ifrm";
    frm.action = "/sfa/m/pop/popup_upload_proc.php";
    frm.submit();
    $('#pop_upload_md').modal('hide');
});  
$(document).on('click', '.del_attach_file', function() {
    var code = $(this).attr('ata_code');
    deleteFile(code);
});
$(document).on('click', '#custom_close', function() {
    $('#custom_md').modal('hide');
});
function saveRival() {
    var frm = document.custom_frm;
    if (!requiredField($("#co_code"), JS_TEXT['alert_insert'])) return;
    frm.target = "ifrm";
    frm.action = '/sfa/m/opportunity/opportunity_rival_proc.php';
    frm.submit();
    $('#custom_md').modal('hide');
}
function saveCooper() {
    var frm = document.custom_frm;
    if (!requiredField($("#co_code"), JS_TEXT['alert_insert'])) return;
    frm.target = "ifrm";
    frm.action = '/sfa/m/opportunity/opportunity_cooper_proc.php';
    frm.submit();
    $('#custom_md').modal('hide');
}
function saveCustomer() {
    var frm = document.custom_frm;
    if (!requiredField($("#cu_code"), JS_TEXT['alert_insert'])) return;
    frm.target = "ifrm";
    frm.action = '/sfa/m/opportunity/opportunity_cust_proc.php';
    frm.submit();
    $('#custom_md').modal('hide');
}
function saveProduct() {
    var frm = document.custom_frm;
    if (!requiredField($("#p_class"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#pr_code"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#quantity"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#price"), JS_TEXT['alert_insert'])) return;
    frm.target = "ifrm";
    frm.action = "opportunity_product_proc.php";
    frm.submit();
    $('#custom_md').modal('hide');
}
function saveCtProduct() {
    var frm = document.custom_frm;
    if (!requiredField($("#p_class"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#pr_code"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#quantity"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#price"), JS_TEXT['alert_insert'])) return;
    frm.target = "ifrm";
    frm.action = "contract_product_proc.php";
    frm.submit();
    $('#custom_md').modal('hide');
}
function saveCtService() {
    var frm = document.custom_frm;
    if (!requiredField($("#s_class"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#pr_code"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#quantity"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#price"), JS_TEXT['alert_insert'])) return;
    frm.target = "ifrm";
    frm.action = "contract_service_proc.php";
    frm.submit();
    $('#custom_md').modal('hide');
}
function saveService() {
    var frm = document.custom_frm;
    if (!requiredField($("#s_class"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#pr_code"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#quantity"), JS_TEXT['alert_insert'])) return;
    if (!requiredField($("#price"), JS_TEXT['alert_insert'])) return;
    frm.target = "ifrm";
    frm.action = "opportunity_service_proc.php";
    frm.submit();
    $('#custom_md').modal('hide');
}
$(document).on('click', '.sch-company', function() {
    _ajax_html("/sfa/m/pop/popup_company.php", "name_field=co_name&code_field=co_code", print_pop_company);
});
$(document).on('click', '.sch-customer', function() {
    _ajax_html("/sfa/m/pop/popup_customer.php", "name_field=cu_name&code_field=cu_code&co_name_field=co_name&co_code_field=co_code", print_pop_customer);
});
$(document).on('click', '.sch-assign', function() {
    _ajax_html("/sfa/m/pop/popup_user.php", "name_field=assign_name&id_field=assign_id", print_pop_user);
});
function print_custom_form(html) {
    _loading(0);
    $('#modal_custom_body').html(html);
    $('#custom_md').modal('show');
    $('#start_date_grp').datepicker({
	autoclose: true,
	todayHighlight:true
    });
    $('#end_date_grp').datepicker({
	autoclose: true,
	todayHighlight:true
    });
    $('#sc_date_grp').datepicker({
	autoclose: true,
	todayHighlight:true
    });
    $('#sc_edate_grp').datepicker({
	autoclose: true,
	todayHighlight:true
    });
    $('#support_date_grp').datepicker({
	autoclose: true,
	todayHighlight:true
    });
    $('#support_edate_grp').datepicker({
	autoclose: true,
	todayHighlight:true
    });
    $('.selectpicker').selectpicker('refresh');

    if ($('#stock_pr_list').length > 0) {
	var query = $('#product_condition :input').serialize();
	$('#stock_pr_list').show_list('/sfa/m/template/xhr/stock_list.xhr.php', query);
    }
}
$(document).on('click', ".member-del-btn", function() {
    var user_id	= $(this).attr('user_id');

    swal({
	title:JS_TEXT['ask_delete'],
	type: "warning",
	showCancelButton: true,
	confirmButtonColor: "#DD6B55",
	confirmButtonText: JS_TEXT['confirm'],
	closeOnConfirm: true
    }, function () {
	var data = 'user_id=' + user_id + '&ref_code=' + document.frm.ref_code.value;
	_ajax('/sfa/m/auth/auth_group_member_del.php', data, member_del_result);
    });
});
function addUser() {
    if ($('input[name^=chks]:checked').length == 0) {
	swal({
	    title:JS_TEXT['no_select'],
	    type:'warning'
	});
	return false;
    }
    swal({
	title: JS_TEXT['ask_add'],
	type: "warning",
	showCancelButton: true,
	confirmButtonColor: "#DD6B55",
	confirmButtonText: JS_TEXT['confirm'],
	closeOnConfirm: true
    }, function () {
	var frm = document.custom_frm;
	frm.target = 'ifrm';
	frm.action = "auth_group_proc.php?is_popup=1&gubun=adduser";
	frm.submit();
    });
}
