function Tree(options) {
    this.data	= options.data;
    this.checked_list	= options.checked_list;
    this.target	= $('#' + options.id);
    this.tree_html	= '';
}
Tree.prototype._init	= function() {
    var html	= '';
    for (var i = 0; i < this.data.length; i++) {
	this.print_tree_list(this.data[i]);
    }
    this.target.addClass('ky-tree');
    this.target.children().remove();
    this.target.append(this.tree_html);
}
Tree.prototype.print_tree_list	= function(parent_li) {
    var checked_str	= '';
    if (inArray(parent_li.id, this.checked_list)) checked_str	= 'checked';
    if (parent_li.children != null) {
	if (parent_li.level >= 1) {
	    this.tree_html	+= '<li code="' + parent_li.id + '">' + 
		'<div class="checkbox">' + 
		'<i class="far fa-plus-square btn-ky-expand"></i>' + 
		'<label><input type="checkbox" class="tree-check" value="' + parent_li.id + '" ' + checked_str + '> ' + parent_li.text + '</label>' + 
		'</div>';
	    this.tree_html	+= '<ul class="collapse">';
	} else {
	    this.tree_html	+= '<li code="' + parent_li.id + '">' + 
		'<div class="checkbox">' + 
		'<i class="far fa-minus-square btn-ky-expand"></i>' + 
		'<label><input type="checkbox" class="tree-check" value="' + parent_li.id + '" ' + checked_str + '> ' + parent_li.text + '</label>' + 
		'</div>';
	    this.tree_html	+= '<ul class="collapse in">';
	}
	if (parent_li.children.length > 0) {
	    for (var i = 0; i < parent_li.children.length; i++) {
		this.print_tree_list(parent_li.children[i]);
	    }
	    this.tree_html	+= '</ul>';
	}
    } else {
	this.tree_html	+= '<li code="' + parent_li.id + '">' + 
	    '<div class="checkbox">' + 
	    '<label><input type="checkbox" class="tree-check" value="' + parent_li.id + '" ' + checked_str + '> ' + parent_li.text + '</label>' + 
	    '</div>';
    }
    this.tree_html	+= '</li>';
}
Tree.prototype.get_checked_value	= function() {
    return this.target.find('.tree-check:checked').map(function(){ return $(this).val(); }).get();
}

$(document).on('click', '.btn-ky-expand', function() {
    if ($(this).hasClass('fa-plus-square')) {
	$(this).removeClass('fa-plus-square').addClass('fa-minus-square');
	$(this).parent().parent().find('.collapse:not(.in)').eq(0).addClass('in');
    } else {
	$(this).removeClass('fa-minus-square').addClass('fa-plus-square');
	$(this).parent().parent().find('.collapse.in').eq(0).removeClass('in');
    }
});
$(document).on('change', '.tree-check', function() {
    var checked	= this.checked;
    $(this).parent().parent().parent().find('.tree-check').prop('checked', checked);

    var checked_value	= $('.tree-check:checked').map(function(){ return $(this).val(); }).get();
    var txt	= '';
    $('.tree-check').each(function() {
	if ($(this).is(':checked')) {
	    if (txt != '') txt += ',';
	    txt += $(this).parent().text();
	}
    });
    $('#sales_team_open').val(txt);
    $('input[name=sales_team]').val(checked_value);
    if (typeof get_user_list2 == 'function') {
	get_user_list2();
    } else if (typeof get_user_list == 'function') {
	get_user_list();
    }
});

function inArray(needle, haystack) {
    if (haystack != undefined) {
	var length = haystack.length;
	for (var i = 0; i < length; i++) {
	    if (haystack[i] == needle) return true;
	}
    }
    return false;
}
