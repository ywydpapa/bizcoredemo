
function requiredField(obj, errMsg) {
    if (obj.val() == "") {
	swal({
	    title:'',
	    text:errMsg,
	    type:'warning'
	});
	obj.focus();
	return false;
    }
    return true;
}
function _ajax(path, data, cb, p, sync)
{
	if (sync == undefined) {
		sync = true;
	}
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
		}
	});
}
