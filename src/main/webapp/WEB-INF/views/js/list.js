$(document).ready(function () {
    // Condition
    $('.sch-supporter').on('click', function() {
	window.open("/sfa/pop/popup_user.php?name_field=supporter_name&id_field=supporter", "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-supporter').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_user.php?name_field=supporter_name&id_field=supporter", "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-company').on('click', function() {
	window.open("/sfa/pop/popup_company.php?name_field=co_name&code_field=co_code", "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-company').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_company.php?name_field=co_name&code_field=co_code", "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-company2').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	window.open("/sfa/pop/popup_company.php?name_field=" + name_field + "&code_field=" + code_field, "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-company2').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-company2').attr('name-field');
	var code_field	= $(this).parent().find('.sch-company2').attr('code-field');
	window.open("/sfa/pop/popup_company.php?name_field=" + name_field + "&code_field=" + code_field, "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-maintenance').on('click', function() {
	//window.open("/sfa/pop/popup_company.php?name_field=mc_name&code_field=mc_code", "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
	window.open("/sfa/pop/popup_partner.php?name_field=mc_name&code_field=mc_code", "PARTNER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-maintenance').parent().parent().find('input[type=text]').on('click', function() {
	//window.open("/sfa/pop/popup_company.php?name_field=mc_name&code_field=mc_code", "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
	window.open("/sfa/pop/popup_partner.php?name_field=mc_name&code_field=mc_code", "PARTNER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-maintenance2').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	window.open("/sfa/pop/popup_partner.php?name_field=" + name_field + "&code_field=" + code_field, "PARTNER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-maintenance2').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-maintenance2').attr('name-field');
	var code_field	= $(this).parent().find('.sch-maintenance2').attr('code-field');
	window.open("/sfa/pop/popup_partner.php?name_field=" + name_field + "&code_field=" + code_field, "PARTNER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-supplier').on('click', function() {
	//window.open("/sfa/pop/popup_company.php?name_field=sc_name&code_field=sc_code", "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
	window.open("/sfa/pop/popup_partner.php?name_field=sc_name&code_field=sc_code", "PARTNER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-supplier').parent().parent().find('input[type=text]').on('click', function() {
	//window.open("/sfa/pop/popup_company.php?name_field=sc_name&code_field=sc_code", "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
	window.open("/sfa/pop/popup_partner.php?name_field=sc_name&code_field=sc_code", "PARTNER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-supplier2').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	window.open("/sfa/pop/popup_partner.php?name_field=" + name_field + "&code_field=" + code_field, "PARTNER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-supplier2').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-supplier2').attr('name-field');
	var code_field	= $(this).parent().find('.sch-supplier2').attr('code-field');
	//window.open("/sfa/pop/popup_company.php?name_field=" + name_field + "&code_field=" + code_field, "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
	window.open("/sfa/pop/popup_partner.php?name_field=" + name_field + "&code_field=" + code_field, "PARTNER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-partner-account').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	window.open("/sfa/pop/popup_partner_account.php?name_field=" + name_field + "&code_field=" + code_field, "PARTNER_ACCOUNT", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-partner-account').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-partner-account').attr('name-field');
	var code_field	= $(this).parent().find('.sch-partner-account').attr('code-field');
	window.open("/sfa/pop/popup_partner_account.php?name_field=" + name_field + "&code_field=" + code_field, "PARTNER_ACCOUNT", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-bill-company').on('click', function() {
	window.open("/sfa/pop/popup_bill_company.php?name_field=bill_co_name&code_field=bill_co_code&contact_field=bill_contact", "BILL_COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-bill-company').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_bill_company.php?name_field=bill_co_name&code_field=bill_co_code&contact_field=bill_contact", "BILL_COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-bill-company2').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	var contact_field	= $(this).attr('contact-field');
	window.open("/sfa/pop/popup_bill_company.php?name_field=" + name_field + "&code_field=" + code_field + "&contact_field=" + contact_field, "BILL_COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-bill-company2').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-bill-company2').attr('name-field');
	var code_field	= $(this).parent().find('.sch-bill-company2').attr('code-field');
	var contact_field	= $(this).parent().find('.sch-bill-company2').attr('contact-field');
	window.open("/sfa/pop/popup_bill_company.php?name_field=" + name_field + "&code_field=" + code_field + "&contact_field=" + contact_field, "BILL_COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-end-company').on('click', function() {
	window.open("/sfa/pop/popup_company.php?name_field=end_co_name&code_field=end_co_code", "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-end-company').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_company.php?name_field=end_co_name&code_field=end_co_code", "COMPANY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-coop-company').on('click', function() {
	window.open("/sfa/pop/popup_partner.php?name_field=coop_co_name&code_field=coop_co_code", "PARTNER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-coop-company').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_partner.php?name_field=coop_co_name&code_field=coop_co_code", "PARTNER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-customer').on('click', function() {
	window.open("/sfa/pop/popup_customer.php?name_field=cu_name&code_field=cu_code", "CUSTOMER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-customer').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_customer.php?name_field=cu_name&code_field=cu_code", "CUSTOMER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-customer2').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	var coname_field	= $(this).attr('coname-field');
	var cocode_field	= $(this).attr('cocode-field');
	window.open("/sfa/pop/popup_customer.php?name_field=" + name_field + "&code_field=" + code_field + "&co_name_field=" + coname_field + "&co_code_field=" + cocode_field, "CUSTOMER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-customer2').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-customer2').attr('name-field');
	var code_field	= $(this).parent().find('.sch-customer2').attr('code-field');
	var coname_field	= $(this).parent().find('.sch-customer2').attr('coname-field');
	var cocode_field	= $(this).parent().find('.sch-customer2').attr('cocode-field');
	window.open("/sfa/pop/popup_customer.php?name_field=" + name_field + "&code_field=" + code_field + "&co_name_field=" + coname_field + "&co_code_field=" + cocode_field, "CUSTOMER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-contact').on('click', function() {
	var name_field	= $(this).parent().find('.sch-contact').attr('name-field');
	var code_field	= $(this).parent().find('.sch-contact').attr('code-field');
	window.open("/sfa/pop/popup_contact.php?name_field=" + name_field + "&code_field=" + code_field, "CONTACT", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-contact').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-contact').attr('name-field');
	var code_field	= $(this).parent().find('.sch-contact').attr('code-field');
	window.open("/sfa/pop/popup_contact.php?name_field=" + name_field + "&code_field=" + code_field, "CONTACT", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-contract').on('click', function() {
	window.open("/sfa/pop/popup_contract.php?name_field=ct_name&code_field=ct_code&co_name_field=end_co_name&co_code_field=end_co_code", "CONTRACT", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-contract').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_contract.php?name_field=ct_name&code_field=ct_code&co_name_field=end_co_name&co_code_field=end_co_code", "CONTRACT", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-end-customer').on('click', function() {
	window.open("/sfa/pop/popup_customer.php?name_field=end_cu_name&code_field=end_cu_code", "CUSTOMER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-end-customer').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_customer.php?name_field=end_cu_name&code_field=end_cu_code", "CUSTOMER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-coop-customer').on('click', function() {
	window.open("/sfa/pop/popup_customer.php?name_field=coop_cu_name&code_field=coop_cu_code", "CUSTOMER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-coop-customer').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_customer.php?name_field=coop_cu_name&code_field=coop_cu_code", "CUSTOMER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-bill-customer').on('click', function() {
	window.open("/sfa/pop/popup_customer.php?name_field=b_cu_name&code_field=b_cu_code", "CUSTOMER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-bill-customer').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_customer.php?name_field=b_cu_name&code_field=b_cu_code", "CUSTOMER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-support').on('click', function() {
	window.open("/sfa/pop/popup_support.php?name_field=ep_name&code_field=ep_code", "SUPPORT", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-support').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_support.php?name_field=ep_name&code_field=ep_code", "SUPPORT", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-order').on('click', function() {
	window.open("/sfa/pop/popup_order.php", "ORDER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-order').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_order.php", "ORDER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-assign').on('click', function() {
	window.open("/sfa/pop/popup_user.php?name_field=assign_name&id_field=assign_id", "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-assign').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_user.php?name_field=assign_name&id_field=assign_id", "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-assign2').on('click', function() {
	window.open("/sfa/pop/popup_user.php?name_field=assign_name2&id_field=assign_id2", "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-assign2').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_user.php?name_field=assign_name2&id_field=assign_id2", "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-assign3').on('click', function() {
	var index	= $('.sch-assign3').index(this);
	var name_field	= $(this).attr('name-field');
	var id_field	= $(this).attr('id-field');
	window.open("/sfa/pop/popup_user.php?name_field=" + name_field + "&id_field=" + id_field + "&index=" + index, "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-assign3').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-assign3').attr('name-field');
	var id_field	= $(this).parent().find('.sch-assign3').attr('id-field');
	var index	= $('.sch-assign3').index($(this).parent().find('.sch-assign3'));
	window.open("/sfa/pop/popup_user.php?name_field=" + name_field + "&id_field=" + id_field + "&index=" + index, "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-reg-id').on('click', function() {
	window.open("/sfa/pop/popup_user.php?name_field=reg_name&id_field=reg_id", "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-reg-id').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_user.php?name_field=reg_name&id_field=reg_id", "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-present').on('click', function() {
	window.open("/sfa/pop/popup_user.php?name_field=present_name&id_field=present_id", "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-present').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_user.php?name_field=present_name&id_field=present_id", "USER", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-opportunity').on('click', function() {
	window.open("/sfa/pop/popup_opportunity.php?name_field=op_name&code_field=op_code&cocode_field=co_code&coname_field=co_name", "OPPORTUNITY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-opportunity').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_opportunity.php?name_field=op_name&code_field=op_code&cocode_field=co_code&coname_field=co_name", "OPPORTUNITY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-campaign').on('click', function() {
	window.open("/sfa/pop/popup_campaign.php?name_field=ca_name&code_field=ca_code", "CAMPAIGN", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-campaign').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_campaign.php?name_field=ca_name&code_field=ca_code", "CAMPAIGN", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-opportunity2').on('click', function() {
	window.open("/sfa/pop/popup_opportunity.php?name_field=op_name&code_field=op_code&coname_field=co_name&cocode_field=co_code", "OPPORTUNITY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-opportunity2').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_opportunity.php?name_field=op_name&code_field=op_code&coname_field=co_name&cocode_field=co_code", "OPPORTUNITY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-opportunity3').on('click', function() {
	var name_field	= $(this).attr('name-field');
	var code_field	= $(this).attr('code-field');
	var coname_field	= $(this).attr('coname-field');
	var cocode_field	= $(this).attr('cocode-field');
	var url	= "/sfa/pop/popup_opportunity.php?name_field=" + name_field + "&code_field=" + code_field;
	if (coname_field != '') {
	    url	+= "&coname_field=" + coname_field + "&cocode_field=" + cocode_field;
	}
	window.open(url, "OPPORTUNITY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-opportunity3').parent().parent().find('input[type=text]').on('click', function() {
	var name_field	= $(this).parent().find('.sch-opportunity3').attr('name-field');
	var code_field	= $(this).parent().find('.sch-opportunity3').attr('code-field');
	var coname_field	= $(this).parent().find('.sch-opportunity3').attr('coname-field');
	var cocode_field	= $(this).parent().find('.sch-opportunity3').attr('cocode-field');
	var url	= "/sfa/pop/popup_opportunity.php?name_field=" + name_field + "&code_field=" + code_field;
	if (coname_field != '') {
	    url	+= "&coname_field=" + coname_field + "&cocode_field=" + cocode_field;
	}
	window.open(url, "OPPORTUNITY", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=800, height=600");
    });
    $('.sch-request').on('click', function() {
	window.open("/sfa/pop/popup_request.php", "REQUEST", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=900, height=600");
    });
    $('.sch-request').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_request.php", "REQUEST", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=900, height=600");
    });
    $('.sch-request2').on('click', function() {
	window.open("/sfa/pop/popup_request2.php", "REQUEST", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=900, height=600");
    });
    $('.sch-request2').parent().parent().find('input[type=text]').on('click', function() {
	window.open("/sfa/pop/popup_request2.php", "REQUEST", "scrollbars=yes, toolbars=no, resizable=yes, status=no, menubars=no, width=900, height=600");
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

    $('#stock-trans-btn').on('click', function() {
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
		code += '<tr class="so-product-form-list">';
		code += '<input type="hidden" name="so_stock_seq[]" value="' + stock_seq + '" />';
		code += '<td>';
		code += '<select name="so_stockout_type[]" class="form-control">';
		code += separ_option;
		code += '</select>';
		code += '</td>'; // col
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
	    }
	});
	if (code != '') {
	    $('#so_list').append(code);
	}

    });

    if (typeof group_data !== 'undefined') {
	$('#group_list').treeview({data: group_data});
	$('#group-close-btn').on('click', function() {
	    $('#group_list_div').hide();
	});
    }

    if ($("#stock_pr_list").length > 0) {
	var query = $('#product_condition :input').serialize();
	$('#stock_pr_list').show_list('/sfa/template/xhr/stock_list.xhr.php', query);
    }
    $("#stock-pr-sch-btn").on('click', function() {
	var query = $('#product_condition :input').serialize();
	$('#stock_pr_list').show_list('/sfa/template/xhr/stock_list.xhr.php', query);
    });
});
function toggleSelectAll(control) {
    var allOptionIsSelected = (control.val() || []).indexOf("all") > -1;
    function valuesOf(elements) {
	return $.map(elements, function(element) {
		return element.value;
		});
    }

    if (control.data('allOptionIsSelected') != allOptionIsSelected) {
	// User clicked 'All' option
	if (allOptionIsSelected) {
	    // Can't use .selectpicker('selectAll') because multiple "change" events will be triggered
	    control.selectpicker('val', valuesOf(control.find('option')));
	} else {
	    control.selectpicker('val', []);
	}
    } else {
	// User clicked other option
	if (allOptionIsSelected && control.val().length != control.find('option').length) {
	    // All options were selected, user deselected one option
	    // => unselect 'All' option
	    control.selectpicker('val', valuesOf(control.find('option:selected[value!=All]')));
	    allOptionIsSelected = false;
	} else if (!allOptionIsSelected && control.val().length == control.find('option').length - 1) {
	    // Not all options were selected, user selected all options except 'all' option
	    // => select 'All' option too
	    control.selectpicker('val', valuesOf(control.find('option')));
	    allOptionIsSelected = true;
	}
    }
    control.data('allOptionIsSelected', allOptionIsSelected);
}

$('select[name^=nation]').change(function(){ toggleSelectAll($(this)); });

$(document).on('click', '.product-row-del-btn', function() {
	if ($('.product-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    if ($('.product-row-add-btn').length == 0) {
		$('.product-buttons').first().append('<button class="btn btn-success product-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	}
});
$(document).on('click', '.product-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/op_product_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.product-form').append(data);
	    $('.selectpicker').selectpicker('refresh');
	}
    });
});
$(document).on('click', '.po-product-row-del-btn', function() {
	if ($('.po-product-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    if ($('.po-product-row-add-btn').length == 0) {
		$('.po-product-buttons').first().append('<button class="btn btn-success po-product-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	}
});
$(document).on('click', '.svc-product-row-del-btn', function() {
	if ($('.svc-product-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    if ($('.svc-product-row-add-btn').length == 0) {
		$('.svc-product-buttons').first().append('<button class="btn btn-success svc-product-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	}
});
$(document).on('click', '.ma-product-row-del-btn', function() {
	if ($('.ma-product-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    if ($('.ma-product-row-add-btn').length == 0) {
		$('.ma-product-buttons').first().append('<button class="btn btn-success ma-product-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	}
});
$(document).on('click', '.c-product-row-del-btn', function() {
	if ($('.product-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    if ($('.c-product-row-add-btn').length == 0) {
		$('.product-buttons').first().append('<button class="btn btn-success c-product-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	    var total = 0;
	    $('input[name^=price]').each(function() {
		total += parseInt($(this).val().replace(/\,/g, '').replace(/\./g, ''), 10);
	    });
	    $('#sales_amount').val(total);
	    $('#ct_price').val(total);
	}
});
$(document).on('click', '.s-product-row-del-btn', function() {
    if ($(this).parent().parent().parent().find('.sales-product-form-list').length > 1) {
	var obj	= $(this).parent().parent().parent();
	$(this).parent().parent().remove();
	if (obj.find('.s-product-row-add-btn').length == 0) {
	    obj.find('.product-buttons').first().append('<button class="btn btn-success btn-sm s-product-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	}
	product_row_count(obj);
    }
});
$(document).on('click', '.po-product-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/po_product_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.po-product-form').append(data);
	    $('.selectpicker').selectpicker('refresh');
	    //$('input[name^=po_pr_code]').selectpicker('refresh');
	}
    });
});
$(document).on('click', '.svc-product-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/svc_product_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.svc-product-form').append(data);
	    $('.selectpicker').selectpicker('refresh');
	    //$('input[name^=po_pr_code]').selectpicker('refresh');
	}
    });
});
$(document).on('click', '.ma-product-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/ma_product_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.ma-product-form').append(data);
	    $('.selectpicker').selectpicker('refresh');
	    //$('input[name^=po_pr_code]').selectpicker('refresh');
	}
    });
});
$(document).on('click', '.c-product-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/contract_product_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.product-form').append(data);
	    $('.selectpicker').selectpicker('refresh');
	}
    });
});
$(document).on('click', '.s-product-row-add-btn', function() {
    var obj	= $(this);
    $.ajax({
	url:'/sfa/template/form/contract_sales_product_row.tmpl.php?ct_code=' + $('#ct_code').val(),
	type:'GET',
	success: function(data){
	    obj.parent().parent().parent().append(data);
	    $('.selectpicker').selectpicker('refresh');
	    product_row_count(obj.parent().parent().parent());
	}
    });
});
$(document).on('click', '.s-product-part-row-add-btn', function() {
    var obj	= $(this);
    $.ajax({
	url:'/sfa/template/form/contract_sales_product_part_row.tmpl.php?ct_code=' + $('#ct_code').val(),
	type:'GET',
	success: function(data){
	    obj.parent().parent().parent().append(data);
	    $('.selectpicker').selectpicker('refresh');
	    product_row_count(obj.parent().parent().parent());
	}
    });
});
function product_row_count(obj) {
    obj.parent().prev().val(obj.find('.sales-product-form-list').length);
    var total = 0;
    obj.find('input[name^=ss_price]').each(function() {
	if ($(this).val() != '') {
	    total += parseInt($(this).val().replace(/\,/g, '').replace(/\./g, ''), 10);
	}
    });
    obj.parent().parent().parent().prev().find('input[name^=sales_price]').val(total);
    sales_total_calc();
    change_currency();
}
$(document).on('click', '.service-row-del-btn', function() {
	if ($('.service-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    /*
	    if ($('.service-row-add-btn').length == 0) {
		$('.service-buttons').first().append('<button class="btn btn-success service-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	    */
	}
});
$(document).on('click', '.service-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/op_service_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.service-form').append(data);
	    $('.selectpicker').selectpicker('refresh');
	}
    });
});
$(document).on('click', '.mc-row-del-btn', function() {
	if ($('.mc-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    /*
	    if ($('.mc-row-add-btn').length == 0) {
		$('.mc-buttons').first().append('<button class="btn btn-success mc-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	    */
	}
});
$(document).on('click', '.mc-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/op_mc_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.mc-form').append(data);
	    $('.selectpicker').selectpicker('refresh');
	}
    });
});
$(document).on('click', '.c-service-row-del-btn', function() {
	if ($('.service-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    if ($('.c-service-row-add-btn').length == 0) {
		$('.service-buttons').first().append('<button class="btn btn-success c-service-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	}
});
$(document).on('click', '.c-service-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/contract_service_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.service-form').append(data);
	    $('.selectpicker').selectpicker('refresh');
	}
    });
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
	if ($('.product-form-list').length > 1) {
	    $(this).parent().parent().remove();
	    if ($('.mc-product-row-add-btn').length == 0) {
		$('.product-buttons').first().append('<button class="btn btn-success mc-product-row-add-btn" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>');
	    }
	}
});
$(document).on('click', '.mc-product-row-add-btn', function() {
    $.ajax({
	url:'/sfa/template/form/contract_mc_row.tmpl.php',
	type:'GET',
	success: function(data){
	    $('.product-form').append(data);
	    $('.product-form-list').last().find('.selectpicker').selectpicker('refresh');
	}
    });
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
    $(this).parent().parent().remove();
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
    _ajax('/sfa/pop/order_info.xhr.php', param, print_order_info, undefined, true);
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
