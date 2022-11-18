package kr.swcore.sderp;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.DeptToPlanTblDTO;
import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.common.service.DeptToPlanTblService;
import kr.swcore.sderp.techd.service.TechdService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
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
import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.product.service.ProductService;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sales.service.SalesService;
import kr.swcore.sderp.salesTarget.service.SalesTargetService;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.sopp.service.SoppService;
import kr.swcore.sderp.user.dto.UserDTO;
import kr.swcore.sderp.user.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	
	@RequestMapping("/myboard.do")
	public ModelAndView refresh(HttpSession session, ModelAndView mav) {
		long beforeTime = System.currentTimeMillis();
		PageDTO pageDTO = new PageDTO();
		pageDTO.setLimit(40);
		pageDTO.setOffset(0);
		mav.addObject("sopplist", soppService.listSopp(session, pageDTO));
		mav.addObject("contlist", contService.listCont(session, pageDTO, null));

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


	@RequestMapping("/modal/popup.do")
	public ModelAndView modal(@RequestParam Map<String, Object> params, Model model, ModelAndView mav, HttpSession session, HttpServletRequest servletRequest) {
		String rtn = "";
		String popId = (String)params.get("popId"); 
		if("cust".equals(popId)) {
			List<CustDTO> list=custService.listCust(session);
			model.addAttribute("list",list);
			rtn = "modal/custList";
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

		else if("supply".equals(popId)) {
//			List<CustDTO> list=custService.listSupply(session);
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

		logger.debug(rtn);
		
		mav.setViewName(rtn);
		return mav;
	}
}