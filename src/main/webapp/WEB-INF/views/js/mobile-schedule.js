$(document).on('click', 'input[name=sch_type]', function() {
    _ajax_html($(this).val() + "_form_modal.php", "sc_date=" + $('#schedule_date').val(), print_custom_form);
});
$(document).on('click', '.schedule-back', function() {
    _ajax_html('schedule_modal.php', 'schedule_date=' + $('#schedule_date').val(), print_custom_form);
});
function saveAnniSchedule() {
    var frm = document.custom_frm;
    if (!requiredField($('select[name=start_d]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('select[name=start_m]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('select[name=end_d]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('select[name=end_m]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('select[name=sch_type]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('input[name=title]'), JS_TEXT['alert_insert'])) return;

    if (frm.every_year.checked == true) {
	frm.expire_year.value = '';
    }
    frm.target = "custom_ifrm";
    frm.action = "schedule_anni_proc.php?gubun=ins&type=modal";
    frm.submit();
    $('#custom_md').modal('hide');
}
function selectEveryMonth() {
    $("#mon").val("+1");
}
function checkUnlimited() {
    var frm = document.custom_frm;
    if (frm.unlimited.checked == true) {
	frm.start_date.value = "";
	frm.end_date.value = "";
    }
}
function savePeriodicSchedule() {
    var frm = document.custom_frm;
    if (!requiredField($('select[name=mon]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('select[name=week]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('select[name=weekday]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('select[name=sch_type]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('input[name=title]'), JS_TEXT['alert_insert'])) return;

    if (frm.unlimited.checked == true) {
	frm.start_date.value = "";
	frm.end_date.value = "";
    }
    frm.target = "custom_ifrm";
    frm.action = "schedule_periodic_proc.php?gubun=ins&type=modal";
    frm.submit();
    $('#custom_md').modal('hide');
}
function delPeriodicSchedule() {
    swal({
	title:JS_TEXT['ask_delete'],
	type: 'warning',
	showCancelButton: true,
	closeOnConfirm:true
    }, function() {
	$('#custom_ifrm').attr('src', "schedule_periodic_proc.php?gubun=del&str=" + $('input[name=pe_code]').val() + "&type=modal");
	$('#custom_md').modal('hide');
    });
}
function delAnniSchedule() {
    swal({
	title:JS_TEXT['ask_delete'],
	type: 'warning',
	showCancelButton: true,
	closeOnConfirm:true
    }, function() {
	$('#custom_ifrm').attr('src', "schedule_anni_proc.php?gubun=del&str=" + $('input[name=an_code]').val() + "&type=modal");
	$('#custom_md').modal('hide');
    });
}
function changeStartMonth() {
    var month = $("#start_m").val();
    $("#end_m").val(month);
}
function changeStartDay() {
    var day = $("#start_d").val();
    $("#end_d").val(day);
}
function saveTask() {
    var frm = document.custom_frm;
    if (!requiredField($('input[name=sc_date]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('input[name=title]'), JS_TEXT['alert_insert'])) return;
    if ($('input[name=sc_date]').val() > $('input[name=sc_edate]').val()) {
	swal({
	    title:JS_TEXT['alert_invalid_period'],
	    type:'warning'
	});
	return;
    }

    frm.target = "custom_ifrm";
    frm.action = "task_proc.php?gubun=ins";
    frm.submit();
    $('#custom_md').modal('hide');
}
function delTask() {
    swal({
	title:JS_TEXT['ask_delete'],
	type: 'warning',
	showCancelButton: true,
	closeOnConfirm:true
    }, function() {
	$('#custom_ifrm').attr('src', "task_proc.php?gubun=del&str=" + $('input[name=ta_code]').val());
	$('#custom_md').modal('hide');
    });
}
function saveSchedule() {
    var frm = document.custom_frm;
    
    if (!requiredField($('input[name=title]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('input[name=sc_date]'), JS_TEXT['alert_insert'])) return;
    if ($('input[name=sc_date]').val() > $('input[name=sc_edate]').val()) {
	swal({
	    title:JS_TEXT['alert_invalid_period'],
	    type:'warning'
	});
	return;
    }
    if ($('input[name=pc_code]').length > 0) {
	if ($('input[name=co_code]').val() == '' && $('input[name=pc_code]').val() == '') {
	    swal({
		title:JS_TEXT['select_account_or_partner'],
		type:'warning'
	    });
	    return false;
	}
    } else {
	if (!requiredField($('input[name=co_code]'), JS_TEXT['alert_insert'])) return;
    }
    //if (!requiredField($('input[name=cu_code]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('select[name=activity]'), JS_TEXT['alert_insert'])) return;
    if (!requiredField($('input[name=title]'), JS_TEXT['alert_insert'])) return;
    if (frm.op_name.value == "") frm.op_code.value = "";
    if (frm.co_name.value == "") frm.co_code.value = "";
    //if (frm.cu_name.value == "") frm.cu_code.value = "";

    frm.target = "custom_ifrm";
    frm.action = "schedule_proc.php?gubun=ins&type=modal";
    frm.submit();
    $('#custom_md').modal('hide');
}
function delSchedule() {
    swal({
	title:JS_TEXT['ask_delete'],
	type: 'warning',
	showCancelButton: true,
	closeOnConfirm:true
    }, function() {
	$('#custom_ifrm').attr('src', "schedule_proc.php?gubun=del&str=" + $('input[name=sc_code]').val() + "&type=modal");
	$('#custom_md').modal('hide');
    });
}
function checkSupportAllday() {
    var frm = document.custom_frm;
    if ($("input:checkbox[name=allday_flg]").is(":checked") == true) {
	$("select[name=hour]").prop("disabled", "disabled");
	$("select[name=min]").prop("disabled", "disabled");
    } else {
	$("select[name=hour]").prop("disabled", "");
	$("select[name=min]").prop("disabled", "");
    }
}
function checkAllday() {
    var frm = document.custom_frm;
    if ($("input:checkbox[name=allday_flg]").is(":checked") == true) {
	$("select[name=need_time_hh]").prop("disabled", "disabled");
	$("select[name=need_time_mm]").prop("disabled", "disabled");
    } else {
	$("select[name=need_time_hh]").prop("disabled", "");
	$("select[name=need_time_mm]").prop("disabled", "");
    }
}
function saveSupportSchedule() {
    var frm = document.custom_frm;
    if ($('input[name=sup_type]:checked').val() == 'new') {
	if (!requiredField($('input[name=ep_title]'), JS_TEXT['alert_insert'] + 'a')) return;
    } else {
	if (!requiredField($('select[name=ep_code]'), JS_TEXT['alert_insert'] + 'b')) return;
    }
    if (!requiredField($("input[name=support_date]"), JS_TEXT['alert_insert'] + 'c')) return;
    if ($('input[name=support_date]').val() > $('input[name=support_edate]').val()) {
	swal({
	    title:JS_TEXT['alert_invalid_period'],
	    type:'warning'
	});
	return;
    }
    if (!requiredField($("input[name=support_edate]"), JS_TEXT['alert_insert'] + 'd')) return;
    if (!requiredField($("input[name=supporter]"), JS_TEXT['alert_insert'] + 'e')) return;
    if (!requiredField($("input[name=co_code]"), JS_TEXT['alert_insert'] + 'f')) return;
    if (!requiredField($("input[name=cu_code]"), JS_TEXT['alert_insert'] + 'i')) return;
    if (!requiredField($("select[name=support_type]"), JS_TEXT['alert_insert'] + 'j')) return;
    if (!requiredField($("select[name=stage]"), JS_TEXT['alert_insert'] + 'k')) return;
    if (!requiredField($("input[name=title]"), JS_TEXT['alert_insert'] + 'l')) return;
    if ($("input[name=ep_name]").val() == "") {
	$("input[name=ep_code]").val("");
    }

    frm.target = "custom_ifrm";
    frm.action = "support_info_proc.php?gubun=ins";
    frm.submit();
    $('#custom_md').modal('hide');
}
$(document).on('click', 'input[name=sup_type]', function() {
    if ($(this).val() == 'new') {
	$('.new_reg').show();
	$('.old_reg').hide();
    } else {
	$('.old_reg').show();
	$('.new_reg').hide();
    }
});
