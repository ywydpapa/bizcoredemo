package kr.swcore.sderp.organiz;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.swcore.sderp.organiz.Service.OrganizService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;

@RestController
public class ApiOrganizController {
	
	@Autowired
	OrganizService service;
	
	@RequestMapping(value = "/api/organiz/{org_code}", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String getOrgJsonData(HttpServletRequest requestm, @PathVariable("org_code") String org_code) throws JsonProcessingException {
		String result = null, data = null;
		OrganizDTO org = null; 
		ObjectMapper mapper = new ObjectMapper();
	
		org = service.getOrgDataByCode(org_code);
	    data = mapper.writeValueAsString(org); 
	    result = data;
		return result; 
	}
}