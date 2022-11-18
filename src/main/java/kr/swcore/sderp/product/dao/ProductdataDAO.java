package kr.swcore.sderp.product.dao;

import kr.swcore.sderp.product.dto.ProductdataDTO;

import java.util.List;

public interface ProductdataDAO {

    List<ProductdataDTO> listProductdata(ProductdataDTO productdataDTO);
    ProductdataDTO detailProductdata(ProductdataDTO productdataDTO);
    int updateProductdata(ProductdataDTO productdataDTO);
    int insertProductdata(ProductdataDTO productdataDTO);
    //int insertProductdataList(List<ProductdataDTO> productdataDTOList);
    int deleteProductdata(ProductdataDTO productdataDTO);
    //int deleteProductdataList(List<ProductdataDTO> productdataDTOList);
    int deleteProductdataWithProductNo(ProductdataDTO productdataDTO);

}
