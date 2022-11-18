package kr.swcore.sderp.salesTarget.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.user.dto.UserDTO;

@Repository
public class SalesTargetDAOImpl implements SalesTargetDAO{
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<SalesTargetDTO> listSalesTarget() {
		return null;
	}

	@Override
	public List<SalesTargetDTO> listSalesTarget(int compNo, String targetYear, String targetType, List<UserDTO> userDtoList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("compNo", compNo);
		map.put("targetYear", targetYear);
		map.put("targetType", targetType);
		map.put("userDtoList", userDtoList);
		return sqlSession.selectList("salesTarget.listSalesTarget", map);
	}

	@Override
	public SalesDTO detailSalesTarget(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.detailSalesTarget", salesTargetDTO);
	}

	@Override
	public int updateSalesTarget(SalesTargetDTO salesTargetDTO) {
		return sqlSession.update("salesTarget.updateSalesTarget", salesTargetDTO);
	}

	@Override
	public int deleteSalesTarget(SalesTargetDTO salesTargetDTO) {
		return sqlSession.delete("salesTarget.deleteSalesTarget", salesTargetDTO);
	}

	@Override
	public int insertSalesTarget(SalesTargetDTO salesTargetDTO) {
		return sqlSession.insert("salesTarget.insertSalesTarget", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listViewGraphData01CompnayMonth(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listViewGraphData01CompnayMonth", salesTargetDTO);
	}

	@Override
	public List<SalesTargetDTO> gradata(SalesTargetDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("salesTarget.gradata", dto);
	}

	@Override
	public List<SalesTargetDTO> gradata01(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata01", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata02(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata02", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata03(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata03", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata04(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata04", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata05(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata05", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata06(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata06", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata07(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata07", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata08(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata08", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata09(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata09", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata10(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata10", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata11(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata11", dto);
	}
	
	@Override
	public List<SalesTargetDTO> gradata12(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.gradata12", dto);
	}

	@Override
	public List<SalesTargetDTO> nomalgradata(SalesTargetDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("salesTarget.nomalgradata", dto);
	}

	@Override
	public List<AccountDTO> user_sales_target(AccountDTO dto) {
		// TODO Auto-generated method stub
		return  sqlSession.selectList("salesTarget.user_sales_target", dto);
	}

	@Override
	public List<AccountDTO> cnt_mouth_data(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.cnt_mouth_data", dto);
	}

	@Override
	public List<AccountDTO> cnt_mouth_data_last(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.cnt_mouth_data_last", dto);
	}

	@Override
	public List<AccountDTO> user_chart_target(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.user_chart_target", dto);
	}

	@Override
	public List<AccountDTO> user_now_graph(AccountDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("account.user_now_graph", dto);
	}
	/*
	@Override
	public SalesTargetDTO listSalesTargetYearTotalSalesIndividual(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetYearTotalSalesIndividual", salesTargetDTO);
	}
	
	@Override
	public SalesTargetDTO listSalesTargetYearTotalProfitIndividual(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetYearTotalProfitIndividual", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listSalesTargetMonthIndividual(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetMonthIndividual", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listSalesTargetYearIndividual(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetYearIndividual", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listSalesTargetYearTotalSalesdept(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetYearTotalSalesdept", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listSalesTargetYearTotalProfitdept(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetYearTotalProfitdept", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listSalesTargetMonthdept(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetMonthdept", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listSalesTargetYeardept(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetYeardept", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listSalesTargetYearTotalSalesCompany(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetYearTotalSalesCompany", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listSalesTargetYearTotalProfitCompany(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetYearTotalProfitCompany", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listSalesTargetMonthCompany(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetMonthCompany", salesTargetDTO);
	}

	@Override
	public SalesTargetDTO listSalesTargetYearCompany(SalesTargetDTO salesTargetDTO) {
		return sqlSession.selectOne("salesTarget.listSalesTargetYearCompany", salesTargetDTO);
	}
	*/
}
