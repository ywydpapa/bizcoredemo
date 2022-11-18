package kr.swcore.sderp.code;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;

@Controller
@RequestMapping("/code/*")

public class CodeController {
	
	private static final Logger logger = LoggerFactory.getLogger(CodeController.class);
	
	@Inject
	CodeService codeService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("code/list");
		mav.addObject("list", codeService.listCode(session));
		return mav;
	}

	@RequestMapping("/detail/{codeNo}")
	public ModelAndView detail(@PathVariable("codeNo") int codeNo, ModelAndView mav) {
		mav.setViewName("code/detail");
		mav.addObject("dto", codeService.detailCode(codeNo));
		return mav;
	}
	
	@RequestMapping("/detail01/{codeNo}")
	public ModelAndView detail01(@PathVariable("codeNo") int codeNo, ModelAndView mav) {
		mav.setViewName("code/detail01");
		mav.addObject("dto", codeService.detailCode(codeNo));
		return mav;
	}

	@RequestMapping("/detail02/{codeNo}")
	public ModelAndView detail02(@PathVariable("codeNo") int codeNo, ModelAndView mav) {
		mav.setViewName("code/detail02");
		mav.addObject("dto", codeService.detailCode(codeNo));
		return mav;
	}

	@RequestMapping("/detail03/{codeNo}")
	public ModelAndView detail03(@PathVariable("codeNo") int codeNo, ModelAndView mav) {
		mav.setViewName("code/detail03");
		mav.addObject("dto", codeService.detailCode(codeNo));
		return mav;
	}


	@RequestMapping("write.do")
	public ModelAndView write(HttpSession session, ModelAndView mav) {
		mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
		mav.setViewName("code/write");
		return mav;
	}
	
	@RequestMapping("write3.do")
	public ModelAndView write3(ModelAndView mav) {
		mav.addObject("list1", codeService.listCode01());
		mav.addObject("list2", codeService.listCode02());
		mav.addObject("list3", codeService.listCode03());
		mav.setViewName("code/write3");
		return mav;
	}

	@RequestMapping("write2.do")
	public ModelAndView write2(ModelAndView mav) {
		mav.addObject("list1", codeService.listCode01());
		mav.addObject("list2", codeService.listCode02());
		mav.setViewName("code/write2");
		return mav;
	}
	
	@RequestMapping("write1.do")
	public ModelAndView write1(ModelAndView mav) {
		mav.addObject("list1", codeService.listCode01());
		mav.addObject("list2", codeService.listCode02());
		mav.addObject("list3", codeService.listCode03());
		mav.setViewName("code/write");
		return mav;
	}

	@RequestMapping("organizChart.do")
	public ModelAndView organview(ModelAndView mav) {
		mav.setViewName("organiz/view");
		return mav;
	}

	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(HttpSession session, @ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<>();
		String compNostr = (String) session.getAttribute("compNo");
		Integer compNo = Integer.valueOf(compNostr);
		dto.setCompNo(compNo);
		int codeInsert = codeService.insertCode(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}


	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int codeUpdate = codeService.updateCode(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update01.do")
	public ResponseEntity<?> update01(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int codeUpdate = codeService.updateCode01(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update02.do")
	public ResponseEntity<?> update02(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int codeUpdate = codeService.updateCode02(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("update03.do")
	public ResponseEntity<?> update03(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int codeUpdate = codeService.updateCode03(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}

	

	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute CodeDTO dto) {
			Map<String, Object> param = new HashMap<>();
			int codeUpdate = codeService.deleteCode(dto.getCodeNo());
			if (codeUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}

	@RequestMapping("reload02/{code01}")
	public ModelAndView reload02(@PathVariable("code01") String code01, ModelAndView mav) {
		mav.addObject("dto02", codeService.listCode02n(code01));
		mav.setViewName("code/listcode02n");
		return mav;
	}
	
	@RequestMapping("reload03/{code02}")
	public ModelAndView reload03(@PathVariable("code02") String code02, ModelAndView mav) {
		mav.addObject("dto03", codeService.listCode03n(code02));
		mav.setViewName("code/listcode03n");
		return mav;
	}
	
}
