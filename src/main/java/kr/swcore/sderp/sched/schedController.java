package kr.swcore.sderp.sched;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cust.service.CustService;
import kr.swcore.sderp.sched.dto.SchedDTO;
import kr.swcore.sderp.sched.service.SchedService;
import kr.swcore.sderp.sopp.SoppController;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.user.service.UserService;

@Controller
@RequestMapping("/sched/*")
public class schedController {
	
	private static final Logger logger = LoggerFactory.getLogger(SoppController.class);

	@Inject
	SchedService schedService;
	
	@Inject
	CodeService codeService;
	
	@Inject
	CustService custService;
	
	@Inject
	UserService userService;
	
	@Inject
	SoppService soppService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
//		mav.addObject("list", schedService.listSched(session));
		List<CodeDTO> listCodeDTO = codeService.listSchedtype(session);
		mav.addObject("schedtype", listCodeDTO);
//		mav.addObject("acttype", codeService.listActtype(session));
		mav.addObject("listSchdType", codeService.listSchdType(session));
		mav.addObject("listschedcat", codeService.listActSprtScheduleDetailType(session));
		mav.addObject("listUser", userService.userList(session));
		mav.addObject("listCust", custService.listCust(session));
		mav.addObject("listSopp", soppService.listSopp(session, null));
		mav.addObject("listschedtype", listCodeDTO);
		mav.addObject("first","Y");
		mav.setViewName("sched/list");
		return mav;
	}
	
	@RequestMapping("schedreport.do")
	public ModelAndView schedrep(HttpSession session,HttpSession session2,HttpSession session3, ModelAndView mav, @ModelAttribute SchedDTO dto) {
		mav.addObject("rlist",schedService.listSreport(session, session2, null, null));
		mav.addObject("myadd",schedService.myAddtext(session3, dto));
		mav.addObject("myadd2",schedService.myAddtext2(session3, dto));
		mav.setViewName("sched/sreport");
		return mav;
	}
	
	@RequestMapping("listMreport.do")
	public ModelAndView listschedrep(HttpSession session, ModelAndView mav) {
		mav.addObject("mlist",schedService.listMreport(session));
		mav.setViewName("sched/listMreport");
		return mav;
	}
	
	@RequestMapping("listMreport2.do")
	public ModelAndView listschedrep2(HttpSession session, ModelAndView mav) {
		mav.addObject("mlist",schedService.listMreport2(session));
		mav.setViewName("sched/listMreport2");
		return mav;
	}
	
	@RequestMapping("detailMreport/{sreportNo}")
	public ModelAndView detailMreport(@PathVariable("sreportNo") int sreportNo,HttpSession session, ModelAndView mav, @ModelAttribute SchedDTO dto) {
		mav.addObject("rlist",schedService.detailSreport(session, dto));
		mav.addObject("addtxt",schedService.detailAddtext(sreportNo));
		mav.setViewName("sched/mreport");
		return mav;
	}
	
	@RequestMapping("detailMreport2/{sreportNo}")
	public ModelAndView detailMreport2(@PathVariable("sreportNo") int sreportNo,HttpSession session, ModelAndView mav, @ModelAttribute SchedDTO dto) {
		mav.addObject("rlist",schedService.detailSreport(session, dto));
		mav.addObject("addtxt",schedService.detailAddtext(sreportNo));
		mav.setViewName("sched/mreport2");
		return mav;
	}

	@RequestMapping(value = "list/data", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody String listData(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> rtn = new HashMap<String, Object>();
		rtn.put("data", schedService.listSched(session, param, request, response));
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(schedService.listSched(session, param, request, response));
	}
	
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

	@RequestMapping("insertauto.do")
	public ResponseEntity<?> insertauto(@ModelAttribute SchedDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = schedService.insertSchedauto(dto);
		if (schedInsertResult >0) {
			param.put("code","10001");
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insSreport.do")
	public ResponseEntity<?> insSreport(@RequestBody Map<String, Object> payload, HttpSession session, @ModelAttribute SchedDTO dto) {
		Map<String, Object> param = new HashMap<>();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(payload.get("checkData"));
		JsonParser jsonParser = new JsonParser();		
		JsonArray jsonArray = (JsonArray) jsonParser.parse(jsonStr);		
		String sreStr = gson.toJson(payload.get("sreportData"));
		System.out.println(sreStr);
		JsonObject jsonObject = (JsonObject) jsonParser.parse(sreStr);

		
		System.out.println(jsonObject.get("userNo"));
		
		dto.setUserNo(jsonObject.get("userNo").getAsInt());
		dto.setCompNo(jsonObject.get("compNo").getAsInt());
		dto.setPrComment(jsonObject.get("prComment").getAsString());
		dto.setPrCheck(jsonObject.get("prCheck").getAsInt());
		dto.setThComment(jsonObject.get("thComment").getAsString());
		dto.setThCheck(jsonObject.get("thCheck").getAsInt());
		
		
		int srIResult = schedService.insertSreport(dto);
		
		for(int i =0; i < jsonArray.size(); i++) {
			SchedDTO schedDto = new SchedDTO();
			JsonObject object = (JsonObject) jsonArray.get(i);
			int schedNo = object.get("schedNo").getAsInt();
			int schedCheck = object.get("schedCheck").getAsInt();
			schedDto.setSchedNo(schedNo);
			schedDto.setSchedCheck(schedCheck);		
			schedService.updateSreport(schedDto);
			
			//sales 세팅	
			int salesNo = object.get("schedNo").getAsInt();
			int salesCheck = object.get("schedCheck").getAsInt();
			schedDto.setSalesNo(salesNo);
			schedDto.setSalesCheck(salesCheck);
			schedService.updateSreport1(schedDto);
			
			//techd 세팅
			int techdNo = object.get("schedNo").getAsInt();
			int techdCheck = object.get("schedCheck").getAsInt();
			schedDto.setTechdNo(techdNo);
			schedDto.setTechdCheck(techdCheck);			
			schedService.updateSreport2(schedDto);
			
		}
		
		if (srIResult >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insSreport2.do")
	public ResponseEntity<?> insSreport2(@RequestBody Map<String, Object> payload, HttpSession session, @ModelAttribute SchedDTO dto) {
		Map<String, Object> param = new HashMap<>();
		Gson gson = new Gson();
		String jsonStr = gson.toJson(payload.get("checkData"));
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(jsonStr);
		
		String sreStr = gson.toJson(payload.get("sreportData"));
		System.out.println(sreStr);
		JsonObject jsonObject = (JsonObject) jsonParser.parse(sreStr);
		System.out.println(jsonObject.get("userNo"));
		
		dto.setUserNo(jsonObject.get("userNo").getAsInt());
		dto.setCompNo(jsonObject.get("compNo").getAsInt());
		dto.setPrComment(jsonObject.get("prComment").getAsString());
		dto.setPrCheck(jsonObject.get("prCheck").getAsInt());
		dto.setThComment(jsonObject.get("thComment").getAsString());
		dto.setThCheck(jsonObject.get("thCheck").getAsInt());
		
		int srIResult = schedService.insertSreport2(dto);
		
		for(int i =0; i < jsonArray.size(); i++) {
			SchedDTO schedDto = new SchedDTO();
			JsonObject object = (JsonObject) jsonArray.get(i);
			int schedNo = object.get("schedNo").getAsInt();
			int schedCheck = object.get("schedCheck").getAsInt();
			schedDto.setSchedNo(schedNo);
			schedDto.setSchedCheck(schedCheck);
			schedService.updateSreport(schedDto);
			
			//sales 세팅	
			int salesNo = object.get("schedNo").getAsInt();
			int salesCheck = object.get("schedCheck").getAsInt();
			schedDto.setSalesNo(salesNo);
			schedDto.setSalesCheck(salesCheck);
			schedService.updateSreport1(schedDto);
			
			//techd 세팅
			int techdNo = object.get("schedNo").getAsInt();
			int techdCheck = object.get("schedCheck").getAsInt();
			schedDto.setTechdNo(techdNo);
			schedDto.setTechdCheck(techdCheck);			
			schedService.updateSreport2(schedDto);
		}
		
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
