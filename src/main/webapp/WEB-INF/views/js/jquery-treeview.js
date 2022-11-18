(function( $ ){
    var plugin = {
        name: 'TreeView',
        version: '1.0.0'
    }
    var defaults = {
        debug : false,
        autoExpand : false,
        css : {
            list : 'fa-ul',
            listItem : 'fa-li fa',
            collapsed : 'fa-caret-right',
            expanded : 'fa-caret-down'
        }
    }
    
    var settings;
    var debug, me = null;
    
    function __changeHandler( e ) {
        //var currentTarget = $(this);
        //var isChecked = currentTarget.is(':checked');
	var isChecked = false;
	if ($(this).hasClass('fa-caret-right')) {
	    isChecked = true;
	}
        
        //debug.log(currentTarget);
        //debug.log("Checked ", isChecked)
        
        if (!isChecked) {
            //debug.log('Uncheck all childs');
           
	    /*
            currentTarget.parent()
                         .find('input.tw-control')
                         .prop('checked', false);
			 */

	    $(this).removeClass('fa-caret-down');
	    $(this).addClass('fa-caret-right');
        } else if (isChecked) {
            //debug.log('Check my parents tree');
           
	    /*
            currentTarget.parents('li')
                         .find('>input.tw-control')
                         .prop('checked', true);
			 */
	    $(this).removeClass('fa-caret-right');
	    $(this).addClass('fa-caret-down');
        }
        
        _toggleCollapse( $(this) );
        
        //me.trigger('treeview.change', currentTarget, me);
    }
    function __checkedHandler(e) {
        var checked = $(this).is(':checked');
	$(this).parent().find('li').each(function() {
	    $(this).find('.tw-control').prop('checked', checked);
	});
	$('input[name=sales_team]').val($('#treeview-checkbox-demo').treeview('selectedValues'));
	var txt = '';
	$('.tw-control').each(function() {
	    if ($(this).is(':checked')) {
		$(this).parent().contents().filter(function() {
		    return this.nodeType == 3;
		}).each(
		    function(i,el){
			if (txt != '') txt += ',';
			txt += $(el).text();
			return false;
		    }
		);
	    }
	});
	$('#sales_team_open').val(txt);
	if (typeof get_user_list2 == 'function') {
	    get_user_list2();
	} else if (typeof get_user_list == 'function') {
	    get_user_list();
	}
    }
    
    function _toggleCollapse ( element ) {
        if (element.hasClass('fa-caret-down')) { // open
            //debug.log('Open checked branchs');
            element.parent()
               .find('>ul.collapse')
               .collapse('show')
               .parent()
               .find('>i.fa-li')
               .removeClass(settings.css.collapsed)
               .addClass(settings.css.expanded);
        } else {
            element.parent()
                   .find('ul.collapse')
                   .collapse('hide')
                   .parent()
                   .find('i.fa-li')
                   .removeClass(settings.css.expanded)
                   .addClass(settings.css.collapsed);
	}
	/*
        debug.log("Toggle collapse");
        
        var chk = $('input[type="checkbox"]:checked');
        
        if (chk.is(':checked')) {
            debug.log('Open checked branchs');
            chk.parent()
               .find('>ul.collapse')
               .collapse('show')
               .parent()
               .find('>i.fa-li')
               .removeClass(settings.css.collapsed)
               .addClass(settings.css.expanded);
        }
        
        if (!element.is(':checked')) {
            debug.log('Hide branch');
            
            element.parent()
                   .find('ul.collapse')
                   .collapse('hide')
                   .parent()
                   .find('i.fa-li')
                   .removeClass(settings.css.expanded)
                   .addClass(settings.css.collapsed);
        }
	*/
    }
    
    function _init() {
        //debug.log( "Initializing plugin" );
        
        me.on('change', 'input.tw-control', __checkedHandler);
	me.on('click', '.fa-li', __changeHandler);
        
        //debug.log("Collapsing tree");
        
        
        me.find('>ul')
          .addClass(settings.css.list)
          .find('ul')
          .addClass('collapse ' +  settings.css.list)
          .parent()
          .prepend(
              $('<i></i>').addClass(settings.css.listItem + ' ' +
                                    settings.css.collapsed)
          );
          
        if (settings.autoExpand) {
            me.find('ul.collapse').collapse('show');
        }
        
        //debug.log("Adding checkbox");
            
        me.find('li').each(function( index, element ) {
            var elmt = $(element);
            
            var chk = $('<input/>').prop('type', 'checkbox')
                                   .prop('class', 'tw-control')
                                   .prop('value', elmt.attr('data-value'));
            
            //debug.log("Checking if the element is selected");
            
            var isChecked = elmt.attr('data-checked');
            
            elmt.prepend(chk);
            
            if ( isChecked ) {
                //debug.log('Toggle checkbox');
                
                chk.prop('checked', true);
                
                //chk.trigger('change');
            }
        });
    }
    
    function _fill( data ) {
        $( data ).each(function (index, element) {
            me.find('input[value="' + element + '"]')
              .prop('checked', true);
              //.trigger('change');
        });
    }
    
    var publicMethods = {
        init : function( options ) {
            me = this;
            
            settings = $.extend( defaults, options );
            
            //debug = $.Logger(settings.debug, plugin);
            
            _init();
            
            //debug.log('Ready');
            
            _fill ( options.data );
            
            return this;
        },
        selectedValues: function() {
            //debug.log("Getting selected values");
            
            var chk = me.find('input[type="checkbox"]:checked');
            var output = [];
            
            chk.each(function(index, item) {
                var item = $(item);
                
                if(typeof item.parent().attr('data-value') !== typeof undefined) {
                    output.push(item.attr('value'));
                }
            })
            
            return output;
        }
    }
    
    $.fn.treeview = function (options) {
        if ( publicMethods[options] ) {
            return publicMethods[ options ].apply( this, Array.prototype.slice.call( arguments, 1 ));
        } else if ( typeof options === 'object' || ! options ) {
            // Default to "init"
            return publicMethods.init.apply( this, arguments );
        } else {
            $.error( 'Method ' +  options  + ' does not exist on jQuery.treeview' );
        }
    }
    
}( jQuery ));