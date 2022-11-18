package kr.swcore.sderp.calendar;

import com.google.gson.Gson;
import kr.swcore.sderp.calendar.dto.CalendarDTO;
import kr.swcore.sderp.calendar.service.CalendarService;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.organiz.Service.OrganizService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Inject
	CalendarService calendarService;
	
	@Inject
	OrganizService organizService;
	
	@Inject
	CodeService codeService;
	
	@ResponseBody
	@RequestMapping(value = "listEvent.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String list(ModelAndView mav, HttpSession session, CalendarDTO dto) {
		List<CalendarDTO> list = calendarService.listEvent(session, dto);
		if (list == null) return "{}";
		else return new Gson().toJson(list);
	}
	
	@RequestMapping("organization.do")
	@ResponseBody
	public Map<String, Object> organizationList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("organizationList", organizService.listDept(session));
		map.put("companyList", codeService.listComp());
		return map;
	}

	@RequestMapping(value ="organization2.do", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String organizationTree(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String rtn = organizService.listDeptForCalendarJson(session);
		response.setCharacterEncoding("UTF-8");
		return rtn;
	}
	
	/*
	 * @RequestMapping("loadEvent.do") public ModelAndView listEvent(ModelAndView
	 * mav) { mav.setViewName("calendar/listEvent"); mav.addObject("list",
	 * calendarService.listEvent()); return mav; }
	 */	
	@RequestMapping("/detail/{eventNo}")
	public ModelAndView detail(@PathVariable("eventNo") int eventNo, ModelAndView mav) {
		mav.setViewName("calendar/detailEvent");
		mav.addObject("dto", calendarService.detailEvent(eventNo));
		return mav;
	}
	
	@RequestMapping("calmain.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("fullcalendar4/calmain3");
		mav.addObject("organizationJson",organizService.listDeptForCalendarJson(session));
		mav.addObject("organizationArrList",organizService.listDeptForCalendarArrList(session));
		return mav;
	}
	
	@RequestMapping("delete.do")
	public ResponseEntity<?> delete(@ModelAttribute CalendarDTO dto) {
	Map<String, Object> param = new HashMap<>();
	int calendarUpdate = calendarService.deleteEvent(dto.getEventNo());
	if (calendarUpdate >0) {
		param.put("code","10001"); 
	}
	else {param.put("code","20001");
	}
	return ResponseEntity.ok(param);
}

	
}
