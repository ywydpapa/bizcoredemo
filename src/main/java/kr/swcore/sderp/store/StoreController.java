package kr.swcore.sderp.store;

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

    @RequestMapping("listStore.do")
    public ModelAndView list(HttpSession session,StoreDTO dto, ModelAndView mav) {
        mav.addObject("store", storeService.listStore(session, dto));
        mav.setViewName("store/list");
        return mav;
    }


    @RequestMapping("writeStore.do")
    public ModelAndView write(HttpSession session,StoreDTO dto, ModelAndView mav) {
        mav.setViewName("store/write");
        return mav;
    }

}


