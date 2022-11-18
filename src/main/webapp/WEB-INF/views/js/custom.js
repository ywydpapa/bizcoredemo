document.write("<script type='text/javascript' src='/js/bootstrap-notify.min.js' ><" + "/script>");
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

$(document).ready(function () {

    // Add body-small class if window less than 768px
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }

    // MetisMenu
    if ($('#side-menu').length > 0) $('#side-menu').metisMenu();

    // Collapse ibox function
    $('.collapse-link').on('click', function () {
        var ibox = $(this).closest('div.ibox');
        var button = $(this).find('i');
        var content = ibox.children('.ibox-content');
        content.slideToggle(200);
        button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
        ibox.toggleClass('').toggleClass('border-bottom');
        setTimeout(function () {
            ibox.resize();
            ibox.find('[id^=map-]').resize();
        }, 50);
    });

    // Close ibox function
    $('.close-link').on('click', function () {
        var content = $(this).closest('div.ibox');
        content.remove();
    });

    // Fullscreen ibox function
    $('.fullscreen-link').on('click', function () {
        var ibox = $(this).closest('div.ibox');
        var button = $(this).find('i');
        $('body').toggleClass('fullscreen-ibox-mode');
        button.toggleClass('fa-expand').toggleClass('fa-compress');
        ibox.toggleClass('fullscreen');
        setTimeout(function () {
            $(window).trigger('resize');
        }, 100);
    });

    // Close menu in canvas mode
    $('.close-canvas-menu').on('click', function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();
    });


    // Open close right sidebar
    $('.right-sidebar-toggle').on('click', function () {
        $('#right-sidebar').toggleClass('sidebar-open');
    });


    // Open close small chat
    $('.open-small-chat').on('click', function () {
        $(this).children().toggleClass('fa-comments').toggleClass('fa-remove');
        $('.small-chat-box').toggleClass('active');
    });


    // Small todo handler
    $('.check-link').on('click', function () {
        var button = $(this).find('i');
        var label = $(this).next('span');
        button.toggleClass('fa-check-square').toggleClass('fa-square-o');
        label.toggleClass('todo-completed');
        return false;
    });

    // Minimalize menu
    $('.navbar-minimalize').on('click', function () {
        $("body").toggleClass("mini-navbar");
        SmoothlyMenu();

    });

    // Tooltips demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    });

    $('.logout').on('click', function () {
	swal({
	    title:JS_TEXT['confirm_logout'],
	    type: "warning",
	    showCancelButton: true,
	    confirmButtonColor: "#DD6B55",
	    confirmButtonText: JS_TEXT['confirm'],
	    closeOnConfirm: true
	}, function () {
	    location.href = "/sfa/login_proc.php?gubun=logout";
	});
    });
    $('.edit_profile').on('click', function () {
    	location.href = "/sfa/user/user_mod.php";
    });
    $('.m_edit_profile').on('click', function () {
    	location.href = "/sfa/m/user/user_mod.php";
    });


    // Full height of sidebar
    function fix_height() {
        var heightWithoutNavbar = $("body > #wrapper").height() - 61;
        $(".sidebar-panel").css("min-height", heightWithoutNavbar + "px");

        var navbarheight = $('nav.navbar-default').height();
        var wrapperHeight = $('#page-wrapper').height();

        if (navbarheight > wrapperHeight) {
            $('#page-wrapper').css("min-height", navbarheight + "px");
        }

        if (navbarheight < wrapperHeight) {
            $('#page-wrapper').css("min-height", $(window).height() + "px");
        }

        if ($('body').hasClass('fixed-nav')) {
            if (navbarheight > wrapperHeight) {
                $('#page-wrapper').css("min-height", navbarheight + "px");
            } else {
                $('#page-wrapper').css("min-height", $(window).height() - 60 + "px");
            }
        }

    }

    fix_height();


    // Move right sidebar top after scroll
    /*
    $(window).scroll(function () {
        if ($(window).scrollTop() > 0 && !$('body').hasClass('fixed-nav')) {
            $('#right-sidebar').addClass('sidebar-top');
        } else {
            $('#right-sidebar').removeClass('sidebar-top');
        }
    });
    */

    $(window).bind("load resize scroll", function () {
        if (!$("body").hasClass('body-small')) {
            fix_height();
        }
    });

    $("[data-toggle=popover]")
        .popover();


    /*
    $.notify({
	    // options
	icon: 'glyphicon glyphicon-warning-sign',
	title: 'Bootstrap notify',
	message: 'Turning standard Bootstrap alerts into "notify" like notifications',
	url: 'https://github.com/mouse0270/bootstrap-notify',
	target: '_blank'
    },{
	// settings
	element: 'body',
	position: null,
	type: "info",
	allow_dismiss: true,
	newest_on_top: false,
	showProgressbar: false,
	placement: {
	    from: "bottom",
	    align: "right"
	},
	offset: 20,
	spacing: 10,
	z_index: 1031,
	delay: 5000,
	timer: 1000,
	url_target: '_blank',
	mouse_over: null,
	animate: {
	    enter: 'animated fadeInDown',
	    exit: 'animated fadeOutUp'
	},
    onShow: null,
    onShown: null,
    onClose: null,
    onClosed: null,
    icon_type: 'class',
    template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
    '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
    '<span data-notify="icon"></span> ' +
    '<span data-notify="title">{1}</span> ' +
    '<span data-notify="message">{2}</span>' +
    '<div class="progress" data-notify="progressbar">' +
    '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
    '</div>' +
    '<a href="{3}" target="{4}" data-notify="url"></a>' +
    '</div>' 
    });
    */

    /*
    $.notify({
	title: '<h4>Heads up!</h4>',
	message: 'Bootstrap Notify uses Bootstrap Info Alert styling as its default setting.',
	url:'/sfa/company/company_detail.php?co_code=co13Y1qu10/0RVE',
	target:'_self'
    }, {
	placement: {
	    from: "bottom",
	    align: "right"
	}
    });
    */
    //var notify_message = setInterval(notifyMessage, 10000);
    notifyMessage();
});

