package kr.swcore.sderp.util;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.sopp.dto.SoppDTO;

public class SessionInfoGet {
	public static SoppDTO getCompNoDto(HttpSession session) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		SoppDTO soppdto = new SoppDTO();
		soppdto.setCompNo(compNo);
		return soppdto;
	}
	
	public static Integer getCompNo(HttpSession session) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		return compNo;
	}
	
	public static Integer getUserNo(HttpSession session) {
		Integer userNo = Integer.valueOf((String) session.getAttribute("userNo"));
		return userNo;
	}
	
	public static String getlistDateFrom(HttpSession session) {
		String listDateFrom = (String)session.getAttribute("listDateFrom");
		
		if(listDateFrom == null) {
			listDateFrom = "2010-01-01";
		}
		
		return listDateFrom;
	}
}
