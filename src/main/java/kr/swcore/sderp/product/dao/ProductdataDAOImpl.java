package kr.swcore.sderp.product.dao;

import kr.swcore.sderp.product.dto.ProductdataDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class ProductdataDAOImpl implements ProductdataDAO{

    @Inject
    SqlSession sqlSession;

    @Override
    public List<ProductdataDTO> listProductdata(ProductdataDTO productdataDTO) {
        return sqlSession.selectList("productdata.listProductdata", productdataDTO);
    }

    @Override
    public ProductdataDTO detailProductdata(ProductdataDTO productdataDTO) {
        return null;
    }

    @Override
    public int updateProductdata(ProductdataDTO productdataDTO) {
        return sqlSession.update("productdata.updateProductdata", productdataDTO);
    }

    @Override
    public int insertProductdata(ProductdataDTO productdataDTO) {
        return sqlSession.insert("productdata.insertProductdata", productdataDTO);
    }

    @Override
    public int deleteProductdata(ProductdataDTO productdataDTO) {
        return sqlSession.delete("productdata.deleteProductdata", productdataDTO);
    }

    @Override
    public int deleteProductdataWithProductNo(ProductdataDTO productdataDTO) {
        return sqlSession.delete("productdata.deleteProductdataWithProductNo", productdataDTO);
    }
}
