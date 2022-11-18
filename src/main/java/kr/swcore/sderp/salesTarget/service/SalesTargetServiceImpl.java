package kr.swcore.sderp.salesTarget.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import kr.swcore.sderp.HomeController;
import kr.swcore.sderp.organiz.Service.OrganizService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.salesTarget.dao.SalesTargetDAO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.user.dto.UserDTO;
import kr.swcore.sderp.user.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

@Service
public class SalesTargetServiceImpl implements SalesTargetService {

	@Inject
	SalesTargetDAO salesTargetDAO;
	
	@Inject
	OrganizService organizService;
	
	@Inject
	UserService userService;


	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private static HashMap<Integer, Object> graph1Cache = null;

	private Integer n1 = 10000000;	// 천만원

	@PostConstruct
	public void init(){
	//	SalesTargetDTO_Static.Update();
	}

	private static SalesTargetDTO defaultSetCompNoAnduserNo(HttpSession session, SalesTargetDTO salesTargetDTO) {
		if(salesTargetDTO == null) salesTargetDTO = new SalesTargetDTO();
		
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		salesTargetDTO.setCompNo(compNo);
		
		Integer userNo = Integer.valueOf((String) session.getAttribute("userNo"));
		salesTargetDTO.setUserNo(userNo);
		return salesTargetDTO;
	}
	
	private SalesTargetDTO defaultSetCalendarInfoYearAndMonth(SalesTargetDTO salesTargetDTO) {
		Calendar cal = Calendar.getInstance();
		String targetYear = salesTargetDTO.getTargetYear();
		if(targetYear == null || targetYear.equals("")) {
			targetYear = String.valueOf(cal.get(Calendar.YEAR));
			salesTargetDTO.setTargetYear(targetYear);
		}
		
		String targetMonth = salesTargetDTO.getTargetMonth();
		Integer month = 0;
		if(targetMonth == null || targetMonth.equals("")) {
			month = cal.get(Calendar.MONTH)+1;
		} else {
			month = Integer.valueOf(targetMonth);
		}
		if(month < 10) {
			targetMonth = "0"+String.valueOf(month);
		} else {
			targetMonth = ""+String.valueOf(month);
		}
		salesTargetDTO.setTargetMonth(targetMonth);
		return salesTargetDTO;
	}

	@Override
	public List<SalesTargetDTO> listSalesTarget() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> listSalesTarget(HttpSession session, OrganizDTO organizDto, SalesTargetDTO salesTargetDTO) {
		if(salesTargetDTO == null) salesTargetDTO = new SalesTargetDTO();
		
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		String targetYear = salesTargetDTO.getTargetYear();
		String targetType = salesTargetDTO.getTargetType();
		
		if(targetYear == null || targetYear.equals("")) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			targetYear = String.valueOf(year);
		}
		
		if(targetType == null || targetType.equals("")) {
			targetType = "PROFIT";
		} else {
			targetType = targetType.toUpperCase();
		}
		
		// 세션을 통해 부서 리스트 검색
		List<OrganizDTO> deptList = null;
		Integer orgId = null;
		if(salesTargetDTO.getOrgId() == 0) {
			// 부서선택을 전부 선택한경우
			deptList = organizService.listDeptChainExtend(session, null);
		} else {
			organizDto.setOrg_id(salesTargetDTO.getOrgId());
			orgId = salesTargetDTO.getOrgId();
			deptList = organizService.listDeptChainExtend(session, organizDto);
		}
		
		List<Object> returnData = new ArrayList<Object>();
		HashMap<String, Object> selectedData = new HashMap<>();
		selectedData.put("targetYear", targetYear);
		selectedData.put("targetType", targetType);
		selectedData.put("orgId", orgId);
		returnData.add(selectedData);
		
		HashMap<String, Object> deptData = null;
		List<UserDTO> userList = null;
		
