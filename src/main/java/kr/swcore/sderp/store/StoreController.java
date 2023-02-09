package kr.swcore.sderp.store;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.store.dto.StoreDTO;
import kr.swcore.sderp.store.service.StoreService;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/store/")
public class StoreController {

    @Inject
    StoreService storeService;

    @Inject
    CodeService codeService;
    //리스트 페이지 조회 
    @RequestMapping("listStore.do")
    public ModelAndView list(HttpSession session,StoreDTO dto, ModelAndView mav) {
        mav.addObject("store", storeService.listStore(session, dto));
        mav.setViewName("store/list");
        return mav;
    }

    // 등록 페이지 조회 
    @RequestMapping("writeStore.do")
    public ModelAndView write(HttpSession session, CodeDTO dto, ModelAndView mav) {
    	mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
        mav.setViewName("store/write");
        return mav;
    }
    
    
    // 재고 insert 
    @RequestMapping("insert.do") 
    public ResponseEntity<?> storeInsert(HttpSession session, @ModelAttribute StoreDTO dto){
    	
    	Map<String, Object> param = new HashMap<>();
    	int storeInsert =storeService.insertStore(session, dto);
    	if(storeInsert > 0) {
        param.put("code","10001");
    	}
    	else {
        param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    } 
    
    
    @RequestMapping("/detail/{storeNo}")
    public ModelAndView detail(HttpSession session, @PathVariable("storeNo") int storeNo, ModelAndView mav) {
    	mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
    	mav.addObject("dto", storeService.storeDetail(storeNo)); 
    	mav.setViewName("store/detail");
    	return mav;
    }
    

}


