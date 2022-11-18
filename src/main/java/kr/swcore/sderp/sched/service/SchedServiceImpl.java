package kr.swcore.sderp.sched.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.swcore.sderp.code.dao.CodeDAO;
import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.common.dto.WrapperDTO;
import kr.swcore.sderp.sched.dao.SchedDAO;
import kr.swcore.sderp.sched.dto.SchedDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;
@Service
public class SchedServiceImpl implements SchedService {
	
	@Inject
	SchedDAO schedDao;
	
	@Inject
	CodeDAO codeDao;

	@Override
	public List<SchedDTO> listSched() {
		// TODO Auto-generated method stub
		return schedDao.listSched();
	}
	
	@Override
	public Object listSched(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		SchedDTO dto = new SchedDTO();
		Integer compNo = SessionInfoGet.getCompNo(session);						// 濡쒓렇�씤 �쉶�궗 援щ텇 肄붾뱶
		String userNostr = request.getParameter("userNo");
		Integer userNo = userNostr.equals("") == true ? null : Integer.valueOf(userNostr);	// �떞�떦�궗�썝
		String soppNostr = request.getParameter("soppNo");
		Integer soppNo = soppNostr.equals("") == true ? null : Integer.valueOf(soppNostr);	// �쁺�뾽湲고쉶
		String contNostr = request.getParameter("contNo");
		Integer contNo = contNostr.equals("") == true ? null : Integer.valueOf(contNostr);	// 怨꾩빟
		String custNostr = request.getParameter("custNo");
		Integer custNo = custNostr.equals("") == true ? null : Integer.valueOf(custNostr);	// 嫄곕옒泥�
		String endCustNostr =  request.getParameter("endCustNo");
		Integer endCustNo = endCustNostr.equals("") == true ? null : Integer.valueOf(endCustNostr);	// �뿏�뱶�쑀��
		String schedType = request.getParameter("schedType") != null ? (String) request.getParameter("schedType") : "";			// �솢�룞�삎�깭
		String schedCat = request.getParameter("schedCat") != null ? (String) request.getParameter("schedCat") : "";			// �솢�룞�삎�깭
		String schedFrom = request.getParameter("schedFrom") != null ? (String) request.getParameter("schedFrom") : "";			// �떆�옉�씪
		String schedTo = request.getParameter("schedTo") != null ? (String) request.getParameter("schedTo") : "";				// 留덇컧�씪
		String regSDate = request.getParameter("regSDate") != null ? (String) request.getParameter("regSDate") : "";					// �벑濡� �떆�옉�씪
		String regEDate = request.getParameter("regEDate") != null ? (String) request.getParameter("regEDate") : "";					// �벑濡� 留덇컧�씪

		dto.setCompNo(compNo);
		if(userNo != null) dto.setUserNo(userNo);
		if(soppNo != null) dto.setSoppNo(soppNo);
		if(contNo != null) dto.setContNo(contNo);
		if(custNo != null) dto.setCustNo(custNo);
		if(endCustNo != null) dto.setEndCustNo(endCustNo);
		dto.setSchedType(schedType);
		dto.setSchedCat(schedCat);
		dto.setSchedFrom(schedFrom);
		dto.setSchedTo(schedTo);
		dto.setRegSDate(regSDate);
		dto.setRegEDate(regEDate);

		String sEcho = request.getParameter("sEcho");
		String limitstr = request.getParameter("iDisplayLength");
		Integer limit = limitstr.equals("") == true ? 20 : Integer.valueOf(limitstr);	// 湲곕낯媛� 20 �꽭�똿
		String offsetstr = request.getParameter("iDisplayStart");
		Integer offset = offsetstr.equals("") == true ? 0 : Integer.valueOf(offsetstr);
		String sSearch = (String) request.getParameter("sSearch");

		String orderColumn = request.getParameter("iSortCol_0");
		String orderOption = request.getParameter("sSortDir_0");

		String column = "";
		switch (orderColumn){
			case "0" : column = "regDatetime"; break;
			case "1" : column = "schedTypeN"; break; // 鍮꾪솢�꽦�솕 議곗튂
			case "2" : column = "schedTitle"; break;
			case "3" : column = "schedFrom"; break;
			case "4" : column = "custName"; break;
			case "5" : column = "userName"; break;
			case "6" : column = "schedPlace"; break;
			case "7" : column = "schedCatN"; break;
			case "8" : column = "schedDesc"; break;
			default : column = "regDatetime"; break;
		}

		String option = "";
		switch (orderOption){
			case "desc" : option = "desc"; break;
			case "asc" : option = "asc"; break;
			default : option = "desc"; break;
		}

		dto.setLimit(limit);
		dto.setOffset(offset);
		dto.setSSearch(sSearch);

		dto.setOrderColumn(column);
		dto.setOrderOption(option);

		WrapperDTO wrapperDTO = new WrapperDTO();
		wrapperDTO.setAaData(schedDao.listSched(dto));



		Integer cnt = schedDao.listSchedCnt(dto);
		wrapperDTO.setITotalRecords(cnt);
		wrapperDTO.setITotalDisplayRecords(cnt);

		return wrapperDTO;
	}
	
