package kr.swcore.sderp.sales.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.sales.dto.SalesDTO;

public interface SalesService {
	
	List<SalesDTO> listSales();
	List<SalesDTO> listSales(HttpSession session, PageDTO pageDTO);
	List<SalesDTO> listconSales(HttpSession session, SalesDTO dto);
	List<SalesDTO> listSalesinsopp(HttpSession session, int soppNo);
	Object listSales(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response);
	SalesDTO detailSales(int salesNo);
	int updateSales(SalesDTO dto);
	int deleteSales(int salesNo);
	int insertSales(SalesDTO dto);
	int insertSales(HttpSession session, SalesDTO dto);


}
