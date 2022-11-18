package kr.swcore.sderp.salesTarget;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import kr.swcore.sderp.account.dto.AccountDTO;
import kr.swcore.sderp.common.dto.DeptToPlanTblDTO;
import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.product.dto.ProductdataDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.salesTarget.service.SalesTargetService;
import kr.swcore.sderp.user.dto.UserDTO;

@Controller
@RequestMapping("/salesTarget/*")
public class SalesTargetController {
	@Inject
	SalesTargetService salesTargetService; 
	
	@RequestMapping(value = "update.do", method=RequestMethod.POST)
	public ResponseEntity<?> insert(HttpSession session, @RequestBody SalesTargetDTO dto) {
 		Map<String, Object> param = new HashMap<>();
		int schedInsertResult = salesTargetService.updateSalesTarget(session, dto);
		param.put("code", (String.valueOf(schedInsertResult))); 
		return ResponseEntity.ok(param);
	}
	
	/*
	@RequestMapping(value = "listSalesTargetMonthIndividual.do")
	@ResponseBody
	public ResponseEntity<?> listSalesTargetMonthIndividual(HttpSession session, @ModelAttribute SalesTargetDTO dto) {
		Map<String, Object> param = new HashMap<>();
		param = salesTargetService.listSalesTargetMonthIndividual(session, dto);
		return ResponseEntity.ok(param);
	}
	*/

