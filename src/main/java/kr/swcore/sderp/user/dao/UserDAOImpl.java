package kr.swcore.sderp.user.dao;

import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.user.dto.UserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(UserDTO dto) {
		// TODO Auto-generated method stub
		String name = sqlSession.selectOne("user.loginCheck", dto);
		return (name == null) ? false:true;
	}

	@Override
	public UserDTO viewUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.viewUser", dto);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<UserDTO> userList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.userList");
	}
	
	@Override
	public List<UserDTO> userList(SoppDTO soppdto) {
		return sqlSession.selectList("user.userList", soppdto);
	}

	@Override
	public int updateUserPass(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.updateUserpass",dto);
	}
	
	@Override
	public int updateUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("user.updateUser",dto);
	}

	@Override
	public int insertUser(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.insertUser",dto);
	}

	@Override
	public int userCheck(UserDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("user.userCheck", dto);
		return result;
	}

	@Override
	public int insertUserdata(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.insertUserdata", dto);
	}

	@Override
	public List<UserDTO> userListWithOrgId(int orgId) {
		return sqlSession.selectList("user.userListWithOrgId", orgId);
	}

	@Override
	public UserDTO userSessionCheck(UserDTO dto) {
		return sqlSession.selectOne("user.userSessionCheck", dto);
	}

	@Override
	public List<UserDTO> allList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.allList");
	}

	@Override
	public List<UserDTO> listuser_data(String userName) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.listuser_data", userName);
	}
	
	@Override
	public UserDTO getUserDataByNo(String userNo) {
		return sqlSession.selectOne("user.getUserByNo",userNo);
	}


}
