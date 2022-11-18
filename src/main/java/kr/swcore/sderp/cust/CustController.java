package kr.swcore.sderp.cust;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import kr.swcore.sderp.cont.service.ContService;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.techd.service.TechdService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cust.dto.CustDTO;
import kr.swcore.sderp.cust.service.CustService;

@Controller

@RequestMapping("/cust/*")
public class CustController {


	@Inject
	CustService custService;
	
	@Inject
	CodeService codeService;

	@Inject
	ContService contService;

	@Inject
	TechdService techdService;

	@Inject
	SalesService salesService;
	
	@RequestMapping("list.do")
	public String custList(HttpSession session, Model model) {
		List<CustDTO> list=custService.listCust(session);
		model.addAttribute("list",list);
		return "cust/list";
	}

	@RequestMapping("/detail/{custNo}")
	public ModelAndView detail(HttpSession session, @PathVariable("custNo") int custNo, ModelAndView mav) {
		mav.addObject("dto", custService.detailCust(custNo));
		mav.addObject("dto02", custService.detailCust02(custNo));
		mav.addObject("dto03", custService.detailCust03(custNo));
		mav.addObject("dto04", custService.detailCust04(custNo));
		mav.addObject("saletype", codeService.listSaletype());
		mav.addObject("comptype", codeService.listComptype(session));
		mav.addObject("memberlist", custService.listCustmember(custNo));
		mav.addObject("contlist",contService.listContbycust(custNo));
		mav.addObject("techdlist",techdService.listTechdbycust(custNo));
		mav.addObject("saleslist",salesService.listSalesbycust(custNo));
		mav.setViewName("cust/detail");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="refresh.do", method = RequestMethod.POST)
	public List<CustDTO> memberlist(int custNo){
		List<CustDTO> result = custService.listCustmember(custNo);
		return result;
	}
	
	@RequestMapping("/details/{custNo}")
	public ModelAndView details(@PathVariable("custNo") int custNo, ModelAndView mav) {
		mav.setViewName("cust/details");
		mav.addObject("dto", custService.detailsCust(custNo));
		return mav;
	}

	@RequestMapping("write.do")
	public String write() {
		return"cust/write";
	}
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(@ModelAttribute CustDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int custInsert = custService.insertCust(dto);
		if (custInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insert02.do")
	public ResponseEntity<?> insert02(@ModelAttribute CustDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int custInsert02 = custService.insertCust02(dto);
		if (custInsert02 >=0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("/listcustM/{custNo}")
	public ModelAndView listcustM(@PathVariable("custNo") int custNo, ModelAndView mav) {
		mav.addObject("dtodata01", custService.listCustmember(custNo));
		mav.setViewName("cust/custMlist");
		return mav;
	}

	@RequestMapping("insert03.do")
	public ResponseEntity<?> insert03(@ModelAttribute CustDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int custInsert03 = custService.insertCust03(dto);
		if (custInsert03 >=0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("insert04.do")
	public ResponseEntity<?> insert04(@ModelAttribute CustDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int custInsert04 = custService.insertCust04(dto);
		if (custInsert04 >=0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute CustDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int custUpdate = custService.updateCust01(dto);
		if (custUpdate >0) {
			param.put("code","10001"); 
		}
		else {
			param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update05.do")
	public ResponseEntity<?> update05(@ModelAttribute CustDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int custUpdate05 = custService.updateCust05(dto);
		if (custUpdate05 >0) {
			param.put("code","10001"); 
		}
		else {
			param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	
	@RequestMapping("delete.do")
	public ResponseEntity<?> delete(@ModelAttribute CustDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int custUpdate = custService.deleteCust(dto.getCustNo());
		if (custUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("tempSelectCustInsert.do")
	public ResponseEntity<?> tempSelectCustInsert(@ModelAttribute CustDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int custUpdate = custService.tempSelectCustInsert(dto);
		if (custUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@ResponseBody
	@RequestMapping(value="custCheck.do", method = RequestMethod.POST)
	public int custCheck(CustDTO dto) {
		int result = custService.custCheck(dto);
		return result;
	}

	@RequestMapping(value = "custNameCheck", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody String custNameCheck(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(custService.listcustNameCheck(session, param, request, response));
	}

	@RequestMapping(value = "simpleRegister", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody String simpleRegister(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(custService.insertSimpleRegister(session, param, request, response));
	}
}
