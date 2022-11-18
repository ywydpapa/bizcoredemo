package kr.swcore.sderp.salesTarget.dao;

import java.util.List;

import kr.swcore.sderp.account.dto.AccountDTO;
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
	List<SalesTargetDTO> gradata(SalesTargetDTO dto);
	List<SalesTargetDTO> gradata01(AccountDTO dto);
	List<SalesTargetDTO> gradata02(AccountDTO dto);
	List<SalesTargetDTO> gradata03(AccountDTO dto);
	List<SalesTargetDTO> gradata04(AccountDTO dto);
	List<SalesTargetDTO> gradata05(AccountDTO dto);
	List<SalesTargetDTO> gradata06(AccountDTO dto);
	List<SalesTargetDTO> gradata07(AccountDTO dto);
	List<SalesTargetDTO> gradata08(AccountDTO dto);
	List<SalesTargetDTO> gradata09(AccountDTO dto);
	List<SalesTargetDTO> gradata10(AccountDTO dto);
	List<SalesTargetDTO> gradata11(AccountDTO dto);
	List<SalesTargetDTO> gradata12(AccountDTO dto);
	List<SalesTargetDTO> nomalgradata(SalesTargetDTO dto);
	List<AccountDTO> user_sales_target(AccountDTO dto);
	List<AccountDTO> cnt_mouth_data(AccountDTO dto);
	List<AccountDTO> cnt_mouth_data_last(AccountDTO dto);
	List<AccountDTO> user_chart_target(AccountDTO dto);
	List<AccountDTO> user_now_graph(AccountDTO dto);
}