		for(OrganizDTO organizDTO : deptList) {	
			deptData = new HashMap<String, Object>();
			deptData.put("deptData", organizDTO);	// 부서명 저장
			
			UserDTO userDTO = new UserDTO();
			int orgIdTemp = organizDTO.getOrg_id();
			userDTO.setOrg_id(orgIdTemp);
			// 부서 코드에 맞는 swc_user 테이블을 접근하여 유저리스트를 반환한다.
			userList = userService.userListWithOrgId(userDTO);
			
			//HashMap<String, Object> salesTargetDataMap = new HashMap<String, Object>();
			if (userList.size() > 0) {
				// 유저 리스트 기준으로 salesTarget 테이블을 접근합니다.
				List<SalesTargetDTO> temp = salesTargetDAO.listSalesTarget(compNo, targetYear, targetType, userList);
				if (temp.size() > 0 && temp != null) {
					deptData.put("salesTargetData", temp);
				}
			}			
			returnData.add(deptData);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = "";
		try {
			json = mapper.writeValueAsString(returnData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		logger.info(json);
		
		return returnData;
	}

	@Override
	public SalesTargetDTO detailSalesTarget(SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		int schedInsert = 0;
		
		List<SalesTargetDTO> list = salesTargetDTO.getSalesTargetlist();
		for(SalesTargetDTO dto : list) {
			dto.setCompNo(compNo);
			try {
				schedInsert = salesTargetDAO.updateSalesTarget(dto);
			} catch (Exception e) {
				schedInsert = 0;
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 

		return schedInsert;
	}

	@Override
	public int deleteSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSalesTarget(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	private Integer[] StringToInteger(String[] data){
		Integer[] rtn = new Integer[data.length];
		for(int i=0; i<rtn.length; i++){
			rtn[i] = Integer.valueOf(data[i]);
		}
		return rtn;
	}

	private BigDecimal[] StringToBigDecimal(String[] data){
		BigDecimal[] rtn = new BigDecimal[data.length];
		for(int i=0; i<rtn.length; i++){
			rtn[i] = new BigDecimal(data[i]);
		}
		return rtn;
	}

	private BigDecimal[] StringToBigDecimalDivCurreny(String[] data){
		BigDecimal[] rtn = new BigDecimal[data.length];
		BigDecimal n1Decimal = new BigDecimal(n1);
		for(int i=0; i<rtn.length; i++){
			rtn[i] = new BigDecimal(data[i]).divide(n1Decimal, 1, BigDecimal.ROUND_DOWN);
		}
		return rtn;
	}
	
	// 연간 계획대비 실적
	@Override
	public Map<String, Object> listSalesTargetYearTotalSalesIndividual(HttpSession session, SalesTargetDTO salesTargetDTO) {
		Map<String, Object> returnMap = new HashMap<>();
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		salesTargetDTO = defaultSetCompNoAnduserNo(session, salesTargetDTO);
		salesTargetDTO = defaultSetCalendarInfoYearAndMonth(salesTargetDTO);
		returnMap.put("targetYear", salesTargetDTO.getTargetYear());
		returnMap.put("targetMonth", salesTargetDTO.getTargetMonth());

		SalesTargetDTO resultDto = new SalesTargetDTO();
		
		Boolean result = false;
		try {
			resultDto = (SalesTargetDTO) SalesTargetGraph_Static.GetWithCompNo(compNo);
			//resultDto = salesTargetDAO.listViewGraphData01CompnayMonth(salesTargetDTO);
			if(resultDto != null){
				String[] monthArr = resultDto.getMonthDate_Group().split(",");
				String[] salesArr = resultDto.getSalesTarget_Group().split(",");
				BigDecimal[] sales = StringToBigDecimalDivCurreny(salesArr);
				BigDecimal[] salesOrgin = StringToBigDecimal(salesArr);

				String[] profitArr = resultDto.getProfitTarget_Group().split(",");
				BigDecimal[] profit = StringToBigDecimalDivCurreny(profitArr);
				BigDecimal[] profitOrgin = StringToBigDecimal(profitArr);

				String[] overArr = resultDto.getOverTarget_Group().split(",");
				BigDecimal[] over = StringToBigDecimalDivCurreny(overArr);
				BigDecimal[] overOrgin = StringToBigDecimal(overArr);

				String[] percentArr = resultDto.getPercent_Group().split(",");
				BigDecimal[] percent = StringToBigDecimal(percentArr);

				String[] cnt01Arr = resultDto.getCnt01_Group().split(",");
				Integer[] cnt01 = StringToInteger(cnt01Arr);

				String[] cnt01SumArr = resultDto.getCnt01_SUM_Group().split(",");
				BigDecimal[] cnt01Sum = StringToBigDecimal(cnt01SumArr);

				String[] cnt02Arr = resultDto.getCnt02_Group().split(",");
				Integer[] cnt02 = StringToInteger(cnt02Arr);

				String[] cnt02SumArr = resultDto.getCnt02_SUM_Group().split(",");
				BigDecimal[] cnt02Sum = StringToBigDecimal(cnt02SumArr);

				String[] cnt03Arr = resultDto.getCnt03_Group().split(",");
				Integer[] cnt03 = StringToInteger(cnt03Arr);

				String[] cnt03SumArr = resultDto.getCnt03_SUM_Group().split(",");
				BigDecimal[] cnt03Sum = StringToBigDecimal(cnt03SumArr);

				String[] cnt04Arr = resultDto.getCnt04_Group().split(",");
				Integer[] cnt04 = StringToInteger(cnt04Arr);

				String[] cnt04SumArr = resultDto.getCnt04_SUM_Group().split(",");
				BigDecimal[] cnt04Sum = StringToBigDecimal(cnt04SumArr);

				String[] cnt05Arr = resultDto.getCnt05_Group().split(",");
				Integer[] cnt05 = StringToInteger(cnt05Arr);

				String[] cnt05SumArr = resultDto.getCnt05_SUM_Group().split(",");
				BigDecimal[] cnt05Sum = StringToBigDecimal(cnt05SumArr);

				String[] cnt06Arr = resultDto.getCnt06_Group().split(",");
				Integer[] cnt06 = StringToInteger(cnt06Arr);

				String[] cnt06SumArr = resultDto.getCnt06_SUM_Group().split(",");
				BigDecimal[] cnt06Sum = StringToBigDecimal(cnt06SumArr);

				returnMap.put("code", 10001);
				returnMap.put("monthArr", monthArr);
				returnMap.put("sales", sales);
				returnMap.put("salesOrgin", salesOrgin);
				returnMap.put("profit", profit);
				returnMap.put("profitOrgin", profitOrgin);
				returnMap.put("over", over);
				returnMap.put("overOrgin", overOrgin);
				returnMap.put("percent", percent);
				returnMap.put("cnt01", cnt01);
				returnMap.put("cnt01Sum", cnt01Sum);
				returnMap.put("cnt02", cnt02);
				returnMap.put("cnt02Sum", cnt02Sum);
				returnMap.put("cnt03", cnt03);
				returnMap.put("cnt03Sum", cnt03Sum);
				returnMap.put("cnt04", cnt04);
				returnMap.put("cnt04Sum", cnt04Sum);
				returnMap.put("cnt05", cnt05);
				returnMap.put("cnt05Sum", cnt05Sum);
				returnMap.put("cnt06", cnt06);
				returnMap.put("cnt06Sum", cnt06Sum);

				return returnMap;
			}
		} catch (Exception e) {
			e.printStackTrace();
			returnMap.put("code", 20001);
			returnMap.put("data", null);
		}

		return returnMap;
	}

	@Override
	public Map<String, Object> listSalesTargetYearTotalProfitIndividual(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	// 월 계획대비 실적
	@Override
	public Map<String, Object> listSalesTargetMonthIndividual(HttpSession session, SalesTargetDTO salesTargetDTO) {
		Map<String, Object> returnMap = new HashMap<>();
		salesTargetDTO = defaultSetCompNoAnduserNo(session, salesTargetDTO);
		salesTargetDTO = defaultSetCalendarInfoYearAndMonth(salesTargetDTO);
		returnMap.put("targetYear", salesTargetDTO.getTargetYear());
		returnMap.put("targetMonth", salesTargetDTO.getTargetMonth());

		return returnMap;
	}
	
	// 누적 계획대비 실적
	@Override
	public Map<String, Object> listSalesTargetYearIndividual(HttpSession session, SalesTargetDTO salesTargetDTO) {
		Map<String, Object> returnMap = new HashMap<>();
		salesTargetDTO = defaultSetCompNoAnduserNo(session, salesTargetDTO);
		salesTargetDTO = defaultSetCalendarInfoYearAndMonth(salesTargetDTO);
		returnMap.put("targetYear", salesTargetDTO.getTargetYear());
		returnMap.put("targetMonth", salesTargetDTO.getTargetMonth());		

		return returnMap;
	}

	@Override
	public Map<String, Object> listSalesTargetMonthdept(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYeardept(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYearTotalSalesdept(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYearTotalProfitdept(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetMonthCompany(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYearCompany(HttpSession session, SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYearTotalSalesCompany(HttpSession session,
			SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listSalesTargetYearTotalProfitCompany(HttpSession session,
			SalesTargetDTO salesTargetDTO) {
		// TODO Auto-generated method stub
		return null;
	}
}
