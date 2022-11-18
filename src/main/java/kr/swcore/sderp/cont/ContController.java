package kr.swcore.sderp.cont;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.DTD;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.sopp.service.SoppdataService;
import kr.swcore.sderp.techd.service.TechdService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.service.ContService;

@Controller
@RequestMapping("/cont/*")

public class ContController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContController.class);
	
	@Inject
	ContService contService;
	
	@Inject
	CodeService codeService;

	@Inject
	SoppService soppService;

	@Inject
	SoppdataService soppdataService;

	@Inject
	SalesService salesService;

	@Inject
	TechdService techdService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav,
							 @RequestParam(value = "custNo", required = false) Integer custNo,
							 @RequestParam(value = "ptncNo", required = false) Integer ptncNo,
							 @RequestParam(value = "supplyNo", required = false) Integer supplyNo,
							 @RequestParam(value = "buyrNo", required = false) Integer buyrNo,
							 @RequestParam(value = "contTitle", required = false) String contTitle,
							 @RequestParam(value = "contType", required = false) String contType,
							 @RequestParam(value = "targetDatefrom", required = false) String targetDatefrom,
							 @RequestParam(value = "targetDateto", required = false) String targetDateto,
							 @RequestParam(value = "userName", required = false) String userName,
							 @RequestParam(value = "freemaintSdate", required = false) String freemaintSdate,
							 @RequestParam(value = "freemaintEdate", required = false) String freemaintEdate,
							 @RequestParam(value = "regSDate", required = false) String regSDate,
							 @RequestParam(value = "regEDate", required = false) String regEDate) {
		if(custNo != null || ptncNo != null || supplyNo != null || buyrNo != null || contTitle != null || contType != null || targetDatefrom != null || targetDateto != null
				|| userName != null || freemaintSdate != null || freemaintEdate != null || regSDate != null || regEDate != null){
			ContDTO dto = new ContDTO();
			if(custNo != null) dto.setCustNo(custNo);
			if(ptncNo != null) dto.setPtncNo(ptncNo);
			if(supplyNo != null) dto.setSupplyNo(supplyNo);
			if(buyrNo != null) dto.setBuyrNo(buyrNo);
			if(contTitle != null) dto.setContTitle(contTitle);
			if(contType != null) dto.setContType(contType);
			if(targetDatefrom != null) dto.setTargetDatefrom(targetDatefrom);
			if(targetDateto != null) dto.setTargetDateto(targetDateto);
			if(userName != null) dto.setUserName(userName);
			if(freemaintSdate != null) dto.setFreemaintSdate(freemaintSdate);
			if(freemaintEdate != null) dto.setFreemaintEdate(freemaintEdate);
			if(regSDate != null) dto.setRegSDate(regSDate);
			if(regEDate != null) dto.setRegEDate(regEDate);
			mav.addObject("list", contService.listconCont(session, dto));
		} else {
			ContDTO dto = new ContDTO();
			mav.addObject("list", contService.listCont(session, null, dto));
		}

		mav.setViewName("cont/list");
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("contType", codeService.listContType(session));
		return mav;
	}
	
	@RequestMapping("listcon.do")
	public ModelAndView listcon(HttpSession session, ModelAndView mav, @ModelAttribute ContDTO dto) {
		mav.setViewName("cont/list");
		mav.addObject("preserveSearchCondition", "Y");
		mav.addObject("list", contService.listconCont(session, dto));
		return mav;
	}

	@RequestMapping("/detail/{contNo}")
	public ModelAndView detail(HttpSession session, @PathVariable("contNo") int contNo, ModelAndView mav) {
		mav.setViewName("cont/detail");
		ContDTO contDTO = new ContDTO();
		contDTO = contService.detailCont(contNo);
		int soppNo = contDTO.getSoppNo();
		mav.addObject("contDto", contDTO);
		mav.addObject("dto", soppService.detailSopp(soppNo));
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.addObject("dtodata02", soppdataService.listSoppdata02(soppNo));
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("salesinsopp",salesService.listSalesinsopp(session, soppNo));
		mav.addObject("techdinsopp",techdService.listTechdinsopp(session, soppNo));
		mav.addObject("soppFiles",soppService.listFile(soppNo));
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("contType", codeService.listContType(session));
		mav.addObject("areaType", codeService.listAreaType(session));
		return mav;
	}

	@RequestMapping("write.do")
	public ModelAndView write(HttpSession session, ModelAndView mav) {
		mav.setViewName("cont/write");
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("contType", codeService.listContType(session));
		mav.addObject("areaType", codeService.listAreaType(session));
		return mav;
	}

	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = contService.insertCont(session, dto);
		param.put("code", (String.valueOf(schedInsertResult)));
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int contUpdate = contService.updateCont(dto);
		if (contUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("delete.do")
	public ResponseEntity<?> delete(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int contUpdate = contService.deleteCont(dto.getContNo());
		if (contUpdate >0) {
			param.put("code","10001");
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping(value = "graph4", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listAjaxGraph4(HttpSession session, @RequestBody String param) throws JsonProcessingException {
		Map<String, Object> rtn = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		ContDTO contDTO = mapper.readValue(param, ContDTO.class);
		rtn = contService.listSalesTargetMonthIndividual(session, contDTO);
		return new Gson().toJson(rtn);
	}
}
