package kr.swcore.sderp.bcode;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.bcode.service.BcodeService;
import kr.swcore.sderp.code.CodeController;

public class BcodeController {

	private static final Logger logger = LoggerFactory.getLogger(CodeController.class);
	
	@Inject
	BcodeService bcodeService;
	
	@RequestMapping("/bcode/{code02}")
	public ModelAndView listCode03(@PathVariable("code02") String code02, ModelAndView mav) {
		mav.addObject("dto", bcodeService.listCode03(code02));
		return mav;
	}
	
}
