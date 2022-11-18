package kr.swcore.sderp.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.product.dto.ProductDTO;

public interface ProductService {

	ProductDTO oneProduct(HttpSession session, ProductDTO dto);
	List<ProductDTO> listProduct();
	List<ProductDTO> listProduct(HttpSession session);
	List<ProductDTO> listProductGoodsCategory(HttpSession session);
	ProductDTO detailProduct(HttpSession session, int productNo);
	Map<String, Object> updateProduct(HttpSession session, ProductDTO dto);
	int deleteProduct(HttpSession session, int productNo);
	Map<String, Object> insertProduct(HttpSession session, ProductDTO dto);
	String fileInfo(int productNo);
		
}
