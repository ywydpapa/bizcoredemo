package kr.swcore.sderp.calendar.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.calendar.dto.CalendarDTO;

public interface CalendarService {

	List<CalendarDTO> listEvent();
	List<CalendarDTO> listEvent(HttpSession session, CalendarDTO dto);
	CalendarDTO detailEvent(int eventNo);
	int deleteEvent(int eventNo);
	
}
