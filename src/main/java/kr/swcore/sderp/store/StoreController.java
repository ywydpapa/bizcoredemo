package kr.swcore.sderp.store;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.store.dto.StoreDTO;
import kr.swcore.sderp.store.dto.StoreInoutDTO;
import kr.swcore.sderp.store.service.StoreInoutService;
import kr.swcore.sderp.store.service.StoreService;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/store/")
public class StoreController {
	

    @Inject
    StoreService storeService;
    
    @Inject 
    StoreInoutService storeInoutService;

    @Inject
    CodeService codeService;
    //리스트 페이지 조회 
    @RequestMapping("listStore.do")
    public ModelAndView list(HttpSession session, StoreDTO dto, ModelAndView mav) {
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
    
    @RequestMapping("writeInout.do")
    public ModelAndView inoutInsert(HttpSession session, StoreDTO dto, ModelAndView mav) {
         mav.addObject("storeList", storeService.storeList(session,dto));
    	 mav.setViewName("store/inoutWrite");
        return mav;
    }
    
    
    @RequestMapping("/detail/{productNo}")
    public ModelAndView detail(HttpSession session, @PathVariable("productNo") int productNo, ModelAndView mav) {
    	mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
    	mav.addObject("dtoList", storeService.storeDetail(productNo)); 
    	mav.setViewName("store/detail");
    	return mav;
    }
    
   
    
    @RequestMapping("/update.do")
    public ResponseEntity<?> storeUpdate(HttpSession session, @ModelAttribute StoreDTO dto) {
    	Map<String, Object> param = new HashMap<>();
    	int storeUpdate =storeService.updateStore(session, dto);
    	if(storeUpdate > 0) {
        param.put("code","10001");
    	}
    	else {
        param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }    
    
    @RequestMapping("/delete.do")
    public ResponseEntity<?> storeDelete(HttpSession session, @ModelAttribute StoreDTO dto) {
    	Map<String, Object> param = new HashMap<>();
    	int storeUpdate =storeService.deleteStore(session, dto);
    	if(storeUpdate > 0) {
        param.put("code","10001");
    	}
    	else {
        param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }   
    

//    @RequestMapping("/inOutInsert.do")
//    public ResponseEntity<?> storeInOutInsert (HttpSession session, @ModelAttribute StoreInoutDTO dto){
//    	
//    	Map<String, Object> param = new HashMap<>();
//    	int storeInsert = 0;
//    	storeInsert =storeInoutService.insertInoutStore(dto);
//    	if(storeInsert > 0) {
//	        param.put("code","10001");
//	    	}
//	    	else {
//	        param.put("code","20001");
//	        }
//    	
//        return ResponseEntity.ok(param);
//    } 
    
    @RequestMapping("/inOutInsert.do")
    public ResponseEntity<?> storeInOutInsert (HttpSession session, @RequestBody String requestbody){
    	Map<String, Object> param = new HashMap<>();
    	String data = requestbody; 
      StoreInoutDTO dto = new StoreInoutDTO();
       int storeInsert = 0;
    	org.json.JSONArray jarr = new org.json.JSONArray(data);
    	org.json.JSONObject json = null; 
    	for(int i = 0 ; i < jarr.length(); i ++) {
    		json = jarr.getJSONObject(i);
    		dto.setInoutQty(json.getInt("inoutQty"));
    		dto.setComment(json.getString("comment"));
    		dto.setInoutType(json.getString("inoutType"));
    		dto.setStoreNo(json.getInt("storeNo"));
    		storeInsert =storeInoutService.insertInoutStore(dto);
    	if(storeInsert > 0) {
	        param.put("code","10001");
	    	}
	    	else {
	        param.put("code","20001");
	        }
    	}
    	
    	
    	
        return ResponseEntity.ok(param);
    } 

}


