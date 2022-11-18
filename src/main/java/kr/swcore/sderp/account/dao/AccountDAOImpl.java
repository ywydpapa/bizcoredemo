package kr.swcore.sderp.account.dao;

import kr.swcore.sderp.account.dto.AccountDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

import java.util.List;

@Repository
public class AccountDAOImpl implements AccountDAO {
    @Inject
    SqlSession sqlSession;

    @Override
    public List<AccountDTO> listvat(AccountDTO dto) {
        return sqlSession.selectList("account.listVat", dto);
    }

	@Override
	public List<AccountDTO> sumBvat(AccountDTO dto) {
		return sqlSession.selectList("account.sumBVat", dto);
	}

	@Override
	public List<AccountDTO> sumSvat(AccountDTO dto) {
		return sqlSession.selectList("account.sumSVat",dto);
	}

	@Override
	public List<AccountDTO> sumBvatSearch(AccountDTO dto) {
		return sqlSession.selectList("account.sumBVatSearch",dto);
	}

	@Override
	public List<AccountDTO> sumSvatSearch(AccountDTO dto) {
		return sqlSession.selectList("account.sumSVatSearch",dto);
	}

	@Override
    public List<AccountDTO> listbac(int compNo) {
        return sqlSession.selectList("account.baclist", compNo);
    }
    
    @Override
    public List<AccountDTO> listCard(int compNo) {
        return sqlSession.selectList("account.listCard", compNo);
    }

    @Override
    public List<AccountDTO> listvatitem(int vatId) {
        return sqlSession.selectList("account.listVatitem", vatId);
    }

    @Override
    public List<AccountDTO> modalVatB(AccountDTO dto) {
        return sqlSession.selectList("account.modalVatB",dto);
    }

    @Override
    public List<AccountDTO> modalVatS(AccountDTO dto) {
        return sqlSession.selectList("account.modalVatS",dto);
    }

    @Override
    public AccountDTO checkVat(AccountDTO dto) {
        return sqlSession.selectOne("account.checkVat", dto);
    }

    @Override
    public AccountDTO detailvat(int vatId) {
        return sqlSession.selectOne("account.detailVat", vatId);
    }

    @Override
    public int insertVat(AccountDTO dto) {
        return sqlSession.insert("account.insertVat", dto);
    }

    @Override
    public int insertBac(AccountDTO dto) {
        return sqlSession.insert("account.insertbac",dto);
    }
    
    @Override
    public int insertCard(AccountDTO dto) {
        return sqlSession.insert("account.insertCard",dto);
    }

    @Override
    public int insertBacledger(AccountDTO dto) {
        return sqlSession.insert("account.insertbacledger",dto);
    }
    
    @Override
    public int insertCardLedger(AccountDTO dto) {
        return sqlSession.insert("account.insertCardLedger",dto);
    }

    @Override
    public int insertVatitem(AccountDTO dto) {
        return sqlSession.insert("account.insertVatItem", dto);
    }

    @Override
    public int updvatStat(AccountDTO dto) {
        return sqlSession.update("account.updVatStatus", dto);
    }

	@Override
	public AccountDTO selectVatCust(String vatNo) {
		return sqlSession.selectOne("account.selectVatCust", vatNo);
	}

	@Override
	public List<AccountDTO> connect_list(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.connect_list",dto);
	}

