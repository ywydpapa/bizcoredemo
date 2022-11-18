package kr.swcore.sderp.cont.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.cont.dto.ContDTO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;

public interface ContService {
	
	List<ContDTO> listCont();
	List<ContDTO> listCont(HttpSession session, PageDTO pageDTO, ContDTO dto);
	List<ContDTO> listconCont(HttpSession session, ContDTO dto);
	ContDTO detailCont(int contNo);
	int updateCont(ContDTO dto);
	int deleteCont(int contNo);
	int insertCont(ContDTO dto);
	int insertCont(HttpSession session, ContDTO dto);

	Map<String, Object> listSalesTargetMonthIndividual(HttpSession session, ContDTO contDTO);
}
