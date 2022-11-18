package kr.swcore.sderp.notice;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.notice.dto.NoticeDTO;
import kr.swcore.sderp.notice.service.NoticeService;


@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	@Inject
	NoticeService noticeService;
	
	@Inject
	CodeService codeService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		//mav.addObject("list", noticeService.listNotice(session, null));
		mav.addObject("first","Y");
		mav.setViewName("notice/list");
		return mav;
	}
	
	@RequestMapping(value = "list/data", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody String listData(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(noticeService.listNotice(session, param, request, response));
	}
	
	@RequestMapping(value = "list1/data", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody String listData1(HttpSession session, @RequestBody String param, HttpServletRequest request, HttpServletResponse response){
		Gson ojb = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return ojb.toJson(noticeService.listNotice1(session, param, request, response));
	}
	
	
	@RequestMapping("write.do")
	public ModelAndView write(@RequestParam(value = "simple", required = false) String simple, HttpSession session, ModelAndView mav) {
		if(simple != null){
			mav.addObject("simple","Y");
		}
		mav.setViewName("notice/write");
		return mav;
	}
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute NoticeDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int noticeInsert = noticeService.insertNotice(session, dto);
		param.put("code", (String.valueOf(noticeInsert))); 
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("/detail/{notiNo}")
	public ModelAndView detail(@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss") @PathVariable("notiNo") int notiNo, @RequestParam(value = "simple", required = false) String simple, ModelAndView mav, HttpSession session) {
		mav.setViewName("notice/detail");
		mav.addObject("dto", noticeService.detailNotice(notiNo));
		mav.addObject("acttype", codeService.listActtype(session));
		if(simple != null){
			mav.addObject("simple","Y");
		}
		return mav;
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute NoticeDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int salesUpdate = noticeService.updateNotice(dto);
		if (salesUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	
	@RequestMapping("delete.do")
		public ResponseEntity<?> delete(@ModelAttribute NoticeDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int salesUpdate = noticeService.deleteNotice(dto.getNotiNo());
		if (salesUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
}
