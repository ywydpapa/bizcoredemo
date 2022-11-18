package kr.swcore.sderp.salesTarget;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import kr.swcore.sderp.product.dto.ProductdataDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import kr.swcore.sderp.salesTarget.service.SalesTargetService;

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
}
