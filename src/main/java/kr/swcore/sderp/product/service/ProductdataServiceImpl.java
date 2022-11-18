package kr.swcore.sderp.product.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import kr.swcore.sderp.product.dao.ProductdataDAO;
import kr.swcore.sderp.product.dto.ProductdataDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ProductdataServiceImpl implements ProductdataService{
    @Inject
    ProductdataDAO productdataDAO;

    @Override
    public List<ProductdataDTO> listProductdata(HttpSession session, ProductdataDTO productdataDTO) {
        productdataDTO.setCompNo(SessionInfoGet.getCompNo(session));

        return null;
    }

    @Override
    public List<ProductdataDTO> listAjaxDetail(HttpSession session, String param) throws JsonProcessingException {

		ObjectMapper mapper = new ObjectMapper();
		ProductdataDTO productdataDTO = mapper.readValue(param, ProductdataDTO.class);
		/*
        Gson gsons = new Gson();
        ProductdataDTO productdataDTO = gsons.fromJson(param, ProductdataDTO.class);
        */

        List<ProductdataDTO> productdataDTOList = productdataDAO.listProductdata(productdataDTO);

        return productdataDTOList;
    }
}