	@Override
	public List<AccountDTO> modalbB(String vatSerial) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.connect_list", vatSerial);
	}

	@Override
	public AccountDTO checkBac(AccountDTO dto) {
		return sqlSession.selectOne("account.checkBac", dto);
	}
	
	@Override
	public AccountDTO cardCheck(AccountDTO dto) {
		return sqlSession.selectOne("account.cardCheck", dto);
	}

	@Override
	public List<AccountDTO> bacSelectList(AccountDTO dto) {
		return sqlSession.selectList("account.bacSelectList", dto);
	}
	
	@Override
	public AccountDTO bacSelectListCnt(AccountDTO dto) {
		return sqlSession.selectOne("account.bacSelectListCnt", dto);
	}
	
	@Override
	public List<AccountDTO> cardSelectList(AccountDTO dto) {
		return sqlSession.selectList("account.cardSelectList", dto);
	}

	@Override
	public int lastUpdate(AccountDTO dto) {
		return sqlSession.update("account.lastUpdate", dto);
	}
	
	@Override
	public int lastUpdateCard(AccountDTO dto) {
		return sqlSession.update("account.lastUpdateCard", dto);
	}

	@Override
	public int bacSerialUpdate(AccountDTO dto) {
		return sqlSession.update("account.bacSerialUpdate", dto);
	}

	@Override
	public List<AccountDTO> listvatSearch(AccountDTO dto) {
		return sqlSession.selectList("account.listVatSearch", dto);
	}

	@Override
	public List<AccountDTO> listvatB(AccountDTO dto) {
		return sqlSession.selectList("account.listVatB", dto);
	}

	@Override
	public List<AccountDTO> listvatSearchB(AccountDTO dto) {
		return sqlSession.selectList("account.listVatSearchB", dto);
	}

	@Override
	public List<AccountDTO> listvatS(AccountDTO dto) {
		return sqlSession.selectList("account.listVatS", dto);
	}

	@Override
	public List<AccountDTO> listvatSearchS(AccountDTO dto) {
		return sqlSession.selectList("account.listVatSearchS", dto);
	}

	@Override
	public List<AccountDTO> listvatT(AccountDTO dto) {
		return sqlSession.selectList("account.listVatT",dto);
	}

	@Override
	public List<AccountDTO> listvatSearchT(AccountDTO dto) {
		return sqlSession.selectList("account.listVatSearchT", dto);
	}

	@Override
	public List<AccountDTO> custVatListModal(AccountDTO dto) {
		return sqlSession.selectList("account.custVatListModal", dto);
	}

	@Override
	public List<AccountDTO> treqCardList(AccountDTO dto) {
		return sqlSession.selectList("account.treqCardList", dto);
	}

	@Override
	public int updatevatlinkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		 return sqlSession.update("account.updatevatlinkedcheck", dto);
	}
	@Override
	public int bacCheckConnect(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("account.bacCheckConnect", dto);
	}

	@Override
	public int billInsert(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("account.billInsert", dto);
	}

	@Override
	public List<AccountDTO> vatSelectList(AccountDTO dto) {
		return sqlSession.selectList("account.vatSelectList", dto);
	}

	@Override
	public int sVatToChange(AccountDTO dto) {
		return sqlSession.update("account.sVatToChange", dto);
	}
	
	@Override
	public List<AccountDTO> new_bac_connect_list(String bacId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.new_bac_connect_list",bacId);
	}
	
	@Override
	public List<AccountDTO> bac_connect_list(String bacId) {
		return sqlSession.selectList("account.bac_connect_list",bacId);
	}
	
	@Override
	public void updatevatmultilinkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.updatevatmultilinkedcheck", dto);
	}

	@Override
	public void updatelogIdlink(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.updatelogIdlink", dto);
	}


	@Override
	public int connnectlist_Num(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.connnectlist_Num", dto);
	}

	@Override
	public void deleteconnectlist(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.delete("account.deleteconnectlist", dto);
	}

	@Override
	public int searchserial(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.searchserial", dto);
	}

	@Override
	public void cancel_connect_final(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.cancel_connect_final", dto);

	}
	@Override
	public void cancelconnect_linkedcheck(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.cancelconnect_linkedcheck", dto);
	}

	@Override
	public void cancelconnect_linkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.delete("account.cancelconnect_linkDoc", dto);
	}

	@Override
	public String number_linkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.number_linkDoc", dto);
	}

	@Override
	public void change_originlinkDoc(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("account.change_originlinkDoc", dto);
	}

	@Override
	public List<AccountDTO> dataprice(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.dataprice", dto);
	}

	@Override
	public List<AccountDTO> total_price(AccountDTO dto) {
		// TODO Auto-generated method stub
		return  sqlSession.selectList("account.total_price", dto);
	}

	@Override
	public void update_s5(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_s5", dto);
	}

	@Override
	public void update_s3(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_s3", dto);
	}

	@Override
	public void update_b5(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_b5", dto);
	}

	@Override
	public void update_b3(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_b3", dto);
	}

	@Override
	public void update_vatStatus(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_vatStatus", dto);
	}

	@Override
	public List<AccountDTO> select_vatStatus(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.select_vatStatus", dto);
	}

	@Override
	public void update_vatStatus_B(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_vatStatus_B", dto);
	}

	@Override
	public List<AccountDTO> endusernamelist(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.endusernamelist", dto);
	}

	@Override
	public List<AccountDTO> endusernamelist_cont(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.endusernamelist_cont", dto);
	}

	@Override
	public List<AccountDTO> vatHtmlListB(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.vatHtmlListB", dto);
	}

	@Override
	public List<AccountDTO> vatHtmlListS(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.vatHtmlListS", dto);
	}

	@Override
	public int bacUpdateMemo(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("account.bacUpdateMemo", dto);
	}
	
	@Override
	public int bacDrawInsert(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("account.bacDrawInsert", dto);
	}

	@Override
	public int bacDrawAfterUpdate(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("account.bacDrawAfterUpdate", dto);
	}

	@Override
	public int bacDrawDelect(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("account.bacDrawDelect", dto);
	}

	@Override
	public AccountDTO selectExcelData(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.selectExcelData", dto);
	}
	@Override
	public void bacCheckConnect_modal_update(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.bacCheckConnect_modal_update", dto);
	}

	@Override
	public List<AccountDTO> checktotalprice_vat_and_detail(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.checktotalprice_vat_and_detail", dto);
	}

	@Override
	public int detail_Count_equal_baclogId(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.detail_Count_equal_baclogId", dto);
	}

	@Override
	public void deleteconnectlist_sub(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.delete("account.deleteconnectlist_sub", dto);
	}

	@Override
	public List<AccountDTO> dataprice_secound(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.dataprice_secound", dto);
	}

	@Override
	public List<AccountDTO> checktotalprice_vat_and_detail_out(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.checktotalprice_vat_and_detail_out", dto);
	}

	@Override
	public AccountDTO bacCalSelect(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.bacCalSelect", dto);
	}
	@Override
	public List<AccountDTO> list_secound_modalVatB(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.list_secound_modalVatB", dto);
	}

	@Override
	public void bacCheckConnect_modal_baclogId_memo(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.bacCheckConnect_modal_baclogId_memo", dto);
	}

	@Override
	public List<AccountDTO> list_secound_modalVatB_secound(String bacId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.list_secound_modalVatB_secound", bacId);
	}

	@Override
	public List<AccountDTO> getlicked_price(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.getlicked_price", dto);
	}

	@Override
	public List<AccountDTO> getlicked_price_secound(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.getlicked_price_secound", dto);
	}

	@Override
	public void bacCheckConnect_modal_update_secound(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.bacCheckConnect_modal_update_secound", dto);

	}

	@Override
	public List<AccountDTO> check_link_vatandbac(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.check_link_vatandbac", dto);
	}

	@Override
	public AccountDTO check_link_vatandbacCnt(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.check_link_vatandbacCnt", dto);
	}

	@Override
	public List<AccountDTO> check_remain_money_from_swc_vat(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.check_remain_money_from_swc_vat", dto);
	}

	@Override
	public void update_check_remain_money_from_swc_vat(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_check_remain_money_from_swc_vat", dto);
	}

	@Override
	public void update_check_remain_money_from_swc_vat_B(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_check_remain_money_from_swc_vat_B", dto);
	}
	
	public AccountDTO cardSelectListCount(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.cardSelectListCount", dto);
	}

	@Override
	public List<AccountDTO> sumSvat_sub(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.sumSvat_sub", dto);
	}

	@Override
	public List<AccountDTO> sumBvat_sub(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.sumBvat_sub", dto);
	}

	@Override
	public List<AccountDTO> check_lincked_last(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.check_lincked_last", dto);
	}
	
	public List<AccountDTO> custSelectVatList(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.custSelectVatList", dto);
	}

	@Override
	public List<AccountDTO> custVatListCount(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.custVatListCount", dto);
	}

	@Override
	public List<AccountDTO> custVatListHtmlS(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.custVatListHtmlS", dto);
	}
	
	@Override
	public List<AccountDTO> custVatListHtmlB(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.custVatListHtmlB", dto);
	}

	@Override
	public int productUpdate(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("account.productUpdate", dto);
	}

	@Override
	public List<AccountDTO> custVatListS(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.custVatListS",dto);
	}

	@Override
	public List<AccountDTO> custVatListB(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.custVatListB",dto);
	}

	@Override
	public List<AccountDTO> ledgerListS(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.ledgerListS",dto);
	}
	
	@Override
	public List<AccountDTO> ledgerListB(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.ledgerListB",dto);
	}
	
	public AccountDTO listVatBCnt(AccountDTO dto) {
		return sqlSession.selectOne("account.listVatBCnt", dto);
	}
	
	@Override
	public AccountDTO modalVatBCnt(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.modalVatBCnt", dto);
	}

	@Override
	public AccountDTO modalVatSCnt(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.modalVatSCnt", dto);
	}

	@Override
    public List<AccountDTO> modalVatB(int compNo) {
        return sqlSession.selectList("account.modalVatB_main",compNo);
	}

	@Override
	public List<AccountDTO> modalVatS(int compNo) {
		return sqlSession.selectList("account.modalVatS_main",compNo);
	}

	@Override
	public AccountDTO custBalanceS(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.custBalanceS", dto);
	}
	
	@Override
	public AccountDTO custBalanceB(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("account.custBalanceB", dto);
	}

	@Override
	public List<AccountDTO> listusercontribution(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.listusercontribution", dto);
	}

	@Override
	public List<AccountDTO> listusercontributionCnt(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.listusercontributionCnt", dto);
	}

	@Override
	public void insert_contribution_percent(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("account.insert_contribution_percent", dto);
	}

	@Override
	public List<AccountDTO> userList(int compNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.userList", compNo);
	}

	@Override
	public void update_card_data(AccountDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("account.update_card_data", dto);
	}

	@Override
	public List<AccountDTO> Search_treqCardList(AccountDTO dto) {
		return sqlSession.selectList("account.Search_treqCardList", dto);
	}

	@Override
	public List<AccountDTO> connect_cont_and_vat(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.connect_cont_and_vat", dto);
	}

	@Override
	public int vatContUpdate(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("account.vatContUpdate", dto);
	}
	public List<AccountDTO> request_vat(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.request_vat", dto);
	}

	@Override
	public List<AccountDTO> request_payment(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.request_payment", dto);
	}
	
	@Override
	public List<AccountDTO> request_attlist(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.request_attlist", dto);
	}

	@Override
	public List<AccountDTO> request_payment_boss(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.request_payment_boss", dto);
	}

	@Override
	public List<AccountDTO> reloadVatListB(AccountDTO dto) {
		return sqlSession.selectList("account.reloadVatListB", dto);
	}

	@Override
	public List<AccountDTO> count1(int compNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.count1", compNo);
	}

	@Override
	public List<AccountDTO> count2(int compNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.count2", compNo);
	}

	@Override
	public List<AccountDTO> count3(int compNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.count3", compNo);
	}

	@Override
	public List<AccountDTO> modalVatListB(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.modalVatListB", dto);
	}
	
}
