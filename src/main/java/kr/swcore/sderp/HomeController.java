package kr.swcore.sderp;

import java.time.LocalDate;
import java.util.List;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.account.service.AccountService;
import kr.swcore.sderp.common.dto.DeptToPlanTblDTO;
import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.common.service.DeptToPlanTblService;
import kr.swcore.sderp.techd.service.TechdService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.cont.service.ContService;
import kr.swcore.sderp.cust.dto.CustDTO;
import kr.swcore.sderp.cust.service.CustService;
import kr.swcore.sderp.notice.service.NoticeService;
import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.product.service.ProductService;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.salesTarget.service.SalesTargetService;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.user.dto.UserDTO;
import kr.swcore.sderp.user.service.UserService;
import kr.swcore.sderp.util.SessionInfoGet;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	NoticeService noticeService;
	
	@Inject
	CustService custService;
	
	@Inject
	UserService userService;
	
	@Inject
	ProductService productService;
	
	@Inject 
	SoppService soppService;
	
	@Inject
	SalesService salesService;

	@Inject
	CodeService codeService;
	
	@Inject
	ContService contService;

	@Inject
	SalesTargetService salesTargetService;

	@Inject
	TechdService techdService;

	@Inject
	AccountService accountService;

	@Inject
	DeptToPlanTblService deptToPlanTblService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		if(userId != null){
			return "redirect:/myboard.do";
		} else {
			return "user/login";
		}
	}
	
	
	@RequestMapping("/testview.do")
	public String testview() {
		return "code/listview";
	}
	
	@RequestMapping("/manager_book.do")
	public String manager_book() {
		return "/manager_book";
	}

	@RequestMapping("/myboard.do")
	public ModelAndView refresh(HttpSession session, ModelAndView mav) {
		long beforeTime = System.currentTimeMillis();
		PageDTO pageDTO = new PageDTO();
		pageDTO.setLimit(40);
		pageDTO.setOffset(0);
		mav.addObject("sopplist", soppService.listSopp(session, pageDTO));
		mav.addObject("contlist", contService.listCont(session, pageDTO, null));
		
		mav.addObject("request_vat", accountService.request_vat(session));
		mav.addObject("request_payment", accountService.request_payment(session));
		mav.addObject("request_payment_boss", accountService.request_payment_boss(session));
		mav.addObject("request_attlist", accountService.request_attlist(session));
		
		Integer orgId = (Integer)session.getAttribute("orgId");
		List<DeptToPlanTblDTO> deptToPlanTblDTOList = deptToPlanTblService.listWithOrgId(orgId);
		for(int i=0; i<deptToPlanTblDTOList.size(); i++){
			String tableName = deptToPlanTblDTOList.get(i).getTableName();
			if(tableName.equalsIgnoreCase("swc_sales")){
				mav.addObject("saleslist", salesService.listSales(session, pageDTO));
			} else if(tableName.equalsIgnoreCase("swc_techd")){
				mav.addObject("techdlist", techdService.listTechd(session, pageDTO));
			}
		}
		if(deptToPlanTblDTOList == null || deptToPlanTblDTOList.size() <=0) {
			mav.addObject("saleslist", salesService.listSales(session, pageDTO));
		}
		
		mav.addObject("noticelist", noticeService.listNotice(session, pageDTO));
		mav.addObject("graph1",salesTargetService.listSalesTargetYearTotalSalesIndividual(session, null));
		mav.setViewName("board/myboard");
		long afterTime = System.currentTimeMillis();
		long millisDiffTime = afterTime - beforeTime;
		logger.info("/myboard.do (millis) : " + millisDiffTime);
		return mav;
	}
	
	@RequestMapping("/sidemenu/menu1.do")
	public String menu1() {
		return "sidemenu/menu1";
	}
	
	@RequestMapping("/sidemenu/menu2.do")
	public String menu2() {
		return "sidemenu/menu2";
	}
	
	@RequestMapping("/sidemenu/menu3.do")
	public String menu3() {
		return "sidemenu/menu3";
	}
	
	@RequestMapping("/sidemenu/menu4.do")
	public String menu4() {
		return "sidemenu/menu4";
	}
	
	@RequestMapping("/manual_detail/introduction.do")
	public String introduction() {
		return "manual_detail/introduction";
	}
	
	@RequestMapping("/manual_detail/calendar_menual.do")
	public String calendar_menual() {
		return "manual_detail/calendar_menual";
	}
	
	@RequestMapping("/manual_detail/sales_menual.do")
	public String sales_menual() {
		return "manual_detail/sales_menual";
	}
	
	@RequestMapping("/manual_detail/contract_menual.do")
	public String contract_menual() {
		return "manual_detail/contract_menual";
	}
	
	@RequestMapping("/manual_detail/contract_menual2.do")
	public String contract_menual2() {
		return "manual_detail/contract_menual2";
	}
	
	@RequestMapping("/manual_detail/bill_account_sample_menual.do")
	public String bill_account_sample_menual() {
		return "manual_detail/bill_account_sample_menual";
	}
	
	@RequestMapping("/manual_detail/maintenance_menual.do")
	public String maintenance_menual() {
		return "manual_detail/maintenance_menual";
	}
	
	@RequestMapping("/manual.do")
	public String manual() {
		return "manual/manual";
	}
	
	
	

	@RequestMapping("/modal/popup.do")
	public ModelAndView modal(@RequestParam Map<String, Object> params, Model model, ModelAndView mav, HttpSession session, HttpServletRequest servletRequest) {
		String rtn = "";
		String popId = (String)params.get("popId"); 
		
		if("cust".equals(popId)) {
			List<CustDTO> list=custService.listCust(session);
			model.addAttribute("list",list);
			rtn = "modal/custList";
		}
		else if("user_data".equals(popId)) {
			String userName = String.valueOf(params.get("userName")); 
			List<UserDTO> list = userService.listuser_data(userName);
			model.addAttribute("list",list);
			rtn = "modal/user_attendance";
		}
		else if("billCust".equals(popId)) {
			List<CustDTO> list=custService.listCust(session);
			model.addAttribute("list",list);
			rtn = "modal/billCustList";
		}
		else if("productdataListSalesInOutCust".equals(popId)) {
			List<CustDTO> list=custService.listCust(session);
			model.addAttribute("list",list);
			rtn = "modal/productdataListSalesInOutCust";
		}
		else if("productdataListSalesEstimateCust".equals(popId)) {
			List<CustDTO> list=custService.listCust(session);
			model.addAttribute("list",list);
			rtn = "modal/productdataListSalesEstimateCust";
		}
		else if("endCust".equals(popId)) {
			List<CustDTO> list=custService.listCust(session);
			model.addAttribute("list",list);
			rtn = "modal/endCustList";
		}
		else if("user".equals(popId)) {
			List<UserDTO> list=userService.userList(session);
			model.addAttribute("list",list);
			rtn = "modal/userList";
		}
		else if("secondUser".equals(popId)) {
			List<UserDTO> list=userService.userList(session);
			model.addAttribute("list",list);
			rtn = "modal/secondUserList";
		}
		else if("sopp".equals(popId)) {
			List<SoppDTO> list=soppService.listSopp(session, null);
			model.addAttribute("list",list);
			rtn = "modal/soppList";
		}

		else if("sales".equals(popId)) {
			List<SalesDTO> list=salesService.listSales(session, null);
			model.addAttribute("list",list);
			rtn = "modal/salesList";
		}

		else if("buyr".equals(popId)) {
//			List<CustDTO> list=custService.listBuyr(session);
			List<CustDTO> list=custService.listCust(session);
			model.addAttribute("list",list);
			rtn = "modal/buyrList";
		}

		else if("ptnc".equals(popId)) {
//			List<CustDTO> list=custService.listPtnc(session);
			List<CustDTO> list=custService.listCust(session);
			model.addAttribute("list",list);
			rtn = "modal/ptncList";
		}
		
		else if("bacVatB".equals(popId)) {
			  String baclogId_s = (String)params.get("baclogId"); 
			  int baclogId = Integer.parseInt(baclogId_s);
			  model.addAttribute("baclogId", baclogId);
			rtn = "modal/bacVatListB";
		}
		else if("bacVatB_spending_resolution".equals(popId)) {
			AccountDTO dto = new AccountDTO();
			LocalDate now = LocalDate.now();
			int compNo = SessionInfoGet.getCompNo(session);
			String regSDate_modal = String.valueOf(params.get("regSDate_modal")).equals("") || String.valueOf(params.get("regSDate_modal")).equals("null") ? now.getYear() + "-01-01" : String.valueOf(params.get("regSDate_modal"));
			String regEDate_modal = String.valueOf(params.get("regEDate_modal")).equals("") || String.valueOf(params.get("regEDate_modal")).equals("null") ? now.getYear() + "-12-31" : String.valueOf(params.get("regEDate_modal"));
			dto.setCompNo(compNo);
			dto.setRegSDate_modal(regSDate_modal);
			dto.setRegEDate_modal(regEDate_modal);
            List<AccountDTO> list = accountService.modalVatListB(dto);
            model.addAttribute("list",list);
			rtn = "modal/bacVatList_spending_resolution";
		}

		else if("bacVatS".equals(popId)) {
			String baclogId_s = (String)params.get("baclogId"); 
			int baclogId = Integer.parseInt(baclogId_s);
			model.addAttribute("baclogId", baclogId);
			rtn = "modal/bacVatListS";
		}

		else if("supply".equals(popId)) {
			List<CustDTO> list=custService.listCust(session);
			model.addAttribute("list",list);
			rtn = "modal/supplyList";
		}

		else if("product".equals(popId)) {
			List<ProductDTO> list=productService.listProduct(session);
			model.addAttribute("list",list);
			rtn = "modal/productList";
		}
		
		else if("code01".equals(popId)) {
			List<CodeDTO> list=codeService.listCode01(session);
			model.addAttribute("list",list);
			rtn = "modal/code01List";
		}

		else if("code02".equals(popId)) {
			List<CodeDTO> list=codeService.listCode02(session);
			model.addAttribute("list",list);
			rtn = "modal/code02List";
		}
		
		else if("cont".equals(popId)) {
			List<ContDTO> list=contService.listCont(session, null, null);
			model.addAttribute("list",list);
			rtn = "modal/contList";
		}

		else if("vatB".equals(popId)) {
			List<AccountDTO> list = accountService.modalVatB(session);
			model.addAttribute("list",list);
			rtn = "modal/vatListB";
		}

		else if("vatS".equals(popId)) {
			List<AccountDTO> list = accountService.modalVatS(session);
			model.addAttribute("list",list);
			rtn = "modal/vatListS";
		}
		
		else if("custmem".equals(popId)) {
			Integer compNo = Integer.valueOf((String) params.get("compNo")); 
			List<CustDTO> list = custService.listCustmember(compNo);
			model.addAttribute("list", list);
			rtn = "modal/custmemberList";
		}

		else if("endCustmem".equals(popId)) {
			Integer compNo = Integer.valueOf((String) params.get("compNo"));
			List<CustDTO> list = custService.listCustmember(compNo);
			model.addAttribute("list", list);
			rtn = "modal/endCustmemberList";
		}
		
		else if("productGoodsCategory".equals(popId)) {
			//Integer compNo = Integer.valueOf((String) params.get("compNo"));
			List<ProductDTO> list = productService.listProductGoodsCategory(session);
			model.addAttribute("list", list);
			rtn = "modal/productGoodsCategory";
		}
		else if("custVatListModal".equals(popId)) {
			//Integer compNo = Integer.valueOf((String) params.get("compNo"));
			AccountDTO dto = new AccountDTO();
			LocalDate now = LocalDate.now();
			
			Integer custNo = Integer.parseInt(String.valueOf(params.get("custNo"))); 
			Integer compNo = Integer.parseInt(String.valueOf(params.get("compNo")));
			String vatType = String.valueOf(params.get("vatType"));
			dto.setCustNo(custNo);
			dto.setCompNo(compNo);
			dto.setVatType(vatType);
			
			if(params.get("modalType").equals("cust") && !params.get("modalFlag").equals("0")) {
				String vatIssueDateFrom = String.valueOf(params.get("vatIssueDateFrom")) != "" ? String.valueOf(params.get("vatIssueDateFrom")) : now.getYear() + "-01-01";
				String vatIssueDateTo = String.valueOf(params.get("vatIssueDateTo")) != "" ? String.valueOf(params.get("vatIssueDateTo")) : now.getYear() + "-12-31";
				dto.setVatIssueDateFrom(vatIssueDateFrom);
				dto.setVatIssueDateTo(vatIssueDateTo);
			}
			
			List<AccountDTO> list = accountService.custVatListModal(dto);
			model.addAttribute("list", list);
			rtn = "modal/custVatListModal";
		}
		else if("cardAddModal".equals(popId)) {
			//Integer compNo = Integer.valueOf((String) params.get("compNo"));
			int compNo = SessionInfoGet.getCompNo(session);
			Integer userNo = Integer.valueOf((String) params.get("userNo"));
			AccountDTO dto = new AccountDTO();
			dto.setCompNo(compNo);
			dto.setUserNo(userNo);
			List<AccountDTO> list = accountService.treqCardList(dto);
			model.addAttribute("list", list);
			rtn = "modal/treqCardList";
		}
		else if("docDrawModal".equals(popId)) {
			//Integer compNo = Integer.valueOf((String) params.get("compNo"));
			List<AccountDTO> list = accountService.listbac(session);
			model.addAttribute("list", list);
			rtn = "modal/docDrawModal";
		}
		else if("contVatSetModal".equals(popId)) {
			//Integer compNo = Integer.valueOf((String) params.get("compNo"));
			rtn = "modal/contVatSetModal";
		}
		
		logger.debug(rtn);
		
		mav.setViewName(rtn);
		return mav;
	}
	@RequestMapping("/modal/popup1.do")
	public ModelAndView modal1(@RequestParam Map<String, Object> params, Model model, ModelAndView mav, HttpSession session, HttpServletRequest servletRequest) {
		String rtn = "";
		String vatSerial = (String)params.get("popId"); 

		List<AccountDTO> list = accountService.modalbB(vatSerial);
		model.addAttribute("list", list);
		rtn = "modal/vatSerialList";

		logger.debug(rtn);
		
		mav.setViewName(rtn);
		return mav;
	}
	@RequestMapping("/modal/popup2.do")
	public ModelAndView modal2(@RequestParam Map<String, Object> params, Model model, ModelAndView mav, HttpSession session, HttpServletRequest servletRequest) {
		String rtn = "";
		String bacId = (String)params.get("popId");
		List<AccountDTO> list=accountService.bac_connect_list(bacId);
		List<AccountDTO> secound_list=accountService.new_bac_connect_list(bacId);
		List<AccountDTO> list_secound = accountService.list_secound_modalVatB_secound(bacId);
		model.addAttribute("list",list);
		model.addAttribute("secound_list",secound_list);
		model.addAttribute("list_secound",list_secound);
		rtn = "modal/bac_connect_list";

		logger.debug(rtn);
		
		mav.setViewName(rtn);
		return mav;
	}
}