	@RequestMapping(value = "graph2", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listAjaxGraph2(HttpSession session, @RequestBody String param) throws JsonProcessingException {
		Map<String, Object> rtn = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		SalesTargetDTO salesTargetDTO = mapper.readValue(param, SalesTargetDTO.class);
		rtn = salesTargetService.listSalesTargetMonthIndividual(session, salesTargetDTO);
		return new Gson().toJson(rtn);
	}

	@RequestMapping(value = "graph3", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listAjaxGraph3(HttpSession session, @RequestBody String param) throws JsonProcessingException {
		Map<String, Object> rtn = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		SalesTargetDTO salesTargetDTO = mapper.readValue(param, SalesTargetDTO.class);
		rtn = salesTargetService.listSalesTargetYearIndividual(session, salesTargetDTO);
		return new Gson().toJson(rtn);
	}

	/*
	@RequestMapping(value = "listAjax/detail", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String listAjaxDetail(HttpSession session, @RequestBody String param) throws JsonProcessingException {
		HashMap<String, Object> rtn = new HashMap<String, Object>();
		List<ProductdataDTO> productdataDTOList = productdataService.listAjaxDetail(session, param);
		JsonObject jsonObject = new JsonObject();
		if (productdataDTOList != null && productdataDTOList.size() == 0){
			jsonObject.addProperty("data", "");
		} else{
			jsonObject.addProperty("data", new Gson().toJson(productdataDTOList));
		}
		return new Gson().toJson(jsonObject);
	}
	 */
	@RequestMapping(value = "gradata.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> gradata(HttpSession session, SalesTargetDTO dto, AccountDTO datato) {
 		Map<String, Object> param = new HashMap<>();
		dto.setCompNo(Integer.valueOf((String) session.getAttribute("compNo")));
 		datato.setCompNo(Integer.valueOf((String) session.getAttribute("compNo")));
 		List <SalesTargetDTO> gradatadata = salesTargetService.gradata(dto);
		param.put("data", gradatadata); 
		List <SalesTargetDTO> gradatadata01= salesTargetService.gradata01(datato);
		List <SalesTargetDTO> gradatadata02= salesTargetService.gradata02(datato);
		List <SalesTargetDTO> gradatadata03= salesTargetService.gradata03(datato);
		List <SalesTargetDTO> gradatadata04= salesTargetService.gradata04(datato);
		List <SalesTargetDTO> gradatadata05= salesTargetService.gradata05(datato);
		List <SalesTargetDTO> gradatadata06= salesTargetService.gradata06(datato);
		List <SalesTargetDTO> gradatadata07= salesTargetService.gradata07(datato);
		List <SalesTargetDTO> gradatadata08= salesTargetService.gradata08(datato);
		List <SalesTargetDTO> gradatadata09= salesTargetService.gradata09(datato);
		List <SalesTargetDTO> gradatadata10= salesTargetService.gradata10(datato);
		List <SalesTargetDTO> gradatadata11= salesTargetService.gradata11(datato);
		List <SalesTargetDTO> gradatadata12= salesTargetService.gradata12(datato);
		param.put("data01", gradatadata01); 
		param.put("data02", gradatadata02); 
		param.put("data03", gradatadata03); 
		param.put("data04", gradatadata04); 
		param.put("data05", gradatadata05); 
		param.put("data06", gradatadata06); 
		param.put("data07", gradatadata07); 
		param.put("data08", gradatadata08); 
		param.put("data09", gradatadata09); 
		param.put("data10", gradatadata10); 
		param.put("data11", gradatadata11); 
		param.put("data12", gradatadata12); 
		return ResponseEntity.ok(param);
	}
	@RequestMapping(value = "gradata.do/{selectNum}", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> gradata(HttpSession session, @PathVariable("selectNum") int selectNum, SalesTargetDTO dto, AccountDTO datato) {
 		Map<String, Object> param = new HashMap<>();
 		dto.setNum(selectNum);
 		
 		dto.setCompNo(Integer.valueOf((String) session.getAttribute("compNo")));
 		datato.setCompNo(Integer.valueOf((String) session.getAttribute("compNo")));
 		
 		List <SalesTargetDTO> nomalgradatadata = salesTargetService.nomalgradata(dto);
 		param.put("datanomal", nomalgradatadata); 
 		
 		if(selectNum == 1) {
 			List <SalesTargetDTO> gradatadata01= salesTargetService.gradata01(datato);
 			param.put("data", gradatadata01);
 		}else if(selectNum == 2){
 			List <SalesTargetDTO> gradatadata02= salesTargetService.gradata02(datato);
 			param.put("data", gradatadata02); 
 		}else if(selectNum == 3){
 			List <SalesTargetDTO> gradatadata03= salesTargetService.gradata03(datato);
 			param.put("data", gradatadata03); 
 		}else if(selectNum == 4){
 			List <SalesTargetDTO> gradatadata04= salesTargetService.gradata04(datato);
 			param.put("data", gradatadata04); 
 		}else if(selectNum == 5){
 			List <SalesTargetDTO> gradatadata05= salesTargetService.gradata05(datato);
 			param.put("data", gradatadata05); 
 		}else if(selectNum == 6){
 			List <SalesTargetDTO> gradatadata06= salesTargetService.gradata06(datato);
 			param.put("data", gradatadata06); 
 		}else if(selectNum == 7){
 			List <SalesTargetDTO> gradatadata07= salesTargetService.gradata07(datato);
 			param.put("data", gradatadata07); 
 		}else if(selectNum == 8){
 			List <SalesTargetDTO> gradatadata08= salesTargetService.gradata08(datato);
 			param.put("data", gradatadata08); 
 		}else if(selectNum == 9){
 			List <SalesTargetDTO> gradatadata09= salesTargetService.gradata09(datato);
 			param.put("data", gradatadata09); 
 		}else if(selectNum == 10){
 			List <SalesTargetDTO> gradatadata10= salesTargetService.gradata10(datato);
 			param.put("data", gradatadata10); 
 		}else if(selectNum == 11){
 			List <SalesTargetDTO> gradatadata11= salesTargetService.gradata11(datato);
 			param.put("data", gradatadata11); 
 		}else if(selectNum == 12){
 			List <SalesTargetDTO> gradatadata12= salesTargetService.gradata12(datato);
 			param.put("data", gradatadata12); 
 		}
 		
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("/sales_analysis.do")
	public ModelAndView sales_analysis(HttpSession session, ModelAndView mav) {
		mav.addObject("graph1",salesTargetService.listSalesTargetYearTotalSalesIndividual(session, null));
		//List<UserDTO> allList = userService.allList(session.getAttribute("compNo"));
		//mav.addObject("username", allList);
		mav.setViewName("sales_analysis/Sales_analysis");
		return mav;
	}
	@RequestMapping("/Maintenance_analysis.do")
	public ModelAndView goal_analysis(HttpSession session, ModelAndView mav) {
		mav.setViewName("sales_analysis/Maintenance_analysis");
		return mav;
	}
	@RequestMapping(value = "cnt_mouth_data.do/{month}/{last_month}", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> cnt_mouth_data(@PathVariable("month") String month, @PathVariable("last_month") String last_month, @ModelAttribute AccountDTO dto) {
		Map<String, Object> param = new HashMap<>();
		
		dto.setMouth(month);
		dto.setLast_mouth(last_month);
		List <AccountDTO> cnt_mouth_data = salesTargetService.cnt_mouth_data(dto);
		List <AccountDTO> cnt_mouth_data_last = salesTargetService.cnt_mouth_data_last(dto);
		param.put("data", cnt_mouth_data);
		param.put("data_last", cnt_mouth_data_last);
		
		return ResponseEntity.ok(param);
	}
	@RequestMapping(value = "user_chart.do/{month}", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> user_chart(HttpSession session, @PathVariable("month") String month, @ModelAttribute AccountDTO dto) {
		Map<String, Object> param = new HashMap<>();
		dto.setMouth(month);
		dto.setCompNo(Integer.valueOf((String) session.getAttribute("compNo")));
		
		BigDecimal zeroBigDec = new BigDecimal("0");
		List <AccountDTO> user_chart_target = salesTargetService.user_chart_target(dto);
		List <AccountDTO> user_now_graph = salesTargetService.user_now_graph(dto);
		for (int i=0; i < user_chart_target.size(); i++) {
			user_chart_target.get(i).setTest(zeroBigDec);
		}
		for(int i=0; i < user_chart_target.size(); i++) {	
			for(int z=0; z < user_now_graph.size(); z++) {
				if(user_chart_target.get(i).getUserNo() == user_now_graph.get(z).getUserNo()) {
					user_chart_target.get(i).setTest(user_now_graph.get(z).getTest());
				}
			}
		}
		param.put("data", user_chart_target);

		return ResponseEntity.ok(param);
	}
}