	@Override
	public List<SchedDTO> listconSched(HttpSession session, SchedDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return schedDao.listconSched(dto);
	}

	@Override
	public SchedDTO detailSched(int schedNo) {
		// TODO Auto-generated method stub
		return schedDao.detailSched(schedNo);
	}

	@Override
	public int insertSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return schedDao.insertSched(dto);
	}
	
	@Override
	public int insertSched(HttpSession session, SchedDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		String userId = (String) session.getAttribute("userId");
		dto.setCompNo(compNo);
		dto.setUserId(userId);
		
		SoppDTO soppdto = new SoppDTO();
		soppdto.setCompNo(compNo);
		List<CodeDTO> codeDto = codeDao.listSchedtype(soppdto);
		
		for(int i = 0; i < codeDto.size(); i++) {
			CodeDTO item = codeDto.get(i);
			if(item.getCode03().equals("SCHED004")) {
				dto.setSchedType(String.valueOf(item.getCodeNo()));
			}
		}
		
		int schedInsert = 0;
		schedInsert = schedDao.insertSched(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public int deleteSched(int schedNo) {
		// TODO Auto-generated method stub
		return schedDao.deleteSched(schedNo);
	}

	@Override
	public int updateSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return schedDao.updateSched(dto);
	}

	@Override
	public Object listSreport(HttpSession session, HttpSession session2, Object object, Object object2) {
		// TODO Auto-generated method stub
		int compNo = SessionInfoGet.getCompNo(session);
		Integer userNo = SessionInfoGet.getUserNo(session2);
		SchedDTO dto = new SchedDTO();
		dto.setCompNo(compNo);
		dto.setUserNo(userNo);
		return schedDao.listSreport(dto);
	}

	@Override
	public int insertSreport(SchedDTO dto) {
		// TODO Auto-generated method stub
		return schedDao.insertSreport(dto);
	}

	@Override
	public List<SchedDTO> listMreport(HttpSession session) {
		// TODO Auto-generated method stub
		int compNo = SessionInfoGet.getCompNo(session);
		SchedDTO dto = new SchedDTO();
		dto.setCompNo(compNo);
		return schedDao.listMreport(dto);
	}

	@Override
	public SchedDTO detailAddtext(int sreportNo) {
		// TODO Auto-generated method stub
		return schedDao.detailAddtext(sreportNo);
	}

	@Override
	public Object detailSreport(HttpSession session,SchedDTO dto){
		// TODO Auto-generated method stub
		int compNo = SessionInfoGet.getCompNo(session);
		int userNo = dto.getUserNo();
		dto.setCompNo(compNo);
		dto.setUserNo(userNo);
		return schedDao.detailSreport(dto);
	}

	@Override
	public SchedDTO myAddtext(HttpSession session3,SchedDTO dto) {
		// TODO Auto-generated method stub
		int userNo = SessionInfoGet.getUserNo(session3);
		dto.setUserNo(userNo);
		return schedDao.myAddtext(dto);
	}


}
