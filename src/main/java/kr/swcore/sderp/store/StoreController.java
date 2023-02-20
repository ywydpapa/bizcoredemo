package kr.swcore.sderp.store;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.cust.service.CustService;
import kr.swcore.sderp.organiz.dto.OrganizDTO;
import kr.swcore.sderp.store.dto.StoreDTO;
import kr.swcore.sderp.store.dto.StoreInoutDTO;
import kr.swcore.sderp.store.service.StoreInoutService;
import kr.swcore.sderp.store.service.StoreService;
import kr.swcore.sderp.user.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/store/")
@Slf4j
public class StoreController {

	@Inject
	SqlSession sqlSession;

	@Inject
	StoreService storeService;

	@Inject
	StoreInoutService storeInoutService;

	@Inject
	CustService custService;

	@Inject
	CodeService codeService;
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);

	// 占쏙옙占쏙옙트 占쏙옙占쏙옙占쏙옙 占쏙옙회
	@RequestMapping("listStore.do")
	public ModelAndView list(HttpSession session, StoreDTO dto, ModelAndView mav) {
		mav.addObject("store", storeService.listStore(session, dto));
		mav.setViewName("store/list");
		return mav;
	}

	// 占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙회
	@RequestMapping("writeStore.do")
	public ModelAndView write(HttpSession session, CodeDTO dto, ModelAndView mav) {
		mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
		mav.setViewName("store/write");
		return mav;
	}

	// 占쏙옙占� insert
	@RequestMapping("insert.do")
	public ResponseEntity<?> storeInsert(HttpSession session, @ModelAttribute StoreDTO dto) {

		Map<String, Object> param = new HashMap<>();
		int storeInsert = storeService.insertStore(session, dto);
		if (storeInsert > 0) {
			param.put("code", "10001");
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("writeInout.do")
	public ModelAndView inoutInsert(HttpSession session, StoreDTO dto, ModelAndView mav) {
		mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
		mav.addObject("storeList", storeService.storeList(session, dto));
		mav.setViewName("store/inoutWrite");
		return mav;
	}

	@RequestMapping("/detail/{productNo}")
	public ModelAndView detail(HttpSession session, @PathVariable("productNo") int productNo, ModelAndView mav) {
		mav.addObject("custDataList", custService.getAllDataList(session));
		mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
		mav.addObject("dtoList", storeService.storeDetail(productNo));
		mav.addObject("inoutList", storeInoutService.getInoutStoreList(productNo));
		mav.setViewName("store/detail");
		return mav;
	}

	@RequestMapping("/update.do")
	public ResponseEntity<?> storeUpdate(HttpSession session, @ModelAttribute StoreDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int storeUpdate = storeService.updateStore(session, dto);
		if (storeUpdate > 0) {
			param.put("code", "10001");
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("/delete.do")
	public ResponseEntity<?> storeDelete(HttpSession session, @ModelAttribute StoreDTO dto) {
		Map<String, Object> param = new HashMap<>();
		int storeUpdate = storeService.deleteStore(session, dto);
		if (storeUpdate > 0) {
			param.put("code", "10001");
		} else {
			param.put("code", "20001");
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
	public ResponseEntity<?> storeInOutInsert(HttpSession session, StoreDTO sdto, @RequestBody String requestbody) {
		String compNo = (String) session.getAttribute("compNo");
		Map<String, Object> param = new HashMap<>();
		String data = requestbody;
		StoreInoutDTO dto = new StoreInoutDTO();
		StoreDTO storeDto = new StoreDTO();
		int storeInoutInsert = 0;
		int temp = 0;
		int process1 = 0;
		int lastStoreNo = 0;
		org.json.JSONArray jarr = new org.json.JSONArray(data);
		org.json.JSONObject json = null;
		for (int i = 0; i < jarr.length(); i++) {
			temp = 0;
			lastStoreNo = -1;
			json = jarr.getJSONObject(i);
			dto.setInoutQty(json.getInt("inoutQty"));
			dto.setInoutAmount(BigDecimal.valueOf(json.getInt("inoutAmount")));
			dto.setComment(json.getString("comment"));
			dto.setInoutType(json.getString("inoutType"));
			dto.setLocationNo(json.getString("locationNo"));

			if (json.getString("inoutType").equals("IN")) {
				storeDto.setCompNo(Integer.valueOf(compNo));
				storeDto.setProductNo(json.getInt("productNo"));
				storeDto.setSerialNo(json.getString("storeNo"));
				storeDto.setStoreAmount(BigDecimal.valueOf(json.getInt("inoutAmount")));
				storeDto.setLocationNo(json.getString("locationNo"));
				storeDto.setComment(json.getString("comment"));
				// 재고가 0인 재고부터 생성함
				process1 = storeService.insertStore2(session, storeDto);
				logger.error("check last process1 : " + process1);
				// 재고 생성에 성공한 경우
				if (process1 > 0) {
					// 생성된 재고의 재고 번호를 구함
					lastStoreNo = storeService.getLastStoreNo(session, storeDto);
					logger.error("check last StoreNo : " + lastStoreNo);
					if (lastStoreNo != -1) {
						dto.setStoreNo(lastStoreNo);
						storeInoutInsert = storeInoutService.insertInoutStore(session, dto);
						storeDto.setStoreQty(json.getInt("inoutQty"));
						storeDto.setStoreNo(lastStoreNo);
					}
					// 재고 생성에 실패한 경우
				} else {
					param.put("code", "20001");
				}

			} else {
				dto.setStoreNo(Integer.valueOf(json.getString("storeNo")));
				storeInoutInsert = storeInoutService.insertInoutStore(session, dto);
				storeDto.setStoreQty(json.getInt("inoutQty") * -1);
				storeDto.setStoreNo(dto.getStoreNo());
			}

			// 입출고 데이터 생성에 성공한 경우 재고 수량에 반영함
			if (storeInoutInsert > 0) {
				sqlSession.update("store.plusStoreQty", storeDto);
				param.put("code", "10001");
			} else {
				param.put("code", "20001");
			}
		}

		return ResponseEntity.ok(param);
	}

	@RequestMapping("/inOutList.do")
	public ModelAndView storeInOutList(HttpSession session, StoreInoutDTO dto, ModelAndView mav) {
		mav.addObject("custDataList", custService.getAllDataList(session));
		String compNo = (String) session.getAttribute("compNo");
		dto.setCompNo(Integer.valueOf(compNo));
		mav.addObject("list1", codeService.listCode01(session));
		mav.addObject("list2", codeService.listCode02(session));
		mav.addObject("list3", codeService.listCode03(session));
		mav.addObject("inOutAllList", storeInoutService.getAllList(session, dto));
		mav.setViewName("store/inoutList");
		return mav;
	}

	@RequestMapping("/inOutUpate.do")
	public ResponseEntity<?> storeInOutUpated(HttpSession session, StoreInoutDTO dto, StoreInoutDTO idto) {

		Map<String, Object> param = new HashMap<>();
		int process1 = 0;
		int process2 = 0;
		String compNo = (String) session.getAttribute("compNo");
		StoreDTO sdto = new StoreDTO();
		idto.setCompNo(Integer.valueOf(compNo));
		sdto.setCompNo(Integer.valueOf(compNo));
		sdto.setStoreNo(idto.getStoreNo()); // 수정할 store 의 수량을 구함
		// 재고 수량과 입출고 기록에 더해주면 됨

		if (idto.getInoutType().equals("IN")) {
			sdto.setStoreQty(idto.getInoutQty());
		} else {
			sdto.setStoreQty(idto.getInoutQty() * -1);
		}

		process1 = sqlSession.update("store.plusStoreQty", sdto);

		if (process1 > 0) {

			process2 = storeInoutService.updateInoutStore(session, dto);
			if (process2 > 0) {
				param.put("code", "10001");
			} else {
				param.put("code", "20001");

			}

		}
		return ResponseEntity.ok(param);
	}

	@RequestMapping("/inoutSearch")
	public ModelAndView getSearchResult(@RequestBody String reqeuestBody, ModelAndView mav, HttpSession session)
			throws SQLException {
		String data = null, inOutType = null, productName = null, storeNo = null, serialNo = null, locationNo = null,
				from = null, to = null;
		data = reqeuestBody;
		// JSON 문자열 > JSON 오브젝트
		org.json.JSONObject json = new org.json.JSONObject(data);
		StoreInoutDTO sdto = new StoreInoutDTO();

		inOutType = json.isNull("inOutType") ? null : json.getString("inOutType");
		productName = json.isNull("productName") ? null : json.getString("productName");
		storeNo = json.isNull("storeNo") ? null : json.getString("storeNo");
		serialNo = json.isNull("serialNo") ? null : json.getString("serialNo");
		locationNo = json.isNull("locationNo") ? null : json.getString("locationNo");
		from = json.isNull("from") ? null : json.getString("from");
		to = json.isNull("to") ? null : json.getString("to");

		sdto.setInoutType(inOutType);
		sdto.setProductName(productName);
		if(storeNo != null) {
			sdto.setStoreNo(Integer.valueOf(storeNo));
		}
		sdto.setSerialNo(serialNo);
		sdto.setRegDate(from);

		mav.addObject("inOutAllList", storeInoutService.search(session, sdto));

		mav.setViewName("store/inoutList");

		return mav;

	}

}
