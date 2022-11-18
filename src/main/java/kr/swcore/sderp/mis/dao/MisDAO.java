package kr.swcore.sderp.mis.dao;

import kr.swcore.sderp.account.dto.AccountDTO;

import kr.swcore.sderp.cont.dto.ContDTO;

import kr.swcore.sderp.mis.dto.MisDTO;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;

import java.util.List;

public interface MisDAO {
    List<MisDTO> listHRduty(MisDTO dto);
    List<MisDTO> listHRcost(MisDTO dto);
    List<MisDTO> listSopp(MisDTO dto);
    List<MisDTO> listSoppcost(MisDTO dto);
    List<MisDTO> listSoppmargin(ContDTO dto);
    List<MisDTO> listBacinout(MisDTO dto);
    List<MisDTO> listBacstatus(MisDTO dto);
    
    List<AccountDTO> sumSvat(AccountDTO dto);
    List<AccountDTO> sumSvat_sub(AccountDTO dto);
    List<AccountDTO> sumSvatSearch(AccountDTO dto);
    
    List<AccountDTO> sumBvat(AccountDTO dto);
    List<AccountDTO> sumBvat_sub(AccountDTO dto);
    List<AccountDTO> sumBvatSearch(AccountDTO dto);
    
    List<SoppdataDTO> listIOsum(SoppdataDTO dto);
	List<SoppdataDTO> listSearchIO(SoppdataDTO dto);
	
	List<AccountDTO> listbac(int compNo);
	List<AccountDTO> bacSelectList(AccountDTO dto);
	List<AccountDTO> bacInOutList(AccountDTO dto);
	List<MisDTO> listBacstatus_select(MisDTO dto);
}
