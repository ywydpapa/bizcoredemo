package kr.swcore.sderp.product;

import java.util.*;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import kr.swcore.sderp.product.dto.ProductdataDTO;
import kr.swcore.sderp.product.service.ProductdataService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.product.service.ProductService;

@Controller

@RequestMapping("/product/*")
public class ProductController {
	
	@Inject
	ProductService productService;

	@Inject
	ProductdataService productdataService;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		mav.setViewName("product/list");
		mav.addObject("list", productService.listProduct(session));
		return mav;
	}

	@RequestMapping(value = "listAjax", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String listAjax(HttpSession session) {
		List<ProductDTO> productDTOList  = productService.listProduct(session);
		JsonObject jsonObject = new JsonObject();
		if (productDTOList != null && productDTOList.size() == 0){
			jsonObject.addProperty("data", "");
		} else {
			jsonObject.addProperty("data", new Gson().toJson(productDTOList));
		}
		return new Gson().toJson(jsonObject);
	}

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
	
	@RequestMapping("/detail/{productNo}")
	public ModelAndView detail(HttpSession session, @PathVariable("productNo") int productNo, ModelAndView mav) {
		mav.setViewName("product/detail");
		mav.addObject("dto", productService.detailProduct(session, productNo));
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "product/write";
	}

	@RequestMapping(value ="insert.do", method= RequestMethod.POST)
	public ResponseEntity<?> insert(HttpSession session, @RequestBody ProductDTO dto) {
		Map<String, Object> param = new HashMap<>();
		param = productService.insertProduct(session, dto);
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping(value = "update.do", method= RequestMethod.POST)
	public ResponseEntity<?> update(HttpSession session, @RequestBody ProductDTO productData) {
		Map<String, Object> param = new HashMap<>();
		param = productService.updateProduct(session, productData);
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(HttpSession session, @ModelAttribute ProductDTO dto) {
			Map<String, Object> param = new HashMap<>();
			int productUpdate = productService.deleteProduct(session, dto.getProductNo());
			if (productUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("codo","20001");
			}
			return ResponseEntity.ok(param);
		}
			

}
