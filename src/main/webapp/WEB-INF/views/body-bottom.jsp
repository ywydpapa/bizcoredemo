<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>

							<!-- main_contents end -->
							</div>
							<!-- Page-body end -->
						</div>
						<!--page-wrapper end-->
					</div>
					<!--Main-body  end-->
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$("#userInfoChangeModal").on('show.bs.modal', function(e){
		$("#userInfoForm")[0].reset();
	});
</script>

<!-- Custom js -->
<script src='${path}/assets/jstree/js/jstree.js'></script>
<script type="text/javascript" src="${path}/assets/pages/treeview/jquery.tree.js"></script>
<script src="${path}/assets/pages/data-table/js/data-table-custom.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
<script src="${path}/assets/js/pcoded.min.js"></script>
<script src="${path}/assets/js/demo-12.js"></script>
<script src="${path}/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/script.js"></script>
</body>
</html>