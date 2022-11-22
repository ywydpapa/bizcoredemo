package kr.swcore.sderp.user;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.service.ContService;
import kr.swcore.sderp.cust.service.CustService;
import kr.swcore.sderp.organiz.Service.OrganizService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.user.dto.UserDTO;
import kr.swcore.sderp.user.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Inject
	UserService userService;
	
	@Inject
	CodeService codeService;
	
	@Inject
	OrganizService organizService;
	
	@Inject
	CustService custService;
	
	@Inject
	SoppService soppService;
	
	@Inject
	ContService contService;
	
	@RequestMapping("login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("write.do")
	public ModelAndView write(@ModelAttribute CodeDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<CodeDTO> listcomp = codeService.listComp();
		List<CodeDTO> listrank = codeService.listRank();
		List<OrganizDTO> listdept = organizService.listDept(session);
		mav.addObject("listDept",listdept);
		mav.addObject("listComp",listcomp);
		mav.addObject("listRank",listrank);
		mav.setViewName("user/write");
		return mav;
	}

	@RequestMapping("UserDetailPrepare")
	public String UserDetailPrepare(@ModelAttribute UserDTO dto, HttpSession session){
		Map<String, Object> param = new HashMap<>();
		Boolean b = userService.UserDetailPrepare(dto, session);
		return null;
	}
	
	@RequestMapping("view.do")
	public ModelAndView userView(@ModelAttribute UserDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String compNo = (String) session.getAttribute("compNo");
		dto.setCompNo(compNo);
		UserDTO userInfo = userService.viewUser(dto);
		List<OrganizDTO> listdept = organizService.listDept(session);
		mav.addObject("listDept",listdept);
		mav.addObject("userInfo", userInfo);
		mav.setViewName("user/view");
		return mav;
	}
	
	@RequestMapping("list.do")
	public String userList(HttpSession session, Model model) {
		List<UserDTO> list=userService.userList(session);
		model.addAttribute("list",list);
		return "user/list";
	}
	
	@RequestMapping("updatePass.do")
	public ResponseEntity<?> userpassUpdate(@ModelAttribute UserDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int userUpdate = userService.updateUserPass(dto);
		if(userUpdate > 0) {
       	param.put("code","10001");
      }
       else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> userUpdate(@ModelAttribute UserDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int userUpdate = userService.updateUser(dto);
		if(userUpdate > 0) {
       	param.put("code","10001");
      }
       else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	}

	//사용자 정보등록 컨트롤러
	@RequestMapping("insert.do")
	public ResponseEntity<?> userInsert(@ModelAttribute UserDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int userInsert =userService.insertUser(dto);
		int userdataInsert =userService.insertUserdata(dto);
		if(userInsert > 0) {
       	param.put("code","10001");
		}
		else {
        	param.put("code","20001");
        }
        return ResponseEntity.ok(param);
	} 

	@RequestMapping(value="/login_check.do")
	public ModelAndView loginCheck(@ModelAttribute UserDTO dto, HttpSession session) {
		boolean result = userService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) {
			UserDTO userInfo = userService.viewUser(dto);
			mav.setViewName("redirect:/myboard.do");
			//mav.addObject("msg", "Success");
			//mav.addObject("userName", userInfo.getUserName());
			session.setAttribute("userId", userInfo.getUserId());
			session.setAttribute("userName", userInfo.getUserName());
			session.setAttribute("userRole", userInfo.getUserRole()); // �����ڵ�
			session.setAttribute("docRole", userInfo.getDocRole());
			session.setAttribute("userOtp", userInfo.getUserOtp()); // OTP - 1ȸ��
			session.setAttribute("userKey", userInfo.getUserKey());
			session.setAttribute("compNo", userInfo.getCompNo()); // ȸ���ڵ�
			session.setAttribute("userNo", Integer.toString(userInfo.getUserNo())); // ���� �Ϸù�ȣ
			session.setAttribute("orgId", userInfo.getOrg_id()); // �μ� ��ȣ
			session.setAttribute("listUser", userService.userList(session));
			session.setAttribute("listCust", custService.listCust(session));
			session.setAttribute("listSopp", soppService.listSopp(session, null));
			ContDTO contDto = new ContDTO();
			session.setAttribute("listCont", contService.listCont(session, null, contDto));
			session.setAttribute("listDateFrom", userInfo.getListDateFrom());
		}else{
			mav.setViewName("user/login");
			mav.addObject("msg", "Fail");
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="userCheck.do", method = RequestMethod.POST)
	public int userCheck(UserDTO dto) {
		int result = userService.userCheck(dto);
		return result;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}

}
