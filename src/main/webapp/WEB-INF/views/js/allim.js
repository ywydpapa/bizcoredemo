/**
 * 
 */
function fn_allimInsert(path, userNo, compNo, msg, role, dataPath){
	var insertData = {};
	
	insertData.userNo = userNo;
	insertData.compNo = compNo;
	insertData.allimRole = role;
	insertData.allimContents = msg;
	insertData.allimPath = dataPath;
	
	$.ajax({
		url: path + "/allim/insertAllim.do",
		method: "post",
		data: insertData,	
		async: false,
		dataType: "json",
	});
}