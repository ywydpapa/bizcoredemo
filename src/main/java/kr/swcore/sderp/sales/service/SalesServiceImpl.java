package kr.swcore.sderp.sales.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.common.dto.WrapperDTO;
import org.springframework.stereotype.Service;

import kr.swcore.sderp.code.dao.CodeDAO;
import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.sales.dao.SalesDAO;
import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;

@Service
public class SalesServiceImpl implements SalesService {

	@Inject
	SalesDAO salesDao;
	
	@Inject
	CodeDAO codeDao;

	@Override
	public List<SalesDTO> listSales() {
		// TODO Auto-generated method stub
		return salesDao.listSales();
	}

	@Override
	public List<SalesDTO> listSalesbycust(int custNo) {
		return salesDao.listSalesbycust(custNo);
	}

	@Override
	public List<SalesDTO> listSales(HttpSession session, PageDTO pageDTO) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		SalesDTO dto = new SalesDTO();
		dto.setCompNo(compNo);
		dto.setListDateFrom(listDateFrom);

		if(pageDTO != null) {
			Integer limit = pageDTO.getLimit();
			dto.setLimit(limit);
			Integer offset = pageDTO.getOffset();
			dto.setOffset(offset);
		}

		dto.setOrderColumn("regDatetime");
		dto.setOrderOption("desc");

		return salesDao.listSales(dto);
	}
	
	@Override
	public List<SalesDTO> listconSales(HttpSession session, SalesDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return salesDao.listconSales(dto);
	}

	@Override
	public SalesDTO detailSales(int salesNo) {
		// TODO Auto-generated method stub
		return salesDao.detailSales(salesNo);
	}

	@Override
	public int updateSales(SalesDTO dto) {
		// TODO Auto-generated method stub
		return salesDao.updateSales(dto);
		
	}

	@Override
	public int deleteSales(int salesNo) {
		// TODO Auto-generated method stub
		return salesDao.deleteSales(salesNo);
	}

	@Override
	public int insertSales(SalesDTO dto) {
		// TODO Auto-generated method stub
		return salesDao.insertSales(dto);
	}
	
	@Override
	public int insertSales(HttpSession session, SalesDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		
		SoppDTO soppdto = new SoppDTO();
		soppdto.setCompNo(compNo);
		List<CodeDTO> codeDto = codeDao.listSchedtype(soppdto);
		
		for(int i = 0; i < codeDto.size(); i++) {
			CodeDTO item = codeDto.get(i);
			if(item.getCode03().equals("SCHED001")) {
				dto.setSchedType(String.valueOf(item.getCodeNo()));
			}
		}
		
		int schedInsert = 0;
		schedInsert = salesDao.insertSales(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}

	@Override
	public List<SalesDTO> listSalesinsopp(HttpSession session, int soppNo, int contNo) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		soppdto.setSoppNo(soppNo);
		soppdto.setContNo(contNo);
		
		return salesDao.listSalesinsopp(soppdto);
	}

	@Override
	public Object listSales(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response) {
		SalesDTO dto = new SalesDTO();
		Integer compNo = SessionInfoGet.getCompNo(session);						// ????????? ?????? ?????? ??????
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		String userNostr = request.getParameter("userNo");
		Integer userNo = userNostr.equals("") == true ? 0 : Integer.valueOf(userNostr);	// ????????????
		String soppNostr =  request.getParameter("soppNo");
		Integer soppNo = soppNostr.equals("") == true ? 0 : Integer.valueOf(soppNostr);	// ????????????
		String custNostr =  request.getParameter("custNo");
		Integer custNo = custNostr.equals("") == true ? 0 : Integer.valueOf(custNostr);	// ????????????
		String salesType = request.getParameter("salesType") != null ? (String) request.getParameter("salesType") : "";						// ????????????
		String salesFrdatetime = request.getParameter("salesFrdatetime") != null ? (String) request.getParameter("salesFrdatetime") : "";	// ?????????
		String salesTodatetime = request.getParameter("salesTodatetime") != null ? (String) request.getParameter("salesTodatetime") : "";	// ?????????
		String regSDate = request.getParameter("regSDate") != null ? (String) request.getParameter("regSDate") : "";					// ?????? ?????????
		String regEDate = request.getParameter("regEDate") != null ? (String) request.getParameter("regEDate") : "";					// ?????? ?????????

		dto.setCompNo(compNo);
		dto.setUserNo(userNo);
		dto.setCustNo(custNo);
		dto.setSoppNo(soppNo);
		dto.setSalesType(salesType);
		dto.setSalesFrdatetime(salesFrdatetime);
		dto.setSalesTodatetime(salesTodatetime);
		dto.setRegSDate(regSDate);
		dto.setRegEDate(regEDate);
		dto.setListDateFrom(listDateFrom);

		String sEcho = request.getParameter("sEcho");
		String limitstr = request.getParameter("iDisplayLength");
		Integer limit = limitstr != null ? Integer.valueOf(limitstr) : 20;	// ????????? 20 ??????
		String offsetstr = request.getParameter("iDisplayStart");
		Integer offset = offsetstr != null ? Integer.valueOf(offsetstr) : 0;
		String sSearch = (String) request.getParameter("sSearch");

		String orderColumn = request.getParameter("iSortCol_0");
		String orderOption = request.getParameter("sSortDir_0");

		String column = "";
		switch (orderColumn){
			case "0" : column = "regDatetime"; break;		// ?????????
			case "1" : column = "salesTitle"; break;		// ???????????????
			case "2" : column = "salesFrdatetime"; break;	// ??????(??????)
			case "3" : column = "salesTodatetime"; break;	// ??????(???)
			case "4" : column = "soppTitle"; break;			// ???????????????
			case "5" : column = "userName"; break;			// ????????????
			case "6" : column = "custName"; break;			// ?????????
			case "7" : column = "ptncName"; break;			// ????????????
			/*case "7" : column = "salesTypeN"; break;*/		// ????????????
			case "8" : column = "salesDesc"; break;			// ????????????
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
		wrapperDTO.setAaData(salesDao.listSales(dto));

		Integer cnt = salesDao.listSalesCnt(dto);
		wrapperDTO.setITotalRecords(cnt);
		wrapperDTO.setITotalDisplayRecords(cnt);

		return wrapperDTO;
	}


}
