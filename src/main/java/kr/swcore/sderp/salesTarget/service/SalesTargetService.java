package kr.swcore.sderp.salesTarget.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;

public interface SalesTargetService {
	List<SalesTargetDTO> listSalesTarget();
	List<Object> listSalesTarget(HttpSession session, OrganizDTO organizDto, SalesTargetDTO salesTargetDTO);
	SalesTargetDTO detailSalesTarget(SalesTargetDTO salesTargetDTO);
	int updateSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO);
	int deleteSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO);
	int insertSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO);
	
	Map<String, Object> listSalesTargetYearTotalSalesIndividual(HttpSession session, SalesTargetDTO salesTargetDTO);
	Map<String, Object> listSalesTargetYearTotalProfitIndividual(HttpSession session, SalesTargetDTO salesTargetDTO);
	Map<String, Object> listSalesTargetMonthIndividual(HttpSession session, SalesTargetDTO salesTargetDTO);
	Map<String, Object> listSalesTargetYearIndividual(HttpSession session, SalesTargetDTO salesTargetDTO);
	
	Map<String, Object> listSalesTargetMonthdept(HttpSession session, SalesTargetDTO salesTargetDTO);
	Map<String, Object> listSalesTargetYeardept(HttpSession session, SalesTargetDTO salesTargetDTO);
	Map<String, Object> listSalesTargetYearTotalSalesdept(HttpSession session, SalesTargetDTO salesTargetDTO);
	Map<String, Object> listSalesTargetYearTotalProfitdept(HttpSession session, SalesTargetDTO salesTargetDTO);
	
	Map<String, Object> listSalesTargetMonthCompany(HttpSession session, SalesTargetDTO salesTargetDTO);
	Map<String, Object> listSalesTargetYearCompany(HttpSession session, SalesTargetDTO salesTargetDTO);
	Map<String, Object> listSalesTargetYearTotalSalesCompany(HttpSession session, SalesTargetDTO salesTargetDTO);
	Map<String, Object> listSalesTargetYearTotalProfitCompany(HttpSession session, SalesTargetDTO salesTargetDTO);
}
