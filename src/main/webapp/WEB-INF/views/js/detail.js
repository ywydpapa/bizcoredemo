$(document).ready(function () {
    $('input[name=detail_ct_union_search]').on('input', function() {
	if ($("#contract_list").length > 0) {
	    show_contract_list();
	} else if ($("#partner_contract_list").length > 0) {
	    show_partner_contract_list();
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
	window.open("/sfa/pop/popup_upload.php?ref_code=" + code, "UPLOAD", "scrollbars=no, toolbars=no, resizable=yes, status=no, menubars=no, width=660, height=440");

    });
    $("#schedule-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/schedule/schedule_form.php?' + init_code + '_code=' + code;
    });
    $("#contract-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/contract/contract_form.php?' + init_code + '_code=' + code;
    });
    $("#customer-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/customer/customer_form.php?' + init_code + '_code=' + code;
    });
    $("#contact-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/customer/customer_form.php?' + init_code + '_code=' + code;
    });
    $("#opportunity-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/opportunity/opportunity_form.php?' + init_code + '_code=' + code;
    });
    $("#opportunity-coop-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/opportunity/opportunity_form.php?coop_co_code=' + code;
    });
    $("#activity-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/activity/activity_form.php?' + init_code + '_code=' + code;
    });
    $("#support-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/support/support_form.php?' + init_code + '_code=' + code;
    });
    $("#support-history-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/support/support_info_form.php?' + init_code + '_code=' + code;
    });
    $("#order-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/order/order_form.php?' + init_code + '_code=' + code;
    });
    $("#stockin-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/stock/stockin_form.php?' + init_code + '_code=' + code;
    });
    $("#stockout-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/stock/stockout_form.php?' + init_code + '_code=' + code;
    });
    $("#request-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/order/request_form.php?' + init_code + '_code=' + code;
    });
    $("#quote-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	var init_code = code.substring(0, 2);
	location.href = '/sfa/quote/quote_form.php?' + init_code + '_code=' + code;
    });
    $("#op-product-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	$("#product_ifrm").attr("src", '/sfa/opportunity/opportunity_product_form.php?op_code=' + code);
	$("#product_md").modal('show');
    });
    $("#op-service-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	$("#service_ifrm").attr("src", '/sfa/opportunity/opportunity_service_form.php?op_code=' + code);
	$("#service_md").modal('show');
    });
    $("#op-mc-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	$("#mc_ifrm").attr("src", '/sfa/opportunity/opportunity_mc_form.php?op_code=' + code);
	$("#mc_md").modal('show');
    });
    $("#contract-product-add-btn").on('click', function() {
	var code = $("input[name=ct_code]").val();
	$("#product_ifrm").attr("src", '/sfa/contract/contract_product_form.php?ct_code=' + code);
	$("#product_md").modal('show');
    });
    $("#contract-service-add-btn").on('click', function() {
	var code = $("input[name=ct_code]").val();
	$("#service_ifrm").attr("src", '/sfa/contract/contract_service_form.php?ct_code=' + code);
	$("#service_md").modal('show');
    });
    $("#contract-mc-add-btn").on('click', function() {
	var code = $("input[name=ct_code]").val();
	window.open('/sfa/contract/contract_mc_form.php?parent_code=' + code, 'MAINTENANCE', "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=1100, height=640");
    });
    $("#op-customer-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	$("#customer_ifrm").attr("src", '/sfa/opportunity/opportunity_cust_form.php?op_code=' + code);
	$("#customer_md").modal('show');
    });
    $("#op-cooper-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	$("#cooper_ifrm").attr("src", '/sfa/opportunity/opportunity_cooper_form.php?op_code=' + code);
	$("#cooper_md").modal('show');
    });
    $("#op-rival-add-btn").on('click', function() {
	var code = $("input[name=op_code]").val();
	$("#rival_ifrm").attr("src", '/sfa/opportunity/opportunity_rival_form.php?op_code=' + code);
	$("#rival_md").modal('show');
    });
    $("#present-add-btn").on('click', function() {
	var code = $("input[name=ac_code]").val();
	$("#present_ifrm").attr("src", '/sfa/activity/activity_present_form.php?ac_code=' + code);
	$("#present_md").modal('show');
    });
    $("#sc-present-add-btn").on('click', function() {
	var code = $("input[name=sc_code]").val();
	$("#sc_present_ifrm").attr("src", '/sfa/schedule/schedule_present_form.php?sc_code=' + code);
	$("#sc_present_md").modal('show');
    });
    $("#cust-job-add-btn").on('click', function() {
	var code = $("input[name=cu_code]").val();
	$("#job_ifrm").attr("src", '/sfa/customer/customer_job_form.php?cu_code=' + code);
	$("#job_md").modal('show');
    });
    $("#member-add-btn").on('click', function() {
	var code = $("input[name=ref_code]").val();
	$("#member_ifrm").attr("src", '/sfa/auth/auth_group_member.php?xg_code=' + code);
	$("#member_md").modal('show');
    });
    $("#member-del-btn").on('click', function() {
	var obj = $('#member_list');
	if ($(obj).find('td input:checkbox:checked').length == 0) {
	    swal({
		title:JS_TEXT['no_select'],
		type:'warning'
	    });
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
		if ($('form').eq(i).attr('name') == 'frm') {
		    var form_name = $('form').eq(i).attr('name');
		    break;
		}
	    }
	    var data = $(document.forms[form_name]).serialize();
	    _ajax('/sfa/auth/auth_group_member_del.php', data, member_del_result);
	});
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
    if ($("#contact_list").length > 0) {
	show_contact_list();
    }
    if ($("#pc_contact_list").length > 0) {
	show_pc_contact_list();
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
    if ($("#opportunity_coop_list").length > 0) {
	show_opportunity_coop_list();
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
    if ($("#request_detail_list").length > 0) {
	show_request_detail_list();
    }
    if ($("#quote_detail_list").length > 0) {
	show_quote_detail_list();
    }
    if ($("#contract_list").length > 0) {
	show_contract_list();
    }
    if ($("#partner_contract_list").length > 0) {
	show_partner_contract_list();
    }
    if ($("#op_items_list").length > 0) {
	show_op_items_list();
    }
    if ($("#op_product_list").length > 0) {
	show_op_product_list();
    }
    if ($("#ct_op_product_list").length > 0) {
	show_ct_op_product_list();
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
    if ($("#relative_mc_list").length > 0) {
	show_relative_mc_list();
    }
    if ($("#relative_ct_list").length > 0) {
	show_relative_ct_list();
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
    _ajax('/sfa/template/xhr/detail_note.xhr.php', param, note_data_output, undefined, true);
}
function show_attach_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#attach_list").children().remove();
    _ajax('/sfa/template/xhr/detail_attach.xhr.php', param, attach_data_output, undefined, true);
}
function show_schedule_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#schedule_list").children().remove();
    _ajax('/sfa/template/xhr/detail_schedule.xhr.php', param, schedule_data_output, undefined, true);
}
function show_customer_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#customer_list").children().remove();
    _ajax('/sfa/template/xhr/detail_customer.xhr.php', param, customer_data_output, undefined, true);
}
function show_contact_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#contact_list").children().remove();
    _ajax('/sfa/template/xhr/detail_contact.xhr.php', param, contact_data_output, undefined, true);
}
function show_pc_contact_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#pc_contact_list").children().remove();
    _ajax('/sfa/template/xhr/detail_partner_contact.xhr.php', param, pc_contact_data_output, undefined, true);
}
function show_campaign_info_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#campaign_list").children().remove();
    _ajax('/sfa/template/xhr/detail_campaign_info.xhr.php', param, campaign_info_data_output, undefined, true);
}
function show_campaign_mail_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#campaign_mail_list").children().remove();
    _ajax('/sfa/template/xhr/detail_campaign_mail_list.xhr.php', param, campaign_mail_list_data_output, undefined, true);
}
function show_campaign_mail_info_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#campaign_mail_info_list").children().remove();
    _ajax('/sfa/template/xhr/detail_campaign_mail_info.xhr.php', param, campaign_mail_info_data_output, undefined, true);
}
function show_opportunity_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#opportunity_list").children().remove();
    _ajax('/sfa/template/xhr/detail_opportunity.xhr.php', param, opportunity_data_output, undefined, true);
}
function show_opportunity_coop_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#opportunity_coop_list").children().remove();
    _ajax('/sfa/template/xhr/detail_opportunity_coop.xhr.php', param, opportunity_coop_data_output, undefined, true);
}
function show_opportunity_cust_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#opportunity_cust_list").children().remove();
    _ajax('/sfa/template/xhr/detail_opportunity_cust.xhr.php', param, opportunity_cust_data_output, undefined, true);
}
function show_activity_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#activity_list").children().remove();
    _ajax('/sfa/template/xhr/detail_activity.xhr.php', param, activity_data_output, undefined, true);
}
function show_support_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#support_list").children().remove();
    _ajax('/sfa/template/xhr/detail_support.xhr.php', param, support_data_output, undefined, true);
}
function show_support_history_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#support_history_list").children().remove();
    _ajax('/sfa/template/xhr/detail_support_history.xhr.php', param, support_history_data_output, undefined, true);
}
function show_order_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#order_list").children().remove();
    _ajax('/sfa/template/xhr/detail_order.xhr.php', param, order_data_output, undefined, true);
}
function show_stockin_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#stockin_list").children().remove();
    _ajax('/sfa/template/xhr/detail_stockin.xhr.php', param, stockin_data_output, undefined, true);
}
function show_stockout_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#stockout_list").children().remove();
    _ajax('/sfa/template/xhr/detail_stockout.xhr.php', param, stockout_data_output, undefined, true);
}
function show_request_detail_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#request_detail_list").children().remove();
    _ajax('/sfa/template/xhr/detail_request.xhr.php', param, request_detail_data_output, undefined, true);
}
function show_quote_detail_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val();
    $("#quote_detail_list").children().remove();
    _ajax('/sfa/template/xhr/detail_quote.xhr.php', param, quote_detail_data_output, undefined, true);
}
function show_contract_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val() + "&sch_word=" + $('input[name=detail_ct_union_search]').val();
    $("#contract_list").children().remove();
    _ajax('/sfa/template/xhr/detail_contract.xhr.php', param, contract_data_output, undefined, true);
}
function show_partner_contract_list() {
    var param = "ref_code=" + $("input[name=ref_code]").val() + "&sch_word=" + $('input[name=detail_ct_union_search]').val();
    $("#partner_contract_list").children().remove();
    _ajax('/sfa/template/xhr/detail_partner_contract.xhr.php', param, partner_contract_data_output, undefined, true);
}
function show_op_items_list() {
    var param = "op_code=" + $("input[name=op_code]").val();
    $("#op_items_list").children().remove();
    _ajax('/sfa/template/xhr/detail_op_items.xhr.php', param, op_items_data_output, undefined, true);
}
function show_op_product_list() {
    var param = "op_code=" + $("input[name=op_code]").val();
    $("#op_product_list").children().remove();
    _ajax('/sfa/template/xhr/detail_op_product.xhr.php', param, op_product_data_output, undefined, true);
}
function show_ct_op_product_list() {
    var param = "op_code=" + $("input[name=op_code]").val();
    param += '&ct_code=' + $('input[name=ct_code]').val();
    $("#op_product_list").children().remove();
    _ajax('/sfa/template/xhr/detail_ct_op_product.xhr.php', param, ct_op_product_data_output, undefined, true);
}
function show_op_service_list() {
    var param = "op_code=" + $("input[name=op_code]").val();
    $("#op_service_list").children().remove();
    _ajax('/sfa/template/xhr/detail_op_service.xhr.php', param, op_service_data_output, undefined, true);
}
function show_op_mc_list() {
    var param = "op_code=" + $("input[name=op_code]").val();
    $("#op_mc_list").children().remove();
    _ajax('/sfa/template/xhr/detail_op_mc.xhr.php', param, op_mc_data_output, undefined, true);
}
function show_contract_product_list() {
    var param = "ct_code=" + $("input[name=ct_code]").val();
    $("#contract_product_list").children().remove();
    _ajax('/sfa/template/xhr/detail_contract_product.xhr.php', param, contract_product_data_output, undefined, true);
}
function show_contract_service_list() {
    var param = "ct_code=" + $("input[name=ct_code]").val();
    $("#contract_service_list").children().remove();
    _ajax('/sfa/template/xhr/detail_contract_service.xhr.php', param, contract_service_data_output, undefined, true);
}
function show_contract_mc_list() {
    var param = "ct_code=" + $("input[name=ct_code]").val();
    $("#contract_mc_list").children().remove();
    _ajax('/sfa/template/xhr/detail_contract_maintenance.xhr.php', param, contract_mc_data_output, undefined, true);
}
function show_relative_mc_list() {
    var param = "ct_code=" + $("input[name=ct_code]").val();
    $("#relative_mc_list").children().remove();
    _ajax('/sfa/template/xhr/detail_relative_maintenance.xhr.php', param, relative_mc_data_output, undefined, true);
}
function show_relative_ct_list() {
    var param = "ct_code=" + $("input[name=ct_code]").val();
    $("#relative_ct_list").children().remove();
    _ajax_html('/sfa/template/xhr/detail_relative_contract_v2.xhr.php', param, relative_ct_data_output, undefined, true);
}
function show_op_history_list() {
    var param = "op_code=" + $("input[name=op_code]").val();
    $("#op_history_list").children().remove();
    _ajax('/sfa/template/xhr/detail_op_history.xhr.php', param, op_history_data_output, undefined, true);
}
function show_present_list() {
    var param = "ac_code=" + $("input[name=ac_code]").val();
    $("#present_list").children().remove();
    _ajax('/sfa/template/xhr/detail_present.xhr.php', param, present_data_output, undefined, true);
}
function show_sc_present_list() {
    var param = "sc_code=" + $("input[name=sc_code]").val();
    $("#sc_present_list").children().remove();
    _ajax('/sfa/template/xhr/detail_schedule_present.xhr.php', param, sc_present_data_output, undefined, true);
}
function show_cust_job_list() {
    var param = "cu_code=" + $("input[name=cu_code]").val();
    $("#cust_job_list").children().remove();
    _ajax('/sfa/template/xhr/detail_customer_job.xhr.php', param, cust_job_data_output, undefined, true);
}
function show_member_list() {
    var param = "xg_code=" + $("input[name=ref_code]").val();
    $("#member_list").children().remove();
    _ajax('/sfa/template/xhr/detail_auth_group_member.xhr.php', param, member_data_output, undefined, true);
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
    }
    $('#note_list').append(code);
    if (cnt > 0) $('#nt_label').text(cnt);
    code = '';
}
function attach_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="5" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code') {
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
    $('#attach_list').append(code);
    code = '';

    if (cnt > 0) $('#at_label').text(cnt);
    /*
    if (cnt > 5) {
	$('#attach_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/attach/attach.php?ref_code=' + ref_code + '\';">more</button></div>');
    }
    */
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
    $('#schedule_list').append(code);
    code = '';
    if (cnt > 0) $('#sc_label').text(cnt);
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
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="6" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
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
    if (cnt > 0) $('#cu_label').text(cnt);
    code = '';
    /*
    if (cnt > 5) {
	$('#customer_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/customer/customer.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function contact_data_output(data) {
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
	code += '<tr><td colspan="7" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
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
    $('#contact_list').append(code);
    if (cnt > 0) $('#contact_label').text(cnt);
    code = '';
    /*
    if (cnt > 5) {
	$('#customer_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/customer/customer.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function pc_contact_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="7" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt') {
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
    $('#pc_contact_list').append(code);
    if (cnt > 0) $('#pc_contact_label').text(cnt);
    code = '';
}
function campaign_info_data_output(data) {
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
	code += '<tr><td colspan="3" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
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
    if (cnt > 0) $('#ca_label').text(cnt);
    code = '';
}
function campaign_mail_list_data_output(data) {
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
    $('#campaign_mail_list').append(code);
    if (cnt > 0) $('#em_label').text(cnt);
    code = '';
}
function campaign_mail_info_data_output(data) {
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
    $('#campaign_mail_info_list').append(code);
    code = '';
}
function opportunity_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var end_cnt = data.end_cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';

    if (end_cnt == '0') {
	code += '<tr><td colspan="7" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'end_cnt' || k == 'ref_code' || k == 'init_code') {
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

    var cnt	= parseInt(end_cnt, 10);
    if (cnt > 0) $('#op_label').text(cnt);
    /*
    if (cnt > 5) {
	$('#opportunity_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/opportunity/opportunity.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function opportunity_coop_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var coop_cnt = data.coop_cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';

    if (coop_cnt == '0') {
	code += '<tr><td colspan="7" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'coop_cnt' || k == 'ref_code' || k == 'init_code') {
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
    $('#opportunity_coop_list').append(code);

    var cnt	= parseInt(coop_cnt, 10);
    if (cnt > 0) $('#op_label').text(cnt);
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
    if (cnt > 0) $('#op_cust_label').text(cnt);
    code = '';
}
function activity_data_output(data) {
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
    $('#activity_list').append(code);
    code = '';
    if (cnt > 0) $('#ac_label').text(cnt);
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
    if (cnt > 0) $('#ep_label').text(cnt);
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
    $('#support_history_list').append(code);
    code = '';
    if (cnt > 0) $('#ei_label').text(cnt);
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
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="6" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
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
    if (cnt > 0) $('#or_label').text(cnt);
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
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="7" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
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
    if (cnt > 0) $('#si_label').text(cnt);
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
    var cnt = data.cnt;
    var ref_code = data.ref_code;
    var init_code = data.init_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="8" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
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
    if (cnt > 0) $('#so_label').text(cnt);
    code = '';
    /*
    if (cnt > 5) {
	$('#stockout_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/stock/stockout.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function request_detail_data_output(data) {
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
	code += '<tr><td colspan="10" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code' || k == 'init_code') {
		    return true;
		}
		$.each(dt, function(k2, v) {
		    if (k2 == 'html') {
			$('#request_detail_list').append(v);
		    }
		});
	});
    }
    if (cnt > 0) {
	$('#sr_label').text(cnt);
	//$('#request-add-btn').parent().remove();
    }
    code = '';
    /*
    if (cnt > 5) {
	$('#stockout_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/stock/stockout.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function quote_detail_data_output(data) {
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
		$.each(dt, function(k2, v) {
		    if (k2 == 'html') {
			$('#quote_detail_list').append(v);
		    }
		});
	});
    }
    if (cnt > 0) {
	$('#qu_label').text(cnt);
    }
    code = '';
}
function contract_data_output(data) {
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
	code += '<tr><td colspan="6" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
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
    if (cnt > 0) $('#ct_label').text(cnt);
    /*
    if (cnt > 5) {
	$('#contract_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/contract/contract.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function partner_contract_data_output(data) {
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
	code += '<tr><td colspan="6" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
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
    $('#partner_contract_list').append(code);
    code = '';
    if (cnt > 0) $('#ct_label').text(cnt);
    /*
    if (cnt > 5) {
	$('#contract_more').append('<div class="text-right"><button class="btn btn-sm btn-primary" type="button" onclick="javascript:location.href=\'/sfa/contract/contract.php?' + init_code + '_code=' + ref_code + '\';">more</button></div>');
    }
    */
}
function op_items_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var op_code = data.op_code;
    var code	= data.code;
    $('#op_items_list').append(code);
    if (cnt > 0) $('#op_items_label').text(cnt);
    code = '';
}
function op_product_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var op_code = data.op_code;
    var code	= data.code;
    $('#op_product_list').append(code);
    if (cnt > 0) $('#op_product_label').text(cnt);
    code = '';
}
function ct_op_product_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var code	= data.code;
    $('#ct_op_product_list').append(code);
    code = '';
}
function op_service_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var op_code = data.op_code;
    var code	= data.code;
    $('#op_service_list').append(code);
    if (cnt > 0) $('#op_service_label').text(cnt);
    code = '';
}
function op_mc_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var op_code = data.op_code;
    var code	= data.code;
    $('#op_mc_list').append(code);
    if (cnt > 0) $('#op_mc_label').text(cnt);
    code = '';
}
function contract_product_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var ct_code = data.ct_code;
    var code	= data.code;
    var total_amount	= data.total_amount;
    if (cnt > 0) $('#ct_product_label').text(cnt);
    $('#contract_product_list').append(code);
    $('#total_amount').text(total_amount);
    code = '';
}
function contract_service_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var ct_code = data.ct_code;
    var code	= data.code;
    var total_amount	= data.total_amount;
    if (cnt > 0) $('#ct_service_label').text(cnt);
    $('#contract_service_list').append(code);
    $('#total_amount').text(total_amount);
    code = '';
}
function contract_mc_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var ct_code = data.ct_code;
    var code	= data.code;
    var total_amount	= data.total_amount;
    if (cnt > 0) $('#ct_mc_label').text(cnt);
    $('#contract_mc_list').append(code);
    $('#total_amount').text(total_amount);
    code = '';
}
function relative_mc_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var ct_code = data.ct_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="6" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ct_code') {
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
    $('#relative_mc_list').append(code);
    //if (cnt > 0) $('#re_mc_label').text(cnt);
    code = '';
}
function relative_ct_data_output(data) {
    _loading(0);
    /*
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var ct_code = data.ct_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="6" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ct_code') {
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
    $('#relative_ct_list').append(code);
    //if (cnt > 0) $('#re_mc_label').text(cnt);
    code = '';
    */
    $('#relative_ct_list').html(data);
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
    if (cnt > 0 ) $('#op_history_label').text(cnt);
    code = '';
}
function present_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var ep_code = data.ep_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="3" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ep_code') {
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
    if (cnt > 0) $('#present_label').text(cnt);
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
	code += '<tr><td colspan="3" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt') {
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
    $('#sc_present_list').append(code);
    if (cnt > 0) $('#sc_present_label').text(cnt);
    code = '';
}
function cust_job_data_output(data) {
    _loading(0);
    if (data.success != undefined) {
	ajax_resp(data);
	return;
    }
    var cnt = data.cnt;
    var cu_code = data.cu_code;
    var code = '';
    if (cnt == '0') {
	code += '<tr><td colspan="5" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'cu_code') {
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
    $('#cust_job_list').append(code);
    if (cnt > 0) $('#cust_job_label').text(cnt);
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
	code += '<tr><td colspan="5" align="center">' + JS_TEXT['no_data'] + '</td></tr>';
    } else {
	$.each(data, function(k, dt) {
		if (k == 'cnt' || k == 'ref_code') {
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
    if (cnt > 0) $('#member_label').text(cnt);
    $('#member_list').append(code);
    code = '';
		
    $('#member_list').prev().find('th input:checkbox').removeAttr('checked');
    $('#member_list').prev().find('th input:checkbox').unbind('change');
    $('#member_list').prev().find('th input:checkbox').change(function() {
	if ($(this).is(':checked')) {
	    $('#member_list').find('td input:checkbox').not(":checked").click();
	} else {
	    $('#member_list').find('td input:checkbox:checked').click();
	}
    });
    $('#member_list').find('td input:checkbox').change(function() {
	if ($(this).is(':checked') == false) {
	    if ($('#member_list').prev().find('th input:checkbox').is(':checked')) {
		$('#member_list').prev().find('th input:checkbox').attr('checked', false);
	    }
	}
    });
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
