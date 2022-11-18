package kr.swcore.sderp.techd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.techd.dto.TechdDTO;

public interface TechdService {

	List<TechdDTO> listTechd();
	List<TechdDTO> listTechdbycust(int custNo);
	List<TechdDTO> listTechd(HttpSession session, PageDTO pageDTO);
	Object listTechd(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response);
	List<TechdDTO> listconTechd(HttpSession session, TechdDTO dto);
	List<SalesDTO> listTechdinsopp(HttpSession session, int soppNo, int contNo);
	TechdDTO detailTechd(int techdNo);
	int updateTechd(TechdDTO dto);
	int deleteTechd(int techdNo);
	int insertTechd(TechdDTO dto);
	int insertTechd(HttpSession session, TechdDTO dto);

}
