var JS_TEXT = new Array();
get_js();
function get_js()
{
    $.ajax({
	type : "GET",
	url : "/lib/js.php",
	dataType : "json",
	async: false,
	success : js_text
    });
}

function js_text(txt)
{
    var obj = txt;

    $.each(obj, function (key, value) {
    	JS_TEXT[key] = value;
    });
}


/*
	path: 파일 경로
	data: 전달 인자
	cb  : ajax 성공시 callback 함수
	p   : callback 함수에 전달 인자(해당 함수에서 this.arg로 사용할수 있음)
*/
function _ajax(path, data, cb, p, sync)
{
	if (sync == undefined) {
		sync = true;
	}
	_loading(1);
	$.ajax({
		type: "POST",
		url: path,
		cache: false,
		data: data,
		dataType: 'json',
		async: sync,
		success: eval(cb),
		context: {arg: p},
		error: function() {
			alert(JS_TEXT['error_resp']);
			_loading(0);
		}
	});
}
function _ajax_html(path, data, cb, p, sync)
{
	if (sync == undefined) {
		sync = true;
	}
	_loading(1);
	$.ajax({
		type: "POST",
		url: path,
		cache: false,
		data: data,
		dataType: 'html',
		async: sync,
		success: eval(cb),
		context: {arg: p},
		error: function() {
			alert(JS_TEXT['error_resp']);
			_loading(0);
		}
	});
}
function _loading(type)
{
	if (type == 0) { // loading hide
	    $('#loading').parent().removeClass('sk-loading');
	    $('#loading').hide();
	} else {
	    $('#loading').parent().addClass('sk-loading');
	    $('#loading').show();
	}
}
function ajax_resp(resp)
{
    if (resp.debug != undefined) {
	if (resp.debug) {
	    goto_debug();
	}
    }

    if (resp == undefined || resp == "" || resp == null) {
	alert(JS_TEXT['error_resp']);
	return false;
    }

    if (resp.success == undefined) {
	alert(JS_TEXT['error_resp']);
	return false;
    }

    if (resp.success == true) {
	return true;
    }

    var msg = '';

    if (resp.success == false) {
	msg = JS_TEXT['hmsg'] + "\n\n";
	_loading(0);
    }

    for (var i=0; i<resp.msg.length; i++) {
	if (i != 0) {
	    msg += "\n";
	}

	msg += "- " + resp.msg[i];
    }

    alert(msg);
    return false;
}
