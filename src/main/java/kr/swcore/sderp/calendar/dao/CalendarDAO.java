package kr.swcore.sderp.calendar.dao;

import java.util.List;

import kr.swcore.sderp.calendar.dto.CalendarDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface CalendarDAO {
	
		List<CalendarDTO> listEvent();
		List<CalendarDTO> listEvent(CalendarDTO dto);
		CalendarDTO detailEvent(int eventNo);
		int deleteEvent(int eventNo);
}
