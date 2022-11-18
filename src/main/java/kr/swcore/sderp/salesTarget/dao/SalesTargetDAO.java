package kr.swcore.sderp.salesTarget.dao;

import java.util.List;

import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.user.dto.UserDTO;

public interface SalesTargetDAO {
	List<SalesTargetDTO> listSalesTarget();
	List<SalesTargetDTO> listSalesTarget(int compNo, String targetYear, String targetType, List<UserDTO> userDtoList);
	SalesDTO detailSalesTarget(SalesTargetDTO salesTargetDTO);
	int updateSalesTarget(SalesTargetDTO salesTargetDTO);
	int deleteSalesTarget(SalesTargetDTO salesTargetDTO);
	int insertSalesTarget(SalesTargetDTO salesTargetDTO);
	
//	SalesTargetDTO listSalesTargetYearTotalSalesIndividual(SalesTargetDTO salesTargetDTO);
//	SalesTargetDTO listSalesTargetYearTotalProfitIndividual(SalesTargetDTO salesTargetDTO);
//	SalesTargetDTO listSalesTargetMonthIndividual(SalesTargetDTO salesTargetDTO);
//	SalesTargetDTO listSalesTargetYearIndividual(SalesTargetDTO salesTargetDTO);
//
//	SalesTargetDTO listSalesTargetYearTotalSalesdept(SalesTargetDTO salesTargetDTO);
//	SalesTargetDTO listSalesTargetYearTotalProfitdept(SalesTargetDTO salesTargetDTO);
//	SalesTargetDTO listSalesTargetMonthdept(SalesTargetDTO salesTargetDTO);
//	SalesTargetDTO listSalesTargetYeardept(SalesTargetDTO salesTargetDTO);
//
//	SalesTargetDTO listSalesTargetYearTotalSalesCompany(SalesTargetDTO salesTargetDTO);
//	SalesTargetDTO listSalesTargetYearTotalProfitCompany(SalesTargetDTO salesTargetDTO);
//	SalesTargetDTO listSalesTargetMonthCompany(SalesTargetDTO salesTargetDTO);
//	SalesTargetDTO listSalesTargetYearCompany(SalesTargetDTO salesTargetDTO);

	SalesTargetDTO listViewGraphData01CompnayMonth(SalesTargetDTO salesTargetDTO);
}
