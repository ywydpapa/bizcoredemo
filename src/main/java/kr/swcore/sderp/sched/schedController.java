package kr.swcore.sderp.sched;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.sched.dto.SchedDTO;
import kr.swcore.sderp.sched.service.SchedService;
import kr.swcore.sderp.sopp.SoppController;

@Controller
@RequestMapping("/sched/*")
public class schedController {
	
	private static final Logger logger = LoggerFactory.getLogger(SoppController.class);

	@Inject
	SchedService schedService;
	
	@Inject
	CodeService codeService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
//		mav.addObject("list", schedService.listSched(session));
		List<CodeDTO> listCodeDTO = codeService.listSchedtype(session);
		mav.addObject("schedtype", listCodeDTO);
//		mav.addObject("acttype", codeService.listActtype(session));
		mav.addObject("listSchdType", codeService.listSchdType(session));
		mav.addObject("listschedcat", codeService.listActSprtScheduleDetailType(session));
		mav.addObject("listschedtype", listCodeDTO);
		mav.addObject("first","Y");
		mav.setViewName("sched/list");
		return mav;
	}

	@RequestMapping("schedreport.do")
	public ModelAndView schedrep(HttpSession session,HttpSession session2,HttpSession session3, ModelAndView mav, @ModelAttribute SchedDTO dto) {
		mav.addObject("rlist",schedService.listSreport(session, session2, null, null));
		mav.addObject("myadd",schedService.myAddtext(session3, dto));
		mav.setViewName("sched/sreport");
		return mav;
	}
	
	@RequestMapping("listMreport.do")
	public ModelAndView listschedrep(HttpSession session, ModelAndView mav) {
		mav.addObject("mlist",schedService.listMreport(session));
		mav.setViewName("sched/listMreport");
		return mav;
	}
	
	@RequestMapping("detailMreport/{sreportNo}")
	public ModelAndView detailMreport(@PathVariable("sreportNo") int sreportNo,HttpSession session, ModelAndView mav, @ModelAttribute SchedDTO dto) {
		mav.addObject("rlist",schedService.detailSreport(session, dto));
		mav.addObject("addtxt",schedService.detailAddtext(sreportNo));
		mav.setViewName("sched/mreport");
		return mav;
	}

	@RequestMapping(value = "list/data", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody String listData(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> rtn = new HashMap<String, Object>();
		rtn.put("data", schedService.listSched(session, param, request, response));
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(schedService.listSched(session, param, request, response));
	}
	
	//�˻� ��ư Ŭ�� ��
	@RequestMapping("listcon.do")
	public ModelAndView listcon(HttpSession session, ModelAndView mav, @ModelAttribute SchedDTO dto) {
		mav.addObject("list", schedService.listconSched(session, dto));
		mav.addObject("preserveSearchCondition", "Y");
		mav.setViewName("sched/list");
		return mav;
	}

	@RequestMapping("/detail/{schedNo}")
	public ModelAndView detail(@PathVariable("schedNo") int schedNo, @RequestParam(value = "simple", required = false) String simple, ModelAndView mav, HttpSession session) {
		mav.addObject("dto", schedService.detailSched(schedNo));
		mav.addObject("schedtype", codeService.listSchedtype(session));
		mav.addObject("acttype", codeService.listActtype(session));
		if(simple != null){
			mav.addObject("simple","Y");
		}
		mav.setViewName("sched/detail");
		return mav;
	}
	
	@RequestMapping("/detail2/{schedNo}")
	public ModelAndView detail2(@PathVariable("schedNo") int schedNo, @RequestParam(value = "simple", required = false) String simple, ModelAndView mav, HttpSession session) {
		mav.addObject("dto", schedService.detailSched(schedNo));
		mav.addObject("schedtype", codeService.listSchedtype(session));
		mav.addObject("acttype", codeService.listActtype(session));
		if(simple != null){
			mav.addObject("simple","Y");
		}
		mav.setViewName("sched/detail2");
		return mav;
	}
	
	@RequestMapping("write.do")
	public ModelAndView write(@RequestParam(value = "simple", required = false) String simple, HttpSession session, ModelAndView mav) {
		mav.addObject("schedtype", codeService.listSchedtype(session));
//		mav.addObject("acttype", codeService.listActtype(session));
		mav.addObject("acttype", codeService.listActtype(session));
		if(simple != null){
			mav.addObject("simple","Y");
		}
		mav.setViewName("sched/write");
		return mav;
	}
		
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute SchedDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = schedService.insertSched(session, dto);
		param.put("code", (String.valueOf(schedInsertResult))); 
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insSreport.do")
	public ResponseEntity<?> insSreport(HttpSession session, @ModelAttribute SchedDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int srIResult = schedService.insertSreport(dto);
		if (srIResult >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute SchedDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedUpdate = schedService.updateSched(dto);
		if (schedUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute SchedDTO dto) {
			Map<String, Object> param = new HashMap<>();
			int schedUpdate = schedService.deleteSched(dto.getSchedNo());
			if (schedUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}
	
	
}
