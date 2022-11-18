package kr.swcore.sderp.cust.dao;

import java.util.List;

import kr.swcore.sderp.cust.dto.CustDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface CustDAO {
	
	List<CustDTO> listCust();
	List<CustDTO> listCust(SoppDTO soppDto);	
	List<CustDTO> listBuyr();
	List<CustDTO> listBuyr(SoppDTO soppDto);
	List<CustDTO> listPtnc();
	List<CustDTO> listPtnc(SoppDTO soppDto);
	List<CustDTO> listSupply();
	List<CustDTO> listSupply(SoppDTO soppDto);
	List<CustDTO> listCustmember(int custNo);
	List<CustDTO> listCustNameCheck(CustDTO custDTO);
	List<CustDTO> listCustNameSimilarCheck(CustDTO custDTO);
	CustDTO detailCust(int custNo);
	CustDTO detailCust02(int custNo);
	CustDTO detailCust03(int custNo);
	CustDTO detailCust04(int custNo);
	List<CustDTO> detailsCust(int custNo);
	int insertCust(CustDTO dto);
	int deleteCust(int custNo);
	int updateCust01(CustDTO dto);
	int updateCust05(CustDTO dto);
	String fileInfo(int custNo);
	int custCheck(CustDTO dto);
	int insertCust02(CustDTO dto);
	int insertCust03(CustDTO dto);
	int insertCust04(CustDTO dto);
	CustDTO sessionSelectCust(int custCompNo);
	int tempSelectCustInsert(CustDTO dto);
}
