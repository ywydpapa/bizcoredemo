package kr.swcore.sderp.sopp;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.dto.SoppFileDataDTO;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.sopp.service.SoppdataService;
import kr.swcore.sderp.techd.service.TechdService;
import kr.swcore.sderp.user.dto.UserDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller

@RequestMapping("/sopp/*")
public class SoppController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(SoppController.class);
	
	@Inject
	SoppService soppService;
	
	@Inject
	SoppdataService soppdataService;
	
	@Inject
	SalesService salesService;
	
	@Inject 
	CodeService codeService;
	
	@Inject
	TechdService techdService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("sopp/list");
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("list", soppService.listSopp(session, null));
		mav.addObject("first","Y");
		return mav;
	}

	@RequestMapping(value = "list/data", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody
	String listData(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(soppService.listSopp(session, param, request, response));
	}

	@RequestMapping("listcon.do")
	public ModelAndView listcon(HttpSession session, ModelAndView mav, SoppDTO dto) {
		mav.setViewName("sopp/list");
		mav.addObject("list", soppService.listconSopp(session, dto));
		mav.addObject("preserveSearchCondition", "Y");
		return mav;
	}

	@RequestMapping("list2.do")
	public ModelAndView list2(HttpSession session, ModelAndView mav) {
		mav.setViewName("sopp/list2");
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("list", soppService.listSopp2(session));
		mav.addObject("first","Y");
		return mav;
	}

	@RequestMapping(value = "list2/data", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody
	String list2Data(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(soppService.listSopp2(session, param, request, response));
	}

	@RequestMapping("list2con.do")
	public ModelAndView list2con(HttpSession session, ModelAndView mav, SoppDTO dto) {
		mav.setViewName("sopp/list2");
		mav.addObject("preserveSearchCondition", "Y");
		mav.addObject("list", soppService.listconSopp2(session, dto));
		return mav;
	}

	@RequestMapping("listdata01.do")
	public ModelAndView listdata01(@RequestParam int soppNo, ModelAndView mav) {
		mav.setViewName("sopp/list");
		mav.addObject("listdata01", soppdataService.listSoppdata01(soppNo));
		return mav;
	}

	@RequestMapping("/detail/{soppNo}")
	public ModelAndView detail(@PathVariable("soppNo") int soppNo, ModelAndView mav, HttpSession session) {
		mav.addObject("dto", soppService.detailSopp(soppNo));
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.addObject("dtodata02", soppdataService.listSoppdata02(soppNo));
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("salesinsopp",salesService.listSalesinsopp(session, soppNo));
		mav.addObject("techdinsopp",techdService.listTechdinsopp(session, soppNo));
		mav.addObject("soppFiles",soppService.listFile(soppNo));
		mav.setViewName("sopp/detail");
		return mav;
	}

	@RequestMapping("/detail2/{soppNo}")
	public ModelAndView detail2(@PathVariable("soppNo") int soppNo, ModelAndView mav, HttpSession session) {
		mav.addObject("dto", soppService.detailSopp(soppNo));
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.addObject("dtodata02", soppdataService.listSoppdata02(soppNo));
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.addObject("sstatuslist", codeService.listSstatus(session));
		mav.addObject("salesinsopp",salesService.listSalesinsopp(session, soppNo));
		mav.setViewName("sopp/detail2");
		return mav;
	}

	@RequestMapping("/inoutlist/{soppNo}")
	public ModelAndView inoutlist(@PathVariable("soppNo") int soppNo, ModelAndView mav) {
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.setViewName("sopp/inoutlist");
		return mav;
	}

	@RequestMapping("/qutylist/{soppNo}")
	public ModelAndView qutylist(@PathVariable("soppNo") int soppNo, ModelAndView mav) {
		mav.addObject("dtodata02", soppdataService.listSoppdata02(soppNo));
		mav.setViewName("sopp/qutylist");
		return mav;
	}
	
	@RequestMapping("/uploadfile/{soppNo}")
	public ResponseEntity<?> uploadFile(HttpSession session, @PathVariable("soppNo") int soppNo, @ModelAttribute SoppDTO dto, MultipartHttpServletRequest fileList) throws IOException {
		int uploadFile = soppService.uploadFile(session, soppNo, fileList);
		Map<String, Object> param = new HashMap<>();
		if(uploadFile > 0) {
			param.put("code", "10001");
			param.put("data",soppService.listFile(soppNo));
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("/deleteFile")
	public ResponseEntity<?> removeFile(HttpSession session, @ModelAttribute SoppFileDataDTO dto){
		int uploadFile = soppService.deleteFile(session, dto);
		Map<String, Object> param = new HashMap<>();
		if(uploadFile > 0) {
			param.put("code", "10001");
			param.put("data", soppService.listFile(dto.getSoppNo()));
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("/downloadfile")
	public ResponseEntity<?> downloadFile(HttpSession session, HttpServletResponse response, @ModelAttribute SoppFileDataDTO dto) throws IOException {
		SoppFileDataDTO soppFile = soppService.downloadFile(dto);
		String fileName = soppFile.getFileName();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.add("Content-Disposition", new String(fileName.getBytes("utf-8"), "ISO-8859-1"));
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(soppFile.getFileContent(), headers, HttpStatus.OK);
		
		return entity;
	}

	@RequestMapping("write.do")
	public ModelAndView write(HttpSession session, ModelAndView mav) {
		mav.addObject("saleslist", codeService.listSalestype(session));
		UserDTO userDTO =  new UserDTO();
		userDTO.setUserName((String) session.getAttribute("userName"));
		userDTO.setUserNo(Integer.valueOf((String)session.getAttribute("userNo")));
		mav.addObject("userInfo",userDTO);
		mav.addObject("saleslist", codeService.listSalestype(session));
		mav.setViewName("sopp/write");
		return mav;
	}

	@RequestMapping("write2.do")
	public String write2() {
		return "sopp/write2";
	}
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, HttpServletRequest request, @ModelAttribute SoppDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = soppService.insertSopp(session, dto);
		param.put("code", (String.valueOf(schedInsertResult)));
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update2Sopp.do")
	public ResponseEntity<?> update2Sopp(HttpSession session, @ModelAttribute SoppDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int soppInsert = soppService.update2Sopp(session, dto);
		if (soppInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping(value ="Aprv.do", method= RequestMethod.POST)
	public ResponseEntity<?> Aprv(HttpSession session, @RequestBody SoppDTO dto) {
		Map<String, Object> param = new HashMap<>();
		param = soppService.updateAprvOrReject(session, dto);
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insertdata01.do")
	public ResponseEntity<?> insertdata01(HttpSession session, @ModelAttribute SoppdataDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int soppdataInsert = soppdataService.insertSoppdata01(session, dto);
		if (soppdataInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	@RequestMapping("insertdata02.do")
	public ResponseEntity<?> insertdata02(HttpSession session,@ModelAttribute SoppdataDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int soppdataInsert = soppdataService.insertSoppdata01(session, dto);
		if (soppdataInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("updatedata01.do")
	public ResponseEntity<?> updatedata01(HttpSession session, @ModelAttribute SoppdataDTO dto, HttpServletRequest servletRequest) {
		Map<String, Object> param = new HashMap<>();
		int soppdataInsert = soppdataService.updateSoppdata01(session, dto, servletRequest);
		if (soppdataInsert >0) {
			param.put("code","10001");
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	@RequestMapping("update1.do")
	public ResponseEntity<?> update(@RequestParam Map<String, Object> params) {
		logger.info("sopp update1 logger : " + params.toString());
		
		Map<String, Object> param = new HashMap<>();
		//int soppUpdate = soppService.updateSopp(dto);
		int soppUpdate = 1;
		if (soppUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(HttpSession session, @ModelAttribute SoppDTO dto) {
		logger.info("sopp logger : " + dto.toString());
		
		Map<String, Object> param = new HashMap<>();
		int soppUpdate = soppService.updateSopp(session, dto);
		if (soppUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute SoppDTO dto) {
			Map<String, Object> param = new HashMap<>();
			int soppUpdate = soppService.deleteSopp(dto.getSoppNo());
			if (soppUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}
			
	@RequestMapping("deletedata01.do")
	public ResponseEntity<?> delete(@ModelAttribute SoppdataDTO dto) {
	Map<String, Object> param = new HashMap<>();
	int soppdataUpdate = soppdataService.deleteSoppdata01(dto.getSoppdataNo());
	if (soppdataUpdate >0) {
		param.put("code","10001"); 
	}
	else {param.put("code","20001");
	}
	return ResponseEntity.ok(param);
}


	@RequestMapping("deletedata02.do")
	public ResponseEntity<?> delete02(@ModelAttribute SoppdataDTO dto) {
	Map<String, Object> param = new HashMap<>();
	int soppdataUpdate = soppdataService.deleteSoppdata01(dto.getSoppdataNo());
	if (soppdataUpdate >0) {
		param.put("code","10001"); 
	}
	else {param.put("code","20001");
	}
	return ResponseEntity.ok(param);
}


}
