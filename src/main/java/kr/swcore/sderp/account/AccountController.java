package kr.swcore.sderp.account;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.account.service.AccountService;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.util.SessionInfoGet;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/acc/*")
public class AccountController {

    @Inject
    AccountService accountService;

    @Inject
    CodeService codeService;

    @RequestMapping("vatlist.do")
    public ModelAndView vatList(HttpSession session, ModelAndView mav, 
    							@RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
								 @RequestParam(value = "vatType", required = false) String vatType,
								 @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
								 @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
								 @RequestParam(value = "vatSerial", required = false) String vatSerial,
								 @RequestParam(value = "vatRemark", required = false) String vatRemark) {
    	if(vatSellerCustNo != null || vatType != null || vatIssueDateFrom != null || vatIssueDateTo != null || vatSerial != null || vatRemark != null){
			AccountDTO dto = new AccountDTO();
			if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
			if(vatType != null) dto.setVatType(vatType);
			if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
			if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
			if(vatSerial != null) dto.setVatSerial(vatSerial);
			if(vatRemark != null) dto.setVatRemark(vatRemark);
			mav.addObject("vatList", accountService.listvatSearch(session, dto));
		} else {
			AccountDTO dto = new AccountDTO();
			mav.addObject("vatList", accountService.listvat(session, dto));
		}
        mav.setViewName("settle/vatlist");
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
            List <AccountDTO> vatList =  accountService.sumBvatSearch(session, dto);
            List <AccountDTO> sumBvat_sub = accountService.sumBvat_sub(session, dto);
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
            
            List <AccountDTO> vatList =  accountService.sumBvat(session, dto);
            List <AccountDTO> sumBvat_sub = accountService.sumBvat_sub(session, dto);
            for(int i = 0; i < sumBvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumBvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalB(sumBvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            
            mav.addObject("vatList", vatList);
        }
        mav.setViewName("settle/sumBvatlist");
        return mav;
    }
    
    @RequestMapping("sumSvatlist.do")
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
			List <AccountDTO> vatList = accountService.sumSvatSearch(session, dto);
			List <AccountDTO> sumSvat_sub = accountService.sumSvat_sub(session, dto);
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
				List <AccountDTO> sumSvat_sub = accountService.sumSvat_sub(session, dto);
				List <AccountDTO> vatList = accountService.sumSvat(session, dto);
		
				for(int i = 0; i < sumSvat_sub.size(); i++) {
					for(int s = 0; s < vatList.size(); s++) {
						if(sumSvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
							vatList.get(s).setSerialTotalS(sumSvat_sub.get(i).getModal_receive_data());
						}
					}
				}
			mav.addObject("vatList", vatList);
		}
	
		mav.setViewName("settle/sumSvatlist");
		return mav;
	}

    @RequestMapping("custVatListS.do")
    public ModelAndView custVatListS(HttpSession session, ModelAndView mav,
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
            List <AccountDTO> vatList = accountService.sumSvatSearch(session, dto);
            List <AccountDTO> sumSvat_sub = accountService.sumSvat_sub(session, dto);
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
            List <AccountDTO> sumSvat_sub = accountService.sumSvat_sub(session, dto);
            List <AccountDTO> vatList = accountService.custVatListS(session, dto);
            
            for(int i = 0; i < sumSvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumSvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalS(sumSvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            mav.addObject("vatList", vatList);
        }
        
        mav.setViewName("settle/custVatListS");
        return mav;
    }
    
    @RequestMapping("custVatListB.do")
    public ModelAndView custVatListB(HttpSession session, ModelAndView mav,
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
            List <AccountDTO> vatList =  accountService.sumBvatSearch(session, dto);
            List <AccountDTO> sumBvat_sub = accountService.sumBvat_sub(session, dto);
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
            
            List <AccountDTO> vatList =  accountService.custVatListB(session, dto);
            List <AccountDTO> sumBvat_sub = accountService.sumBvat_sub(session, dto);
            for(int i = 0; i < sumBvat_sub.size(); i++) {
            	for(int s = 0; s < vatList.size(); s++) {
            		if(sumBvat_sub.get(i).getCustNo() == vatList.get(s).getCustNo()) {
            			vatList.get(s).setSerialTotalB(sumBvat_sub.get(i).getModal_receive_data());
            		}
            	}
            }
            
            mav.addObject("vatList", vatList);
        }
        mav.setViewName("settle/custVatListB");
        return mav;
    }
    
    @RequestMapping("vatlistB.do")
    public ModelAndView vatListB(HttpSession session, ModelAndView mav, 
            @RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
            @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
            @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
            @RequestParam(value = "vatTotalFrom", required = false) BigDecimal vatTotalFrom,
            @RequestParam(value = "vatTotalTo", required = false) BigDecimal vatTotalTo) {
    	if(vatSellerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null || vatTotalFrom != null || vatTotalTo != null){
			AccountDTO dto = new AccountDTO();
			if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
			if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
			if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
			if(vatTotalFrom != null) dto.setVatTotalFrom(vatTotalFrom);
			if(vatTotalTo != null) dto.setVatTotalTo(vatTotalTo);
			mav.addObject("vatList", accountService.listvatSearchB(session, dto));
		} else {
			AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
			mav.addObject("vatList", accountService.listvatB(session, dto));
		}
        mav.setViewName("settle/vatListB");
        return mav;
    }
    
    @RequestMapping("vatlistS.do")
    public ModelAndView vatListS(HttpSession session, ModelAndView mav, 
            @RequestParam(value = "vatBuyerCustNo", required = false) Integer vatBuyerCustNo,
            @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
            @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
            @RequestParam(value = "vatTotalFrom", required = false) BigDecimal vatTotalFrom,
            @RequestParam(value = "vatTotalTo", required = false) BigDecimal vatTotalTo) {
    	if(vatBuyerCustNo != null || vatIssueDateFrom != null || vatIssueDateTo != null || vatTotalFrom != null || vatTotalTo != null){
			AccountDTO dto = new AccountDTO();
			if(vatBuyerCustNo != null) dto.setVatBuyerCustNo(vatBuyerCustNo);
			if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
			if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
			if(vatTotalFrom != null) dto.setVatTotalFrom(vatTotalFrom);
			if(vatTotalTo != null) dto.setVatTotalTo(vatTotalTo);
			mav.addObject("vatList", accountService.listvatSearchS(session, dto));
		} else {
			AccountDTO dto = new AccountDTO();
            LocalDate now = LocalDate.now();
            int year = now.getYear();
            dto.setVatIssueDateFrom(year + "-01-01");
            dto.setVatIssueDateTo(year + "-12-31");
			mav.addObject("vatList", accountService.listvatS(session, dto));
		}
        mav.setViewName("settle/vatListS");
        return mav;
    }

    @RequestMapping("vatlistT.do")
    public ModelAndView vatListT(HttpSession session, ModelAndView mav,
                                 @RequestParam(value = "vatSellerCustNo", required = false) Integer vatSellerCustNo,
                                 @RequestParam(value = "vatType", required = false) String vatType,
                                 @RequestParam(value = "vatIssueDateFrom", required = false) String vatIssueDateFrom,
                                 @RequestParam(value = "vatIssueDateTo", required = false) String vatIssueDateTo,
                                 @RequestParam(value = "vatSerial", required = false) String vatSerial,
                                 @RequestParam(value = "vatRemark", required = false) String vatRemark) {
        if(vatSellerCustNo != null || vatType != null || vatIssueDateFrom != null || vatIssueDateTo != null || vatSerial != null || vatRemark != null){
            AccountDTO dto = new AccountDTO();
            if(vatSellerCustNo != null) dto.setVatSellerCustNo(vatSellerCustNo);
            if(vatType != null) dto.setVatType(vatType);
            if(vatIssueDateFrom != null) dto.setVatIssueDateFrom(vatIssueDateFrom);
            if(vatIssueDateTo != null) dto.setVatIssueDateTo(vatIssueDateTo);
            if(vatSerial != null) dto.setVatSerial(vatSerial);
            if(vatRemark != null) dto.setVatRemark(vatRemark);
            mav.addObject("vatList", accountService.listvatSearchT(session, dto));
        } else {
            AccountDTO dto = new AccountDTO();
            mav.addObject("vatList", accountService.listvatT(session, dto));
        }
        mav.setViewName("settle/vatListT");
        return mav;
    }
    
	/*
	 * @RequestMapping("custVatList.do") public ModelAndView custVatList(HttpSession
	 * session, ModelAndView mav) { mav.setViewName("settle/custVatList"); return
	 * mav; }
	 */
    
    @ResponseBody
    @RequestMapping("custVatListCount.do")
    public List<AccountDTO> custVatListCount(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
    	List<AccountDTO> count = accountService.custVatListCount(dto);
        return count;
    }
    
    @ResponseBody
    @RequestMapping("custSelectVatList.do")
    public List<AccountDTO> custSelectVatList(@ModelAttribute AccountDTO dto)
    {
    	System.out.println("�뜲�씠�듃 : " + dto.getVatIssueDateFrom());
    	LocalDate now = LocalDate.now();
        int year = now.getYear();
        
    	if(dto.getVatIssueDateFrom() == null) {
    		dto.setVatIssueDateFrom(year + "-01-01");
    	}
    	
    	if(dto.getVatIssueDateTo() == null) {
    		dto.setVatIssueDateTo(year + "-12-31");
    	}
    	
    	List<AccountDTO> count = accountService.custSelectVatList(dto);
        return count;
    }
    
    @ResponseBody
    @RequestMapping("baccheck.do")
    public AccountDTO baccheck(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
        AccountDTO vserial = accountService.checkBac(dto);
        return vserial;
    }
    
    @ResponseBody
    @RequestMapping("cardCheck.do")
    public AccountDTO cardCheck(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
        AccountDTO cardserial = accountService.cardCheck(dto);
        return cardserial;
    }

    @RequestMapping("baclist.do")
    public ModelAndView bacList(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listbac(session));
        mav.setViewName("settle/baclist");
        return mav;
    }

    @RequestMapping("regbac.do")
    public ModelAndView regbac(HttpSession session, ModelAndView mav) {
        mav.addObject("vatList", accountService.listbac(session));
        mav.addObject("bnkcd", codeService.listCode003("BANKCD"));
        mav.addObject("baccd", codeService.listCode003("BACTYPE"));
        mav.setViewName("settle/regbaclist");
        return mav;
    }
    
    @RequestMapping("regCard.do")
    public ModelAndView regCard(HttpSession session, ModelAndView mav) {
        mav.addObject("cardList", accountService.listCard(session));
        mav.addObject("userList", accountService.userList(session));
        mav.addObject("bnkcd", codeService.listCode003("BANKCD"));
        mav.addObject("baccd", codeService.listCode003("BACTYPE"));
        mav.setViewName("settle/regcardlist");
        return mav;
    }

    @RequestMapping("bacdetail.do")
    public ModelAndView bacDetail(HttpSession session, ModelAndView mav) {
        mav.addObject("bacList", accountService.listbac(session));
        mav.setViewName("settle/bacdetail");
        return mav;
    }
    
    @RequestMapping("check_connect.do")
    public ModelAndView check_connect(HttpSession session, ModelAndView mav) {
        mav.setViewName("settle/check_connect");
        return mav;
    }
    
    @RequestMapping("cardDetail.do")
    public ModelAndView cardDetail(HttpSession session, ModelAndView mav) {
        mav.addObject("cardList", accountService.listCard(session));
        mav.setViewName("settle/carddetail");
        return mav;
    }

    @RequestMapping("bacupdate.do")
    public ModelAndView bacUpload(HttpSession session, ModelAndView mav, @ModelAttribute AccountDTO dto) {
        mav.setViewName("settle/bacupload");
        return mav;
    }
    
    @RequestMapping("cardUpload.do")
    public ModelAndView cardUpload(HttpSession session, ModelAndView mav, @ModelAttribute AccountDTO dto) {
//        mav.addObject("vatList", accountService.listvat(session, dto));
        mav.setViewName("settle/cardupload");
        return mav;
    }
    
    @ResponseBody
    @RequestMapping("listVatBCnt.do")
    public AccountDTO listVatBCnt(@ModelAttribute AccountDTO dto){
    	AccountDTO count = accountService.listVatBCnt(dto);
    	
    	return count;
    }
    
    @ResponseBody
    @RequestMapping("selectVatCust/{vatNo}")
    public AccountDTO selectVatCust(@PathVariable("vatNo") String vatNo) {
    	AccountDTO dto = accountService.selectVatCust(vatNo);
    	
		return dto;
    }

    @ResponseBody
    @RequestMapping("vatcheck.do")
    public AccountDTO vchk(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
        AccountDTO vserial = accountService.checkVat(dto);
        return vserial;
    }

    @ResponseBody
    @RequestMapping("bacSelectList.do")
    public List<AccountDTO> bacSelectList(@ModelAttribute AccountDTO dto){
    	List<AccountDTO> accList = accountService.bacSelectList(dto);
    	
    	return accList;
    }
    
    @ResponseBody
    @RequestMapping("bacCalSelect.do")
    public AccountDTO bacCalSelect(@ModelAttribute AccountDTO dto){
    	AccountDTO accList = accountService.bacCalSelect(dto);
    	
    	return accList;
    }
    
    @ResponseBody
    @RequestMapping("bacSelectListCnt.do")
    public AccountDTO bacSelectListCnt(@ModelAttribute AccountDTO dto){
    	AccountDTO count = accountService.bacSelectListCnt(dto);
    	
    	return count;
    }
    
    @ResponseBody
    @RequestMapping("cardSelectList.do")
    public List<AccountDTO> cardSelectList(@ModelAttribute AccountDTO dto){
    	List<AccountDTO> accList = accountService.cardSelectList(dto);
    	
    	return accList;
    }
    
    @ResponseBody
    @RequestMapping("cardSelectListCount.do")
    public AccountDTO cardSelectListCount(@ModelAttribute AccountDTO dto){
    	AccountDTO count = accountService.cardSelectListCount(dto);
    	
    	return count;
    }
    
    @RequestMapping("vatupload.do")
    public ModelAndView vatUpload(HttpSession session, ModelAndView mav, @ModelAttribute AccountDTO dto) {
		/* mav.addObject("vatList", accountService.listvat(session, dto)); */
        mav.setViewName("settle/vatupload");
        return mav;
    }

    @RequestMapping("vatdetail/{vatId}")
    public ModelAndView vatDetail(@PathVariable("vatId") int vatId, ModelAndView mav) {
        mav.addObject("vatdetail", accountService.detailvat(vatId));
        mav.setViewName("settle/vatdetail");
        return mav;
    }

    @RequestMapping("insertvat.do")
    public ResponseEntity<Object> insertvat(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatIns = accountService.insertVat(dto);
        if(vatIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("insertbac.do")
    public ResponseEntity<Object> insertbac(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatIns = accountService.insertBac(dto);
        if(vatIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("insertCard.do")
    public ResponseEntity<Object> insertCard(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int cardIns = accountService.insertCard(dto);
        if(cardIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("insertbacledger.do")
    public ResponseEntity<Object> insertbacledger(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatIns = accountService.insertBacledger(dto);
        if(vatIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("insertCardLedger.do")
    public ResponseEntity<Object> insertCardLedger(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int cardIns = accountService.insertCardLedger(dto);
        if(cardIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("vatStatuschg.do")
    public ResponseEntity<Object> chgvat(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int chgVat = accountService.updvatStat(dto);
        if(chgVat > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("/totalamount/{vatSerial}")
    public String totalamount(@PathVariable("vatSerial") String vatSerial, AccountDTO dto, Model model) {
    	dto.setVatSerial(vatSerial);
    	List<AccountDTO> connect_list = accountService.connect_list(dto);
    	model.addAttribute("connect_list", connect_list);
    	return "settle/totalamount";
    }
    
    @RequestMapping("lastUpdate.do")
    public ResponseEntity<Object> lastUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacIns = accountService.lastUpdate(dto);
        if(bacIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("lastUpdateCard.do")
    public ResponseEntity<Object> lastUpdateCard(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int cardIns = accountService.lastUpdateCard(dto);
        if(cardIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("bacSerialUpdate.do")
    public ResponseEntity<Object> bacSerialUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacIns = accountService.bacSerialUpdate(dto);
        accountService.updatevatlinkedcheck(dto);
        if(bacIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("billInsert.do")
    public ResponseEntity<Object> billInsert(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int billIns = accountService.billInsert(dto);
        if(billIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("sVatToChange.do")
	public ResponseEntity<?> sVatToChange(@ModelAttribute AccountDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int vatUpdate = accountService.sVatToChange(dto);
		if (vatUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
    @RequestMapping("bacCheckConnect.do")
    public ResponseEntity<Object> bacCheckConnect(HttpSession session, @ModelAttribute AccountDTO dto){
    	
        Map<String,Object> param = new HashMap<>();
        //swc_bacledger�쓽 linkDoc 媛믪씠 y媛� �븘�땲怨� ''媛믪씠 �븘�땺�븣
        String datalinkDocno = dto.getLinkDocno();
        String number_linkDoc = accountService.number_linkDoc(dto);
        
        if(!number_linkDoc.equals("y")) {
        	if(!number_linkDoc.equals("n")) {
        		dto.setLinkDocno(number_linkDoc);
        		accountService.change_originlinkDoc(dto);
        		//�뿰寃고븯�뒗 湲덉븸怨� �넻�옣 湲덉븸�씠 �씪移섑븯�뒗 寃쎌슦 s5濡� 蹂�寃�
        		//�븯吏�留� �뿰寃고븯�뒗 湲덉븸�슫 �엳�뒗�뜲 �넻�옣 湲덉븸怨� �씪移섑븯吏� �븡�뒗�떎硫� s3 (酉댄븷 �엯/異쒓툑�씠�씪 �깮媛곹븯硫� �맂�떎.)
        	}
        }
        dto.setLinkDocno(datalinkDocno);
        int bacIns = accountService.bacCheckConnect(dto);
        accountService.updatevatmultilinkedcheck(dto);
        accountService.updatelogIdlink(dto);
        if(bacIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        
        BigDecimal sum = new BigDecimal("0");
        List<AccountDTO> dataprice = accountService.dataprice(dto);
		for(int i=0; i < dataprice.size(); i++) {
			BigDecimal a = dataprice.get(i).getVatTax(); 
			BigDecimal b = dataprice.get(i).getVatAmount();
			sum = sum.add(a.add(b));
		}
		BigDecimal zeroBigDec = new BigDecimal("0");
		List<AccountDTO> totalprice = accountService.total_price(dto);
		BigDecimal in_num = totalprice.get(0).getInAmt();
		BigDecimal out_num = totalprice.get(0).getOutAmt();
		System.out.println("sum===============" + sum);
		System.out.println("zeroBigDec==============" + zeroBigDec);
		System.out.println("in_num=============" + in_num);
		System.out.println("out_num===========" + out_num);
		
		int compareResult = in_num.compareTo(out_num);
		int compareResult_in = sum.compareTo(in_num); 
		int compareResult_in_secound = in_num.compareTo(zeroBigDec);
		int compareResult_out = sum.compareTo(out_num);
		int compareResult_out_secound = out_num.compareTo(zeroBigDec);
		
		//
		if(compareResult > 0) {
			if(compareResult_in < 0){
				if(compareResult_in_secound > 0) {
					for(int i=0; i < totalprice.size(); i++) {
						dto.setLinkDocno(totalprice.get(i).getLinkDocno());
						accountService.update_s3(dto);
					}
				}
				//detail�뿉 �빐�떦�븯�뒗 �떆由ъ뼱�쓽 id媛믪쓣 媛�吏� swc_bacledger�쓽 in湲덉븸�쓣 �빀移섍퀬 swc_vat�쓽 湲덉븸怨� 媛숇떎硫� �빐�떦 �떆由ъ뼱瑜� 媛�吏� swc_vat�쓽 lincked�뒗 0, s5濡� 蹂�寃�.
				List <AccountDTO> checktotalprice_vat_and_detail = accountService.checktotalprice_vat_and_detail(dto);
				BigDecimal total_detail = checktotalprice_vat_and_detail.get(0).getTotal_Amt();
				int finalcompare = sum.compareTo(total_detail);
				if(finalcompare == 0) {
					accountService.update_s5(dto);
					accountService.updatevatmultilinkedcheck(dto);
				}
			}else if(compareResult_in == 0) {
				for(int i=0; i < totalprice.size(); i++) {
					dto.setLinkDocno(totalprice.get(i).getLinkDocno());
					accountService.update_s5(dto);
				}
			}else if(compareResult_in > 0) {
				for(int i=0; i < totalprice.size(); i++) {
					dto.setLinkDocno(totalprice.get(i).getLinkDocno());
					accountService.update_s3(dto);
					accountService.cancelconnect_linkedcheck(dto);
				}
				//detail�뿉 �빐�떦�븯�뒗 �떆由ъ뼱�쓽 id媛믪쓣 媛�吏� swc_bacledger�쓽 in湲덉븸�쓣 �빀移섍퀬 swc_vat�쓽 湲덉븸怨� 媛숇떎硫� �빐�떦 �떆由ъ뼱瑜� 媛�吏� swc_vat�쓽 lincked�뒗 0, s5濡� 蹂�寃�.
				List <AccountDTO> checktotalprice_vat_and_detail = accountService.checktotalprice_vat_and_detail(dto);
				BigDecimal total_detail = checktotalprice_vat_and_detail.get(0).getTotal_Amt();
				int finalcompare = sum.compareTo(total_detail);
				if(finalcompare == 0) {
					accountService.update_s5(dto);
					accountService.updatevatmultilinkedcheck(dto);
				}
			}
		}else if(compareResult < 0) {
			if(compareResult_out == 0) {
				//s5
				for(int i=0; i < totalprice.size(); i++) {
					dto.setLinkDocno(totalprice.get(i).getLinkDocno());
					accountService.update_b5(dto);
				}
			}else if(compareResult_out < 0){
				if(compareResult_out_secound > 0) {
					//s3
					for(int i=0; i < totalprice.size(); i++) {
						dto.setLinkDocno(totalprice.get(i).getLinkDocno());
						accountService.update_b3(dto);
					}
				}
				//detail�뿉 �빐�떦�븯�뒗 �떆由ъ뼱�쓽 id媛믪쓣 媛�吏� swc_bacledger�쓽 in湲덉븸�쓣 �빀移섍퀬 swc_vat�쓽 湲덉븸怨� 媛숇떎硫� �빐�떦 �떆由ъ뼱瑜� 媛�吏� swc_vat�쓽 lincked�뒗 0, s5濡� 蹂�寃�.
				List <AccountDTO> checktotalprice_vat_and_detail_out = accountService.checktotalprice_vat_and_detail_out(dto);
				BigDecimal total_detail = checktotalprice_vat_and_detail_out.get(0).getTotal_Amt();
				int finalcompare = sum.compareTo(total_detail);
				if(finalcompare == 0) {
					accountService.update_b5(dto);
					accountService.updatevatmultilinkedcheck(dto);
				}
			}else if(compareResult_out > 0) {
				for(int i=0; i < totalprice.size(); i++) {
					dto.setLinkDocno(totalprice.get(i).getLinkDocno());
					accountService.update_b3(dto);
					accountService.cancelconnect_linkedcheck(dto);
				}
				//detail�뿉 �빐�떦�븯�뒗 �떆由ъ뼱�쓽 id媛믪쓣 媛�吏� swc_bacledger�쓽 in湲덉븸�쓣 �빀移섍퀬 swc_vat�쓽 湲덉븸怨� 媛숇떎硫� �빐�떦 �떆由ъ뼱瑜� 媛�吏� swc_vat�쓽 lincked�뒗 0, s5濡� 蹂�寃�.
				List <AccountDTO> checktotalprice_vat_and_detail_out = accountService.checktotalprice_vat_and_detail_out(dto);
				BigDecimal total_detail = checktotalprice_vat_and_detail_out.get(0).getTotal_Amt();
				int finalcompare = sum.compareTo(total_detail);
				if(finalcompare == 0) {
					accountService.update_b5(dto);
					accountService.updatevatmultilinkedcheck(dto);
				}
			}
		}
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("bacCheckConnect_modal_update.do")
    public ResponseEntity<Object> bacCheckConnect_modal_update(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        accountService.bacCheckConnect_modal_update(dto);
		List <AccountDTO> check_lincked_last = accountService.check_lincked_last(dto);
		System.out.println(Integer.parseInt(check_lincked_last.get(0).getModal_vatmemo()));
		if(Integer.parseInt(check_lincked_last.get(0).getModal_vatmemo()) == 0) {
			if(check_lincked_last.get(0).getVatStatus().equals("S1") || check_lincked_last.get(0).getVatStatus().equals("S3") || check_lincked_last.get(0).getVatStatus().equals("S5")) {
				accountService.update_s5(dto);
				accountService.updatevatmultilinkedcheck(dto);
			}else if(check_lincked_last.get(0).getVatStatus().equals("B1") || check_lincked_last.get(0).getVatStatus().equals("B3") || check_lincked_last.get(0).getVatStatus().equals("B5")) {
				accountService.update_b5(dto);
				accountService.updatevatmultilinkedcheck(dto);
			}
		}
        return ResponseEntity.ok(param);
    }
    @RequestMapping("bacCheckConnect_modal_baclogId_memo.do")
    public ResponseEntity<Object> bacCheckConnect_modal_baclogId_memo(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        accountService.bacCheckConnect_modal_baclogId_memo(dto);
        
        List <AccountDTO> check_remain_money_from_swc_vat = accountService.check_remain_money_from_swc_vat(dto);
        if(check_remain_money_from_swc_vat.get(0).getModal_vatmemo() == "0"){
        	if(check_remain_money_from_swc_vat.get(0).getVatStatus() == "S1" || check_remain_money_from_swc_vat.get(0).getVatStatus() == "S3") {
        		accountService.update_check_remain_money_from_swc_vat(dto);
        	}else if(check_remain_money_from_swc_vat.get(0).getVatStatus() == "B1" || check_remain_money_from_swc_vat.get(0).getVatStatus() == "B3") {
        		accountService.update_check_remain_money_from_swc_vat_B(dto);
        	}
        }
        
        return ResponseEntity.ok(param);
    }
    
    
    @RequestMapping("connect_link_check_cancel.do")
    public ResponseEntity<Object> connect_link_check_cancel(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        
        //swc_bacledger_detail�뿉 媛��닔
        int listNumber = accountService.connnectlist_Num(dto);
        int detail_Count_equal_baclogId = accountService.detail_Count_equal_baclogId(dto);
        List<AccountDTO> select_vatStatus = accountService.select_vatStatus(dto);
        if(listNumber != 0) {
        	if(detail_Count_equal_baclogId == 1) {
	        	//swc_bacledger�뒗 delete �릺寃� 洹몃━怨� �빐�떦 serial瑜� 媛�吏� swc_vat�� 1濡� 蹂�寃�
	        	accountService.deleteconnectlist(dto);
	        	accountService.cancelconnect_linkedcheck(dto);
	        	if(select_vatStatus.get(0).getVatStatus().equals("S5")) {
	        		accountService.update_vatStatus(dto);
	        	}else if(select_vatStatus.get(0).getVatStatus().equals("S3")) {
	        		accountService.update_vatStatus(dto);
	        	}else if(select_vatStatus.get(0).getVatStatus().equals("B5")) {
	        		accountService.update_vatStatus_B(dto);
	        	}else if(select_vatStatus.get(0).getVatStatus().equals("B3")) {
	        		accountService.update_vatStatus_B(dto);
	        	}
        	}else if(detail_Count_equal_baclogId != 1) {
        		//�엯湲� �씪�븣
        		if(select_vatStatus.get(0).getVatStatus().equals("S5") || select_vatStatus.get(0).getVatStatus().equals("S3")){
	        		accountService.deleteconnectlist_sub(dto);
	        		
	        		BigDecimal sum = new BigDecimal("0");
	        	    	List<AccountDTO> dataprice_secound = accountService.dataprice_secound(dto);
	        			for(int i=0; i < dataprice_secound.size(); i++) {
	        				BigDecimal a = dataprice_secound.get(i).getVatTax(); 
	        				BigDecimal b = dataprice_secound.get(i).getVatAmount();
	        				sum = sum.add(a.add(b));
	        			}
	        		System.out.println("sum=================" + sum);
	        		
	        		List <AccountDTO> checktotalprice_vat_and_detail = accountService.checktotalprice_vat_and_detail(dto);
					BigDecimal total_detail = checktotalprice_vat_and_detail.get(0).getTotal_Amt();
					int finalcompare = sum.compareTo(total_detail);
					System.out.println("finalcompare========================" + finalcompare);
					if(finalcompare == 0) {
						accountService.update_s5(dto);
						accountService.updatevatmultilinkedcheck(dto);
					}else if(finalcompare > 0) {
						accountService.update_s3(dto);
						accountService.cancelconnect_linkedcheck(dto);
					}
				//異쒓툑�씪�븣
        		}else if(select_vatStatus.get(0).getVatStatus().equals("B5") || select_vatStatus.get(0).getVatStatus().equals("B3")) {
        			accountService.deleteconnectlist_sub(dto);
	        		
	        		BigDecimal sum = new BigDecimal("0");
	        	    	List<AccountDTO> dataprice_secound = accountService.dataprice_secound(dto);
	        			for(int i=0; i < dataprice_secound.size(); i++) {
	        				BigDecimal a = dataprice_secound.get(i).getVatTax(); 
	        				BigDecimal b = dataprice_secound.get(i).getVatAmount();
	        				sum = sum.add(a.add(b));
	        			}
	        		System.out.println("sum=================" + sum);
	        		
	        		List <AccountDTO> checktotalprice_vat_and_detail = accountService.checktotalprice_vat_and_detail(dto);
					BigDecimal total_detail = checktotalprice_vat_and_detail.get(0).getTotal_Amt();
					int finalcompare = sum.compareTo(total_detail);
					System.out.println("finalcompare========================" + finalcompare);
					if(finalcompare == 0) {
						accountService.update_b5(dto);
						accountService.updatevatmultilinkedcheck(dto);
					}else if(finalcompare > 0) {
						accountService.update_b3(dto);
						accountService.cancelconnect_linkedcheck(dto);
					}
        		}
        	}
        }
        //0�씪 寃쎌슦�뒗 �몢媛�吏� 寃쎌슦媛� 議댁옱 (湲곗〈�뿉 swc_bacledger�쓽 而щ읆�쑝濡� �뱾�뼱媛� �엳�뒗 寃쎌슦, 吏꾩쭨 �븘臾� �뿰寃곗씠 �뾾�뒗寃쎌슦)
        else if (listNumber == 0) {
        	int searchserial = accountService.searchserial(dto);
        	//swc_bacledger�쓽 而щ읆�뿉 �빐�떦 serial�씠 �뾾�뒗寃쎌슦 0�쓣 諛섑솚, 洹몃젃寃� �릺硫� 湲곗〈�뿉 �뿰寃곕맂 臾몄꽌�룄 �뾾�떎�뒗 �냼由�
        	if(searchserial != 0) {
        		accountService.cancelconnect_linkDoc(dto);
        		accountService.cancelconnect_linkedcheck(dto);
        		//swv_bacledger�쓽 �빐�떦 而щ읆 '' 洹몃━怨� �빐�떦 serial瑜� 媛�吏� swc_vat�� 1濡� 蹂�寃�
        	}
        }
        int listNumber_secound_check = accountService.connnectlist_Num(dto);
        int searchserial_secound_check = accountService.searchserial(dto);
        if(listNumber_secound_check == 0 ) {
        	if(searchserial_secound_check == 0) {
        		accountService.cancel_connect_final(dto);
        	}
        }
        //痍⑥냼 �떆 �궓�� 湲덉븸 理쒖떊�솕
        BigDecimal a = dto.getCancel_lincked_price();
        List <AccountDTO> getlicked_price = accountService.getlicked_price(dto);
        BigDecimal b = new BigDecimal(getlicked_price.get(0).getModal_vatmemo().replaceAll("\\,",""));
        BigDecimal c = getlicked_price.get(0).getModal_receive_data();
        BigDecimal d = a.add(b);
        BigDecimal e = c.subtract(a);
        dto.setModal_vatmemo(new java.text.DecimalFormat("#,###").format(d).toString());
        dto.setModal_receive_data(e);
        accountService.bacCheckConnect_modal_update(dto);
        //怨꾩쥖 �옍�뿬 湲덉븸
        List <AccountDTO> getlicked_price_secound = accountService.getlicked_price_secound(dto);
        BigDecimal f = getlicked_price_secound.get(0).getDifference_price();
        BigDecimal g = a.add(f);
        dto.setDifference_price(g);
        accountService.bacCheckConnect_modal_update_secound(dto);
        
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("endusernamelist.do/{soppNo}")
    public ResponseEntity<Object> endusernamelist(@PathVariable("soppNo") int soppNo, HttpSession session, AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        dto.setSoppNo(soppNo);
        List<AccountDTO> endusernamelist = accountService.endusernamelist(dto);
        param.put("data", endusernamelist);
        return ResponseEntity.ok(param);
    }
    @RequestMapping("endusernamelist_cont.do/{contNo}")
    public ResponseEntity<Object> endusernamelist_cont(@PathVariable("contNo") int contNo, HttpSession session, AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        dto.setContNo(contNo);
        List<AccountDTO> endusernamelist_cont = accountService.endusernamelist_cont(dto);
        param.put("data", endusernamelist_cont);
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("vatHtml/{vatSerial}/{vatType}")
    public ModelAndView vatHtml(HttpSession session, ModelAndView mav, @PathVariable("vatSerial") String vatSerial, @PathVariable("vatType") String vatType) {
    	AccountDTO dto = new AccountDTO();
    	dto.setVatSerial(vatSerial);
    	dto.setVatType(vatType);
    	
    	if(vatType.equals("B")) {
    		mav.addObject("vatList", accountService.vatHtmlListB(dto));
    	}else {
    		mav.addObject("vatList", accountService.vatHtmlListS(dto));
    	}
    	mav.setViewName("form/vatHtml");
    	
    	return mav;
    }
    
    @RequestMapping("custVatListHtmlS/{compNo}/{vatBuyerCustNo}/{vatIssueDateFrom}/{vatIssueDateTo}/{selectYear}/{vatType}")
    public ModelAndView custVatListHtml(HttpSession session, ModelAndView mav, @PathVariable("compNo") int compNo, @PathVariable("vatBuyerCustNo") int vatBuyerCustNo, @PathVariable("vatIssueDateFrom") String vatIssueDateFrom, @PathVariable("vatIssueDateTo") String vatIssueDateTo, @PathVariable("selectYear") int selectYear, @PathVariable("vatType") String vatType) {
    	AccountDTO dto = new AccountDTO();
    	LocalDate now = LocalDate.now();
    	int year = now.getYear();
    	
    	if(!vatIssueDateFrom.equals("0")) {
    		dto.setVatIssueDateFrom(vatIssueDateFrom);
    	}else {
    		dto.setVatIssueDateFrom(year + "-01-01");
    	}
    	
    	if(!vatIssueDateTo.equals("0")) {
    		dto.setVatIssueDateTo(vatIssueDateTo);
        }else {
        	dto.setVatIssueDateTo(year + "-12-31");
        }
    	
    	if(selectYear > 0) {
    		dto.setSelectYear(selectYear);
    	}else {
    		dto.setSelectYear(year);
    	}
    	
		dto.setVatBuyerCustNo(vatBuyerCustNo);
		dto.setCompNo(compNo);
		dto.setVatType(vatType);
    	
		//mav.addObject("ledgerList", accountService.ledgerListS(session, dto));
		mav.addObject("custVatList", accountService.custVatListHtmlS(dto));
		mav.addObject("custBalance", accountService.custBalanceS(dto));
    	mav.setViewName("form/custVatListHtmlS");
    	return mav;
    }
    
    @RequestMapping("custVatListHtmlB/{compNo}/{vatSellerCustNo}/{vatIssueDateFrom}/{vatIssueDateTo}/{selectYear}/{vatType}")
    public ModelAndView custVatListHtmlB(HttpSession session, ModelAndView mav, @PathVariable("compNo") int compNo, @PathVariable("vatSellerCustNo") int vatSellerCustNo, @PathVariable("vatIssueDateFrom") String vatIssueDateFrom, @PathVariable("vatIssueDateTo") String vatIssueDateTo, @PathVariable("selectYear") int selectYear, @PathVariable("vatType") String vatType) {
    	AccountDTO dto = new AccountDTO();
    	LocalDate now = LocalDate.now();
    	int year = now.getYear();
    	
    	if(!vatIssueDateFrom.equals("0")) {
    		dto.setVatIssueDateFrom(vatIssueDateFrom);
    	}else {
    		dto.setVatIssueDateFrom(year + "-01-01");
    	}
    	
    	if(!vatIssueDateTo.equals("0")) {
    		dto.setVatIssueDateTo(vatIssueDateTo);
        }else {
        	dto.setVatIssueDateTo(year + "-12-31");
        }
    	
    	if(selectYear > 0) {
    		dto.setSelectYear(selectYear);
    	}else {
    		dto.setSelectYear(year);
    	}
    	
		dto.setVatSellerCustNo(vatSellerCustNo);
		dto.setCompNo(compNo);
		dto.setVatType(vatType);
    	
		//mav.addObject("ledgerList", accountService.ledgerListB(session, dto));
		mav.addObject("custVatList", accountService.custVatListHtmlB(dto));
		mav.addObject("custBalance", accountService.custBalanceB(dto));
    	mav.setViewName("form/custVatListHtmlB");
    	return mav;
    }
    
    @RequestMapping("bacUpdateMemo.do")
    public ResponseEntity<Object> bacUpdateMemo(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacUpdate = accountService.bacUpdateMemo(dto);
        if(bacUpdate > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("bacDrawInsert.do")
    public ResponseEntity<Object> bacDrawInsert(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacIns = accountService.bacDrawInsert(dto);
        param.put("getId", dto.getGetId());
        if(bacIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("bacDrawDelect.do")
    public ResponseEntity<Object> bacDrawDelect(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacDel = accountService.bacDrawDelect(dto);
        if(bacDel > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("bacDrawAfterUpdate.do")
    public ResponseEntity<Object> bacDrawAfterUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int bacUp = accountService.bacDrawAfterUpdate(dto);
        if(bacUp > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @ResponseBody
    @RequestMapping("selectExcelData.do")
    public AccountDTO selectExcelData(ModelAndView mav, @ModelAttribute AccountDTO dto)
    {
        AccountDTO vatDataList = accountService.selectExcelData(dto);
        
        return vatDataList;
    }
    
    @ResponseBody
    @RequestMapping("check_link_vatandbac.do")
    public List<AccountDTO> check_link_vatandbac(@ModelAttribute AccountDTO dto){
    	List<AccountDTO> check_link_vatandbac = accountService.check_link_vatandbac(dto);
    	
    	return check_link_vatandbac;
    }
    
    @ResponseBody
    @RequestMapping("check_link_vatandbacCnt.do")
    public AccountDTO check_link_vatandbacCnt(@ModelAttribute AccountDTO dto){
    	AccountDTO count = accountService.check_link_vatandbacCnt(dto);
    	
    	return count;
    }
    
    @RequestMapping("productUpdate.do")
    public ResponseEntity<Object> productUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int productUp = accountService.productUpdate(dto);
        if(productUp > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    @RequestMapping("modalVatB.do")
    public ResponseEntity<Object> modalVatB(HttpSession session, @ModelAttribute AccountDTO dto){
    	Map<String,Object> param = new HashMap<>();
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
    	
	    List<AccountDTO> list = accountService.modalVatB(dto);
		List<AccountDTO> list_secound = accountService.list_secound_modalVatB(dto);
		param.put("data",list);
		param.put("data_secound",list_secound);
		return ResponseEntity.ok(param);
    }
    
    @ResponseBody
    @RequestMapping("modalVatListB.do")
    public List<AccountDTO> modalVatListB(HttpSession session, @ModelAttribute AccountDTO dto){
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
    	List<AccountDTO> list = accountService.modalVatListB(dto);
    	
    	return list;
    }
    
    @ResponseBody
    @RequestMapping("modalVatBCnt.do")
    public AccountDTO modalVatBCnt(HttpSession session, @ModelAttribute AccountDTO dto){
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
    	AccountDTO count = accountService.modalVatBCnt(dto);
    	
    	return count;
    }
    @RequestMapping("modalVatS.do")
    public ResponseEntity<Object> modalVatS(HttpSession session, @ModelAttribute AccountDTO dto){
    	Map<String,Object> param = new HashMap<>();
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
	    List<AccountDTO> list = accountService.modalVatS(dto);
		List<AccountDTO> list_secound = accountService.list_secound_modalVatB(dto);
		param.put("data",list);
		param.put("data_secound",list_secound);
		return ResponseEntity.ok(param);
    }
    @ResponseBody
    @RequestMapping("modalVatSCnt.do")
    public AccountDTO modalVatSCnt(HttpSession session, @ModelAttribute AccountDTO dto){
    	Integer compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
    	AccountDTO count = accountService.modalVatSCnt(dto);
    	
    	return count;
    }
    @RequestMapping("update_card_data.do")
    public ResponseEntity<Object> update_card_data(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        
        accountService.update_card_data(session, dto);

        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("Search_treqCardList.do")
    public ResponseEntity<Object> Search_treqCardList(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        
        List <AccountDTO> Search_treqCardList = accountService.Search_treqCardList(session, dto);
        param.put("data", Search_treqCardList);
        
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("vatContUpdate.do")
    public ResponseEntity<Object> vatContUpdate(HttpSession session, @ModelAttribute AccountDTO dto){
        Map<String,Object> param = new HashMap<>();
        int vatUp = accountService.vatContUpdate(dto);
        if(vatUp > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @ResponseBody
    @RequestMapping("reloadVatListB.do")
    public List<AccountDTO> reloadVatListB(@ModelAttribute AccountDTO dto){
    	List<AccountDTO> list = accountService.reloadVatListB(dto);
    	
    	return list;
    }
    
    @RequestMapping("count_maintenance.do")
    public ResponseEntity<Object> count_maintenance(HttpSession session, @ModelAttribute AccountDTO dto){
    	
        Map<String,Object> param = new HashMap<>();
        
        List <AccountDTO> count1 = accountService.count1(session);
        List <AccountDTO> count2 = accountService.count2(session);
        List <AccountDTO> count3 = accountService.count3(session);
        
        BigDecimal sum = new BigDecimal("0");
        for(int i=0; i < count2.size(); i++) {
        	if(i == 0) {
        		sum = count2.get(i).getTest();
        	}else {
        		sum.add(count2.get(i).getTest());
        	}
        }
        
        param.put("count1", count1);
        param.put("count2", count2);
        param.put("count3", count3);
        param.put("sum", sum);
        
        return ResponseEntity.ok(param);
    }
    
    
}
