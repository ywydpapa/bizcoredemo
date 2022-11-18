package kr.swcore.sderp.product.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.product.dto.ProductdataDTO;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ProductdataService {

	List<ProductdataDTO> listProductdata(HttpSession session, ProductdataDTO productdataDTO);
	List<ProductdataDTO> listAjaxDetail	(HttpSession session, String param) throws JsonProcessingException;
}
