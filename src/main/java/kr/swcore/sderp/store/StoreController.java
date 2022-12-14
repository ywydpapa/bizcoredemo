package kr.swcore.sderp.store;

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
    public ModelAndView list(HttpSession session, ModelAndView mav) {
        mav.setViewName("store/list");
        mav.addObject("store", storeService.listStore());
        return mav;
    }


}
