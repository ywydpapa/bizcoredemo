package kr.swcore.sderp.techd;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.service.ContService;
import kr.swcore.sderp.cust.service.CustService;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.sopp.service.SoppdataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.techd.dto.TechdDTO;
import kr.swcore.sderp.techd.service.TechdService;
import kr.swcore.sderp.user.service.UserService;

@Controller

@RequestMapping("/techd/*")
public class TechdController {
	
	private static final Logger logger = LoggerFactory.getLogger(TechdController.class);
	
	@Inject
	TechdService techdService;
	
	@Inject
	CodeService codeService;

	@Inject
	ContService contService;

	@Inject
	SalesService salesService;

	@Inject
	SoppService soppService;

	@Inject
	SoppdataService soppdataService;
	
	@Inject
	CustService custService;
	
	@Inject
	UserService userService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("techd/list");
		mav.addObject("techdSteps", codeService.listTechdSteps(session));
		mav.addObject("contractType",codeService.listContractType(session));
		mav.addObject("list", techdService.listTechd(session, null));
		mav.addObject("listUser", userService.userList(session));
		mav.addObject("listCust", custService.listCust(session));
		mav.addObject("first","Y");
		return mav;
	}

	@RequestMapping("contlist.do")
	public ModelAndView listcont3m(HttpSession session, ModelAndView mav) {
		mav.setViewName("techd/listcont");
		mav.addObject("list", contService.listCont3m());
		mav.addObject("first","Y");
		return mav;
	}

	@RequestMapping("/contextdetail/{soppNo}/{contNo}")
	public ModelAndView detail(HttpSession session, @PathVariable("contNo") int contNo, @PathVariable("soppNo") int soppNo, SoppDTO data, ModelAndView mav) {
		mav.setViewName("techd/contextdetail");
		ContDTO contDTO = new ContDTO();
		contDTO = contService.detailCont(contNo);
		mav.addObject("contDto", contDTO);
		mav.addObject("dto", soppService.detailSopp(soppNo));
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.addObject("dtodata02", soppdataService.listSoppdata011(soppNo));
		mav.addObject("dtodata02", soppdataService.listSoppdata02(soppNo));
		mav.addObject("contType", codeService.listContType(session));
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("salesinsopp",salesService.listSalesinsopp(session, soppNo, contNo));
		mav.addObject("techdinsopp",techdService.listTechdinsopp(session, soppNo, contNo));
		mav.addObject("contFiles", contService.listFile(contNo));
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.addObject("dtodata02", soppdataService.listSoppdata011(soppNo));
		data.setContNo(contNo);
		data.setSoppNo(soppNo);
		mav.addObject("dtodata01", soppdataService.listSoppdata01_08(data));
		return mav;
	}

	@RequestMapping("bbuycontlist.do")
	public ModelAndView bbuycont(HttpSession session, ModelAndView mav) {
		mav.setViewName("techd/listbbuycont");
		mav.addObject("list", contService.listCont3m());
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
