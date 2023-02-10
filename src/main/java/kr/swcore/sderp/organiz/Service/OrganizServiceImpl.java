package kr.swcore.sderp.organiz.Service;

import kr.swcore.sderp.organiz.dao.OrganizDAO;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.user.dao.UserDAO;
import kr.swcore.sderp.user.dto.UserDTO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Service
public class OrganizServiceImpl implements OrganizService {

	@Inject
	OrganizDAO organizDao;

	@Inject
	UserDAO userDAO;
	
	@Override
	public List<OrganizDTO> listDept(HttpSession session) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		return organizDao.listDept(compNo);
	}

	@Override
	public List<OrganizDTO> listDept2(HttpSession session) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		return organizDao.listDept2(compNo);
	}

	@Override
	public String listDeptForCalendarJson(HttpSession session) {
		String result = "";
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		JSONArray returnArray = new JSONArray();
		List<OrganizDTO> rtn = organizDao.listDept(compNo);
		if(rtn != null) {
			HashMap<String, Object> first = new JSONObject();
			first.put("title", rtn.get(0).getParentTitle());
			first.put("expanded", true);
			first.put("folder", true);
			JSONArray arr = new JSONArray();
			for(OrganizDTO dto : rtn){
				HashMap<String, Object> jsonObject = new JSONObject();
				jsonObject.put("title", dto.getOrg_title());
				jsonObject.put("expanded", false);
				jsonObject.put("folder", true);
				
				
				List<UserDTO> userList = userDAO.userListWithOrgId(dto.getOrg_id());
				JSONArray array = new JSONArray();
				for(UserDTO userDTO : userList){
					HashMap<String, Object> obj = new HashMap<String, Object>();
					obj.put("title", userDTO.getUserName());
					obj.put("userNo", userDTO.getUserNo());

					HashMap<String, Object> object = new JSONObject(obj);
					array.add(object);
				}
				jsonObject.put("children", array);
				arr.add(jsonObject);
			}
			first.put("children", arr);
			returnArray.add(first);
		}
		result = returnArray.toString();
		return result;
	}

	@Override
	public ArrayList<HashMap<String, Object>> listDeptForCalendarArrList(HttpSession session) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		ArrayList<HashMap<String, Object>> returnArray = new JSONArray();
		List<OrganizDTO> rtn = organizDao.listDept(compNo);
		if(rtn != null) {
			HashMap<String, Object> first = new JSONObject();
			first.put("title", rtn.get(0).getParentTitle());
			first.put("depth", 0);
			first.put("expanded", true);
			first.put("folder", true);
			ArrayList<HashMap<String, Object>> arr = new JSONArray();
			for(OrganizDTO dto : rtn){
				HashMap<String, Object> objDto = new HashMap<>();
				objDto.put("title", dto.getOrg_title());
				objDto.put("depth", 1);
				objDto.put("expanded", false);
				objDto.put("folder", true);
				objDto.put("id", dto.getOrg_id());
				objDto.put("code", dto.getOrg_code());

				List<UserDTO> userList = userDAO.userListWithOrgId(dto.getOrg_id());
				ArrayList<HashMap<String, Object>> array = new ArrayList<>();
				for(UserDTO userDTO : userList){
					HashMap<String, Object> obj = new HashMap<String, Object>();
					obj.put("title", userDTO.getUserName());
					obj.put("userNo", userDTO.getUserNo());
					obj.put("depth", 2);
					array.add(obj);
				}
				objDto.put("children", array);
				arr.add(objDto);
			}
			first.put("children", arr);
			returnArray.add(first);
		}
		return returnArray;
	}

	@Override
    public List<OrganizDTO> listDeptChainExtend(HttpSession session, OrganizDTO organizDTO) {
        Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
        if(organizDTO == null) organizDTO = new OrganizDTO();
        organizDTO.setCompNo(compNo);

        return organizDao.listDeptChainExtend(organizDTO);
    }

	@Override
	public int insertOrg(OrganizDTO dto) {
		return organizDao.insertOrg(dto);
		
	}

	@Override
	public OrganizDTO getOrgDataByCode(String org_code) {
		return organizDao.getOrgByCode(org_code);
	
	}

	@Override
	public int updateOrg(OrganizDTO dto) {
	
		return organizDao.updateOrg(dto);
		
	}

	@Override
	public int deleteOrg(OrganizDTO dto) {
		return organizDao.deleteOrg(dto);
		
	}

}
