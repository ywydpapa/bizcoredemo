package kr.swcore.sderp.user.dao;

import kr.swcore.sderp.common.dto.DeptToPlanTblDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.user.dto.UserDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserDAO {
	
	List<UserDTO> userList();
	List<UserDTO> userList(SoppDTO soppdto);
	public boolean loginCheck(UserDTO dto);
	public UserDTO viewUser(UserDTO dto);
	public void logout(HttpSession session);
	public int updateUser(UserDTO dto);
	public int insertUser(UserDTO dto);
	public int insertUserdata(UserDTO dto);
	public int userCheck(UserDTO dto);
	public List<UserDTO> userListWithOrgId(int orgId);
	public UserDTO userSessionCheck(UserDTO dto);
	public int updateUserPass(UserDTO dto);
	List<UserDTO> allList();
	List<UserDTO> listuser_data(String userName);
}