function notifyMessage() {
    _ajax_no_loading('/sfa/common/get_new_message.xhr.php', '', show_message);
}
function show_message(data) {

    _loading(0);
    $.each(data, function(k, dt) {
	$.notify({
	    title: '<h4>' + dt.title + '</h4>',
	    message: dt.message,
	    url: dt.url,
	    target: '_self'
	}, {
	    delay: 1000,
	    placement: {
		from: "bottom",
		align: "right"
	    }
	});
    });
}


// Minimalize menu when screen is less than 768px
$(window).bind("resize", function () {
    if ($(this).width() < 769) {
        $('body').addClass('body-small')
    } else {
        $('body').removeClass('body-small')
    }
});

// Local Storage functions
// Set proper body class and plugins based on user configuration
$(document).ready(function () {
    if (localStorageSupport()) {

        var collapse = localStorage.getItem("collapse_menu");
        var fixedsidebar = localStorage.getItem("fixedsidebar");
        var fixednavbar = localStorage.getItem("fixednavbar");
        var boxedlayout = localStorage.getItem("boxedlayout");
        var fixedfooter = localStorage.getItem("fixedfooter");

        var body = $('body');

        if (fixedsidebar == 'on') {
            body.addClass('fixed-sidebar');
        }

        if (collapse == 'on') {
            if (body.hasClass('fixed-sidebar')) {
                if (!body.hasClass('body-small')) {
                    body.addClass('mini-navbar');
                }
            } else {
                if (!body.hasClass('body-small')) {
                    body.addClass('mini-navbar');
                }

            }
        }

        if (fixednavbar == 'on') {
            $(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
            body.addClass('fixed-nav');
        }

        if (boxedlayout == 'on') {
            body.addClass('boxed-layout');
        }

        if (fixedfooter == 'on') {
            $(".footer").addClass('fixed');
        }
    }
});

// check if browser support HTML5 local storage
function localStorageSupport() {
    return (('localStorage' in window) && window['localStorage'] !== null)
}

// For demo purpose - animation css script
function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            //wait for animation to finish before removing classes
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

function SmoothlyMenu() {
    if (!$('body').hasClass('mini-navbar') || $('body').hasClass('body-small')) {
        // Hide menu in order to smoothly turn on when maximize menu
        $('#side-menu').hide();
        // For smoothly turn on menu
        setTimeout(
            function () {
                $('#side-menu').fadeIn(400);
            }, 200);
    } else if ($('body').hasClass('fixed-sidebar')) {
        $('#side-menu').hide();
        setTimeout(
            function () {
                $('#side-menu').fadeIn(400);
            }, 100);
    } else {
        // Remove all inline style from jquery fadeIn function to reset menu state
        $('#side-menu').removeAttr('style');
    }
}

// Dragable panels
function WinMove() {
    var element = "[class*=col]";
    var handle = ".ibox-title";
    var connect = "[class*=col]";
    $(element).sortable(
        {
            handle: handle,
            connectWith: connect,
            tolerance: 'pointer',
            forcePlaceholderSize: true,
            opacity: 0.8
        })
        .disableSelection();
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
		success: function(data) {
		    if (data.login != undefined) {
			if (data.login == 'fail') {
			    if (data.logout_msg != undefined) {
				alert(data.logout_msg);
			    }
			    window.location.href = '/sfa/login.php';
			}
		    } else {
			if (p == undefined) {
			    eval(cb)(data);
			} else {
			    eval(cb)(data, p);
			}
		    }
		},
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
function _ajax_no_loading(path, data, cb, p, sync)
{
	if (sync == undefined) {
		sync = true;
	}
	$.ajax({
		type: "POST",
		contentType: 'application/json; charset=utf-8',
		url: path,
		cache: false,
		data: data,
		dataType: 'json',
		async: sync,
		success: function(data) {
		    if (data.login != undefined) {
			if (data.login == 'fail') {
			    if (data.logout_msg != undefined) {
				alert(data.logout_msg);
			    }
			    window.location.href = '/sfa/login.php';
			}
		    } else {
			if (p == undefined) {
			    eval(cb)(data);
			} else {
			    eval(cb)(data, p);
			}
		    }
		},
		context: {arg: p},
		error: function() {
			alert(JS_TEXT['error_resp']);
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
function requiredField(obj, errMsg) {
    if (obj.val() == "") {
	swal({
	    title:errMsg,
	    type:'warning'
	});
	obj.focus();
	return false;
    }
    return true;
}
function requiredFieldNoZero(obj, errMsg) {
    if (obj.val() == "" || obj.val() == 0) {
	swal({
	    title:errMsg,
	    type:'warning'
	});
	obj.focus();
	return false;
    }
    return true;
}
function multiple_condition(type) {
    $('#'+type).combobox({
	multiple : true,
	onChange : function(data) {
	    if (data == '') {
		$('#'+type).combobox('select', '*');
		$('#'+type).setValue('*');
	    }
	},
	onSelect : function(data) {
	    if (data.value != '*') {
		$('#'+type).combobox('unselect', '*');
	    } else if (data.value == '*') {
		$('#'+type).combobox('setValue', '*');
	}
    }
});
}
function make_hidden_obj(name, value, target) {
    target.append('<input type="hidden" name="' + name + '" value="' + value + '" />');
}
function convert_currency(x) {
    if (x >= 1000) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    } else {
	return x;
    }
}
function change_agent(mode) {
    var url	= $(location).attr('href');
    if (mode == 'mobile') {
	if (url.indexOf('/sfa/m/') < 0) {
	    if (url.indexOf('?') > 0) {
		location.href = url.replace('/sfa/', '/sfa/m/').split('#')[0] + '&agent=mobile';
	    } else {
		location.href = url.replace('/sfa/', '/sfa/m/').split('#')[0] + '?agent=mobile';
	    }
	}
    } else if (mode == 'pc') {
	if (url.indexOf('?') > 0) {
	    location.href = url.replace('/sfa/m/', '/sfa/').split('#')[0] + '&agent=pc';
	} else {
	    location.href = url.replace('/sfa/m/', '/sfa/').split('#')[0] + '?agent=pc';
	}
    }
}
function show_notice(code) {
    $('#notice_ifrm').attr('src', '/sfa/include/notice_detail.php?no_code=' + code);
    $('#notice_md').modal('show');
}
$(document).on('click', '#logout-btn', function () {
    swal({
	title:JS_TEXT['confirm_logout'],
	type: "warning",
	showCancelButton: true,
	confirmButtonColor: "#DD6B55",
	confirmButtonText: JS_TEXT['confirm'],
	closeOnConfirm: true
    }, function () {
	location.href = "/sfa/login_proc.php?gubun=logout";
    });
});
function escapeHtml(text) {
    var map = {
	'&': '&amp;',
	'<': '&lt;',
	'>': '&gt;',
	'"': '&quot;',
	"'": '&#039;'
    };

    return text.replace(/[&<>"']/g, function(m) { return map[m]; });
}
