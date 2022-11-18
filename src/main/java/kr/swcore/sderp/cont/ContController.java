package kr.swcore.sderp.cont;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.sopp.service.SoppdataService;
import kr.swcore.sderp.techd.service.TechdService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.account.service.AccountService;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.dto.ContFileDataDTO;
import kr.swcore.sderp.cont.service.ContService;
import kr.swcore.sderp.cust.service.CustService;

@Controller
@RequestMapping("/cont/*")

public class ContController {
	
	@Inject
	CustService custService;
	
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
	
	@Inject
	AccountService accountService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav,
							 @RequestParam(value = "custNo", required = false) Integer custNo,
							 @RequestParam(value = "ptncNo", required = false) Integer ptncNo,
							 @RequestParam(value = "cntrctMth", required = false) String cntrctMth,
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
				|| cntrctMth != null || userName != null || freemaintSdate != null || freemaintEdate != null || regSDate != null || regEDate != null){
			ContDTO dto = new ContDTO();
			if(custNo != null) dto.setCustNo(custNo);
			if(ptncNo != null) dto.setPtncNo(ptncNo);
			if(cntrctMth != null) dto.setCntrctMth(cntrctMth);
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
		mav.addObject("listSum", contService.listSumCont(session));
		mav.addObject("contType", codeService.listContType(session));
		mav.addObject("listCust", custService.listCust(session));
		return mav;
	}
	
	@RequestMapping("listcon.do")
	public ModelAndView listcon(HttpSession session, ModelAndView mav, @ModelAttribute ContDTO dto) {
		mav.setViewName("cont/list");
		mav.addObject("preserveSearchCondition", "Y");
		mav.addObject("list", contService.listconCont(session, dto));
		return mav;
	}

	@RequestMapping("/detail/{soppNo}/{contNo}")
	public ModelAndView detail(HttpSession session, @PathVariable("contNo") int contNo, @PathVariable("soppNo") int soppNo, SoppDTO data, ModelAndView mav, AccountDTO dto) {
		mav.setViewName("cont/detail");
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
		mav.addObject("soppFiles",soppService.listFile(soppNo));
		mav.addObject("sessionCust", custService.sessionSelectCust(session));
		mav.addObject("vatData01", accountService.vatSelectList(contNo));
		mav.addObject("data", accountService.connect_cont_and_vat(session, contNo));
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		dto.setContNo(contNo);
		
		List <AccountDTO> listusercontribution = accountService.listusercontribution(dto);
		List <AccountDTO> listusercontributionCnt = accountService.listusercontributionCnt(dto);
		mav.addObject("listusercontribution", listusercontribution);
		mav.addObject("listusercontributionCnt", listusercontributionCnt.get(0).getCount());
		data.setContNo(contNo);
		data.setSoppNo(soppNo);
		mav.addObject("dtodata01", soppdataService.listSoppdata01_08(data));
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
	
	@RequestMapping("iowrite.do/{soppNo}")
	public ModelAndView iowrite(@PathVariable("soppNo") int soppNo, HttpSession session, ModelAndView mav) {
		mav.setViewName("slip/iowrite");
		mav.addObject("contractType", codeService.listContractType(session));
			mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
			if(soppdataService.listSoppdata01(soppNo).isEmpty()) {
				mav.addObject("dtodata01", soppdataService.listSoppdata011(soppNo));
				if(soppdataService.listSoppdata011(soppNo).isEmpty()) {
					mav.addObject("dtodata01", soppdataService.listSoppdata011_1(soppNo));
					System.out.println("계약은 없고 영업기회만 있고 그 영업기회의 매입매출내역이 있을때");
					if(soppdataService.listSoppdata011_1(soppNo).isEmpty())  {
						mav.addObject("dtodata01", soppdataService.listSoppdata011_2(soppNo));
						System.out.println("계약은 없고 영업기회만 있고 그 영업기회의 매입매출내역이 없을때");
					}
				}
			}
		System.out.println(mav);
		mav.addObject("soppParam", soppNo);
		return mav;
	}
	
	@RequestMapping("iowrite.do/{soppNo}/{contNo}")
	public ModelAndView iowrite(@PathVariable("soppNo") int soppNo, @PathVariable("contNo") int contNo, HttpSession session, ModelAndView mav) {
		mav.setViewName("slip/iowrite");
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("dtodata01", soppdataService.listContdata(contNo));
		System.out.println("soppNo의 값이 10005223일 때");
		if(soppdataService.listContdata(contNo).isEmpty()) {
			mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
			System.out.println("정상적인 select");
			if(soppdataService.listSoppdata01(soppNo).isEmpty()) {
				mav.addObject("dtodata01", soppdataService.listSoppdata011(soppNo));
				if(soppdataService.listSoppdata011(soppNo).isEmpty()) {
					mav.addObject("dtodata01", soppdataService.listSoppdata011_1(soppNo));
					System.out.println("계약은 없고 영업기회만 있고 그 영업기회의 매입매출내역이 있을때");
					if(soppdataService.listSoppdata011_1(soppNo).isEmpty())  {
						mav.addObject("dtodata01", soppdataService.listSoppdata011_2(soppNo));
						System.out.println("계약은 없고 영업기회만 있고 그 영업기회의 매입매출내역이 없을때");
					}
				}
			}
		}
		System.out.println(mav);
		mav.addObject("soppParam", soppNo);
		return mav;
	}
	
	@RequestMapping("iodetail/{soppNo}")
	public ModelAndView iodetail(HttpSession session,@PathVariable("soppNo") int soppNo, ModelAndView mav) {
		mav.setViewName("slip/iodetail");
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("dtodata01", soppdataService.listSoppdata01(soppNo));
		mav.addObject("dtodata02", soppdataService.listSoppdata011(soppNo));
		mav.addObject("soppParam", soppNo);
		return mav;
	}
	
	@RequestMapping("iolist.do")
	public ModelAndView iolist(HttpSession session, ModelAndView mav,
			@RequestParam(value = "custNo", required = false) Integer custNo,
			@RequestParam(value = "userName", required = false) String userName) {
		
		if(custNo != null || userName != null){
			SoppdataDTO dto = new SoppdataDTO();
    		if(custNo != null) dto.setCustNo(custNo);
    		if(userName != null) dto.setUserName(userName);
    		mav.addObject("listsum", soppdataService.listSearchIO(session, dto));
    	}else {
    		SoppdataDTO dto = new SoppdataDTO();
    		mav.addObject("listsum",soppdataService.listIOsum(session, dto));
    	}
		
		mav.addObject("contractType", codeService.listContractType(session));
		mav.setViewName("slip/iolist");
		
		return mav;
	}
	
	@RequestMapping("iolistall.do")
	public ModelAndView iolistall(HttpSession session, ModelAndView mav, @ModelAttribute SoppdataDTO dto,
			@RequestParam(value = "userNo", required = false) String userNo,
			@RequestParam(value = "custNo", required = false) String custNo,
			@RequestParam(value = "dataType", required = false) String dataType,
			@RequestParam(value = "vatDatefrom", required = false) String vatDatefrom,
			@RequestParam(value = "vatDateto", required = false) String vatDateto,
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "cntrctMth", required = false) String cntrctMth,
			@RequestParam(value = "freemaintSdate", required = false) String freemaintSdate,
			@RequestParam(value = "freemaintEdate", required = false) String freemaintEdate
			) {
		mav.setViewName("slip/iolistall");
		mav.addObject("contractType", codeService.listContractType(session));
		mav.addObject("listall",soppdataService.listIO(session, dto));
		return mav;
	}
	
	@RequestMapping("slipwrite.do")
	public ModelAndView slipwrite(HttpSession session, ModelAndView mav) {
		mav.setViewName("slip/slipwrite");
		mav.addObject("contractType", codeService.listContractType(session));
		return mav;
	}
	
	@RequestMapping("sliplist.do")
	public ModelAndView sliplist(HttpSession session, ModelAndView mav) {
		mav.setViewName("slip/sliplist");
		mav.addObject("contractType", codeService.listContractType(session));
		return mav;
	}

	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = contService.insertCont(session, dto);
		param.put("code", (String.valueOf(schedInsertResult)));
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insert_maintenance.do")
	public ResponseEntity<?> insert_maintenance(HttpSession session, @ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		contService.insert_maintenance(session, dto);
		contService.update_maintenance(dto);
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int contUpdate = contService.updateCont(dto);
		contService.updateSopp_buyrno(dto);
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
	
	@RequestMapping("/uploadfile/{contNo}")
	public ResponseEntity<?> uploadFile(HttpSession session, @PathVariable("contNo") int contNo, @ModelAttribute ContDTO dto, MultipartHttpServletRequest fileList) throws IOException {
		int uploadFile = contService.uploadFile(session, contNo, fileList);
		Map<String, Object> param = new HashMap<>();
		if(uploadFile > 0) {
			param.put("code", "10001");
			param.put("data",contService.listFile(contNo));
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("/deleteFile")
	public ResponseEntity<?> removeFile(HttpSession session, @ModelAttribute ContFileDataDTO dto){
		int uploadFile = contService.deleteFile(session, dto);
		Map<String, Object> param = new HashMap<>();
		if(uploadFile > 0) {
			param.put("code", "10001");
			param.put("data", contService.listFile(dto.getContNo()));
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("/downloadfile")
	public ResponseEntity<?> downloadFile(HttpSession session, HttpServletResponse response, @ModelAttribute ContFileDataDTO dto) throws IOException {
		ContFileDataDTO contFile = contService.downloadFile(dto);
		String fileName = contFile.getFileName();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.add("Content-Disposition", new String(fileName.getBytes("UTF-8"), "ISO-8859-1"));
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(contFile.getFileContent(), headers, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("extInsert.do")
	public ResponseEntity<?> extInsert(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = contService.extInsert(dto);
		param.put("code", (String.valueOf(schedInsertResult)));
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("extAttUpdate.do")
	public ResponseEntity<?> extAttUpdate(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int contUpdate = contService.extAttUpdate(dto);
		if (contUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("defaultgradata01.do")
	public ResponseEntity<?> defaultgradata01(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		List <ContDTO> defaultgradata01 = contService.defaultgradata01();
		param.put("data", defaultgradata01);
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("contAmtUpdate.do")
	public ResponseEntity<?> contAmtUpdate(@ModelAttribute ContDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int contUpdate = contService.contAmtUpdate(dto);
		if (contUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	@RequestMapping("insert_contribution_percent.do")
	public ResponseEntity<?> insert_contribution_percent(@ModelAttribute AccountDTO dto) {
		Map<String, Object> param = new HashMap<>();
		accountService.insert_contribution_percent(dto);
		return ResponseEntity.ok(param);
	}

}
