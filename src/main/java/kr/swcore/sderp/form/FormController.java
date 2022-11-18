package kr.swcore.sderp.form;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/form/*")
public class FormController {

    @RequestMapping("/ordform/{docNo}")
    public ModelAndView detail(@PathVariable("docNo") int docNo, ModelAndView mav) {
         mav.setViewName("form/ordForm");
        return mav;
    }

}
