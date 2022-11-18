function go_url(url) {
    var cur_hash	= window.location.hash;
    if (cur_hash.indexOf('&scroll=') > 0) {
	cur_hash	= cur_hash.substring(0, cur_hash.indexOf('&scroll='));
    }
    window.location.hash = cur_hash + '&scroll=' + $(document).scrollTop();
    //location.href = url + '&scroll=' + $(document).scrollTop();
    location.href = url;
}
$(document).on('click', '.mobile-menu-btn', function() {
    $('#Basement').removeClass('BasementClose');
    $('#Basement').addClass('BasementOpen');
    $('#body-cover').show();
});
$(document).on('click', '#body-cover', function() {
    $('#Basement').addClass('BasementClose');
    $('#Basement').removeClass('BasementOpen');
    $('#body-cover').hide();
});
$(document).on('swipeleft', '#body-cover', function() {
    $('#Basement').addClass('BasementClose');
    $('#Basement').removeClass('BasementOpen');
    $('#body-cover').hide();
});
$(document).on('swipeleft', '.list-content', function() {
    if ($(this).next().hasClass('swipe-content')) {
	if ($(this).next().find('.swipe-menu').length == 3) {
	    $(this).parent().find('.swipe-content').css('width', '80%');
	    $(this).parent().find('.swipe-content').css('margin-left', '20%');
	    $(this).removeClass('swipe-right');
	    $(this).addClass('swipe-left');
	    $(this).parent().find('.swipe-content').css('display', 'flex');
	} else {
	    $(this).parent().find('.swipe-content').css('width', '60%');
	    $(this).parent().find('.swipe-content').css('margin-left', '40%');
	    $(this).removeClass('swipe-right2');
	    $(this).addClass('swipe-left2');
	    $(this).parent().find('.swipe-content').css('display', 'flex');
	}
    }
	/*
    $(this).parent().find('.origin-content').hide();
    $(this).parent().find('.swipe-content').addClass('slideInRight');
    $(this).parent().find('.swipe-content').show();
    */
});
$(document).on('swiperight', '.list-content', function() {
    if ($(this).next().hasClass('swipe-content')) {
	if ($(this).next().find('.swipe-menu').length == 3) {
	    $(this).removeClass('swipe-left');
	    $(this).addClass('swipe-right');
	    $(this).parent().find('.swipe-content').hide();
	} else {
	    $(this).removeClass('swipe-left2');
	    $(this).addClass('swipe-right2');
	    $(this).parent().find('.swipe-content').hide();
	}
    }
	/*
    $(this).parent().find('.origin-content').show();
    $(this).parent().find('.origin-content').addClass('slideInRight');
    $(this).parent().find('.swipe-content').hide();
    */
});
$(document).on('swiperight', '.swipe-content', function() {
    if ($(this).find('.swipe-menu').length == 3) {
	$(this).parent().find('.list-content').removeClass('swipe-left');
	$(this).parent().find('.list-content').addClass('swipe-right');
	$(this).hide();
    } else {
	$(this).parent().find('.list-content').removeClass('swipe-left2');
	$(this).parent().find('.list-content').addClass('swipe-right2');
	$(this).hide();
    }
	/*
    $(this).parent().find('.origin-content').show();
    $(this).parent().find('.origin-content').addClass('slideInRight');
    $(this).parent().find('.swipe-content').hide();
    */
});
$(document).on('click', '.list-content-expand', function() {
    var url = $(this).find('span').eq(0).attr('url');
    var param	= $(this).find('span').eq(0).attr('param');
    if (url != undefined && url != '') {
	if (param != '') {
	    go_url(url + '?' + param);
	} else {
	    go_url(url);
	}
    }
});
$(document).on('click', '.list-content', function(e) {
    if (!$(e.target).is('.support-expand') && !$(e.target).is('.mail-company-reg-btn')) {
	var url = $(this).find('span').eq(0).attr('url');
	var param	= $(this).find('span').eq(0).attr('param');
	var func	= $(this).find('span').eq(0).attr('func');
	if (url != undefined && url != '') {
	    if (param != '') {
		go_url(url + '?' + param);
	    } else {
		go_url(url);
	    }
	} else if (func != undefined) {
	    if (func == 'selectUser') {
		var user_id	= $(this).find('span').eq(0).attr('user_id');
		var user_name	= $(this).find('span').eq(0).attr('user_name');
		selectUser(user_id, user_name);
		$('#pop_md').modal('hide');
	    } else if (func == 'selectOpp') {
		var op_code = $(this).find('span').eq(0).attr('op_code');
		var title	= $(this).find('span').eq(0).attr('title');
		var co_code	= $(this).find('span').eq(0).attr('co_code');
		var co_name	= $(this).find('span').eq(0).attr('co_name');
		var stage	= $(this).find('span').eq(0).attr('stage');
		var sales_date	= $(this).find('span').eq(0).attr('sales_date');
		selectOpp(op_code, title, co_code, co_name, stage, sales_date);
		$('#pop_md').modal('hide');
	    } else if (func == 'selectCompany') {
		var co_code = $(this).find('span').eq(0).attr('co_code');
		var co_name	= $(this).find('span').eq(0).attr('co_name');
		selectCompany(co_code, co_name);
		$('#pop_md').modal('hide');
	    } else if (func == 'selectCampaign') {
		var ca_code = $(this).find('span').eq(0).attr('ca_code');
		var ca_name	= $(this).find('span').eq(0).attr('ca_name');
		selectCampaign(ca_code, ca_name);
		$('#pop_md').modal('hide');
	    } else if (func == 'selectBillCompany') {
		var co_code = $(this).find('span').eq(0).attr('bc_code');
		var co_name	= $(this).find('span').eq(0).attr('bc_name');
		selectCompany(co_code, co_name);
		$('#pop_md').modal('hide');
	    } else if (func == 'selectSupport') {
		var code = $(this).find('span').eq(0).attr('ep_code');
		var name	= $(this).find('span').eq(0).attr('ep_name');
		selectSupport(code, name);
		$('#pop_md').modal('hide');
	    } else if (func == 'selectCustomer') {
		var cu_code = $(this).find('span').eq(0).attr('cu_code');
		var cu_name	= $(this).find('span').eq(0).attr('cu_name');
		var co_code = $(this).find('span').eq(0).attr('co_code');
		var co_name	= $(this).find('span').eq(0).attr('co_name');
		var position	= $(this).find('span').eq(0).attr('position');
		var mobile	= $(this).find('span').eq(0).attr('mobile');
		selectCustomer(cu_code, cu_name, co_code, co_name, position, mobile);
		$('#pop_md').modal('hide');
	    } else if (func == 'selectContact') {
		var cu_code = $(this).find('span').eq(0).attr('cu_code');
		var cu_name	= $(this).find('span').eq(0).attr('cu_name');
		var co_name	= $(this).find('span').eq(0).attr('co_name');
		selectContact(co_name, cu_code, cu_name);
		$('#pop_md').modal('hide');
	    } else if (func == 'selectContact2') {
		var contact_code	= $(this).find('span').eq(0).attr('contact_code');
		var contact_name	= $(this).find('span').eq(0).attr('contact_name');
		selectContact2(contact_code, contact_name);
		$('#pop_md').modal('hide');
	    } else if (func == 'selectData') {
		var da_code = $(this).find('span').eq(0).attr('da_code');
		var da_name	= $(this).find('span').eq(0).attr('da_name');
		var memo	= $(this).find('span').eq(0).attr('memo');
		selectData(da_code, da_name, memo);
		$('#pop_md').modal('hide');
	    } else if (func == 'selectOrder') {
		var od_code = $(this).find('span').eq(0).attr('od_code');
		var od_name	= $(this).find('span').eq(0).attr('od_name');
		selectOrder(od_code, od_name);
		$('#pop_md').modal('hide');
	    } /*
		   * added by yongmin	
		   *
		   */
		else if(func == 'selectSchedule') {
		var sc_code = $(this).find('span').eq(0).attr('sc_code');
		var sc_name = $(this).find('span').eq(0).attr('sc_title');
		selectSchedule(sc_code, sc_name);
		$('#pop_md').modal('hide');
		} else if(func == 'selectContract') {
		var ct_code = $(this).find('span').eq(0).attr('ct_code');
		var ct_name = $(this).find('span').eq(0).attr('ct_title');
		selectContract(ct_code, ct_name);
		$('#pop_md').modal('hide');
		}

	} else if ($(this).parent().parent().attr('id') == 'contract_mc_list') {
	    if ($(this).parent().next().hasClass('relative-contract')) {
		if ($(this).parent().next().css('display') == 'none') {
		    $(this).parent().next().show();
		} else {
		    $(this).parent().next().hide();
		}
	    }
	}
    }
});
$(document).on('click', '.btn-more', function() {
    if ($('.detail-list-more').css('display') == 'none') {
	$('.detail-list-more').show();
	$(this).html('<i class="fa fa-angle-up"></i>');
    } else {
	$('.detail-list-more').hide();
	$(this).html('<i class="fa fa-angle-down"></i>');
    }
});
