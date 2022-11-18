package kr.swcore.sderp.mis.service;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.mis.dto.MisDTO;
import kr.swcore.sderp.sopp.dto.SoppdataDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MisService {
    List<MisDTO> listHRduty(HttpSession session,MisDTO dto);
    List<MisDTO> listHRcost(HttpSession session, MisDTO dto);
    List<MisDTO> listSopp(HttpSession session, MisDTO dto);
    List<MisDTO> listSoppcost(HttpSession session, MisDTO dto);
    List<MisDTO> listSoppmargin(HttpSession session, ContDTO dto);
    List<MisDTO> listBacinout(HttpSession session, MisDTO dto);
    List<MisDTO> listBacstatus(HttpSession session, MisDTO dto);
    
    List<AccountDTO> sumSvat(HttpSession session, AccountDTO dto);
    List<AccountDTO> sumSvat_sub(HttpSession session, AccountDTO dto);
    List<AccountDTO> sumSvatSearch(HttpSession session, AccountDTO dto);
    
    List<AccountDTO> sumBvat(HttpSession session, AccountDTO dto);
    List<AccountDTO> sumBvat_sub(HttpSession session, AccountDTO dto);
    List<AccountDTO> sumBvatSearch(HttpSession session, AccountDTO dto);
    
    List<SoppdataDTO> listIOsum(HttpSession session, SoppdataDTO dto);
	List<SoppdataDTO> listSearchIO(HttpSession session, SoppdataDTO dto);
	
	List<AccountDTO> listbac(HttpSession session);
	List<AccountDTO> bacSelectList(AccountDTO dto);
	List<AccountDTO> bacInOutList(AccountDTO dto);
	List<MisDTO> listBacstatus_select(HttpSession session, MisDTO dto);
}
