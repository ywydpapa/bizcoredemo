package kr.swcore.sderp.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.DeptToPlanTblDTO;
import kr.swcore.sderp.user.dto.UserDTO;



public interface UserService {

		public boolean loginCheck(UserDTO dto, HttpSession session);

	    public UserDTO viewUser(UserDTO dto);

	    public Boolean UserDetailPrepare(UserDTO dto, HttpSession session);

    	public void logout(HttpSession session);
	
    	public List<UserDTO> userList();
    	
    	public List<UserDTO> userList(HttpSession session);
    	
    	public int insertUser(UserDTO dto);
    	
    	public int insertUserdata(UserDTO dto);

    	public int userCheck(UserDTO dto);
    	
    	public List<UserDTO> userListWithOrgId(UserDTO dto);

		public int updateUserPass(UserDTO dto);
		
		public int updateUser(UserDTO dto);

		public List<UserDTO> allList();

		public List<UserDTO> listuser_data(String userName);
}
