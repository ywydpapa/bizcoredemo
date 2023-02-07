package kr.swcore.sderp.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.swcore.sderp.user.dto.UserDTO;
import kr.swcore.sderp.user.service.UserService;

@RestController
public class ApiUserController {
	
	@Autowired
	UserService service;
	@GetMapping("/api/user/{userNo}") 
	public String getEachUserData(HttpServletRequest request, @PathVariable("userNo") String userNo) throws JsonProcessingException{
		String result = null, data = null;
		UserDTO user = null; 
		ObjectMapper mapper = new ObjectMapper();
	
		user = service.getUserDataByNo(userNo);
	    data = mapper.writeValueAsString(user); 
	    result = data;
		
		return result; 
	}
	
	
}