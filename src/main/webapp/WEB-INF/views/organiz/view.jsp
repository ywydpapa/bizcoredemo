<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="row  border-bottom white-bg dashboard-header">
	<div class="col-lg-12">
		<h2>
			조직도관리 <span class="pull-right">
				<button class="btn btn-primary" type="button" id="btn-set-sup"
					style="margin-top: -8px">공급자 설정</button>
			</span>
		</h2>
	</div>
</div>
<div class="card-block">
	<div class="card-block tree-view">
		<div id="checkTree">
			<ul>
				<li>Admin
					<ul>
						<li data-jstree='{"opened":true}'>Assets
							<ul>
								<li data-jstree='{"type":"file"}'>Css</li>
								<li data-jstree='{"opened":true}'>Plugins
									<ul>
										<li data-jstree='{"selected":true,"type":"file"}'>Plugin
											one</li>
										<li data-jstree='{"type":"file"}'>Plugin two</li>
									</ul>
								</li>
							</ul>
						</li>
						<li data-jstree='{"opened":true}'>Email Template
							<ul>
								<li data-jstree='{"type":"file"}'>Email one</li>
								<li data-jstree='{"type":"file"}'>Email two</li>
							</ul>
						</li>
						<li data-jstree='{"icon":"zmdi zmdi-view-dashboard"}'>Dashboard</li>
						<li data-jstree='{"icon":"zmdi zmdi-format-underlined"}'>Typography</li>
						<li data-jstree='{"opened":true}'>User Interface
							<ul>
								<li data-jstree='{"type":"file"}'>Buttons</li>
								<li data-jstree='{"type":"file"}'>Cards</li>
							</ul>
						</li>
						<li data-jstree='{"icon":"zmdi zmdi-collection-text"}'>Forms</li>
						<li data-jstree='{"icon":"zmdi zmdi-view-list"}'>Tables</li>
					</ul>
				</li>
				<li data-jstree='{"type":"file"}'>Frontend</li>
			</ul>
		</div>
	</div>
</div>

<script>
$( document ).ready(function() {
    // Checkbox
    $('#checkTree').jstree({
		'core' : {
			'themes' : {
				'responsive': false
			}
		},
        'types' : {
            'default' : {
                'icon' : 'icofont icofont-folder'
            },
            'file' : {
                'icon' : 'icofont icofont-file-alt'
            }
        },
        'plugins' : ['types', 'checkbox']
    });
    
    // Ajax
    $('#ajaxTree').jstree({
		'core' : {
			'check_callback' : true,
			'themes' : {
				'responsive': false
			},
            'data' : {
                'url' : function (node) {
                    return node.id === '#' ? 'assets/plugins/jstree/ajax_roots.json' : 'assets/plugins/jstree/ajax_children.json';
                },
                'data' : function (node) {
                    return { 'id' : node.id };
                }
            }
        },
        "types" : {
            'default' : {
                'icon' : 'icofont icofont-folder'
            },
            'file' : {
                'icon' : 'icofont icofont-file-alt'
            }
        },
        "plugins" : [ "contextmenu", "dnd", "search", "state", "types", "wholerow" ]
    });
});
</script>