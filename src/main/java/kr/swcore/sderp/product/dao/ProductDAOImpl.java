package kr.swcore.sderp.product.dao;
import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public ProductDTO searchingWithMaxProductCategoryNo(ProductDTO productdto) {
		return sqlSession.selectOne("product.searchingWithMaxProductCategoryNo", productdto);
	}

	@Override
	public ProductDTO oneProduct(ProductDTO productdto) {
		return sqlSession.selectOne("product.oneProduct", productdto);
	}

	@Override
	public List<ProductDTO> listProduct() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.listProduct");
	}
	
	@Override
	public List<ProductDTO> listProduct(ProductDTO productDTO) {
		return sqlSession.selectList("product.listProduct", productDTO);
	}

	@Override
	public ProductDTO detailProduct(ProductDTO productdto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.detailProduct", productdto);
	}

	@Override
	public ProductDTO oneDetailProudct(ProductDTO productDTO) {
		return sqlSession.selectOne("product.oneDetailProudct", productDTO);
	}

	@Override
	public ProductDTO checkDetailProudct(ProductDTO productDTO) {
		return sqlSession.selectOne("product.checkDetailProudct", productDTO);
	}

	@Override
	public int updateProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("product.updateProduct", dto);
	}

	@Override
	public int deleteProduct(ProductDTO productNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("product.deleteProduct", productNo);
	}

	@Override
	public int insertProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("product.insertProduct", dto);
	}

	@Override
	public String fileInfo(int productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductDTO> listProductGoodsCategory(ProductDTO productdto) {
		return sqlSession.selectList("product.listProductGoodsCategory", productdto);
	}
}
