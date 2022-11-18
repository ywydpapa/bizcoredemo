package kr.swcore.sderp.techd;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.techd.dto.TechdDTO;
import kr.swcore.sderp.techd.service.TechdService;

@Controller

@RequestMapping("/techd/*")
public class TechdController {
	
	private static final Logger logger = LoggerFactory.getLogger(TechdController.class);
	
	@Inject
	TechdService techdService;
	
	@Inject
	CodeService codeService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("techd/list");
		mav.addObject("techdSteps", codeService.listTechdSteps(session));
		mav.addObject("contractType",codeService.listContractType(session));
		mav.addObject("list", techdService.listTechd(session, null));
		mav.addObject("first","Y");
		return mav;
	}

	@RequestMapping(value = "list/data", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody
	String listData(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(techdService.listTechd(session, param, request, response));
	}
	
	@RequestMapping("listcon.do")
	public ModelAndView listcon(HttpSession session, ModelAndView mav, TechdDTO dto) {
		mav.setViewName("techd/list");
		mav.addObject("preserveSearchCondition", "Y");
		mav.addObject("list", techdService.listconTechd(session, dto));
		return mav;
	}

	@RequestMapping("/detail/{techdNo}")
	public ModelAndView detail(@PathVariable("techdNo") int techdNo,
							   ModelAndView mav,
							   HttpSession session,
							   @RequestParam(value = "simple", required = false) String simple,
							   @RequestParam(value = "userNo", required = false) Integer userNo,
							   @RequestParam(value = "userName", required = false) String userName,
							   @RequestParam(value = "custNo", required = false) Integer custNo,
							   @RequestParam(value = "custName", required = false) String custName,
							   @RequestParam(value = "custmemberNo", required = false) Integer custmemberNo,
							   @RequestParam(value = "custmemberName", required = false) String custmemberName,
							   @RequestParam(value = "targetDatefrom", required = false) String targetDatefrom,
							   @RequestParam(value = "targetDateto", required = false) String targetDateto,
							   @RequestParam(value = "regSDate", required = false) String regSDate,
							   @RequestParam(value = "regEDate", required = false) String regEDate,
							   @RequestParam(value = "techdDesc", required = false) String techdDesc,
							   @RequestParam(value = "search", required = false) String search
							   ) {
		mav.setViewName("techd/detail");
		mav.addObject("dto", techdService.detailTechd(techdNo));
		mav.addObject("sprttype", codeService.listSprttype(session));
		mav.addObject("sprtstat", codeService.listSprtstat(session));
		mav.addObject("contractType", codeService.listContractType(session));
		if(simple != null){
			mav.addObject("simple","Y");
		}
		return mav;
	}
	
	@RequestMapping("/detail2/{techdNo}")
	public ModelAndView detail2(@PathVariable("techdNo") int techdNo,
							   ModelAndView mav,
							   HttpSession session,
							   @RequestParam(value = "simple", required = false) String simple,
							   @RequestParam(value = "userNo", required = false) Integer userNo,
							   @RequestParam(value = "userName", required = false) String userName,
							   @RequestParam(value = "custNo", required = false) Integer custNo,
							   @RequestParam(value = "custName", required = false) String custName,
							   @RequestParam(value = "custmemberNo", required = false) Integer custmemberNo,
							   @RequestParam(value = "custmemberName", required = false) String custmemberName,
							   @RequestParam(value = "targetDatefrom", required = false) String targetDatefrom,
							   @RequestParam(value = "targetDateto", required = false) String targetDateto,
							   @RequestParam(value = "regSDate", required = false) String regSDate,
							   @RequestParam(value = "regEDate", required = false) String regEDate,
							   @RequestParam(value = "techdDesc", required = false) String techdDesc,
							   @RequestParam(value = "search", required = false) String search
							   ) {
		mav.setViewName("techd/detail2");
		mav.addObject("dto", techdService.detailTechd(techdNo));
		mav.addObject("sprttype", codeService.listSprttype(session));
		mav.addObject("sprtstat", codeService.listSprtstat(session));
		mav.addObject("contractType", codeService.listContractType(session));
		if(simple != null){
			mav.addObject("simple","Y");
		}
		return mav;
	}


	@RequestMapping("write.do")
	public ModelAndView write(@RequestParam(value = "simple", required = false) String simple, HttpSession session, ModelAndView mav) {
		mav.addObject("sprttype", codeService.listSprttype(session));
		mav.addObject("sprtstat", codeService.listSprtstat(session));
		mav.addObject("contractType", codeService.listContractType(session));
		if(simple != null){
			mav.addObject("simple","Y");
		}
		mav.setViewName("techd/write");
		return mav;
	}

	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute TechdDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = techdService.insertTechd(session, dto);
		param.put("code", (String.valueOf(schedInsertResult))); 
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute TechdDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int techdUpdate = techdService.updateTechd(dto);
		if (techdUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute TechdDTO dto) {
			Map<String, Object> param = new HashMap<>();
			int techdUpdate = techdService.deleteTechd(dto.getTechdNo());
			if (techdUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}


}
