package kr.swcore.sderp.mis;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.mis.dto.MisDTO;
import kr.swcore.sderp.mis.service.MisService;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;

import org.springframework.context.weaving.DefaultContextLoadTimeWeaver;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/mis/*")
public class MisController {

    @Inject
    MisService misService;
    
    @Inject
    CodeService codeService;

    @RequestMapping("/hrdutylist.do")
    public ModelAndView hrdutylist(HttpSession session, MisDTO dto, ModelAndView mav) {
        mav.addObject("dutyList", misService.listHRduty(session,dto));
        mav.setViewName("mis/hrdutylist");
        return mav;
    }

    @RequestMapping("/hrcostlist.do")
    public ModelAndView hrcostlist(HttpSession session,MisDTO dto,  ModelAndView mav) {
        mav.addObject("costList", misService.listHRcost(session, dto));
        mav.setViewName("mis/hrcostlist");
        return mav;
    }

    @RequestMapping("/soppstatuslist.do")
    public ModelAndView soppstatuslist(HttpSession session, MisDTO dto, ModelAndView mav) {
    	mav.addObject("sstatuslist", codeService.listSstatus(session));
        mav.addObject("soppList", misService.listSopp(session, dto));
        mav.setViewName("mis/soppstatuslist");
        return mav;
    }

    @RequestMapping("/soppcostlist.do")
    public ModelAndView soppcostlist(HttpSession session, MisDTO dto, ModelAndView mav) {
        mav.addObject("costList", misService.listSoppcost(session, dto));
        mav.setViewName("mis/soppcostlist");
        return mav;
    }
    @RequestMapping("/soppmarginlist.do")
    public ModelAndView soppmarginlist(HttpSession session, ContDTO dto, ModelAndView mav) {
        mav.addObject("marginList", misService.listSoppmargin(session, dto));
        mav.setViewName("mis/soppmarginlist");
        return mav;
    }

//    @RequestMapping("/bacinoutlist.do")
//    public ModelAndView bacinoutlist(HttpSession session, MisDTO dto, ModelAndView mav) {
//        mav.addObject("inoutList", misService.listBacinout(session,dto));
//        mav.setViewName("mis/bacinoutlist");
//        return mav;
//    }
    
    @RequestMapping("/bacstatuslist.do")
    public ModelAndView bacstatuslist(HttpSession session, MisDTO dto,  ModelAndView mav) {
        mav.addObject("statusList", misService.listBacstatus(session,dto));
        mav.setViewName("mis/bacstatuslist");
        return mav;
    }
    @RequestMapping("/bacstatuslist.do/{select_regDate}")
    public ModelAndView bacstatuslist_select(@PathVariable("select_regDate") String select_regDate, HttpSession session, MisDTO dto,  ModelAndView mav) {
    	dto.setSelect_regDate(select_regDate);
        mav.addObject("statusList", misService.listBacstatus_select(session,dto));
        mav.addObject("select_regDate", select_regDate);
        mav.setViewName("mis/bacstatuslist");
        return mav;
    }
    
    
    @RequestMapping("/sumSvatlist.do")
    public ModelAndView sumSvatlist(HttpSession session, ModelAndView mav,
            @RequestParam(value = "vatBuyerCustNo", required = false) Integer vatBuyerCustNo,
            @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
            @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo, 
            @RequestParam(value = "selectYear", required = false) Integer selectYear) {
    	if(vatBuyerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null){
			AccountDTO dto = new AccountDTO();
			LocalDate now = LocalDate.now();
			int year = now.getYear();
			if(vatBuyerCustNo != null) dto.setVatBuyerCustNo(vatBuyerCustNo);
			if(vatIssueDateFrom != null) {
				dto.setVatIssueDateFrom(vatIssueDateFrom);
			}else {
				dto.setVatIssueDateFrom(year + "-01-01");
			}
		
			if(vatIssueDateTo != null) {
				dto.setVatIssueDateTo(vatIssueDateTo);
			}else {
				dto.setVatIssueDateTo(year + "-12-31");
			}
		
			if(selectYear != null) {
				dto.setSelectYear(selectYear);
			}else {
				dto.setSelectYear(year);
			}
			List <AccountDTO> vatList = misService.sumSvatSearch(session, dto);
			List <AccountDTO> sumSvat_sub = misService.sumSvat_sub(session, dto);
			for(int i = 0; i < sumSvat_sub.size(); i++) {
				for(int s = 0; s < vatList.size(); s++) {
					if(sumSvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
						vatList.get(s).setSerialTotalS(sumSvat_sub.get(i).getModal_receive_data());
					}
				}
			}
			mav.addObject("vatList", vatList);
		
			} else {
				AccountDTO dto = new AccountDTO();
				LocalDate now = LocalDate.now();
				int year = now.getYear();
				dto.setVatIssueDateFrom(year + "-01-01");
				dto.setVatIssueDateTo(year + "-12-31");
				dto.setSelectYear(year);
				List <AccountDTO> sumSvat_sub = misService.sumSvat_sub(session, dto);
				List <AccountDTO> vatList = misService.sumSvat(session, dto);
		
				for(int i = 0; i < sumSvat_sub.size(); i++) {
					for(int s = 0; s < vatList.size(); s++) {
						if(sumSvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
							vatList.get(s).setSerialTotalS(sumSvat_sub.get(i).getModal_receive_data());
						}
					}
				}
			mav.addObject("vatList", vatList);
		}
	
		mav.setViewName("mis/sumSvatlist");
		return mav;
    }
    
    @RequestMapping("sumBvatlist.do")
    public ModelAndView sumBvatList(HttpSession session, ModelAndView mav,
                                @RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
                                @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
                                @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
                                @RequestParam(value = "selectYear", required = false) Integer selectYear) {
        if(vatSellerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null){
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
            if(vatIssueDateFrom != null) {
            	dto.setVatIssueDateFrom(vatIssueDateFrom);
            }else {
            	dto.setVatIssueDateFrom(year + "-01-01");
            }
            
            if(vatIssueDateTo != null) {
            	dto.setVatIssueDateTo(vatIssueDateTo);
            }else {
            	dto.setVatIssueDateTo(year + "-12-31");
            }
            
            if(selectYear != null) {
            	dto.setSelectYear(selectYear);
            }else {
            	dto.setSelectYear(year);
            }
            List <AccountDTO> vatList =  misService.sumBvatSearch(session, dto);
            List <AccountDTO> sumBvat_sub = misService.sumBvat_sub(session, dto);
            for(int i = 0; i < sumBvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumBvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalB(sumBvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            mav.addObject("vatList", vatList);
        } else {
            AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
            dto.setSelectYear(year);
            
            List <AccountDTO> vatList =  misService.sumBvat(session, dto);
            List <AccountDTO> sumBvat_sub = misService.sumBvat_sub(session, dto);
            for(int i = 0; i < sumBvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumBvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalB(sumBvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            
            mav.addObject("vatList", vatList);
        }
        mav.setViewName("mis/sumBvatlist");
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
    		mav.addObject("listsum", misService.listSearchIO(session, dto));
    	}else {
    		SoppdataDTO dto = new SoppdataDTO();
    		mav.addObject("listsum",misService.listIOsum(session, dto));
    	}
		
		mav.addObject("contractType", codeService.listContractType(session));
		mav.setViewName("mis/iolist");
		
		return mav;
	}
    
    @RequestMapping("bacinoutlist.do")
    public ModelAndView bacinoutlist(HttpSession session, ModelAndView mav) {
    	List<AccountDTO> listBac = misService.listbac(session);
    	
    	System.out.println(listBac);
    	
        mav.addObject("bacList", listBac);
        mav.setViewName("mis/bacinoutlist");
        return mav;
    }
    
    @ResponseBody
    @RequestMapping("bacSelectList.do")
    public List<AccountDTO> bacSelectList(@ModelAttribute AccountDTO dto){
    	List<AccountDTO> accList = misService.bacSelectList(dto);
    	List<AccountDTO> inOutList = misService.bacInOutList(dto);
    	
    	for(int i = 0; i < accList.size(); i++) {
    		accList.get(i).setInAmt(inOutList.get(i).getInListAmt());
    		accList.get(i).setOutAmt(inOutList.get(i).getOutListAmt());
    	}
    	
    	return accList;
    }
/*
    @RequestMapping("/saleslist.do")
    public ModelAndView saleslist(HttpSession session, ModelAndView mav) {
        mav.addObject("salesList", misService.listHRduty(session));
        mav.setViewName("mis/saleslist");
        return mav;
    }
    @RequestMapping("/ledgerlist.do")
    public ModelAndView ledgerlist(HttpSession session, ModelAndView mav) {
        mav.addObject("ledgerList", misService.listHRduty(session));
        mav.setViewName("mis/ledgerlist");
        return mav;
    }*/

}
