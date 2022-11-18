package kr.swcore.sderp.organiz.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import kr.swcore.sderp.organiz.dto.OrganizDTO;

public interface OrganizService {
	
	List<OrganizDTO> listDept(HttpSession session);
	String listDeptForCalendarJson(HttpSession session);
	ArrayList<HashMap<String, Object>> listDeptForCalendarArrList(HttpSession session);
	List<OrganizDTO> listDeptChainExtend(HttpSession session, OrganizDTO organizDTO);
}
