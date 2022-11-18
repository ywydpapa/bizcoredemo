package kr.swcore.sderp.product.dao;

import java.util.List;

import kr.swcore.sderp.product.dto.ProductDTO;

public interface ProductDAO {
	ProductDTO searchingWithMaxProductCategoryNo(ProductDTO productdto);
	ProductDTO oneProduct(ProductDTO productdto);
	List<ProductDTO> listProduct();
	List<ProductDTO> listProduct(ProductDTO roductDTO);
	List<ProductDTO> listProductGoodsCategory(ProductDTO productdto);
	ProductDTO detailProduct(ProductDTO productdto);
	ProductDTO oneDetailProudct(ProductDTO productDTO);
	ProductDTO checkDetailProudct(ProductDTO productDTO);
	int updateProduct(ProductDTO productdto);
	int deleteProduct(ProductDTO productNo);
	int insertProduct(ProductDTO dto);
	String fileInfo(int productNo);
	
}
