package kr.swcore.sderp.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.product.dao.ProductdataDAO;
import kr.swcore.sderp.product.dto.ProductdataDTO;
import org.springframework.stereotype.Service;

import kr.swcore.sderp.product.dao.ProductDAO;
import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO productDao;

	@Inject
	ProductdataDAO productdataDAO;

	private String isNumber(String str){
		try {
			Double.parseDouble(str);
			try{
				Integer.parseInt(str);
				return "INTEGER";
			} catch (NumberFormatException e){
				return "DOUBLE";
			}
		} catch (NumberFormatException e){
			return "STRING";
		}
	}

	@Override
	public ProductDTO oneProduct(HttpSession session, ProductDTO dto) {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNo(dto.getProductNo());
		productDTO.setCompNo(SessionInfoGet.getCompNo(session));
		return null;
	}

	@Override
	public List<ProductDTO> listProduct() {
		// TODO Auto-generated method stub
		return productDao.listProduct();
	}
	
	@Override
	public List<ProductDTO> listProduct(HttpSession session) {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setCompNo(SessionInfoGet.getCompNo(session));
		return productDao.listProduct(productDTO);
	}

	@Override
	public ProductDTO detailProduct(HttpSession session, int productNo) {
		ProductDTO productdto = new ProductDTO();
		productdto.setCompNo(SessionInfoGet.getCompNo(session));
		productdto.setProductNo(productNo);
		productdto = productDao.detailProduct(productdto);

		ProductdataDTO productdataDTO = new ProductdataDTO();
		productdataDTO.setCompNo(SessionInfoGet.getCompNo(session));
		productdataDTO.setProductNo(productNo);
		List<ProductdataDTO> productdataDTOList = productdataDAO.listProductdata(productdataDTO);

		if(productdataDTOList != null && productdataDTOList.size() > 0){
			productdto.setProductdataDTOList(productdataDTOList);
		}

		return productdto;
	}

	@Override
	public Map<String, Object> updateProduct(HttpSession session, ProductDTO newDto) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		newDto.setCompNo(compNo);
		Integer	userNo = SessionInfoGet.getUserNo(session);

		Map<String, Object> param = new HashMap<>();
		Integer returnValue = null;
		ProductDTO checkDetailProudct = productDao.checkDetailProudct(newDto);
		if(checkDetailProudct != null && newDto.getProductNo() != checkDetailProudct.getProductNo()){
			param.put("code",20001);
			param.put("msg","상품번호("+checkDetailProudct.getProductNo()+"번)와 일치하는 데이터 입니다.");
			return param;
		}
		Integer result = 0;
		/*
		1. 기존데이터 select / 신규데이터 비교
		 */
		// 상품 번호, 상품 카테고리 번호, 상품 카테고리 명, 상품 명, 상품 기본 가격, 상품 설명, 공급사
		ProductDTO oldDto = new ProductDTO();
		oldDto.setProductNo(newDto.getProductNo());
		oldDto.setCompNo(compNo);
		oldDto = productDao.oneProduct(oldDto);

		newDto.setCompNo(compNo);	// 회사 번호
		newDto.setUserNo(SessionInfoGet.getUserNo(session));	// 유저 번호
		// 수정 데이터중 카테고리 번호가 없거나 기존 데이터와 비교하여 상품명이 불일치 한경우 진행
		if(newDto.getProductCategoryNo() == 0 || (oldDto.getProductCategoryName()).equals(newDto.getProductName())){
			/*
			1. productCategoryName 이 존재하면  set 후 업데이트 진행
			2. 존재하지않으면 MAX(productcategoryNo) + 1 업데이트 진행
			 */
			ProductDTO returnDto = new ProductDTO();
			returnDto.setCompNo(compNo);					// 회사 번호
			returnDto.setProductCategoryName(newDto.getProductCategoryName());		// 상품 카테고리 이름
			returnDto = productDao.searchingWithMaxProductCategoryNo(returnDto);

			if(returnDto.getProductCategoryName() == null){
				// 신규 카테고리 생성해서 update
				newDto.setProductNo(returnDto.getProductNo()+1);
			} else {
				// 기존 카테고리로 update
				newDto.setProductNo(returnDto.getProductNo());
			}
		}
		try {
			result = productDao.updateProduct(newDto);
		} catch (Exception e){
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 쿼리 에러시 롤백
		}

		// update 에러만 안나면 계속 진행
		// 새 DB 데이터 get
		List<ProductdataDTO> newproductdataDTOList = newDto.getProductdataDTOList();

		// 타입 셋팅
		Integer custsNo = newDto.getCustNo();
		if(newproductdataDTOList != null && newproductdataDTOList.size() > 0){
			for(int i=0; i<newproductdataDTOList.size(); i++){
				String productType = newproductdataDTOList.get(i).getProductPrice();
				String productTypertn = isNumber(productType);
				Integer productDataNo = newproductdataDTOList.get(i).getProductDataNo();
				newproductdataDTOList.get(i).setProductType(productTypertn);
				newproductdataDTOList.get(i).setCustNo(custsNo);
				newproductdataDTOList.get(i).setCompNo(compNo);
				newproductdataDTOList.get(i).setProductDataNo(productDataNo);
				newproductdataDTOList.get(i).setRegUser(userNo);
			}
		}

		try{
			for(int i=0; i<newproductdataDTOList.size(); i++){
				ProductdataDTO productdataDTO = newproductdataDTOList.get(i);
				if(productdataDTO.getMode().equals("delete")) {
					productdataDAO.deleteProductdata(productdataDTO);
				} else if(productdataDTO.getMode().equals("insert")) {
					productdataDAO.insertProductdata(productdataDTO);
				} else if(productdataDTO.getMode().equals("update")) {
					productdataDAO.deleteProductdata(productdataDTO);
					productdataDAO.insertProductdata(productdataDTO);
				}
			}
			result = 1;
		} catch (Exception e){
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 쿼리 에러시 롤백
		}

		if (result > 0) {
			param.put("code",10001);
		}
		else {
			param.put("code",20001);
		}

		return param;
	}

	@Override
	public int deleteProduct(HttpSession session, int productNo) {
		Integer rtn = 0;
		Integer compNo = SessionInfoGet.getCompNo(session);
		try {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProductNo(productNo);
			productDTO.setCompNo(compNo);
			productDao.deleteProduct(productDTO);
			ProductdataDTO productdataDTO = new ProductdataDTO();
			productdataDTO.setProductNo(productNo);
			productdataDTO.setCompNo(compNo);
			productdataDAO.deleteProductdataWithProductNo(productdataDTO);
			rtn = 1;
		} catch (Exception e){
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 쿼리 에러시 롤백
		}
		return rtn;
	}

	@Override
	public Map<String, Object> insertProduct(HttpSession session, ProductDTO dto) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);

		Map<String, Object> param = new HashMap<>();
		Integer returnValue = null;
		ProductDTO checkDetailProudct = productDao.checkDetailProudct(dto);
		if(checkDetailProudct != null){
			param.put("code",20001);
			param.put("msg","상품번호("+checkDetailProudct.getProductNo()+"번)와 일치하는 데이터 입니다.");
			return param;
		}
		// 새 DB 데이터 get

		List<ProductdataDTO> newproductdataDTOList = new ArrayList<ProductdataDTO>();
		if(newproductdataDTOList != null) {
			newproductdataDTOList = dto.getProductdataDTOList();
		}
		Integer	userNo = SessionInfoGet.getUserNo(session);
		dto.setUserNo(userNo);
		Integer result = 0;
		// 수정 데이터중 카테고리 번호가 없거나 기존 데이터와 비교하여 상품명이 불일치 한경우 진행
		if(dto.getProductCategoryNo() == 0){
			/*
			1. productCategoryName 이 존재하면  set 후 업데이트 진행
			2. 존재하지않으면 MAX(productcategoryNo) + 1 업데이트 진행
			 */
			ProductDTO returnDto = new ProductDTO();
			returnDto.setCompNo(compNo);					// 회사 번호
			returnDto.setProductCategoryName(dto.getProductCategoryName());		// 상품 카테고리 이름
			returnDto = productDao.searchingWithMaxProductCategoryNo(returnDto);

			if(returnDto.getProductCategoryName() == null){
				// 신규 카테고리 생성해서 update
				dto.setProductNo(returnDto.getProductNo()+1);
			} else {
				// 기존 카테고리로 update
				dto.setProductNo(returnDto.getProductNo());
			}
		}
		try {
			result = productDao.insertProduct(dto);
			dto = productDao.oneDetailProudct(dto);	// productNo 을 얻기위해 다시 selectOne 질의
		} catch (Exception e){
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 쿼리 에러시 롤백
		}

		// 에러만 안나면 계속 진행
		if(newproductdataDTOList != null) {
			// 타입 셋팅
			Integer custsNo = dto.getCustNo();
			Integer productNo = dto.getProductNo();
			if (newproductdataDTOList != null && newproductdataDTOList.size() > 0) {
				for (int i = 0; i < newproductdataDTOList.size(); i++) {
					String productType = newproductdataDTOList.get(i).getProductPrice();
					String productTypertn = isNumber(productType);
					Integer productDataNo = newproductdataDTOList.get(i).getProductDataNo();
					newproductdataDTOList.get(i).setProductNo(productNo);
					newproductdataDTOList.get(i).setProductType(productTypertn);
					newproductdataDTOList.get(i).setCustNo(custsNo);
					newproductdataDTOList.get(i).setCompNo(compNo);
					newproductdataDTOList.get(i).setRegUser(userNo);
				}
			}

			try {
				for (int i = 0; i < newproductdataDTOList.size(); i++) {
					ProductdataDTO productdataDTO = newproductdataDTOList.get(i);
					productdataDAO.insertProductdata(productdataDTO);
				}
				result = 1;
			} catch (Exception e) {
				e.printStackTrace();
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); // 쿼리 에러시 롤백
			}
		}

		if (result > 0) {
			param.put("code",10001);
		}
		else {
			param.put("code",20001);
		}

		return param;
	}

	@Override
	public String fileInfo(int productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductDTO> listProductGoodsCategory(HttpSession session) {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setCompNo(SessionInfoGet.getCompNo(session));
		List<ProductDTO> list = productDao.listProductGoodsCategory(productDTO);
		return list;
	}
}
