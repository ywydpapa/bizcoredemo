package kr.swcore.sderp.store;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.store.dto.StoreDTO;
import kr.swcore.sderp.store.service.StoreService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/store/")
public class StoreController {

    @Inject
    StoreService storeService;

    @Inject
    CodeService codeService;
    @RequestMapping("listStore.do")
    public ModelAndView list(HttpSession session,StoreDTO dto, ModelAndView mav) {
        mav.addObject("store", storeService.listStore(session, dto));
        mav.setViewName("store/list");
        return mav;
    }


    @RequestMapping("writeStore.do")
    public ModelAndView write(HttpSession session, CodeDTO dto, ModelAndView mav) {
    	mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
        mav.setViewName("store/write");
        return mav;
    }

}


