package kr.swcore.sderp.account.service;

import kr.swcore.sderp.account.dao.AccountDAO;
import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import java.time.LocalDate;
import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    @Inject
    AccountDAO accountDAO;

    @Override
    public List<AccountDTO> listvat(HttpSession session, AccountDTO dto) {
        int compNo = SessionInfoGet.getCompNo(session);
        String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
        return accountDAO.listvat(dto);
    }

	@Override
	public List<AccountDTO> sumBvat(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.sumBvat(dto);
	}

	@Override
	public List<AccountDTO> sumSvat(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.sumSvat(dto);
	}

	@Override
	public List<AccountDTO> sumBvatSearch(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.sumBvatSearch(dto);
	}

	@Override
	public List<AccountDTO> sumSvatSearch(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.sumSvatSearch(dto);
	}

	@Override
    public List<AccountDTO> listbac(HttpSession session) {
        int compNo = SessionInfoGet.getCompNo(session);
        return accountDAO.listbac(compNo);
    }
    
    @Override
    public List<AccountDTO> listCard(HttpSession session) {
        int compNo = SessionInfoGet.getCompNo(session);
        return accountDAO.listCard(compNo);
    }

    @Override
    public List<AccountDTO> listvatitem(int vatId) {
        return accountDAO.listvatitem(vatId);
    }

    @Override
    public List<AccountDTO> modalVatB(AccountDTO dto) {
        return accountDAO.modalVatB(dto);
    }

    @Override
    public List<AccountDTO> modalVatS(AccountDTO dto) {
        return accountDAO.modalVatS(dto);
    }

    @Override
    public AccountDTO checkVat(AccountDTO dto) {
        return accountDAO.checkVat(dto);
    }

    @Override
    public AccountDTO detailvat(int vatId) {
        return accountDAO.detailvat(vatId);
    }

    @Override
    public int insertVat(AccountDTO dto) {
        return accountDAO.insertVat(dto);
    }

    @Override
    public int insertBac(AccountDTO dto) {
        return accountDAO.insertBac(dto);
    }
    
    @Override
    public int insertCard(AccountDTO dto) {
        return accountDAO.insertCard(dto);
    }

    @Override
    public int insertBacledger(AccountDTO dto) {
        return accountDAO.insertBacledger(dto);
    }
    
    @Override
    public int insertCardLedger(AccountDTO dto) {
        return accountDAO.insertCardLedger(dto);
    }

    @Override
    public int insertVatitem(AccountDTO dto) {
        return accountDAO.insertVatitem(dto);
    }

    @Override
    public int updvatStat(AccountDTO dto) {
        return accountDAO.updvatStat(dto);
    }

	@Override
	public AccountDTO selectVatCust(String vatNo) {
		return accountDAO.selectVatCust(vatNo);
	}

	@Override
	public List<AccountDTO> connect_list(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.connect_list(dto);
	}

	@Override
	public List<AccountDTO> modalbB(String vatSerial) {
    	return accountDAO.modalbB(vatSerial);
	}

	@Override
	public AccountDTO checkBac(AccountDTO dto) {
		return accountDAO.checkBac(dto);
	}
	
	@Override
	public AccountDTO cardCheck(AccountDTO dto) {
		return accountDAO.cardCheck(dto);
	}

	@Override
	public List<AccountDTO> bacSelectList(AccountDTO dto) {
		return accountDAO.bacSelectList(dto);
	}
	
	@Override
	public AccountDTO bacSelectListCnt(AccountDTO dto) {
		return accountDAO.bacSelectListCnt(dto);
	}
	
	@Override
	public List<AccountDTO> cardSelectList(AccountDTO dto) {
		return accountDAO.cardSelectList(dto);
	}

	@Override
	public int lastUpdate(AccountDTO dto) {
		return accountDAO.lastUpdate(dto);
	}
	
	@Override
	public int lastUpdateCard(AccountDTO dto) {
		return accountDAO.lastUpdateCard(dto);
	}

	@Override
	public int bacSerialUpdate(AccountDTO dto) {
		return accountDAO.bacSerialUpdate(dto);
	}

	@Override
	public List<AccountDTO> listvatSearch(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
		return accountDAO.listvatSearch(dto);
	}

	@Override
	public List<AccountDTO> listvatB(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
        String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
        return accountDAO.listvatB(dto);
	}

	@Override
	public List<AccountDTO> listvatSearchB(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
		return accountDAO.listvatSearchB(dto);
	}

	@Override
	public List<AccountDTO> listvatS(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
        String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
        return accountDAO.listvatS(dto);
	}

	@Override
	public List<AccountDTO> listvatSearchS(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
        dto.setCompNo(compNo);
        dto.setListDateFrom(listDateFrom);
		return accountDAO.listvatSearchS(dto);
	}

	@Override
	public List<AccountDTO> listvatT(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.listvatT(dto);
	}

	@Override
	public List<AccountDTO> listvatSearchT(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.listvatSearchT(dto);
	}

	@Override
	public List<AccountDTO> custVatListModal(AccountDTO dto) {
		return accountDAO.custVatListModal(dto);
	}

	@Override
	public List<AccountDTO> treqCardList(AccountDTO dto) {
		return accountDAO.treqCardList(dto);
	}

	@Override
	public int updatevatlinkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.updatevatlinkedcheck(dto);
	}

	@Override
	public int bacCheckConnect(AccountDTO dto) {
		return accountDAO.bacCheckConnect(dto);
	}

	@Override
	public int billInsert(AccountDTO dto) {
		return accountDAO.billInsert(dto);
	}

	@Override

	public List<AccountDTO> vatSelectList(int contNo) {
		AccountDTO dto = new AccountDTO();
		dto.setContNo(contNo);
		
		return accountDAO.vatSelectList(dto);
	}

	@Override
	public int sVatToChange(AccountDTO dto) {
		return accountDAO.sVatToChange(dto);
	}
	
	@Override
	public List<AccountDTO> bac_connect_list(String bacId) {
        return accountDAO.bac_connect_list(bacId);
	}
	
	@Override
	public List<AccountDTO> new_bac_connect_list(String bacId) {
		// TODO Auto-generated method stub
		 return accountDAO.new_bac_connect_list(bacId);
	}
	
	@Override
	public void cancelconnect_linkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.cancelconnect_linkedcheck(dto);
	}
	@Override
	public void cancelconnect_linkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.cancelconnect_linkDoc(dto);
	}

	@Override
	public void updatevatmultilinkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.updatevatmultilinkedcheck(dto);
	}

	@Override
	public void updatelogIdlink(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.updatelogIdlink(dto);
	}


	@Override
	public int connnectlist_Num(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.connnectlist_Num(dto);
	}

	@Override
	public void deleteconnectlist(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.deleteconnectlist(dto);
	}

	@Override
	public int searchserial(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.searchserial(dto);
	}
	
	@Override
	public void cancel_connect_final(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.cancel_connect_final(dto);

	}

	@Override
	public String number_linkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.number_linkDoc(dto);
	}

	@Override
	public void change_originlinkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.change_originlinkDoc(dto);
	}

	@Override
	public List<AccountDTO> dataprice(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.dataprice(dto);
	}

	@Override
	public List<AccountDTO> total_price(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.total_price(dto);
	}

	@Override
	public void update_s5(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_s5(dto);
	}
	@Override
	public void update_s3(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_s3(dto);
	}

	@Override
	public void update_b5(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_b5(dto);
	}

	@Override
	public void update_b3(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_b3(dto);
	}

	@Override
	public void update_vatStatus(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_vatStatus(dto);
	}

	@Override
	public List<AccountDTO> select_vatStatus(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.select_vatStatus(dto);
	}

	@Override
	public void update_vatStatus_B(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_vatStatus_B(dto);
	}

	@Override
	public List<AccountDTO> endusernamelist(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.endusernamelist(dto);
	}

	@Override
	public List<AccountDTO> endusernamelist_cont(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.endusernamelist_cont(dto);
	}

	@Override
	public List<AccountDTO> vatHtmlListB(AccountDTO dto) {
		return accountDAO.vatHtmlListB(dto);
	}

	@Override
	public List<AccountDTO> vatHtmlListS(AccountDTO dto) {
		return accountDAO.vatHtmlListS(dto);
	}

	@Override
	public int bacUpdateMemo(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.bacUpdateMemo(dto);
	}
	
	@Override
	public int bacDrawInsert(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.bacDrawInsert(dto);
	}

	@Override
	public int bacDrawAfterUpdate(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.bacDrawAfterUpdate(dto);
	}

	@Override
	public int bacDrawDelect(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.bacDrawDelect(dto);
	}

	@Override
	public AccountDTO selectExcelData(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.selectExcelData(dto);
	}
	@Override
	public void bacCheckConnect_modal_update(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.bacCheckConnect_modal_update(dto);	
	}

	@Override
	public List<AccountDTO> checktotalprice_vat_and_detail(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.checktotalprice_vat_and_detail(dto);
	}

	@Override
	public int detail_Count_equal_baclogId(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.detail_Count_equal_baclogId(dto);
	}

	@Override
	public void deleteconnectlist_sub(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.deleteconnectlist_sub(dto);
	}

	@Override
	public List<AccountDTO> dataprice_secound(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.dataprice_secound(dto);
	}

	@Override
	public List<AccountDTO> checktotalprice_vat_and_detail_out(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.checktotalprice_vat_and_detail_out(dto);

	}

	@Override
	public AccountDTO bacCalSelect(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.bacCalSelect(dto);
	}
	@Override
	public List<AccountDTO> list_secound_modalVatB(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.list_secound_modalVatB(dto);
	}

	@Override
	public void bacCheckConnect_modal_baclogId_memo(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.bacCheckConnect_modal_baclogId_memo(dto);
	}

	@Override
	public List<AccountDTO> list_secound_modalVatB_secound(String bacId) {
		// TODO Auto-generated method stub
		return accountDAO.list_secound_modalVatB_secound(bacId);
	}

	@Override
	public List<AccountDTO> getlicked_price(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.getlicked_price(dto);
	}

	@Override
	public List<AccountDTO> getlicked_price_secound(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.getlicked_price_secound(dto);
	}

	@Override
	public void bacCheckConnect_modal_update_secound(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.bacCheckConnect_modal_update_secound(dto);

	}

	@Override
	public List<AccountDTO> check_link_vatandbac(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.check_link_vatandbac(dto);
	}

	@Override
	public AccountDTO check_link_vatandbacCnt(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.check_link_vatandbacCnt(dto);
	}

	@Override
	public List<AccountDTO> check_remain_money_from_swc_vat(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.check_remain_money_from_swc_vat(dto);
	}

	@Override
	public void update_check_remain_money_from_swc_vat(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_check_remain_money_from_swc_vat(dto);
	}

	@Override
	public void update_check_remain_money_from_swc_vat_B(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.update_check_remain_money_from_swc_vat_B(dto);
	}
	
	public AccountDTO cardSelectListCount(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.cardSelectListCount(dto);
	}

	@Override
	public List<AccountDTO> sumSvat_sub(HttpSession session, AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.sumSvat_sub(dto);
	}

	@Override
	public List<AccountDTO> sumBvat_sub(HttpSession session, AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.sumBvat_sub(dto);
	}

	@Override
	public List<AccountDTO> check_lincked_last(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.check_lincked_last(dto);
	}
	
	@Override
	public List<AccountDTO> custSelectVatList(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.custSelectVatList(dto);
	}

	@Override
	public List<AccountDTO> custVatListCount(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.custVatListCount(dto);
	}

	@Override
	public List<AccountDTO> custVatListHtmlS(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.custVatListHtmlS(dto);
	}
	
	@Override
	public List<AccountDTO> custVatListHtmlB(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.custVatListHtmlB(dto);
	}

	@Override
	public int productUpdate(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.productUpdate(dto);
	}

	@Override
	public List<AccountDTO> custVatListS(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.custVatListS(dto);
	}

	@Override
	public List<AccountDTO> custVatListB(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);
		return accountDAO.custVatListB(dto);
	}

	@Override
	public List<AccountDTO> ledgerListS(HttpSession session, AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.ledgerListS(dto);
	}
	
	@Override
	public List<AccountDTO> ledgerListB(HttpSession session, AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.ledgerListB(dto);
	}
	
	public AccountDTO listVatBCnt(AccountDTO dto) {
		return accountDAO.listVatBCnt(dto);
	}
	
	public AccountDTO modalVatBCnt(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.modalVatBCnt(dto);
	}

	@Override
	public AccountDTO modalVatSCnt(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.modalVatSCnt(dto);
	}

	@Override
    public List<AccountDTO> modalVatB(HttpSession session) {
        int compNo = SessionInfoGet.getCompNo(session);
        return accountDAO.modalVatB(compNo);
	}

	@Override
	public List<AccountDTO> modalVatS(HttpSession session) {
		int compNo = SessionInfoGet.getCompNo(session);
        return accountDAO.modalVatS(compNo);
	}

	@Override
	public AccountDTO custBalanceS(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.custBalanceS(dto);
	}
	
	@Override
	public AccountDTO custBalanceB(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.custBalanceB(dto);
	}

	@Override
	public List<AccountDTO> listusercontribution(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.listusercontribution(dto);
	}

	@Override
	public List<AccountDTO> listusercontributionCnt(AccountDTO dto) {
		// TODO Auto-generated method stub
		return accountDAO.listusercontributionCnt(dto);
	}

	@Override
	public void insert_contribution_percent(AccountDTO dto) {
		// TODO Auto-generated method stub
		accountDAO.insert_contribution_percent(dto);
	}

	@Override
	public List<AccountDTO> userList(HttpSession session) {
		int compNo = SessionInfoGet.getCompNo(session);
		return accountDAO.userList(compNo);
	}

	@Override
	public void update_card_data(HttpSession session, AccountDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		accountDAO.update_card_data(dto);

	}

	@Override
	public List<AccountDTO> Search_treqCardList(HttpSession session, AccountDTO dto) {		
		return accountDAO.Search_treqCardList(dto);
	}

	@Override
	public List<AccountDTO> connect_cont_and_vat(HttpSession session, int contNo) {
		// TODO Auto-generated method stub
		int compNo = SessionInfoGet.getCompNo(session);
		AccountDTO dto = new AccountDTO();
		dto.setCompNo(compNo);
		dto.setContNo(contNo);
		return accountDAO.connect_cont_and_vat(dto);
	}

	@Override
	public int vatContUpdate(AccountDTO dto) {
	
		return accountDAO.vatContUpdate(dto);
	}
	public List<AccountDTO> request_vat(HttpSession session) {
		AccountDTO dto = new AccountDTO();
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return accountDAO.request_vat(dto);
	}

	@Override
	public List<AccountDTO> request_payment(HttpSession session) {
		AccountDTO dto = new AccountDTO();
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return accountDAO.request_payment(dto);
	}

	@Override
	public List<AccountDTO> request_attlist(HttpSession session) {
		AccountDTO dto = new AccountDTO();
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return accountDAO.request_attlist(dto);
	}

	@Override
	public List<AccountDTO> request_payment_boss(HttpSession session) {
		AccountDTO dto = new AccountDTO();
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return accountDAO.request_payment_boss(dto);
	}

	@Override
	public List<AccountDTO> reloadVatListB(AccountDTO dto) {
		return accountDAO.reloadVatListB(dto);
	}

	@Override
	public List<AccountDTO> count1(HttpSession session) {
		int compNo = SessionInfoGet.getCompNo(session);
		return accountDAO.count1(compNo);
	}

	@Override
	public List<AccountDTO> count2(HttpSession session) {
		int compNo = SessionInfoGet.getCompNo(session);
		return accountDAO.count2(compNo);
	}

	@Override
	public List<AccountDTO> count3(HttpSession session) {
		int compNo = SessionInfoGet.getCompNo(session);
		return accountDAO.count3(compNo);
	}

	@Override
	public List<AccountDTO> modalVatListB(AccountDTO dto) {
		LocalDate now = LocalDate.now();
		if(dto.getRegSDate_modal().equals("")) {
    		dto.setRegSDate_modal(now.getYear() + "-01-01");
    		dto.setRegEDate_modal(now.getYear() + "-12-31");
    	}
		return accountDAO.modalVatListB(dto);
	}
}
