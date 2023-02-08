package kr.swcore.sderp.organiz;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.CodeController;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.organiz.Service.OrganizService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.user.dto.UserDTO;

@Controller
@RequestMapping("/organiz/*")

public class OrganizController {
	
	private static final Logger logger = LoggerFactory.getLogger(CodeController.class);
	
	@Inject
	CodeService codeService;
	
	@Inject
	OrganizService organizService;

	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("organiz/list");
		mav.addObject("organizationArrList", organizService.listDeptForCalendarArrList(session));
		return mav;
	}
	@RequestMapping("write.do")
	public ModelAndView write(HttpSession session, ModelAndView mav) {
		mav.setViewName("organiz/write");
		return mav;
	} 
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> organizInsert(@ModelAttribute OrganizDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int orgInsert =organizService.insertOrg(dto);
		if(orgInsert > 0) {
       	param.put("code","10001");
		}
		else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	} 
	
	@RequestMapping("update.do")
	public ResponseEntity<?> userUpdate(@ModelAttribute OrganizDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int orgUpdate = organizService.updateOrg(dto);
		if(orgUpdate > 0) {
       	param.put("code","10001");
      }
       else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	}

}
